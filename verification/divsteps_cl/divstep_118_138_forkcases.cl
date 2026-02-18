proc divstep_118_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_1,
sint64 g_118_low60_0_low20_1,
sint64 u_118_118,
sint64 v_118_118,
sint64 r_118_118,
sint64 s_118_118,
sint64 u_118_119,
sint64 v_118_119,
sint64 r_118_119,
sint64 s_118_119,
bit ne
)={
    u_118_118 * f_118_low60_0_low20_0 + v_118_118 * g_118_low60_0_low20_0 = f_118_low60_0_low20_0 * (-(2**20)),
    r_118_118 * f_118_low60_0_low20_0 + s_118_118 * g_118_low60_0_low20_0 = g_118_low60_0_low20_0 * (-(2**20))
&&
    u_118_118 * f_118_low60_0_low20_0 + v_118_118 * g_118_low60_0_low20_0 = f_118_low60_0_low20_0 * (const 64 (-(2**20))),
    r_118_118 * f_118_low60_0_low20_0 + s_118_118 * g_118_low60_0_low20_0 = g_118_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_0 + u_118_118 * (const 64 (2**21)) + v_118_118 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_0 + r_118_118 * (const 64 (2**21)) + s_118_118 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 118)) <=s delta, delta <=s (const 64 (1 + 2*118)),
    u_118_118 = (const 64 (-(2**20))),
    v_118_118 = (const 64 (0)),
    r_118_118 = (const 64 (0)),
    s_118_118 = (const 64 (-(2**20)))
}



// divsteps
// step118

// premise a
assume
g_118_low60_0_low20_0 = 0 (mod 2)
&&
g_118_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_118_low60_0_low20_1 f_118_low60_0_low20_0;
mov u_118_119 u_118_118;
mov v_118_119 v_118_118;

asr g_118_low60_0_low20_1 g_118_low60_0_low20_0 1;
asr r_118_119 r_118_118 1;
asr s_118_119 s_118_118 1;
assert
    true
&&
    f_118_low60_0_low20_1 = f_118_low60_0_low20_0,
    u_118_119 = u_118_118,
    v_118_119 = v_118_118,
    g_118_low60_0_low20_1 * (const 64 2) = g_118_low60_0_low20_0,
    r_118_119 * (const 64 2) = r_118_118,
    s_118_119 * (const 64 2) = s_118_118
;

assume
    f_118_low60_0_low20_1 = f_118_low60_0_low20_0,
    u_118_119 = u_118_118,
    v_118_119 = v_118_118,
    g_118_low60_0_low20_1 * 2 = g_118_low60_0_low20_0,
    r_118_119 * 2 = r_118_118,
    s_118_119 * 2 = s_118_118
&&
    true
;

{
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_1 + u_118_119 * (const 64 (2**21)) + v_118_119 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_1 + r_118_119 * (const 64 (2**21)) + s_118_119 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_1,
    f_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_1,
    g_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 119)) <=s delta, delta <=s (const 64 (1 + 2*119)),
    (const 64 (-(2**20))) <=s u_118_119, u_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_119, v_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_119, r_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_119, s_118_119 <=s (const 64 ((2**20)-1)),
    u_118_119 + v_118_119 <=s (const 64 (2**20)),
    u_118_119 - v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 + v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 - v_118_119 <=s (const 64 (2**20)),
    r_118_119 + s_118_119 <=s (const 64 (2**20)),
    r_118_119 - s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 + s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 - s_118_119 <=s (const 64 (2**20)),
    u_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_118_119 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_118_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_1,
sint64 g_118_low60_0_low20_1,
sint64 u_118_118,
sint64 v_118_118,
sint64 r_118_118,
sint64 s_118_118,
sint64 u_118_119,
sint64 v_118_119,
sint64 r_118_119,
sint64 s_118_119,
bit ne
)={
    u_118_118 * f_118_low60_0_low20_0 + v_118_118 * g_118_low60_0_low20_0 = f_118_low60_0_low20_0 * (-(2**20)),
    r_118_118 * f_118_low60_0_low20_0 + s_118_118 * g_118_low60_0_low20_0 = g_118_low60_0_low20_0 * (-(2**20))
&&
    u_118_118 * f_118_low60_0_low20_0 + v_118_118 * g_118_low60_0_low20_0 = f_118_low60_0_low20_0 * (const 64 (-(2**20))),
    r_118_118 * f_118_low60_0_low20_0 + s_118_118 * g_118_low60_0_low20_0 = g_118_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_0 + u_118_118 * (const 64 (2**21)) + v_118_118 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_0 + r_118_118 * (const 64 (2**21)) + s_118_118 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 118)) <=s delta, delta <=s (const 64 (1 + 2*118)),
    u_118_118 = (const 64 (-(2**20))),
    v_118_118 = (const 64 (0)),
    r_118_118 = (const 64 (0)),
    s_118_118 = (const 64 (-(2**20)))
}



// divsteps
// step118

// premise b
assume
g_118_low60_0_low20_0 = 1 (mod 2)
&&
g_118_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_1 f_118_low60_0_low20_0;
mov u_118_119 u_118_118;
mov v_118_119 v_118_118;

add g_118_low60_0_low20_1 g_118_low60_0_low20_0 f_118_low60_0_low20_0;
asr g_118_low60_0_low20_1 g_118_low60_0_low20_1 1;
add r_118_119 r_118_118 u_118_118;
asr r_118_119 r_118_119 1;
add s_118_119 s_118_118 v_118_118;
asr s_118_119 s_118_119 1;
assert
    true
&&
    f_118_low60_0_low20_1 = f_118_low60_0_low20_0,
    u_118_119 = u_118_118,
    v_118_119 = v_118_118,
    g_118_low60_0_low20_1 * (const 64 2) = g_118_low60_0_low20_0 + f_118_low60_0_low20_0,
    r_118_119 * (const 64 2) = r_118_118 + u_118_118,
    s_118_119 * (const 64 2) = s_118_118 + v_118_118
;

assume
    f_118_low60_0_low20_1 = f_118_low60_0_low20_0,
    u_118_119 = u_118_118,
    v_118_119 = v_118_118,
    g_118_low60_0_low20_1 * 2 = g_118_low60_0_low20_0 + f_118_low60_0_low20_0,
    r_118_119 * 2 = r_118_118 + u_118_118,
    s_118_119 * 2 = s_118_118 + v_118_118
&&
    true
;

{
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_1 + u_118_119 * (const 64 (2**21)) + v_118_119 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_1 + r_118_119 * (const 64 (2**21)) + s_118_119 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_1,
    f_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_1,
    g_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 119)) <=s delta, delta <=s (const 64 (1 + 2*119)),
    (const 64 (-(2**20))) <=s u_118_119, u_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_119, v_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_119, r_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_119, s_118_119 <=s (const 64 ((2**20)-1)),
    u_118_119 + v_118_119 <=s (const 64 (2**20)),
    u_118_119 - v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 + v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 - v_118_119 <=s (const 64 (2**20)),
    r_118_119 + s_118_119 <=s (const 64 (2**20)),
    r_118_119 - s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 + s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 - s_118_119 <=s (const 64 (2**20)),
    u_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_118_119 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_118_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_1,
sint64 g_118_low60_0_low20_1,
sint64 u_118_118,
sint64 v_118_118,
sint64 r_118_118,
sint64 s_118_118,
sint64 u_118_119,
sint64 v_118_119,
sint64 r_118_119,
sint64 s_118_119,
bit ne
)={
    u_118_118 * f_118_low60_0_low20_0 + v_118_118 * g_118_low60_0_low20_0 = f_118_low60_0_low20_0 * (-(2**20)),
    r_118_118 * f_118_low60_0_low20_0 + s_118_118 * g_118_low60_0_low20_0 = g_118_low60_0_low20_0 * (-(2**20))
&&
    u_118_118 * f_118_low60_0_low20_0 + v_118_118 * g_118_low60_0_low20_0 = f_118_low60_0_low20_0 * (const 64 (-(2**20))),
    r_118_118 * f_118_low60_0_low20_0 + s_118_118 * g_118_low60_0_low20_0 = g_118_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_0 + u_118_118 * (const 64 (2**21)) + v_118_118 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_0 + r_118_118 * (const 64 (2**21)) + s_118_118 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 118)) <=s delta, delta <=s (const 64 (1 + 2*118)),
    u_118_118 = (const 64 (-(2**20))),
    v_118_118 = (const 64 (0)),
    r_118_118 = (const 64 (0)),
    s_118_118 = (const 64 (-(2**20)))
}



// divsteps
// step118

// premise c
assume
g_118_low60_0_low20_0 = 1 (mod 2)
&&
g_118_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_1 g_118_low60_0_low20_0;
mov u_118_119 r_118_118;
mov v_118_119 s_118_118;

subs dc g_118_low60_0_low20_1 g_118_low60_0_low20_0 f_118_low60_0_low20_0;
asr g_118_low60_0_low20_1 g_118_low60_0_low20_1 1;
subs dc r_118_119 r_118_118 u_118_118;
asr r_118_119 r_118_119 1;
subs dc s_118_119 s_118_118 v_118_118;
asr s_118_119 s_118_119 1;
assert
    true
&&
    f_118_low60_0_low20_1 = g_118_low60_0_low20_0,
    u_118_119 = r_118_118,
    v_118_119 = s_118_118,
    g_118_low60_0_low20_1 * (const 64 2) = g_118_low60_0_low20_0 - f_118_low60_0_low20_0,
    r_118_119 * (const 64 2) = r_118_118 - u_118_118,
    s_118_119 * (const 64 2) = s_118_118 - v_118_118
;

assume
    f_118_low60_0_low20_1 = g_118_low60_0_low20_0,
    u_118_119 = r_118_118,
    v_118_119 = s_118_118,
    g_118_low60_0_low20_1 * 2 = g_118_low60_0_low20_0 - f_118_low60_0_low20_0,
    r_118_119 * 2 = r_118_118 - u_118_118,
    s_118_119 * 2 = s_118_118 - v_118_118
&&
    true
;

{
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_1 + u_118_119 * (const 64 (2**21)) + v_118_119 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_1 + r_118_119 * (const 64 (2**21)) + s_118_119 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_1,
    f_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_1,
    g_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 119)) <=s delta, delta <=s (const 64 (1 + 2*119)),
    (const 64 (-(2**20))) <=s u_118_119, u_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_119, v_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_119, r_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_119, s_118_119 <=s (const 64 ((2**20)-1)),
    u_118_119 + v_118_119 <=s (const 64 (2**20)),
    u_118_119 - v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 + v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 - v_118_119 <=s (const 64 (2**20)),
    r_118_119 + s_118_119 <=s (const 64 (2**20)),
    r_118_119 - s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 + s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 - s_118_119 <=s (const 64 (2**20)),
    u_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_118_119 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_119_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_1,
sint64 g_118_low60_0_low20_1,
sint64 f_118_low60_0_low20_2,
sint64 g_118_low60_0_low20_2,
sint64 u_118_119,
sint64 v_118_119,
sint64 r_118_119,
sint64 s_118_119,
sint64 u_118_120,
sint64 v_118_120,
sint64 r_118_120,
sint64 s_118_120,
bit ne
)={
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (-(2**20)),
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (-(2**20))
&&
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (const 64 (-(2**20))),
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_1 + u_118_119 * (const 64 (2**21)) + v_118_119 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_1 + r_118_119 * (const 64 (2**21)) + s_118_119 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_1,
    f_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_1,
    g_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 119)) <=s delta, delta <=s (const 64 (1 + 2*119)),
    (const 64 (-(2**20))) <=s u_118_119, u_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_119, v_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_119, r_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_119, s_118_119 <=s (const 64 ((2**20)-1)),
    u_118_119 + v_118_119 <=s (const 64 (2**20)),
    u_118_119 - v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 + v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 - v_118_119 <=s (const 64 (2**20)),
    r_118_119 + s_118_119 <=s (const 64 (2**20)),
    r_118_119 - s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 + s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 - s_118_119 <=s (const 64 (2**20)),
    u_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_118_119 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step119

// premise a
assume
g_118_low60_0_low20_1 = 0 (mod 2)
&&
g_118_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_2 f_118_low60_0_low20_1;
mov u_118_120 u_118_119;
mov v_118_120 v_118_119;

asr g_118_low60_0_low20_2 g_118_low60_0_low20_1 1;
asr r_118_120 r_118_119 1;
asr s_118_120 s_118_119 1;
assert
    true
&&
    f_118_low60_0_low20_2 = f_118_low60_0_low20_1,
    u_118_120 = u_118_119,
    v_118_120 = v_118_119,
    g_118_low60_0_low20_2 * (const 64 2) = g_118_low60_0_low20_1,
    r_118_120 * (const 64 2) = r_118_119,
    s_118_120 * (const 64 2) = s_118_119
;

assume
    f_118_low60_0_low20_2 = f_118_low60_0_low20_1,
    u_118_120 = u_118_119,
    v_118_120 = v_118_119,
    g_118_low60_0_low20_2 * 2 = g_118_low60_0_low20_1,
    r_118_120 * 2 = r_118_119,
    s_118_120 * 2 = s_118_119
&&
    true
;

{
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_2 + u_118_120 * (const 64 (2**21)) + v_118_120 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_2 + r_118_120 * (const 64 (2**21)) + s_118_120 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_2,
    f_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_2,
    g_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 120)) <=s delta, delta <=s (const 64 (1 + 2*120)),
    (const 64 (-(2**20))) <=s u_118_120, u_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_120, v_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_120, r_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_120, s_118_120 <=s (const 64 ((2**20)-1)),
    u_118_120 + v_118_120 <=s (const 64 (2**20)),
    u_118_120 - v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 + v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 - v_118_120 <=s (const 64 (2**20)),
    r_118_120 + s_118_120 <=s (const 64 (2**20)),
    r_118_120 - s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 + s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 - s_118_120 <=s (const 64 (2**20)),
    u_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_118_120 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_119_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_1,
sint64 g_118_low60_0_low20_1,
sint64 f_118_low60_0_low20_2,
sint64 g_118_low60_0_low20_2,
sint64 u_118_119,
sint64 v_118_119,
sint64 r_118_119,
sint64 s_118_119,
sint64 u_118_120,
sint64 v_118_120,
sint64 r_118_120,
sint64 s_118_120,
bit ne
)={
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (-(2**20)),
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (-(2**20))
&&
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (const 64 (-(2**20))),
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_1 + u_118_119 * (const 64 (2**21)) + v_118_119 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_1 + r_118_119 * (const 64 (2**21)) + s_118_119 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_1,
    f_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_1,
    g_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 119)) <=s delta, delta <=s (const 64 (1 + 2*119)),
    (const 64 (-(2**20))) <=s u_118_119, u_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_119, v_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_119, r_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_119, s_118_119 <=s (const 64 ((2**20)-1)),
    u_118_119 + v_118_119 <=s (const 64 (2**20)),
    u_118_119 - v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 + v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 - v_118_119 <=s (const 64 (2**20)),
    r_118_119 + s_118_119 <=s (const 64 (2**20)),
    r_118_119 - s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 + s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 - s_118_119 <=s (const 64 (2**20)),
    u_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_118_119 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step119

// premise b
assume
g_118_low60_0_low20_1 = 1 (mod 2)
&&
g_118_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_2 f_118_low60_0_low20_1;
mov u_118_120 u_118_119;
mov v_118_120 v_118_119;

add g_118_low60_0_low20_2 g_118_low60_0_low20_1 f_118_low60_0_low20_1;
asr g_118_low60_0_low20_2 g_118_low60_0_low20_2 1;
add r_118_120 r_118_119 u_118_119;
asr r_118_120 r_118_120 1;
add s_118_120 s_118_119 v_118_119;
asr s_118_120 s_118_120 1;
assert
    true
&&
    f_118_low60_0_low20_2 = f_118_low60_0_low20_1,
    u_118_120 = u_118_119,
    v_118_120 = v_118_119,
    g_118_low60_0_low20_2 * (const 64 2) = g_118_low60_0_low20_1 + f_118_low60_0_low20_1,
    r_118_120 * (const 64 2) = r_118_119 + u_118_119,
    s_118_120 * (const 64 2) = s_118_119 + v_118_119
;

assume
    f_118_low60_0_low20_2 = f_118_low60_0_low20_1,
    u_118_120 = u_118_119,
    v_118_120 = v_118_119,
    g_118_low60_0_low20_2 * 2 = g_118_low60_0_low20_1 + f_118_low60_0_low20_1,
    r_118_120 * 2 = r_118_119 + u_118_119,
    s_118_120 * 2 = s_118_119 + v_118_119
&&
    true
;

{
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_2 + u_118_120 * (const 64 (2**21)) + v_118_120 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_2 + r_118_120 * (const 64 (2**21)) + s_118_120 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_2,
    f_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_2,
    g_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 120)) <=s delta, delta <=s (const 64 (1 + 2*120)),
    (const 64 (-(2**20))) <=s u_118_120, u_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_120, v_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_120, r_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_120, s_118_120 <=s (const 64 ((2**20)-1)),
    u_118_120 + v_118_120 <=s (const 64 (2**20)),
    u_118_120 - v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 + v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 - v_118_120 <=s (const 64 (2**20)),
    r_118_120 + s_118_120 <=s (const 64 (2**20)),
    r_118_120 - s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 + s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 - s_118_120 <=s (const 64 (2**20)),
    u_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_118_120 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_119_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_1,
sint64 g_118_low60_0_low20_1,
sint64 f_118_low60_0_low20_2,
sint64 g_118_low60_0_low20_2,
sint64 u_118_119,
sint64 v_118_119,
sint64 r_118_119,
sint64 s_118_119,
sint64 u_118_120,
sint64 v_118_120,
sint64 r_118_120,
sint64 s_118_120,
bit ne
)={
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (-(2**20)),
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (-(2**20))
&&
    u_118_119 * f_118_low60_0_low20_0 + v_118_119 * g_118_low60_0_low20_0 = f_118_low60_0_low20_1 * (const 64 (-(2**20))),
    r_118_119 * f_118_low60_0_low20_0 + s_118_119 * g_118_low60_0_low20_0 = g_118_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_1 + u_118_119 * (const 64 (2**21)) + v_118_119 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_1 + r_118_119 * (const 64 (2**21)) + s_118_119 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_1,
    f_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_1,
    g_118_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 119)) <=s delta, delta <=s (const 64 (1 + 2*119)),
    (const 64 (-(2**20))) <=s u_118_119, u_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_119, v_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_119, r_118_119 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_119, s_118_119 <=s (const 64 ((2**20)-1)),
    u_118_119 + v_118_119 <=s (const 64 (2**20)),
    u_118_119 - v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 + v_118_119 <=s (const 64 (2**20)),
    (const 64 0) - u_118_119 - v_118_119 <=s (const 64 (2**20)),
    r_118_119 + s_118_119 <=s (const 64 (2**20)),
    r_118_119 - s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 + s_118_119 <=s (const 64 (2**20)),
    (const 64 0) - r_118_119 - s_118_119 <=s (const 64 (2**20)),
    u_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_118_119 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_118_119 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step119

// premise c
assume
g_118_low60_0_low20_1 = 1 (mod 2)
&&
g_118_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_2 g_118_low60_0_low20_1;
mov u_118_120 r_118_119;
mov v_118_120 s_118_119;

subs dc g_118_low60_0_low20_2 g_118_low60_0_low20_1 f_118_low60_0_low20_1;
asr g_118_low60_0_low20_2 g_118_low60_0_low20_2 1;
subs dc r_118_120 r_118_119 u_118_119;
asr r_118_120 r_118_120 1;
subs dc s_118_120 s_118_119 v_118_119;
asr s_118_120 s_118_120 1;
assert
    true
&&
    f_118_low60_0_low20_2 = g_118_low60_0_low20_1,
    u_118_120 = r_118_119,
    v_118_120 = s_118_119,
    g_118_low60_0_low20_2 * (const 64 2) = g_118_low60_0_low20_1 - f_118_low60_0_low20_1,
    r_118_120 * (const 64 2) = r_118_119 - u_118_119,
    s_118_120 * (const 64 2) = s_118_119 - v_118_119
;

assume
    f_118_low60_0_low20_2 = g_118_low60_0_low20_1,
    u_118_120 = r_118_119,
    v_118_120 = s_118_119,
    g_118_low60_0_low20_2 * 2 = g_118_low60_0_low20_1 - f_118_low60_0_low20_1,
    r_118_120 * 2 = r_118_119 - u_118_119,
    s_118_120 * 2 = s_118_119 - v_118_119
&&
    true
;

{
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_2 + u_118_120 * (const 64 (2**21)) + v_118_120 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_2 + r_118_120 * (const 64 (2**21)) + s_118_120 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_2,
    f_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_2,
    g_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 120)) <=s delta, delta <=s (const 64 (1 + 2*120)),
    (const 64 (-(2**20))) <=s u_118_120, u_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_120, v_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_120, r_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_120, s_118_120 <=s (const 64 ((2**20)-1)),
    u_118_120 + v_118_120 <=s (const 64 (2**20)),
    u_118_120 - v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 + v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 - v_118_120 <=s (const 64 (2**20)),
    r_118_120 + s_118_120 <=s (const 64 (2**20)),
    r_118_120 - s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 + s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 - s_118_120 <=s (const 64 (2**20)),
    u_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_118_120 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_120_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_2,
sint64 g_118_low60_0_low20_2,
sint64 f_118_low60_0_low20_3,
sint64 g_118_low60_0_low20_3,
sint64 u_118_120,
sint64 v_118_120,
sint64 r_118_120,
sint64 s_118_120,
sint64 u_118_121,
sint64 v_118_121,
sint64 r_118_121,
sint64 s_118_121,
bit ne
)={
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (-(2**20)),
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (-(2**20))
&&
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (const 64 (-(2**20))),
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_2 + u_118_120 * (const 64 (2**21)) + v_118_120 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_2 + r_118_120 * (const 64 (2**21)) + s_118_120 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_2,
    f_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_2,
    g_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 120)) <=s delta, delta <=s (const 64 (1 + 2*120)),
    (const 64 (-(2**20))) <=s u_118_120, u_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_120, v_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_120, r_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_120, s_118_120 <=s (const 64 ((2**20)-1)),
    u_118_120 + v_118_120 <=s (const 64 (2**20)),
    u_118_120 - v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 + v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 - v_118_120 <=s (const 64 (2**20)),
    r_118_120 + s_118_120 <=s (const 64 (2**20)),
    r_118_120 - s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 + s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 - s_118_120 <=s (const 64 (2**20)),
    u_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_118_120 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step120

// premise a
assume
g_118_low60_0_low20_2 = 0 (mod 2)
&&
g_118_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_3 f_118_low60_0_low20_2;
mov u_118_121 u_118_120;
mov v_118_121 v_118_120;

asr g_118_low60_0_low20_3 g_118_low60_0_low20_2 1;
asr r_118_121 r_118_120 1;
asr s_118_121 s_118_120 1;
assert
    true
&&
    f_118_low60_0_low20_3 = f_118_low60_0_low20_2,
    u_118_121 = u_118_120,
    v_118_121 = v_118_120,
    g_118_low60_0_low20_3 * (const 64 2) = g_118_low60_0_low20_2,
    r_118_121 * (const 64 2) = r_118_120,
    s_118_121 * (const 64 2) = s_118_120
;

assume
    f_118_low60_0_low20_3 = f_118_low60_0_low20_2,
    u_118_121 = u_118_120,
    v_118_121 = v_118_120,
    g_118_low60_0_low20_3 * 2 = g_118_low60_0_low20_2,
    r_118_121 * 2 = r_118_120,
    s_118_121 * 2 = s_118_120
&&
    true
;

{
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_3 + u_118_121 * (const 64 (2**21)) + v_118_121 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_3 + r_118_121 * (const 64 (2**21)) + s_118_121 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_3,
    f_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_3,
    g_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 121)) <=s delta, delta <=s (const 64 (1 + 2*121)),
    (const 64 (-(2**20))) <=s u_118_121, u_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_121, v_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_121, r_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_121, s_118_121 <=s (const 64 ((2**20)-1)),
    u_118_121 + v_118_121 <=s (const 64 (2**20)),
    u_118_121 - v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 + v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 - v_118_121 <=s (const 64 (2**20)),
    r_118_121 + s_118_121 <=s (const 64 (2**20)),
    r_118_121 - s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 + s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 - s_118_121 <=s (const 64 (2**20)),
    u_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_118_121 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_120_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_2,
sint64 g_118_low60_0_low20_2,
sint64 f_118_low60_0_low20_3,
sint64 g_118_low60_0_low20_3,
sint64 u_118_120,
sint64 v_118_120,
sint64 r_118_120,
sint64 s_118_120,
sint64 u_118_121,
sint64 v_118_121,
sint64 r_118_121,
sint64 s_118_121,
bit ne
)={
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (-(2**20)),
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (-(2**20))
&&
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (const 64 (-(2**20))),
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_2 + u_118_120 * (const 64 (2**21)) + v_118_120 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_2 + r_118_120 * (const 64 (2**21)) + s_118_120 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_2,
    f_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_2,
    g_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 120)) <=s delta, delta <=s (const 64 (1 + 2*120)),
    (const 64 (-(2**20))) <=s u_118_120, u_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_120, v_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_120, r_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_120, s_118_120 <=s (const 64 ((2**20)-1)),
    u_118_120 + v_118_120 <=s (const 64 (2**20)),
    u_118_120 - v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 + v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 - v_118_120 <=s (const 64 (2**20)),
    r_118_120 + s_118_120 <=s (const 64 (2**20)),
    r_118_120 - s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 + s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 - s_118_120 <=s (const 64 (2**20)),
    u_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_118_120 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step120

// premise b
assume
g_118_low60_0_low20_2 = 1 (mod 2)
&&
g_118_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_3 f_118_low60_0_low20_2;
mov u_118_121 u_118_120;
mov v_118_121 v_118_120;

add g_118_low60_0_low20_3 g_118_low60_0_low20_2 f_118_low60_0_low20_2;
asr g_118_low60_0_low20_3 g_118_low60_0_low20_3 1;
add r_118_121 r_118_120 u_118_120;
asr r_118_121 r_118_121 1;
add s_118_121 s_118_120 v_118_120;
asr s_118_121 s_118_121 1;
assert
    true
&&
    f_118_low60_0_low20_3 = f_118_low60_0_low20_2,
    u_118_121 = u_118_120,
    v_118_121 = v_118_120,
    g_118_low60_0_low20_3 * (const 64 2) = g_118_low60_0_low20_2 + f_118_low60_0_low20_2,
    r_118_121 * (const 64 2) = r_118_120 + u_118_120,
    s_118_121 * (const 64 2) = s_118_120 + v_118_120
;

assume
    f_118_low60_0_low20_3 = f_118_low60_0_low20_2,
    u_118_121 = u_118_120,
    v_118_121 = v_118_120,
    g_118_low60_0_low20_3 * 2 = g_118_low60_0_low20_2 + f_118_low60_0_low20_2,
    r_118_121 * 2 = r_118_120 + u_118_120,
    s_118_121 * 2 = s_118_120 + v_118_120
&&
    true
;

{
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_3 + u_118_121 * (const 64 (2**21)) + v_118_121 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_3 + r_118_121 * (const 64 (2**21)) + s_118_121 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_3,
    f_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_3,
    g_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 121)) <=s delta, delta <=s (const 64 (1 + 2*121)),
    (const 64 (-(2**20))) <=s u_118_121, u_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_121, v_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_121, r_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_121, s_118_121 <=s (const 64 ((2**20)-1)),
    u_118_121 + v_118_121 <=s (const 64 (2**20)),
    u_118_121 - v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 + v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 - v_118_121 <=s (const 64 (2**20)),
    r_118_121 + s_118_121 <=s (const 64 (2**20)),
    r_118_121 - s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 + s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 - s_118_121 <=s (const 64 (2**20)),
    u_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_118_121 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_120_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_2,
sint64 g_118_low60_0_low20_2,
sint64 f_118_low60_0_low20_3,
sint64 g_118_low60_0_low20_3,
sint64 u_118_120,
sint64 v_118_120,
sint64 r_118_120,
sint64 s_118_120,
sint64 u_118_121,
sint64 v_118_121,
sint64 r_118_121,
sint64 s_118_121,
bit ne
)={
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (-(2**20)),
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (-(2**20))
&&
    u_118_120 * f_118_low60_0_low20_0 + v_118_120 * g_118_low60_0_low20_0 = f_118_low60_0_low20_2 * (const 64 (-(2**20))),
    r_118_120 * f_118_low60_0_low20_0 + s_118_120 * g_118_low60_0_low20_0 = g_118_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_2 + u_118_120 * (const 64 (2**21)) + v_118_120 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_2 + r_118_120 * (const 64 (2**21)) + s_118_120 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_2,
    f_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_2,
    g_118_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 120)) <=s delta, delta <=s (const 64 (1 + 2*120)),
    (const 64 (-(2**20))) <=s u_118_120, u_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_120, v_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_120, r_118_120 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_120, s_118_120 <=s (const 64 ((2**20)-1)),
    u_118_120 + v_118_120 <=s (const 64 (2**20)),
    u_118_120 - v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 + v_118_120 <=s (const 64 (2**20)),
    (const 64 0) - u_118_120 - v_118_120 <=s (const 64 (2**20)),
    r_118_120 + s_118_120 <=s (const 64 (2**20)),
    r_118_120 - s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 + s_118_120 <=s (const 64 (2**20)),
    (const 64 0) - r_118_120 - s_118_120 <=s (const 64 (2**20)),
    u_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_118_120 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_118_120 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step120

// premise c
assume
g_118_low60_0_low20_2 = 1 (mod 2)
&&
g_118_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_3 g_118_low60_0_low20_2;
mov u_118_121 r_118_120;
mov v_118_121 s_118_120;

subs dc g_118_low60_0_low20_3 g_118_low60_0_low20_2 f_118_low60_0_low20_2;
asr g_118_low60_0_low20_3 g_118_low60_0_low20_3 1;
subs dc r_118_121 r_118_120 u_118_120;
asr r_118_121 r_118_121 1;
subs dc s_118_121 s_118_120 v_118_120;
asr s_118_121 s_118_121 1;
assert
    true
&&
    f_118_low60_0_low20_3 = g_118_low60_0_low20_2,
    u_118_121 = r_118_120,
    v_118_121 = s_118_120,
    g_118_low60_0_low20_3 * (const 64 2) = g_118_low60_0_low20_2 - f_118_low60_0_low20_2,
    r_118_121 * (const 64 2) = r_118_120 - u_118_120,
    s_118_121 * (const 64 2) = s_118_120 - v_118_120
;

assume
    f_118_low60_0_low20_3 = g_118_low60_0_low20_2,
    u_118_121 = r_118_120,
    v_118_121 = s_118_120,
    g_118_low60_0_low20_3 * 2 = g_118_low60_0_low20_2 - f_118_low60_0_low20_2,
    r_118_121 * 2 = r_118_120 - u_118_120,
    s_118_121 * 2 = s_118_120 - v_118_120
&&
    true
;

{
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_3 + u_118_121 * (const 64 (2**21)) + v_118_121 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_3 + r_118_121 * (const 64 (2**21)) + s_118_121 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_3,
    f_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_3,
    g_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 121)) <=s delta, delta <=s (const 64 (1 + 2*121)),
    (const 64 (-(2**20))) <=s u_118_121, u_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_121, v_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_121, r_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_121, s_118_121 <=s (const 64 ((2**20)-1)),
    u_118_121 + v_118_121 <=s (const 64 (2**20)),
    u_118_121 - v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 + v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 - v_118_121 <=s (const 64 (2**20)),
    r_118_121 + s_118_121 <=s (const 64 (2**20)),
    r_118_121 - s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 + s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 - s_118_121 <=s (const 64 (2**20)),
    u_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_118_121 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_121_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_3,
sint64 g_118_low60_0_low20_3,
sint64 f_118_low60_0_low20_4,
sint64 g_118_low60_0_low20_4,
sint64 u_118_121,
sint64 v_118_121,
sint64 r_118_121,
sint64 s_118_121,
sint64 u_118_122,
sint64 v_118_122,
sint64 r_118_122,
sint64 s_118_122,
bit ne
)={
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (-(2**20)),
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (-(2**20))
&&
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (const 64 (-(2**20))),
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_3 + u_118_121 * (const 64 (2**21)) + v_118_121 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_3 + r_118_121 * (const 64 (2**21)) + s_118_121 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_3,
    f_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_3,
    g_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 121)) <=s delta, delta <=s (const 64 (1 + 2*121)),
    (const 64 (-(2**20))) <=s u_118_121, u_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_121, v_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_121, r_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_121, s_118_121 <=s (const 64 ((2**20)-1)),
    u_118_121 + v_118_121 <=s (const 64 (2**20)),
    u_118_121 - v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 + v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 - v_118_121 <=s (const 64 (2**20)),
    r_118_121 + s_118_121 <=s (const 64 (2**20)),
    r_118_121 - s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 + s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 - s_118_121 <=s (const 64 (2**20)),
    u_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_118_121 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step121

// premise a
assume
g_118_low60_0_low20_3 = 0 (mod 2)
&&
g_118_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_4 f_118_low60_0_low20_3;
mov u_118_122 u_118_121;
mov v_118_122 v_118_121;

asr g_118_low60_0_low20_4 g_118_low60_0_low20_3 1;
asr r_118_122 r_118_121 1;
asr s_118_122 s_118_121 1;
assert
    true
&&
    f_118_low60_0_low20_4 = f_118_low60_0_low20_3,
    u_118_122 = u_118_121,
    v_118_122 = v_118_121,
    g_118_low60_0_low20_4 * (const 64 2) = g_118_low60_0_low20_3,
    r_118_122 * (const 64 2) = r_118_121,
    s_118_122 * (const 64 2) = s_118_121
;

assume
    f_118_low60_0_low20_4 = f_118_low60_0_low20_3,
    u_118_122 = u_118_121,
    v_118_122 = v_118_121,
    g_118_low60_0_low20_4 * 2 = g_118_low60_0_low20_3,
    r_118_122 * 2 = r_118_121,
    s_118_122 * 2 = s_118_121
&&
    true
;

{
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_4 + u_118_122 * (const 64 (2**21)) + v_118_122 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_4 + r_118_122 * (const 64 (2**21)) + s_118_122 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_4,
    f_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_4,
    g_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 122)) <=s delta, delta <=s (const 64 (1 + 2*122)),
    (const 64 (-(2**20))) <=s u_118_122, u_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_122, v_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_122, r_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_122, s_118_122 <=s (const 64 ((2**20)-1)),
    u_118_122 + v_118_122 <=s (const 64 (2**20)),
    u_118_122 - v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 + v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 - v_118_122 <=s (const 64 (2**20)),
    r_118_122 + s_118_122 <=s (const 64 (2**20)),
    r_118_122 - s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 + s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 - s_118_122 <=s (const 64 (2**20)),
    u_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_118_122 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_121_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_3,
sint64 g_118_low60_0_low20_3,
sint64 f_118_low60_0_low20_4,
sint64 g_118_low60_0_low20_4,
sint64 u_118_121,
sint64 v_118_121,
sint64 r_118_121,
sint64 s_118_121,
sint64 u_118_122,
sint64 v_118_122,
sint64 r_118_122,
sint64 s_118_122,
bit ne
)={
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (-(2**20)),
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (-(2**20))
&&
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (const 64 (-(2**20))),
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_3 + u_118_121 * (const 64 (2**21)) + v_118_121 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_3 + r_118_121 * (const 64 (2**21)) + s_118_121 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_3,
    f_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_3,
    g_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 121)) <=s delta, delta <=s (const 64 (1 + 2*121)),
    (const 64 (-(2**20))) <=s u_118_121, u_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_121, v_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_121, r_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_121, s_118_121 <=s (const 64 ((2**20)-1)),
    u_118_121 + v_118_121 <=s (const 64 (2**20)),
    u_118_121 - v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 + v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 - v_118_121 <=s (const 64 (2**20)),
    r_118_121 + s_118_121 <=s (const 64 (2**20)),
    r_118_121 - s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 + s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 - s_118_121 <=s (const 64 (2**20)),
    u_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_118_121 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step121

// premise b
assume
g_118_low60_0_low20_3 = 1 (mod 2)
&&
g_118_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_4 f_118_low60_0_low20_3;
mov u_118_122 u_118_121;
mov v_118_122 v_118_121;

add g_118_low60_0_low20_4 g_118_low60_0_low20_3 f_118_low60_0_low20_3;
asr g_118_low60_0_low20_4 g_118_low60_0_low20_4 1;
add r_118_122 r_118_121 u_118_121;
asr r_118_122 r_118_122 1;
add s_118_122 s_118_121 v_118_121;
asr s_118_122 s_118_122 1;
assert
    true
&&
    f_118_low60_0_low20_4 = f_118_low60_0_low20_3,
    u_118_122 = u_118_121,
    v_118_122 = v_118_121,
    g_118_low60_0_low20_4 * (const 64 2) = g_118_low60_0_low20_3 + f_118_low60_0_low20_3,
    r_118_122 * (const 64 2) = r_118_121 + u_118_121,
    s_118_122 * (const 64 2) = s_118_121 + v_118_121
;

assume
    f_118_low60_0_low20_4 = f_118_low60_0_low20_3,
    u_118_122 = u_118_121,
    v_118_122 = v_118_121,
    g_118_low60_0_low20_4 * 2 = g_118_low60_0_low20_3 + f_118_low60_0_low20_3,
    r_118_122 * 2 = r_118_121 + u_118_121,
    s_118_122 * 2 = s_118_121 + v_118_121
&&
    true
;

{
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_4 + u_118_122 * (const 64 (2**21)) + v_118_122 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_4 + r_118_122 * (const 64 (2**21)) + s_118_122 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_4,
    f_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_4,
    g_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 122)) <=s delta, delta <=s (const 64 (1 + 2*122)),
    (const 64 (-(2**20))) <=s u_118_122, u_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_122, v_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_122, r_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_122, s_118_122 <=s (const 64 ((2**20)-1)),
    u_118_122 + v_118_122 <=s (const 64 (2**20)),
    u_118_122 - v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 + v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 - v_118_122 <=s (const 64 (2**20)),
    r_118_122 + s_118_122 <=s (const 64 (2**20)),
    r_118_122 - s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 + s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 - s_118_122 <=s (const 64 (2**20)),
    u_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_118_122 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_121_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_3,
sint64 g_118_low60_0_low20_3,
sint64 f_118_low60_0_low20_4,
sint64 g_118_low60_0_low20_4,
sint64 u_118_121,
sint64 v_118_121,
sint64 r_118_121,
sint64 s_118_121,
sint64 u_118_122,
sint64 v_118_122,
sint64 r_118_122,
sint64 s_118_122,
bit ne
)={
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (-(2**20)),
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (-(2**20))
&&
    u_118_121 * f_118_low60_0_low20_0 + v_118_121 * g_118_low60_0_low20_0 = f_118_low60_0_low20_3 * (const 64 (-(2**20))),
    r_118_121 * f_118_low60_0_low20_0 + s_118_121 * g_118_low60_0_low20_0 = g_118_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_3 + u_118_121 * (const 64 (2**21)) + v_118_121 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_3 + r_118_121 * (const 64 (2**21)) + s_118_121 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_3,
    f_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_3,
    g_118_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 121)) <=s delta, delta <=s (const 64 (1 + 2*121)),
    (const 64 (-(2**20))) <=s u_118_121, u_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_121, v_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_121, r_118_121 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_121, s_118_121 <=s (const 64 ((2**20)-1)),
    u_118_121 + v_118_121 <=s (const 64 (2**20)),
    u_118_121 - v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 + v_118_121 <=s (const 64 (2**20)),
    (const 64 0) - u_118_121 - v_118_121 <=s (const 64 (2**20)),
    r_118_121 + s_118_121 <=s (const 64 (2**20)),
    r_118_121 - s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 + s_118_121 <=s (const 64 (2**20)),
    (const 64 0) - r_118_121 - s_118_121 <=s (const 64 (2**20)),
    u_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_118_121 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_118_121 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step121

// premise c
assume
g_118_low60_0_low20_3 = 1 (mod 2)
&&
g_118_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_4 g_118_low60_0_low20_3;
mov u_118_122 r_118_121;
mov v_118_122 s_118_121;

subs dc g_118_low60_0_low20_4 g_118_low60_0_low20_3 f_118_low60_0_low20_3;
asr g_118_low60_0_low20_4 g_118_low60_0_low20_4 1;
subs dc r_118_122 r_118_121 u_118_121;
asr r_118_122 r_118_122 1;
subs dc s_118_122 s_118_121 v_118_121;
asr s_118_122 s_118_122 1;
assert
    true
&&
    f_118_low60_0_low20_4 = g_118_low60_0_low20_3,
    u_118_122 = r_118_121,
    v_118_122 = s_118_121,
    g_118_low60_0_low20_4 * (const 64 2) = g_118_low60_0_low20_3 - f_118_low60_0_low20_3,
    r_118_122 * (const 64 2) = r_118_121 - u_118_121,
    s_118_122 * (const 64 2) = s_118_121 - v_118_121
;

assume
    f_118_low60_0_low20_4 = g_118_low60_0_low20_3,
    u_118_122 = r_118_121,
    v_118_122 = s_118_121,
    g_118_low60_0_low20_4 * 2 = g_118_low60_0_low20_3 - f_118_low60_0_low20_3,
    r_118_122 * 2 = r_118_121 - u_118_121,
    s_118_122 * 2 = s_118_121 - v_118_121
&&
    true
;

{
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_4 + u_118_122 * (const 64 (2**21)) + v_118_122 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_4 + r_118_122 * (const 64 (2**21)) + s_118_122 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_4,
    f_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_4,
    g_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 122)) <=s delta, delta <=s (const 64 (1 + 2*122)),
    (const 64 (-(2**20))) <=s u_118_122, u_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_122, v_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_122, r_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_122, s_118_122 <=s (const 64 ((2**20)-1)),
    u_118_122 + v_118_122 <=s (const 64 (2**20)),
    u_118_122 - v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 + v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 - v_118_122 <=s (const 64 (2**20)),
    r_118_122 + s_118_122 <=s (const 64 (2**20)),
    r_118_122 - s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 + s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 - s_118_122 <=s (const 64 (2**20)),
    u_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_118_122 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_122_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_4,
sint64 g_118_low60_0_low20_4,
sint64 f_118_low60_0_low20_5,
sint64 g_118_low60_0_low20_5,
sint64 u_118_122,
sint64 v_118_122,
sint64 r_118_122,
sint64 s_118_122,
sint64 u_118_123,
sint64 v_118_123,
sint64 r_118_123,
sint64 s_118_123,
bit ne
)={
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (-(2**20)),
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (-(2**20))
&&
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (const 64 (-(2**20))),
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_4 + u_118_122 * (const 64 (2**21)) + v_118_122 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_4 + r_118_122 * (const 64 (2**21)) + s_118_122 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_4,
    f_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_4,
    g_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 122)) <=s delta, delta <=s (const 64 (1 + 2*122)),
    (const 64 (-(2**20))) <=s u_118_122, u_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_122, v_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_122, r_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_122, s_118_122 <=s (const 64 ((2**20)-1)),
    u_118_122 + v_118_122 <=s (const 64 (2**20)),
    u_118_122 - v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 + v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 - v_118_122 <=s (const 64 (2**20)),
    r_118_122 + s_118_122 <=s (const 64 (2**20)),
    r_118_122 - s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 + s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 - s_118_122 <=s (const 64 (2**20)),
    u_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_118_122 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step122

// premise a
assume
g_118_low60_0_low20_4 = 0 (mod 2)
&&
g_118_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_5 f_118_low60_0_low20_4;
mov u_118_123 u_118_122;
mov v_118_123 v_118_122;

asr g_118_low60_0_low20_5 g_118_low60_0_low20_4 1;
asr r_118_123 r_118_122 1;
asr s_118_123 s_118_122 1;
assert
    true
&&
    f_118_low60_0_low20_5 = f_118_low60_0_low20_4,
    u_118_123 = u_118_122,
    v_118_123 = v_118_122,
    g_118_low60_0_low20_5 * (const 64 2) = g_118_low60_0_low20_4,
    r_118_123 * (const 64 2) = r_118_122,
    s_118_123 * (const 64 2) = s_118_122
;

assume
    f_118_low60_0_low20_5 = f_118_low60_0_low20_4,
    u_118_123 = u_118_122,
    v_118_123 = v_118_122,
    g_118_low60_0_low20_5 * 2 = g_118_low60_0_low20_4,
    r_118_123 * 2 = r_118_122,
    s_118_123 * 2 = s_118_122
&&
    true
;

{
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_5 + u_118_123 * (const 64 (2**21)) + v_118_123 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_5 + r_118_123 * (const 64 (2**21)) + s_118_123 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_5,
    f_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_5,
    g_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 123)) <=s delta, delta <=s (const 64 (1 + 2*123)),
    (const 64 (-(2**20))) <=s u_118_123, u_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_123, v_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_123, r_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_123, s_118_123 <=s (const 64 ((2**20)-1)),
    u_118_123 + v_118_123 <=s (const 64 (2**20)),
    u_118_123 - v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 + v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 - v_118_123 <=s (const 64 (2**20)),
    r_118_123 + s_118_123 <=s (const 64 (2**20)),
    r_118_123 - s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 + s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 - s_118_123 <=s (const 64 (2**20)),
    u_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_118_123 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_122_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_4,
sint64 g_118_low60_0_low20_4,
sint64 f_118_low60_0_low20_5,
sint64 g_118_low60_0_low20_5,
sint64 u_118_122,
sint64 v_118_122,
sint64 r_118_122,
sint64 s_118_122,
sint64 u_118_123,
sint64 v_118_123,
sint64 r_118_123,
sint64 s_118_123,
bit ne
)={
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (-(2**20)),
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (-(2**20))
&&
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (const 64 (-(2**20))),
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_4 + u_118_122 * (const 64 (2**21)) + v_118_122 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_4 + r_118_122 * (const 64 (2**21)) + s_118_122 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_4,
    f_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_4,
    g_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 122)) <=s delta, delta <=s (const 64 (1 + 2*122)),
    (const 64 (-(2**20))) <=s u_118_122, u_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_122, v_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_122, r_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_122, s_118_122 <=s (const 64 ((2**20)-1)),
    u_118_122 + v_118_122 <=s (const 64 (2**20)),
    u_118_122 - v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 + v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 - v_118_122 <=s (const 64 (2**20)),
    r_118_122 + s_118_122 <=s (const 64 (2**20)),
    r_118_122 - s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 + s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 - s_118_122 <=s (const 64 (2**20)),
    u_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_118_122 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step122

// premise b
assume
g_118_low60_0_low20_4 = 1 (mod 2)
&&
g_118_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_5 f_118_low60_0_low20_4;
mov u_118_123 u_118_122;
mov v_118_123 v_118_122;

add g_118_low60_0_low20_5 g_118_low60_0_low20_4 f_118_low60_0_low20_4;
asr g_118_low60_0_low20_5 g_118_low60_0_low20_5 1;
add r_118_123 r_118_122 u_118_122;
asr r_118_123 r_118_123 1;
add s_118_123 s_118_122 v_118_122;
asr s_118_123 s_118_123 1;
assert
    true
&&
    f_118_low60_0_low20_5 = f_118_low60_0_low20_4,
    u_118_123 = u_118_122,
    v_118_123 = v_118_122,
    g_118_low60_0_low20_5 * (const 64 2) = g_118_low60_0_low20_4 + f_118_low60_0_low20_4,
    r_118_123 * (const 64 2) = r_118_122 + u_118_122,
    s_118_123 * (const 64 2) = s_118_122 + v_118_122
;

assume
    f_118_low60_0_low20_5 = f_118_low60_0_low20_4,
    u_118_123 = u_118_122,
    v_118_123 = v_118_122,
    g_118_low60_0_low20_5 * 2 = g_118_low60_0_low20_4 + f_118_low60_0_low20_4,
    r_118_123 * 2 = r_118_122 + u_118_122,
    s_118_123 * 2 = s_118_122 + v_118_122
&&
    true
;

{
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_5 + u_118_123 * (const 64 (2**21)) + v_118_123 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_5 + r_118_123 * (const 64 (2**21)) + s_118_123 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_5,
    f_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_5,
    g_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 123)) <=s delta, delta <=s (const 64 (1 + 2*123)),
    (const 64 (-(2**20))) <=s u_118_123, u_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_123, v_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_123, r_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_123, s_118_123 <=s (const 64 ((2**20)-1)),
    u_118_123 + v_118_123 <=s (const 64 (2**20)),
    u_118_123 - v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 + v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 - v_118_123 <=s (const 64 (2**20)),
    r_118_123 + s_118_123 <=s (const 64 (2**20)),
    r_118_123 - s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 + s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 - s_118_123 <=s (const 64 (2**20)),
    u_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_118_123 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_122_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_4,
sint64 g_118_low60_0_low20_4,
sint64 f_118_low60_0_low20_5,
sint64 g_118_low60_0_low20_5,
sint64 u_118_122,
sint64 v_118_122,
sint64 r_118_122,
sint64 s_118_122,
sint64 u_118_123,
sint64 v_118_123,
sint64 r_118_123,
sint64 s_118_123,
bit ne
)={
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (-(2**20)),
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (-(2**20))
&&
    u_118_122 * f_118_low60_0_low20_0 + v_118_122 * g_118_low60_0_low20_0 = f_118_low60_0_low20_4 * (const 64 (-(2**20))),
    r_118_122 * f_118_low60_0_low20_0 + s_118_122 * g_118_low60_0_low20_0 = g_118_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_4 + u_118_122 * (const 64 (2**21)) + v_118_122 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_4 + r_118_122 * (const 64 (2**21)) + s_118_122 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_4,
    f_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_4,
    g_118_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 122)) <=s delta, delta <=s (const 64 (1 + 2*122)),
    (const 64 (-(2**20))) <=s u_118_122, u_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_122, v_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_122, r_118_122 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_122, s_118_122 <=s (const 64 ((2**20)-1)),
    u_118_122 + v_118_122 <=s (const 64 (2**20)),
    u_118_122 - v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 + v_118_122 <=s (const 64 (2**20)),
    (const 64 0) - u_118_122 - v_118_122 <=s (const 64 (2**20)),
    r_118_122 + s_118_122 <=s (const 64 (2**20)),
    r_118_122 - s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 + s_118_122 <=s (const 64 (2**20)),
    (const 64 0) - r_118_122 - s_118_122 <=s (const 64 (2**20)),
    u_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_118_122 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_118_122 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step122

// premise c
assume
g_118_low60_0_low20_4 = 1 (mod 2)
&&
g_118_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_5 g_118_low60_0_low20_4;
mov u_118_123 r_118_122;
mov v_118_123 s_118_122;

subs dc g_118_low60_0_low20_5 g_118_low60_0_low20_4 f_118_low60_0_low20_4;
asr g_118_low60_0_low20_5 g_118_low60_0_low20_5 1;
subs dc r_118_123 r_118_122 u_118_122;
asr r_118_123 r_118_123 1;
subs dc s_118_123 s_118_122 v_118_122;
asr s_118_123 s_118_123 1;
assert
    true
&&
    f_118_low60_0_low20_5 = g_118_low60_0_low20_4,
    u_118_123 = r_118_122,
    v_118_123 = s_118_122,
    g_118_low60_0_low20_5 * (const 64 2) = g_118_low60_0_low20_4 - f_118_low60_0_low20_4,
    r_118_123 * (const 64 2) = r_118_122 - u_118_122,
    s_118_123 * (const 64 2) = s_118_122 - v_118_122
;

assume
    f_118_low60_0_low20_5 = g_118_low60_0_low20_4,
    u_118_123 = r_118_122,
    v_118_123 = s_118_122,
    g_118_low60_0_low20_5 * 2 = g_118_low60_0_low20_4 - f_118_low60_0_low20_4,
    r_118_123 * 2 = r_118_122 - u_118_122,
    s_118_123 * 2 = s_118_122 - v_118_122
&&
    true
;

{
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_5 + u_118_123 * (const 64 (2**21)) + v_118_123 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_5 + r_118_123 * (const 64 (2**21)) + s_118_123 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_5,
    f_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_5,
    g_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 123)) <=s delta, delta <=s (const 64 (1 + 2*123)),
    (const 64 (-(2**20))) <=s u_118_123, u_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_123, v_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_123, r_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_123, s_118_123 <=s (const 64 ((2**20)-1)),
    u_118_123 + v_118_123 <=s (const 64 (2**20)),
    u_118_123 - v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 + v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 - v_118_123 <=s (const 64 (2**20)),
    r_118_123 + s_118_123 <=s (const 64 (2**20)),
    r_118_123 - s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 + s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 - s_118_123 <=s (const 64 (2**20)),
    u_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_118_123 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_123_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_5,
sint64 g_118_low60_0_low20_5,
sint64 f_118_low60_0_low20_6,
sint64 g_118_low60_0_low20_6,
sint64 u_118_123,
sint64 v_118_123,
sint64 r_118_123,
sint64 s_118_123,
sint64 u_118_124,
sint64 v_118_124,
sint64 r_118_124,
sint64 s_118_124,
bit ne
)={
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (-(2**20)),
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (-(2**20))
&&
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (const 64 (-(2**20))),
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_5 + u_118_123 * (const 64 (2**21)) + v_118_123 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_5 + r_118_123 * (const 64 (2**21)) + s_118_123 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_5,
    f_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_5,
    g_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 123)) <=s delta, delta <=s (const 64 (1 + 2*123)),
    (const 64 (-(2**20))) <=s u_118_123, u_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_123, v_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_123, r_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_123, s_118_123 <=s (const 64 ((2**20)-1)),
    u_118_123 + v_118_123 <=s (const 64 (2**20)),
    u_118_123 - v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 + v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 - v_118_123 <=s (const 64 (2**20)),
    r_118_123 + s_118_123 <=s (const 64 (2**20)),
    r_118_123 - s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 + s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 - s_118_123 <=s (const 64 (2**20)),
    u_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_118_123 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step123

// premise a
assume
g_118_low60_0_low20_5 = 0 (mod 2)
&&
g_118_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_6 f_118_low60_0_low20_5;
mov u_118_124 u_118_123;
mov v_118_124 v_118_123;

asr g_118_low60_0_low20_6 g_118_low60_0_low20_5 1;
asr r_118_124 r_118_123 1;
asr s_118_124 s_118_123 1;
assert
    true
&&
    f_118_low60_0_low20_6 = f_118_low60_0_low20_5,
    u_118_124 = u_118_123,
    v_118_124 = v_118_123,
    g_118_low60_0_low20_6 * (const 64 2) = g_118_low60_0_low20_5,
    r_118_124 * (const 64 2) = r_118_123,
    s_118_124 * (const 64 2) = s_118_123
;

assume
    f_118_low60_0_low20_6 = f_118_low60_0_low20_5,
    u_118_124 = u_118_123,
    v_118_124 = v_118_123,
    g_118_low60_0_low20_6 * 2 = g_118_low60_0_low20_5,
    r_118_124 * 2 = r_118_123,
    s_118_124 * 2 = s_118_123
&&
    true
;

{
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_6 + u_118_124 * (const 64 (2**21)) + v_118_124 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_6 + r_118_124 * (const 64 (2**21)) + s_118_124 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_6,
    f_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_6,
    g_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 124)) <=s delta, delta <=s (const 64 (1 + 2*124)),
    (const 64 (-(2**20))) <=s u_118_124, u_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_124, v_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_124, r_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_124, s_118_124 <=s (const 64 ((2**20)-1)),
    u_118_124 + v_118_124 <=s (const 64 (2**20)),
    u_118_124 - v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 + v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 - v_118_124 <=s (const 64 (2**20)),
    r_118_124 + s_118_124 <=s (const 64 (2**20)),
    r_118_124 - s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 + s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 - s_118_124 <=s (const 64 (2**20)),
    u_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_118_124 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_123_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_5,
sint64 g_118_low60_0_low20_5,
sint64 f_118_low60_0_low20_6,
sint64 g_118_low60_0_low20_6,
sint64 u_118_123,
sint64 v_118_123,
sint64 r_118_123,
sint64 s_118_123,
sint64 u_118_124,
sint64 v_118_124,
sint64 r_118_124,
sint64 s_118_124,
bit ne
)={
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (-(2**20)),
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (-(2**20))
&&
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (const 64 (-(2**20))),
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_5 + u_118_123 * (const 64 (2**21)) + v_118_123 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_5 + r_118_123 * (const 64 (2**21)) + s_118_123 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_5,
    f_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_5,
    g_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 123)) <=s delta, delta <=s (const 64 (1 + 2*123)),
    (const 64 (-(2**20))) <=s u_118_123, u_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_123, v_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_123, r_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_123, s_118_123 <=s (const 64 ((2**20)-1)),
    u_118_123 + v_118_123 <=s (const 64 (2**20)),
    u_118_123 - v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 + v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 - v_118_123 <=s (const 64 (2**20)),
    r_118_123 + s_118_123 <=s (const 64 (2**20)),
    r_118_123 - s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 + s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 - s_118_123 <=s (const 64 (2**20)),
    u_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_118_123 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step123

// premise b
assume
g_118_low60_0_low20_5 = 1 (mod 2)
&&
g_118_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_6 f_118_low60_0_low20_5;
mov u_118_124 u_118_123;
mov v_118_124 v_118_123;

add g_118_low60_0_low20_6 g_118_low60_0_low20_5 f_118_low60_0_low20_5;
asr g_118_low60_0_low20_6 g_118_low60_0_low20_6 1;
add r_118_124 r_118_123 u_118_123;
asr r_118_124 r_118_124 1;
add s_118_124 s_118_123 v_118_123;
asr s_118_124 s_118_124 1;
assert
    true
&&
    f_118_low60_0_low20_6 = f_118_low60_0_low20_5,
    u_118_124 = u_118_123,
    v_118_124 = v_118_123,
    g_118_low60_0_low20_6 * (const 64 2) = g_118_low60_0_low20_5 + f_118_low60_0_low20_5,
    r_118_124 * (const 64 2) = r_118_123 + u_118_123,
    s_118_124 * (const 64 2) = s_118_123 + v_118_123
;

assume
    f_118_low60_0_low20_6 = f_118_low60_0_low20_5,
    u_118_124 = u_118_123,
    v_118_124 = v_118_123,
    g_118_low60_0_low20_6 * 2 = g_118_low60_0_low20_5 + f_118_low60_0_low20_5,
    r_118_124 * 2 = r_118_123 + u_118_123,
    s_118_124 * 2 = s_118_123 + v_118_123
&&
    true
;

{
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_6 + u_118_124 * (const 64 (2**21)) + v_118_124 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_6 + r_118_124 * (const 64 (2**21)) + s_118_124 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_6,
    f_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_6,
    g_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 124)) <=s delta, delta <=s (const 64 (1 + 2*124)),
    (const 64 (-(2**20))) <=s u_118_124, u_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_124, v_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_124, r_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_124, s_118_124 <=s (const 64 ((2**20)-1)),
    u_118_124 + v_118_124 <=s (const 64 (2**20)),
    u_118_124 - v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 + v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 - v_118_124 <=s (const 64 (2**20)),
    r_118_124 + s_118_124 <=s (const 64 (2**20)),
    r_118_124 - s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 + s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 - s_118_124 <=s (const 64 (2**20)),
    u_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_118_124 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_123_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_5,
sint64 g_118_low60_0_low20_5,
sint64 f_118_low60_0_low20_6,
sint64 g_118_low60_0_low20_6,
sint64 u_118_123,
sint64 v_118_123,
sint64 r_118_123,
sint64 s_118_123,
sint64 u_118_124,
sint64 v_118_124,
sint64 r_118_124,
sint64 s_118_124,
bit ne
)={
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (-(2**20)),
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (-(2**20))
&&
    u_118_123 * f_118_low60_0_low20_0 + v_118_123 * g_118_low60_0_low20_0 = f_118_low60_0_low20_5 * (const 64 (-(2**20))),
    r_118_123 * f_118_low60_0_low20_0 + s_118_123 * g_118_low60_0_low20_0 = g_118_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_5 + u_118_123 * (const 64 (2**21)) + v_118_123 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_5 + r_118_123 * (const 64 (2**21)) + s_118_123 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_5,
    f_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_5,
    g_118_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 123)) <=s delta, delta <=s (const 64 (1 + 2*123)),
    (const 64 (-(2**20))) <=s u_118_123, u_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_123, v_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_123, r_118_123 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_123, s_118_123 <=s (const 64 ((2**20)-1)),
    u_118_123 + v_118_123 <=s (const 64 (2**20)),
    u_118_123 - v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 + v_118_123 <=s (const 64 (2**20)),
    (const 64 0) - u_118_123 - v_118_123 <=s (const 64 (2**20)),
    r_118_123 + s_118_123 <=s (const 64 (2**20)),
    r_118_123 - s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 + s_118_123 <=s (const 64 (2**20)),
    (const 64 0) - r_118_123 - s_118_123 <=s (const 64 (2**20)),
    u_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_118_123 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_118_123 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step123

// premise c
assume
g_118_low60_0_low20_5 = 1 (mod 2)
&&
g_118_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_6 g_118_low60_0_low20_5;
mov u_118_124 r_118_123;
mov v_118_124 s_118_123;

subs dc g_118_low60_0_low20_6 g_118_low60_0_low20_5 f_118_low60_0_low20_5;
asr g_118_low60_0_low20_6 g_118_low60_0_low20_6 1;
subs dc r_118_124 r_118_123 u_118_123;
asr r_118_124 r_118_124 1;
subs dc s_118_124 s_118_123 v_118_123;
asr s_118_124 s_118_124 1;
assert
    true
&&
    f_118_low60_0_low20_6 = g_118_low60_0_low20_5,
    u_118_124 = r_118_123,
    v_118_124 = s_118_123,
    g_118_low60_0_low20_6 * (const 64 2) = g_118_low60_0_low20_5 - f_118_low60_0_low20_5,
    r_118_124 * (const 64 2) = r_118_123 - u_118_123,
    s_118_124 * (const 64 2) = s_118_123 - v_118_123
;

assume
    f_118_low60_0_low20_6 = g_118_low60_0_low20_5,
    u_118_124 = r_118_123,
    v_118_124 = s_118_123,
    g_118_low60_0_low20_6 * 2 = g_118_low60_0_low20_5 - f_118_low60_0_low20_5,
    r_118_124 * 2 = r_118_123 - u_118_123,
    s_118_124 * 2 = s_118_123 - v_118_123
&&
    true
;

{
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_6 + u_118_124 * (const 64 (2**21)) + v_118_124 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_6 + r_118_124 * (const 64 (2**21)) + s_118_124 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_6,
    f_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_6,
    g_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 124)) <=s delta, delta <=s (const 64 (1 + 2*124)),
    (const 64 (-(2**20))) <=s u_118_124, u_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_124, v_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_124, r_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_124, s_118_124 <=s (const 64 ((2**20)-1)),
    u_118_124 + v_118_124 <=s (const 64 (2**20)),
    u_118_124 - v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 + v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 - v_118_124 <=s (const 64 (2**20)),
    r_118_124 + s_118_124 <=s (const 64 (2**20)),
    r_118_124 - s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 + s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 - s_118_124 <=s (const 64 (2**20)),
    u_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_118_124 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_124_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_6,
sint64 g_118_low60_0_low20_6,
sint64 f_118_low60_0_low20_7,
sint64 g_118_low60_0_low20_7,
sint64 u_118_124,
sint64 v_118_124,
sint64 r_118_124,
sint64 s_118_124,
sint64 u_118_125,
sint64 v_118_125,
sint64 r_118_125,
sint64 s_118_125,
bit ne
)={
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (-(2**20)),
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (-(2**20))
&&
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (const 64 (-(2**20))),
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_6 + u_118_124 * (const 64 (2**21)) + v_118_124 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_6 + r_118_124 * (const 64 (2**21)) + s_118_124 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_6,
    f_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_6,
    g_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 124)) <=s delta, delta <=s (const 64 (1 + 2*124)),
    (const 64 (-(2**20))) <=s u_118_124, u_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_124, v_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_124, r_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_124, s_118_124 <=s (const 64 ((2**20)-1)),
    u_118_124 + v_118_124 <=s (const 64 (2**20)),
    u_118_124 - v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 + v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 - v_118_124 <=s (const 64 (2**20)),
    r_118_124 + s_118_124 <=s (const 64 (2**20)),
    r_118_124 - s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 + s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 - s_118_124 <=s (const 64 (2**20)),
    u_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_118_124 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step124

// premise a
assume
g_118_low60_0_low20_6 = 0 (mod 2)
&&
g_118_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_7 f_118_low60_0_low20_6;
mov u_118_125 u_118_124;
mov v_118_125 v_118_124;

asr g_118_low60_0_low20_7 g_118_low60_0_low20_6 1;
asr r_118_125 r_118_124 1;
asr s_118_125 s_118_124 1;
assert
    true
&&
    f_118_low60_0_low20_7 = f_118_low60_0_low20_6,
    u_118_125 = u_118_124,
    v_118_125 = v_118_124,
    g_118_low60_0_low20_7 * (const 64 2) = g_118_low60_0_low20_6,
    r_118_125 * (const 64 2) = r_118_124,
    s_118_125 * (const 64 2) = s_118_124
;

assume
    f_118_low60_0_low20_7 = f_118_low60_0_low20_6,
    u_118_125 = u_118_124,
    v_118_125 = v_118_124,
    g_118_low60_0_low20_7 * 2 = g_118_low60_0_low20_6,
    r_118_125 * 2 = r_118_124,
    s_118_125 * 2 = s_118_124
&&
    true
;

{
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_7 + u_118_125 * (const 64 (2**21)) + v_118_125 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_7 + r_118_125 * (const 64 (2**21)) + s_118_125 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_7,
    f_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_7,
    g_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 125)) <=s delta, delta <=s (const 64 (1 + 2*125)),
    (const 64 (-(2**20))) <=s u_118_125, u_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_125, v_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_125, r_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_125, s_118_125 <=s (const 64 ((2**20)-1)),
    u_118_125 + v_118_125 <=s (const 64 (2**20)),
    u_118_125 - v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 + v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 - v_118_125 <=s (const 64 (2**20)),
    r_118_125 + s_118_125 <=s (const 64 (2**20)),
    r_118_125 - s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 + s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 - s_118_125 <=s (const 64 (2**20)),
    u_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_118_125 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_124_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_6,
sint64 g_118_low60_0_low20_6,
sint64 f_118_low60_0_low20_7,
sint64 g_118_low60_0_low20_7,
sint64 u_118_124,
sint64 v_118_124,
sint64 r_118_124,
sint64 s_118_124,
sint64 u_118_125,
sint64 v_118_125,
sint64 r_118_125,
sint64 s_118_125,
bit ne
)={
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (-(2**20)),
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (-(2**20))
&&
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (const 64 (-(2**20))),
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_6 + u_118_124 * (const 64 (2**21)) + v_118_124 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_6 + r_118_124 * (const 64 (2**21)) + s_118_124 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_6,
    f_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_6,
    g_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 124)) <=s delta, delta <=s (const 64 (1 + 2*124)),
    (const 64 (-(2**20))) <=s u_118_124, u_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_124, v_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_124, r_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_124, s_118_124 <=s (const 64 ((2**20)-1)),
    u_118_124 + v_118_124 <=s (const 64 (2**20)),
    u_118_124 - v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 + v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 - v_118_124 <=s (const 64 (2**20)),
    r_118_124 + s_118_124 <=s (const 64 (2**20)),
    r_118_124 - s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 + s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 - s_118_124 <=s (const 64 (2**20)),
    u_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_118_124 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step124

// premise b
assume
g_118_low60_0_low20_6 = 1 (mod 2)
&&
g_118_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_7 f_118_low60_0_low20_6;
mov u_118_125 u_118_124;
mov v_118_125 v_118_124;

add g_118_low60_0_low20_7 g_118_low60_0_low20_6 f_118_low60_0_low20_6;
asr g_118_low60_0_low20_7 g_118_low60_0_low20_7 1;
add r_118_125 r_118_124 u_118_124;
asr r_118_125 r_118_125 1;
add s_118_125 s_118_124 v_118_124;
asr s_118_125 s_118_125 1;
assert
    true
&&
    f_118_low60_0_low20_7 = f_118_low60_0_low20_6,
    u_118_125 = u_118_124,
    v_118_125 = v_118_124,
    g_118_low60_0_low20_7 * (const 64 2) = g_118_low60_0_low20_6 + f_118_low60_0_low20_6,
    r_118_125 * (const 64 2) = r_118_124 + u_118_124,
    s_118_125 * (const 64 2) = s_118_124 + v_118_124
;

assume
    f_118_low60_0_low20_7 = f_118_low60_0_low20_6,
    u_118_125 = u_118_124,
    v_118_125 = v_118_124,
    g_118_low60_0_low20_7 * 2 = g_118_low60_0_low20_6 + f_118_low60_0_low20_6,
    r_118_125 * 2 = r_118_124 + u_118_124,
    s_118_125 * 2 = s_118_124 + v_118_124
&&
    true
;

{
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_7 + u_118_125 * (const 64 (2**21)) + v_118_125 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_7 + r_118_125 * (const 64 (2**21)) + s_118_125 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_7,
    f_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_7,
    g_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 125)) <=s delta, delta <=s (const 64 (1 + 2*125)),
    (const 64 (-(2**20))) <=s u_118_125, u_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_125, v_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_125, r_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_125, s_118_125 <=s (const 64 ((2**20)-1)),
    u_118_125 + v_118_125 <=s (const 64 (2**20)),
    u_118_125 - v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 + v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 - v_118_125 <=s (const 64 (2**20)),
    r_118_125 + s_118_125 <=s (const 64 (2**20)),
    r_118_125 - s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 + s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 - s_118_125 <=s (const 64 (2**20)),
    u_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_118_125 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_124_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_6,
sint64 g_118_low60_0_low20_6,
sint64 f_118_low60_0_low20_7,
sint64 g_118_low60_0_low20_7,
sint64 u_118_124,
sint64 v_118_124,
sint64 r_118_124,
sint64 s_118_124,
sint64 u_118_125,
sint64 v_118_125,
sint64 r_118_125,
sint64 s_118_125,
bit ne
)={
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (-(2**20)),
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (-(2**20))
&&
    u_118_124 * f_118_low60_0_low20_0 + v_118_124 * g_118_low60_0_low20_0 = f_118_low60_0_low20_6 * (const 64 (-(2**20))),
    r_118_124 * f_118_low60_0_low20_0 + s_118_124 * g_118_low60_0_low20_0 = g_118_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_6 + u_118_124 * (const 64 (2**21)) + v_118_124 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_6 + r_118_124 * (const 64 (2**21)) + s_118_124 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_6,
    f_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_6,
    g_118_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 124)) <=s delta, delta <=s (const 64 (1 + 2*124)),
    (const 64 (-(2**20))) <=s u_118_124, u_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_124, v_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_124, r_118_124 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_124, s_118_124 <=s (const 64 ((2**20)-1)),
    u_118_124 + v_118_124 <=s (const 64 (2**20)),
    u_118_124 - v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 + v_118_124 <=s (const 64 (2**20)),
    (const 64 0) - u_118_124 - v_118_124 <=s (const 64 (2**20)),
    r_118_124 + s_118_124 <=s (const 64 (2**20)),
    r_118_124 - s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 + s_118_124 <=s (const 64 (2**20)),
    (const 64 0) - r_118_124 - s_118_124 <=s (const 64 (2**20)),
    u_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_118_124 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_118_124 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step124

// premise c
assume
g_118_low60_0_low20_6 = 1 (mod 2)
&&
g_118_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_7 g_118_low60_0_low20_6;
mov u_118_125 r_118_124;
mov v_118_125 s_118_124;

subs dc g_118_low60_0_low20_7 g_118_low60_0_low20_6 f_118_low60_0_low20_6;
asr g_118_low60_0_low20_7 g_118_low60_0_low20_7 1;
subs dc r_118_125 r_118_124 u_118_124;
asr r_118_125 r_118_125 1;
subs dc s_118_125 s_118_124 v_118_124;
asr s_118_125 s_118_125 1;
assert
    true
&&
    f_118_low60_0_low20_7 = g_118_low60_0_low20_6,
    u_118_125 = r_118_124,
    v_118_125 = s_118_124,
    g_118_low60_0_low20_7 * (const 64 2) = g_118_low60_0_low20_6 - f_118_low60_0_low20_6,
    r_118_125 * (const 64 2) = r_118_124 - u_118_124,
    s_118_125 * (const 64 2) = s_118_124 - v_118_124
;

assume
    f_118_low60_0_low20_7 = g_118_low60_0_low20_6,
    u_118_125 = r_118_124,
    v_118_125 = s_118_124,
    g_118_low60_0_low20_7 * 2 = g_118_low60_0_low20_6 - f_118_low60_0_low20_6,
    r_118_125 * 2 = r_118_124 - u_118_124,
    s_118_125 * 2 = s_118_124 - v_118_124
&&
    true
;

{
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_7 + u_118_125 * (const 64 (2**21)) + v_118_125 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_7 + r_118_125 * (const 64 (2**21)) + s_118_125 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_7,
    f_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_7,
    g_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 125)) <=s delta, delta <=s (const 64 (1 + 2*125)),
    (const 64 (-(2**20))) <=s u_118_125, u_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_125, v_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_125, r_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_125, s_118_125 <=s (const 64 ((2**20)-1)),
    u_118_125 + v_118_125 <=s (const 64 (2**20)),
    u_118_125 - v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 + v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 - v_118_125 <=s (const 64 (2**20)),
    r_118_125 + s_118_125 <=s (const 64 (2**20)),
    r_118_125 - s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 + s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 - s_118_125 <=s (const 64 (2**20)),
    u_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_118_125 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_125_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_7,
sint64 g_118_low60_0_low20_7,
sint64 f_118_low60_0_low20_8,
sint64 g_118_low60_0_low20_8,
sint64 u_118_125,
sint64 v_118_125,
sint64 r_118_125,
sint64 s_118_125,
sint64 u_118_126,
sint64 v_118_126,
sint64 r_118_126,
sint64 s_118_126,
bit ne
)={
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (-(2**20)),
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (-(2**20))
&&
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (const 64 (-(2**20))),
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_7 + u_118_125 * (const 64 (2**21)) + v_118_125 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_7 + r_118_125 * (const 64 (2**21)) + s_118_125 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_7,
    f_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_7,
    g_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 125)) <=s delta, delta <=s (const 64 (1 + 2*125)),
    (const 64 (-(2**20))) <=s u_118_125, u_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_125, v_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_125, r_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_125, s_118_125 <=s (const 64 ((2**20)-1)),
    u_118_125 + v_118_125 <=s (const 64 (2**20)),
    u_118_125 - v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 + v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 - v_118_125 <=s (const 64 (2**20)),
    r_118_125 + s_118_125 <=s (const 64 (2**20)),
    r_118_125 - s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 + s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 - s_118_125 <=s (const 64 (2**20)),
    u_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_118_125 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step125

// premise a
assume
g_118_low60_0_low20_7 = 0 (mod 2)
&&
g_118_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_8 f_118_low60_0_low20_7;
mov u_118_126 u_118_125;
mov v_118_126 v_118_125;

asr g_118_low60_0_low20_8 g_118_low60_0_low20_7 1;
asr r_118_126 r_118_125 1;
asr s_118_126 s_118_125 1;
assert
    true
&&
    f_118_low60_0_low20_8 = f_118_low60_0_low20_7,
    u_118_126 = u_118_125,
    v_118_126 = v_118_125,
    g_118_low60_0_low20_8 * (const 64 2) = g_118_low60_0_low20_7,
    r_118_126 * (const 64 2) = r_118_125,
    s_118_126 * (const 64 2) = s_118_125
;

assume
    f_118_low60_0_low20_8 = f_118_low60_0_low20_7,
    u_118_126 = u_118_125,
    v_118_126 = v_118_125,
    g_118_low60_0_low20_8 * 2 = g_118_low60_0_low20_7,
    r_118_126 * 2 = r_118_125,
    s_118_126 * 2 = s_118_125
&&
    true
;

{
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_8 + u_118_126 * (const 64 (2**21)) + v_118_126 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_8 + r_118_126 * (const 64 (2**21)) + s_118_126 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_8,
    f_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_8,
    g_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 126)) <=s delta, delta <=s (const 64 (1 + 2*126)),
    (const 64 (-(2**20))) <=s u_118_126, u_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_126, v_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_126, r_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_126, s_118_126 <=s (const 64 ((2**20)-1)),
    u_118_126 + v_118_126 <=s (const 64 (2**20)),
    u_118_126 - v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 + v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 - v_118_126 <=s (const 64 (2**20)),
    r_118_126 + s_118_126 <=s (const 64 (2**20)),
    r_118_126 - s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 + s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 - s_118_126 <=s (const 64 (2**20)),
    u_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_118_126 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_125_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_7,
sint64 g_118_low60_0_low20_7,
sint64 f_118_low60_0_low20_8,
sint64 g_118_low60_0_low20_8,
sint64 u_118_125,
sint64 v_118_125,
sint64 r_118_125,
sint64 s_118_125,
sint64 u_118_126,
sint64 v_118_126,
sint64 r_118_126,
sint64 s_118_126,
bit ne
)={
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (-(2**20)),
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (-(2**20))
&&
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (const 64 (-(2**20))),
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_7 + u_118_125 * (const 64 (2**21)) + v_118_125 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_7 + r_118_125 * (const 64 (2**21)) + s_118_125 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_7,
    f_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_7,
    g_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 125)) <=s delta, delta <=s (const 64 (1 + 2*125)),
    (const 64 (-(2**20))) <=s u_118_125, u_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_125, v_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_125, r_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_125, s_118_125 <=s (const 64 ((2**20)-1)),
    u_118_125 + v_118_125 <=s (const 64 (2**20)),
    u_118_125 - v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 + v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 - v_118_125 <=s (const 64 (2**20)),
    r_118_125 + s_118_125 <=s (const 64 (2**20)),
    r_118_125 - s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 + s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 - s_118_125 <=s (const 64 (2**20)),
    u_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_118_125 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step125

// premise b
assume
g_118_low60_0_low20_7 = 1 (mod 2)
&&
g_118_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_8 f_118_low60_0_low20_7;
mov u_118_126 u_118_125;
mov v_118_126 v_118_125;

add g_118_low60_0_low20_8 g_118_low60_0_low20_7 f_118_low60_0_low20_7;
asr g_118_low60_0_low20_8 g_118_low60_0_low20_8 1;
add r_118_126 r_118_125 u_118_125;
asr r_118_126 r_118_126 1;
add s_118_126 s_118_125 v_118_125;
asr s_118_126 s_118_126 1;
assert
    true
&&
    f_118_low60_0_low20_8 = f_118_low60_0_low20_7,
    u_118_126 = u_118_125,
    v_118_126 = v_118_125,
    g_118_low60_0_low20_8 * (const 64 2) = g_118_low60_0_low20_7 + f_118_low60_0_low20_7,
    r_118_126 * (const 64 2) = r_118_125 + u_118_125,
    s_118_126 * (const 64 2) = s_118_125 + v_118_125
;

assume
    f_118_low60_0_low20_8 = f_118_low60_0_low20_7,
    u_118_126 = u_118_125,
    v_118_126 = v_118_125,
    g_118_low60_0_low20_8 * 2 = g_118_low60_0_low20_7 + f_118_low60_0_low20_7,
    r_118_126 * 2 = r_118_125 + u_118_125,
    s_118_126 * 2 = s_118_125 + v_118_125
&&
    true
;

{
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_8 + u_118_126 * (const 64 (2**21)) + v_118_126 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_8 + r_118_126 * (const 64 (2**21)) + s_118_126 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_8,
    f_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_8,
    g_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 126)) <=s delta, delta <=s (const 64 (1 + 2*126)),
    (const 64 (-(2**20))) <=s u_118_126, u_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_126, v_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_126, r_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_126, s_118_126 <=s (const 64 ((2**20)-1)),
    u_118_126 + v_118_126 <=s (const 64 (2**20)),
    u_118_126 - v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 + v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 - v_118_126 <=s (const 64 (2**20)),
    r_118_126 + s_118_126 <=s (const 64 (2**20)),
    r_118_126 - s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 + s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 - s_118_126 <=s (const 64 (2**20)),
    u_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_118_126 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_125_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_7,
sint64 g_118_low60_0_low20_7,
sint64 f_118_low60_0_low20_8,
sint64 g_118_low60_0_low20_8,
sint64 u_118_125,
sint64 v_118_125,
sint64 r_118_125,
sint64 s_118_125,
sint64 u_118_126,
sint64 v_118_126,
sint64 r_118_126,
sint64 s_118_126,
bit ne
)={
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (-(2**20)),
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (-(2**20))
&&
    u_118_125 * f_118_low60_0_low20_0 + v_118_125 * g_118_low60_0_low20_0 = f_118_low60_0_low20_7 * (const 64 (-(2**20))),
    r_118_125 * f_118_low60_0_low20_0 + s_118_125 * g_118_low60_0_low20_0 = g_118_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_7 + u_118_125 * (const 64 (2**21)) + v_118_125 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_7 + r_118_125 * (const 64 (2**21)) + s_118_125 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_7,
    f_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_7,
    g_118_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 125)) <=s delta, delta <=s (const 64 (1 + 2*125)),
    (const 64 (-(2**20))) <=s u_118_125, u_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_125, v_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_125, r_118_125 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_125, s_118_125 <=s (const 64 ((2**20)-1)),
    u_118_125 + v_118_125 <=s (const 64 (2**20)),
    u_118_125 - v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 + v_118_125 <=s (const 64 (2**20)),
    (const 64 0) - u_118_125 - v_118_125 <=s (const 64 (2**20)),
    r_118_125 + s_118_125 <=s (const 64 (2**20)),
    r_118_125 - s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 + s_118_125 <=s (const 64 (2**20)),
    (const 64 0) - r_118_125 - s_118_125 <=s (const 64 (2**20)),
    u_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_118_125 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_118_125 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step125

// premise c
assume
g_118_low60_0_low20_7 = 1 (mod 2)
&&
g_118_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_8 g_118_low60_0_low20_7;
mov u_118_126 r_118_125;
mov v_118_126 s_118_125;

subs dc g_118_low60_0_low20_8 g_118_low60_0_low20_7 f_118_low60_0_low20_7;
asr g_118_low60_0_low20_8 g_118_low60_0_low20_8 1;
subs dc r_118_126 r_118_125 u_118_125;
asr r_118_126 r_118_126 1;
subs dc s_118_126 s_118_125 v_118_125;
asr s_118_126 s_118_126 1;
assert
    true
&&
    f_118_low60_0_low20_8 = g_118_low60_0_low20_7,
    u_118_126 = r_118_125,
    v_118_126 = s_118_125,
    g_118_low60_0_low20_8 * (const 64 2) = g_118_low60_0_low20_7 - f_118_low60_0_low20_7,
    r_118_126 * (const 64 2) = r_118_125 - u_118_125,
    s_118_126 * (const 64 2) = s_118_125 - v_118_125
;

assume
    f_118_low60_0_low20_8 = g_118_low60_0_low20_7,
    u_118_126 = r_118_125,
    v_118_126 = s_118_125,
    g_118_low60_0_low20_8 * 2 = g_118_low60_0_low20_7 - f_118_low60_0_low20_7,
    r_118_126 * 2 = r_118_125 - u_118_125,
    s_118_126 * 2 = s_118_125 - v_118_125
&&
    true
;

{
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_8 + u_118_126 * (const 64 (2**21)) + v_118_126 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_8 + r_118_126 * (const 64 (2**21)) + s_118_126 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_8,
    f_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_8,
    g_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 126)) <=s delta, delta <=s (const 64 (1 + 2*126)),
    (const 64 (-(2**20))) <=s u_118_126, u_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_126, v_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_126, r_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_126, s_118_126 <=s (const 64 ((2**20)-1)),
    u_118_126 + v_118_126 <=s (const 64 (2**20)),
    u_118_126 - v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 + v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 - v_118_126 <=s (const 64 (2**20)),
    r_118_126 + s_118_126 <=s (const 64 (2**20)),
    r_118_126 - s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 + s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 - s_118_126 <=s (const 64 (2**20)),
    u_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_118_126 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_126_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_8,
sint64 g_118_low60_0_low20_8,
sint64 f_118_low60_0_low20_9,
sint64 g_118_low60_0_low20_9,
sint64 u_118_126,
sint64 v_118_126,
sint64 r_118_126,
sint64 s_118_126,
sint64 u_118_127,
sint64 v_118_127,
sint64 r_118_127,
sint64 s_118_127,
bit ne
)={
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (-(2**20)),
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (-(2**20))
&&
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (const 64 (-(2**20))),
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_8 + u_118_126 * (const 64 (2**21)) + v_118_126 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_8 + r_118_126 * (const 64 (2**21)) + s_118_126 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_8,
    f_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_8,
    g_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 126)) <=s delta, delta <=s (const 64 (1 + 2*126)),
    (const 64 (-(2**20))) <=s u_118_126, u_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_126, v_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_126, r_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_126, s_118_126 <=s (const 64 ((2**20)-1)),
    u_118_126 + v_118_126 <=s (const 64 (2**20)),
    u_118_126 - v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 + v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 - v_118_126 <=s (const 64 (2**20)),
    r_118_126 + s_118_126 <=s (const 64 (2**20)),
    r_118_126 - s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 + s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 - s_118_126 <=s (const 64 (2**20)),
    u_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_118_126 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step126

// premise a
assume
g_118_low60_0_low20_8 = 0 (mod 2)
&&
g_118_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_9 f_118_low60_0_low20_8;
mov u_118_127 u_118_126;
mov v_118_127 v_118_126;

asr g_118_low60_0_low20_9 g_118_low60_0_low20_8 1;
asr r_118_127 r_118_126 1;
asr s_118_127 s_118_126 1;
assert
    true
&&
    f_118_low60_0_low20_9 = f_118_low60_0_low20_8,
    u_118_127 = u_118_126,
    v_118_127 = v_118_126,
    g_118_low60_0_low20_9 * (const 64 2) = g_118_low60_0_low20_8,
    r_118_127 * (const 64 2) = r_118_126,
    s_118_127 * (const 64 2) = s_118_126
;

assume
    f_118_low60_0_low20_9 = f_118_low60_0_low20_8,
    u_118_127 = u_118_126,
    v_118_127 = v_118_126,
    g_118_low60_0_low20_9 * 2 = g_118_low60_0_low20_8,
    r_118_127 * 2 = r_118_126,
    s_118_127 * 2 = s_118_126
&&
    true
;

{
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_9 + u_118_127 * (const 64 (2**21)) + v_118_127 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_9 + r_118_127 * (const 64 (2**21)) + s_118_127 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_9,
    f_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_9,
    g_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 127)) <=s delta, delta <=s (const 64 (1 + 2*127)),
    (const 64 (-(2**20))) <=s u_118_127, u_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_127, v_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_127, r_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_127, s_118_127 <=s (const 64 ((2**20)-1)),
    u_118_127 + v_118_127 <=s (const 64 (2**20)),
    u_118_127 - v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 + v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 - v_118_127 <=s (const 64 (2**20)),
    r_118_127 + s_118_127 <=s (const 64 (2**20)),
    r_118_127 - s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 + s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 - s_118_127 <=s (const 64 (2**20)),
    u_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_118_127 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_126_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_8,
sint64 g_118_low60_0_low20_8,
sint64 f_118_low60_0_low20_9,
sint64 g_118_low60_0_low20_9,
sint64 u_118_126,
sint64 v_118_126,
sint64 r_118_126,
sint64 s_118_126,
sint64 u_118_127,
sint64 v_118_127,
sint64 r_118_127,
sint64 s_118_127,
bit ne
)={
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (-(2**20)),
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (-(2**20))
&&
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (const 64 (-(2**20))),
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_8 + u_118_126 * (const 64 (2**21)) + v_118_126 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_8 + r_118_126 * (const 64 (2**21)) + s_118_126 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_8,
    f_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_8,
    g_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 126)) <=s delta, delta <=s (const 64 (1 + 2*126)),
    (const 64 (-(2**20))) <=s u_118_126, u_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_126, v_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_126, r_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_126, s_118_126 <=s (const 64 ((2**20)-1)),
    u_118_126 + v_118_126 <=s (const 64 (2**20)),
    u_118_126 - v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 + v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 - v_118_126 <=s (const 64 (2**20)),
    r_118_126 + s_118_126 <=s (const 64 (2**20)),
    r_118_126 - s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 + s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 - s_118_126 <=s (const 64 (2**20)),
    u_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_118_126 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step126

// premise b
assume
g_118_low60_0_low20_8 = 1 (mod 2)
&&
g_118_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_9 f_118_low60_0_low20_8;
mov u_118_127 u_118_126;
mov v_118_127 v_118_126;

add g_118_low60_0_low20_9 g_118_low60_0_low20_8 f_118_low60_0_low20_8;
asr g_118_low60_0_low20_9 g_118_low60_0_low20_9 1;
add r_118_127 r_118_126 u_118_126;
asr r_118_127 r_118_127 1;
add s_118_127 s_118_126 v_118_126;
asr s_118_127 s_118_127 1;
assert
    true
&&
    f_118_low60_0_low20_9 = f_118_low60_0_low20_8,
    u_118_127 = u_118_126,
    v_118_127 = v_118_126,
    g_118_low60_0_low20_9 * (const 64 2) = g_118_low60_0_low20_8 + f_118_low60_0_low20_8,
    r_118_127 * (const 64 2) = r_118_126 + u_118_126,
    s_118_127 * (const 64 2) = s_118_126 + v_118_126
;

assume
    f_118_low60_0_low20_9 = f_118_low60_0_low20_8,
    u_118_127 = u_118_126,
    v_118_127 = v_118_126,
    g_118_low60_0_low20_9 * 2 = g_118_low60_0_low20_8 + f_118_low60_0_low20_8,
    r_118_127 * 2 = r_118_126 + u_118_126,
    s_118_127 * 2 = s_118_126 + v_118_126
&&
    true
;

{
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_9 + u_118_127 * (const 64 (2**21)) + v_118_127 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_9 + r_118_127 * (const 64 (2**21)) + s_118_127 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_9,
    f_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_9,
    g_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 127)) <=s delta, delta <=s (const 64 (1 + 2*127)),
    (const 64 (-(2**20))) <=s u_118_127, u_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_127, v_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_127, r_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_127, s_118_127 <=s (const 64 ((2**20)-1)),
    u_118_127 + v_118_127 <=s (const 64 (2**20)),
    u_118_127 - v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 + v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 - v_118_127 <=s (const 64 (2**20)),
    r_118_127 + s_118_127 <=s (const 64 (2**20)),
    r_118_127 - s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 + s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 - s_118_127 <=s (const 64 (2**20)),
    u_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_118_127 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_126_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_8,
sint64 g_118_low60_0_low20_8,
sint64 f_118_low60_0_low20_9,
sint64 g_118_low60_0_low20_9,
sint64 u_118_126,
sint64 v_118_126,
sint64 r_118_126,
sint64 s_118_126,
sint64 u_118_127,
sint64 v_118_127,
sint64 r_118_127,
sint64 s_118_127,
bit ne
)={
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (-(2**20)),
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (-(2**20))
&&
    u_118_126 * f_118_low60_0_low20_0 + v_118_126 * g_118_low60_0_low20_0 = f_118_low60_0_low20_8 * (const 64 (-(2**20))),
    r_118_126 * f_118_low60_0_low20_0 + s_118_126 * g_118_low60_0_low20_0 = g_118_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_8 + u_118_126 * (const 64 (2**21)) + v_118_126 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_8 + r_118_126 * (const 64 (2**21)) + s_118_126 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_8,
    f_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_8,
    g_118_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 126)) <=s delta, delta <=s (const 64 (1 + 2*126)),
    (const 64 (-(2**20))) <=s u_118_126, u_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_126, v_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_126, r_118_126 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_126, s_118_126 <=s (const 64 ((2**20)-1)),
    u_118_126 + v_118_126 <=s (const 64 (2**20)),
    u_118_126 - v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 + v_118_126 <=s (const 64 (2**20)),
    (const 64 0) - u_118_126 - v_118_126 <=s (const 64 (2**20)),
    r_118_126 + s_118_126 <=s (const 64 (2**20)),
    r_118_126 - s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 + s_118_126 <=s (const 64 (2**20)),
    (const 64 0) - r_118_126 - s_118_126 <=s (const 64 (2**20)),
    u_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_118_126 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_118_126 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step126

// premise c
assume
g_118_low60_0_low20_8 = 1 (mod 2)
&&
g_118_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_9 g_118_low60_0_low20_8;
mov u_118_127 r_118_126;
mov v_118_127 s_118_126;

subs dc g_118_low60_0_low20_9 g_118_low60_0_low20_8 f_118_low60_0_low20_8;
asr g_118_low60_0_low20_9 g_118_low60_0_low20_9 1;
subs dc r_118_127 r_118_126 u_118_126;
asr r_118_127 r_118_127 1;
subs dc s_118_127 s_118_126 v_118_126;
asr s_118_127 s_118_127 1;
assert
    true
&&
    f_118_low60_0_low20_9 = g_118_low60_0_low20_8,
    u_118_127 = r_118_126,
    v_118_127 = s_118_126,
    g_118_low60_0_low20_9 * (const 64 2) = g_118_low60_0_low20_8 - f_118_low60_0_low20_8,
    r_118_127 * (const 64 2) = r_118_126 - u_118_126,
    s_118_127 * (const 64 2) = s_118_126 - v_118_126
;

assume
    f_118_low60_0_low20_9 = g_118_low60_0_low20_8,
    u_118_127 = r_118_126,
    v_118_127 = s_118_126,
    g_118_low60_0_low20_9 * 2 = g_118_low60_0_low20_8 - f_118_low60_0_low20_8,
    r_118_127 * 2 = r_118_126 - u_118_126,
    s_118_127 * 2 = s_118_126 - v_118_126
&&
    true
;

{
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_9 + u_118_127 * (const 64 (2**21)) + v_118_127 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_9 + r_118_127 * (const 64 (2**21)) + s_118_127 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_9,
    f_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_9,
    g_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 127)) <=s delta, delta <=s (const 64 (1 + 2*127)),
    (const 64 (-(2**20))) <=s u_118_127, u_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_127, v_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_127, r_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_127, s_118_127 <=s (const 64 ((2**20)-1)),
    u_118_127 + v_118_127 <=s (const 64 (2**20)),
    u_118_127 - v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 + v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 - v_118_127 <=s (const 64 (2**20)),
    r_118_127 + s_118_127 <=s (const 64 (2**20)),
    r_118_127 - s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 + s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 - s_118_127 <=s (const 64 (2**20)),
    u_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_118_127 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_127_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_9,
sint64 g_118_low60_0_low20_9,
sint64 f_118_low60_0_low20_10,
sint64 g_118_low60_0_low20_10,
sint64 u_118_127,
sint64 v_118_127,
sint64 r_118_127,
sint64 s_118_127,
sint64 u_118_128,
sint64 v_118_128,
sint64 r_118_128,
sint64 s_118_128,
bit ne
)={
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (-(2**20)),
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (-(2**20))
&&
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (const 64 (-(2**20))),
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_9 + u_118_127 * (const 64 (2**21)) + v_118_127 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_9 + r_118_127 * (const 64 (2**21)) + s_118_127 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_9,
    f_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_9,
    g_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 127)) <=s delta, delta <=s (const 64 (1 + 2*127)),
    (const 64 (-(2**20))) <=s u_118_127, u_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_127, v_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_127, r_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_127, s_118_127 <=s (const 64 ((2**20)-1)),
    u_118_127 + v_118_127 <=s (const 64 (2**20)),
    u_118_127 - v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 + v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 - v_118_127 <=s (const 64 (2**20)),
    r_118_127 + s_118_127 <=s (const 64 (2**20)),
    r_118_127 - s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 + s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 - s_118_127 <=s (const 64 (2**20)),
    u_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_118_127 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step127

// premise a
assume
g_118_low60_0_low20_9 = 0 (mod 2)
&&
g_118_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_10 f_118_low60_0_low20_9;
mov u_118_128 u_118_127;
mov v_118_128 v_118_127;

asr g_118_low60_0_low20_10 g_118_low60_0_low20_9 1;
asr r_118_128 r_118_127 1;
asr s_118_128 s_118_127 1;
assert
    true
&&
    f_118_low60_0_low20_10 = f_118_low60_0_low20_9,
    u_118_128 = u_118_127,
    v_118_128 = v_118_127,
    g_118_low60_0_low20_10 * (const 64 2) = g_118_low60_0_low20_9,
    r_118_128 * (const 64 2) = r_118_127,
    s_118_128 * (const 64 2) = s_118_127
;

assume
    f_118_low60_0_low20_10 = f_118_low60_0_low20_9,
    u_118_128 = u_118_127,
    v_118_128 = v_118_127,
    g_118_low60_0_low20_10 * 2 = g_118_low60_0_low20_9,
    r_118_128 * 2 = r_118_127,
    s_118_128 * 2 = s_118_127
&&
    true
;

{
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_10 + u_118_128 * (const 64 (2**21)) + v_118_128 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_10 + r_118_128 * (const 64 (2**21)) + s_118_128 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_10,
    f_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_10,
    g_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 128)) <=s delta, delta <=s (const 64 (1 + 2*128)),
    (const 64 (-(2**20))) <=s u_118_128, u_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_128, v_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_128, r_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_128, s_118_128 <=s (const 64 ((2**20)-1)),
    u_118_128 + v_118_128 <=s (const 64 (2**20)),
    u_118_128 - v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 + v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 - v_118_128 <=s (const 64 (2**20)),
    r_118_128 + s_118_128 <=s (const 64 (2**20)),
    r_118_128 - s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 + s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 - s_118_128 <=s (const 64 (2**20)),
    u_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_118_128 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_127_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_9,
sint64 g_118_low60_0_low20_9,
sint64 f_118_low60_0_low20_10,
sint64 g_118_low60_0_low20_10,
sint64 u_118_127,
sint64 v_118_127,
sint64 r_118_127,
sint64 s_118_127,
sint64 u_118_128,
sint64 v_118_128,
sint64 r_118_128,
sint64 s_118_128,
bit ne
)={
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (-(2**20)),
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (-(2**20))
&&
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (const 64 (-(2**20))),
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_9 + u_118_127 * (const 64 (2**21)) + v_118_127 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_9 + r_118_127 * (const 64 (2**21)) + s_118_127 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_9,
    f_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_9,
    g_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 127)) <=s delta, delta <=s (const 64 (1 + 2*127)),
    (const 64 (-(2**20))) <=s u_118_127, u_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_127, v_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_127, r_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_127, s_118_127 <=s (const 64 ((2**20)-1)),
    u_118_127 + v_118_127 <=s (const 64 (2**20)),
    u_118_127 - v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 + v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 - v_118_127 <=s (const 64 (2**20)),
    r_118_127 + s_118_127 <=s (const 64 (2**20)),
    r_118_127 - s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 + s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 - s_118_127 <=s (const 64 (2**20)),
    u_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_118_127 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step127

// premise b
assume
g_118_low60_0_low20_9 = 1 (mod 2)
&&
g_118_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_10 f_118_low60_0_low20_9;
mov u_118_128 u_118_127;
mov v_118_128 v_118_127;

add g_118_low60_0_low20_10 g_118_low60_0_low20_9 f_118_low60_0_low20_9;
asr g_118_low60_0_low20_10 g_118_low60_0_low20_10 1;
add r_118_128 r_118_127 u_118_127;
asr r_118_128 r_118_128 1;
add s_118_128 s_118_127 v_118_127;
asr s_118_128 s_118_128 1;
assert
    true
&&
    f_118_low60_0_low20_10 = f_118_low60_0_low20_9,
    u_118_128 = u_118_127,
    v_118_128 = v_118_127,
    g_118_low60_0_low20_10 * (const 64 2) = g_118_low60_0_low20_9 + f_118_low60_0_low20_9,
    r_118_128 * (const 64 2) = r_118_127 + u_118_127,
    s_118_128 * (const 64 2) = s_118_127 + v_118_127
;

assume
    f_118_low60_0_low20_10 = f_118_low60_0_low20_9,
    u_118_128 = u_118_127,
    v_118_128 = v_118_127,
    g_118_low60_0_low20_10 * 2 = g_118_low60_0_low20_9 + f_118_low60_0_low20_9,
    r_118_128 * 2 = r_118_127 + u_118_127,
    s_118_128 * 2 = s_118_127 + v_118_127
&&
    true
;

{
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_10 + u_118_128 * (const 64 (2**21)) + v_118_128 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_10 + r_118_128 * (const 64 (2**21)) + s_118_128 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_10,
    f_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_10,
    g_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 128)) <=s delta, delta <=s (const 64 (1 + 2*128)),
    (const 64 (-(2**20))) <=s u_118_128, u_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_128, v_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_128, r_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_128, s_118_128 <=s (const 64 ((2**20)-1)),
    u_118_128 + v_118_128 <=s (const 64 (2**20)),
    u_118_128 - v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 + v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 - v_118_128 <=s (const 64 (2**20)),
    r_118_128 + s_118_128 <=s (const 64 (2**20)),
    r_118_128 - s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 + s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 - s_118_128 <=s (const 64 (2**20)),
    u_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_118_128 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_127_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_9,
sint64 g_118_low60_0_low20_9,
sint64 f_118_low60_0_low20_10,
sint64 g_118_low60_0_low20_10,
sint64 u_118_127,
sint64 v_118_127,
sint64 r_118_127,
sint64 s_118_127,
sint64 u_118_128,
sint64 v_118_128,
sint64 r_118_128,
sint64 s_118_128,
bit ne
)={
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (-(2**20)),
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (-(2**20))
&&
    u_118_127 * f_118_low60_0_low20_0 + v_118_127 * g_118_low60_0_low20_0 = f_118_low60_0_low20_9 * (const 64 (-(2**20))),
    r_118_127 * f_118_low60_0_low20_0 + s_118_127 * g_118_low60_0_low20_0 = g_118_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_9 + u_118_127 * (const 64 (2**21)) + v_118_127 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_9 + r_118_127 * (const 64 (2**21)) + s_118_127 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_9,
    f_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_9,
    g_118_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 127)) <=s delta, delta <=s (const 64 (1 + 2*127)),
    (const 64 (-(2**20))) <=s u_118_127, u_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_127, v_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_127, r_118_127 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_127, s_118_127 <=s (const 64 ((2**20)-1)),
    u_118_127 + v_118_127 <=s (const 64 (2**20)),
    u_118_127 - v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 + v_118_127 <=s (const 64 (2**20)),
    (const 64 0) - u_118_127 - v_118_127 <=s (const 64 (2**20)),
    r_118_127 + s_118_127 <=s (const 64 (2**20)),
    r_118_127 - s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 + s_118_127 <=s (const 64 (2**20)),
    (const 64 0) - r_118_127 - s_118_127 <=s (const 64 (2**20)),
    u_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_118_127 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_118_127 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step127

// premise c
assume
g_118_low60_0_low20_9 = 1 (mod 2)
&&
g_118_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_10 g_118_low60_0_low20_9;
mov u_118_128 r_118_127;
mov v_118_128 s_118_127;

subs dc g_118_low60_0_low20_10 g_118_low60_0_low20_9 f_118_low60_0_low20_9;
asr g_118_low60_0_low20_10 g_118_low60_0_low20_10 1;
subs dc r_118_128 r_118_127 u_118_127;
asr r_118_128 r_118_128 1;
subs dc s_118_128 s_118_127 v_118_127;
asr s_118_128 s_118_128 1;
assert
    true
&&
    f_118_low60_0_low20_10 = g_118_low60_0_low20_9,
    u_118_128 = r_118_127,
    v_118_128 = s_118_127,
    g_118_low60_0_low20_10 * (const 64 2) = g_118_low60_0_low20_9 - f_118_low60_0_low20_9,
    r_118_128 * (const 64 2) = r_118_127 - u_118_127,
    s_118_128 * (const 64 2) = s_118_127 - v_118_127
;

assume
    f_118_low60_0_low20_10 = g_118_low60_0_low20_9,
    u_118_128 = r_118_127,
    v_118_128 = s_118_127,
    g_118_low60_0_low20_10 * 2 = g_118_low60_0_low20_9 - f_118_low60_0_low20_9,
    r_118_128 * 2 = r_118_127 - u_118_127,
    s_118_128 * 2 = s_118_127 - v_118_127
&&
    true
;

{
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_10 + u_118_128 * (const 64 (2**21)) + v_118_128 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_10 + r_118_128 * (const 64 (2**21)) + s_118_128 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_10,
    f_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_10,
    g_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 128)) <=s delta, delta <=s (const 64 (1 + 2*128)),
    (const 64 (-(2**20))) <=s u_118_128, u_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_128, v_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_128, r_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_128, s_118_128 <=s (const 64 ((2**20)-1)),
    u_118_128 + v_118_128 <=s (const 64 (2**20)),
    u_118_128 - v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 + v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 - v_118_128 <=s (const 64 (2**20)),
    r_118_128 + s_118_128 <=s (const 64 (2**20)),
    r_118_128 - s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 + s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 - s_118_128 <=s (const 64 (2**20)),
    u_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_118_128 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_128_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_10,
sint64 g_118_low60_0_low20_10,
sint64 f_118_low60_0_low20_11,
sint64 g_118_low60_0_low20_11,
sint64 u_118_128,
sint64 v_118_128,
sint64 r_118_128,
sint64 s_118_128,
sint64 u_118_129,
sint64 v_118_129,
sint64 r_118_129,
sint64 s_118_129,
bit ne
)={
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (-(2**20)),
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (-(2**20))
&&
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (const 64 (-(2**20))),
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_10 + u_118_128 * (const 64 (2**21)) + v_118_128 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_10 + r_118_128 * (const 64 (2**21)) + s_118_128 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_10,
    f_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_10,
    g_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 128)) <=s delta, delta <=s (const 64 (1 + 2*128)),
    (const 64 (-(2**20))) <=s u_118_128, u_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_128, v_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_128, r_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_128, s_118_128 <=s (const 64 ((2**20)-1)),
    u_118_128 + v_118_128 <=s (const 64 (2**20)),
    u_118_128 - v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 + v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 - v_118_128 <=s (const 64 (2**20)),
    r_118_128 + s_118_128 <=s (const 64 (2**20)),
    r_118_128 - s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 + s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 - s_118_128 <=s (const 64 (2**20)),
    u_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_118_128 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step128

// premise a
assume
g_118_low60_0_low20_10 = 0 (mod 2)
&&
g_118_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_11 f_118_low60_0_low20_10;
mov u_118_129 u_118_128;
mov v_118_129 v_118_128;

asr g_118_low60_0_low20_11 g_118_low60_0_low20_10 1;
asr r_118_129 r_118_128 1;
asr s_118_129 s_118_128 1;
assert
    true
&&
    f_118_low60_0_low20_11 = f_118_low60_0_low20_10,
    u_118_129 = u_118_128,
    v_118_129 = v_118_128,
    g_118_low60_0_low20_11 * (const 64 2) = g_118_low60_0_low20_10,
    r_118_129 * (const 64 2) = r_118_128,
    s_118_129 * (const 64 2) = s_118_128
;

assume
    f_118_low60_0_low20_11 = f_118_low60_0_low20_10,
    u_118_129 = u_118_128,
    v_118_129 = v_118_128,
    g_118_low60_0_low20_11 * 2 = g_118_low60_0_low20_10,
    r_118_129 * 2 = r_118_128,
    s_118_129 * 2 = s_118_128
&&
    true
;

{
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_11 + u_118_129 * (const 64 (2**21)) + v_118_129 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_11 + r_118_129 * (const 64 (2**21)) + s_118_129 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_11,
    f_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_11,
    g_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 129)) <=s delta, delta <=s (const 64 (1 + 2*129)),
    (const 64 (-(2**20))) <=s u_118_129, u_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_129, v_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_129, r_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_129, s_118_129 <=s (const 64 ((2**20)-1)),
    u_118_129 + v_118_129 <=s (const 64 (2**20)),
    u_118_129 - v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 + v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 - v_118_129 <=s (const 64 (2**20)),
    r_118_129 + s_118_129 <=s (const 64 (2**20)),
    r_118_129 - s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 + s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 - s_118_129 <=s (const 64 (2**20)),
    u_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_118_129 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_128_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_10,
sint64 g_118_low60_0_low20_10,
sint64 f_118_low60_0_low20_11,
sint64 g_118_low60_0_low20_11,
sint64 u_118_128,
sint64 v_118_128,
sint64 r_118_128,
sint64 s_118_128,
sint64 u_118_129,
sint64 v_118_129,
sint64 r_118_129,
sint64 s_118_129,
bit ne
)={
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (-(2**20)),
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (-(2**20))
&&
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (const 64 (-(2**20))),
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_10 + u_118_128 * (const 64 (2**21)) + v_118_128 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_10 + r_118_128 * (const 64 (2**21)) + s_118_128 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_10,
    f_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_10,
    g_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 128)) <=s delta, delta <=s (const 64 (1 + 2*128)),
    (const 64 (-(2**20))) <=s u_118_128, u_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_128, v_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_128, r_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_128, s_118_128 <=s (const 64 ((2**20)-1)),
    u_118_128 + v_118_128 <=s (const 64 (2**20)),
    u_118_128 - v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 + v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 - v_118_128 <=s (const 64 (2**20)),
    r_118_128 + s_118_128 <=s (const 64 (2**20)),
    r_118_128 - s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 + s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 - s_118_128 <=s (const 64 (2**20)),
    u_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_118_128 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step128

// premise b
assume
g_118_low60_0_low20_10 = 1 (mod 2)
&&
g_118_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_11 f_118_low60_0_low20_10;
mov u_118_129 u_118_128;
mov v_118_129 v_118_128;

add g_118_low60_0_low20_11 g_118_low60_0_low20_10 f_118_low60_0_low20_10;
asr g_118_low60_0_low20_11 g_118_low60_0_low20_11 1;
add r_118_129 r_118_128 u_118_128;
asr r_118_129 r_118_129 1;
add s_118_129 s_118_128 v_118_128;
asr s_118_129 s_118_129 1;
assert
    true
&&
    f_118_low60_0_low20_11 = f_118_low60_0_low20_10,
    u_118_129 = u_118_128,
    v_118_129 = v_118_128,
    g_118_low60_0_low20_11 * (const 64 2) = g_118_low60_0_low20_10 + f_118_low60_0_low20_10,
    r_118_129 * (const 64 2) = r_118_128 + u_118_128,
    s_118_129 * (const 64 2) = s_118_128 + v_118_128
;

assume
    f_118_low60_0_low20_11 = f_118_low60_0_low20_10,
    u_118_129 = u_118_128,
    v_118_129 = v_118_128,
    g_118_low60_0_low20_11 * 2 = g_118_low60_0_low20_10 + f_118_low60_0_low20_10,
    r_118_129 * 2 = r_118_128 + u_118_128,
    s_118_129 * 2 = s_118_128 + v_118_128
&&
    true
;

{
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_11 + u_118_129 * (const 64 (2**21)) + v_118_129 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_11 + r_118_129 * (const 64 (2**21)) + s_118_129 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_11,
    f_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_11,
    g_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 129)) <=s delta, delta <=s (const 64 (1 + 2*129)),
    (const 64 (-(2**20))) <=s u_118_129, u_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_129, v_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_129, r_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_129, s_118_129 <=s (const 64 ((2**20)-1)),
    u_118_129 + v_118_129 <=s (const 64 (2**20)),
    u_118_129 - v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 + v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 - v_118_129 <=s (const 64 (2**20)),
    r_118_129 + s_118_129 <=s (const 64 (2**20)),
    r_118_129 - s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 + s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 - s_118_129 <=s (const 64 (2**20)),
    u_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_118_129 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_128_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_10,
sint64 g_118_low60_0_low20_10,
sint64 f_118_low60_0_low20_11,
sint64 g_118_low60_0_low20_11,
sint64 u_118_128,
sint64 v_118_128,
sint64 r_118_128,
sint64 s_118_128,
sint64 u_118_129,
sint64 v_118_129,
sint64 r_118_129,
sint64 s_118_129,
bit ne
)={
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (-(2**20)),
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (-(2**20))
&&
    u_118_128 * f_118_low60_0_low20_0 + v_118_128 * g_118_low60_0_low20_0 = f_118_low60_0_low20_10 * (const 64 (-(2**20))),
    r_118_128 * f_118_low60_0_low20_0 + s_118_128 * g_118_low60_0_low20_0 = g_118_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_10 + u_118_128 * (const 64 (2**21)) + v_118_128 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_10 + r_118_128 * (const 64 (2**21)) + s_118_128 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_10,
    f_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_10,
    g_118_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 128)) <=s delta, delta <=s (const 64 (1 + 2*128)),
    (const 64 (-(2**20))) <=s u_118_128, u_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_128, v_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_128, r_118_128 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_128, s_118_128 <=s (const 64 ((2**20)-1)),
    u_118_128 + v_118_128 <=s (const 64 (2**20)),
    u_118_128 - v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 + v_118_128 <=s (const 64 (2**20)),
    (const 64 0) - u_118_128 - v_118_128 <=s (const 64 (2**20)),
    r_118_128 + s_118_128 <=s (const 64 (2**20)),
    r_118_128 - s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 + s_118_128 <=s (const 64 (2**20)),
    (const 64 0) - r_118_128 - s_118_128 <=s (const 64 (2**20)),
    u_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_118_128 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_118_128 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step128

// premise c
assume
g_118_low60_0_low20_10 = 1 (mod 2)
&&
g_118_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_11 g_118_low60_0_low20_10;
mov u_118_129 r_118_128;
mov v_118_129 s_118_128;

subs dc g_118_low60_0_low20_11 g_118_low60_0_low20_10 f_118_low60_0_low20_10;
asr g_118_low60_0_low20_11 g_118_low60_0_low20_11 1;
subs dc r_118_129 r_118_128 u_118_128;
asr r_118_129 r_118_129 1;
subs dc s_118_129 s_118_128 v_118_128;
asr s_118_129 s_118_129 1;
assert
    true
&&
    f_118_low60_0_low20_11 = g_118_low60_0_low20_10,
    u_118_129 = r_118_128,
    v_118_129 = s_118_128,
    g_118_low60_0_low20_11 * (const 64 2) = g_118_low60_0_low20_10 - f_118_low60_0_low20_10,
    r_118_129 * (const 64 2) = r_118_128 - u_118_128,
    s_118_129 * (const 64 2) = s_118_128 - v_118_128
;

assume
    f_118_low60_0_low20_11 = g_118_low60_0_low20_10,
    u_118_129 = r_118_128,
    v_118_129 = s_118_128,
    g_118_low60_0_low20_11 * 2 = g_118_low60_0_low20_10 - f_118_low60_0_low20_10,
    r_118_129 * 2 = r_118_128 - u_118_128,
    s_118_129 * 2 = s_118_128 - v_118_128
&&
    true
;

{
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_11 + u_118_129 * (const 64 (2**21)) + v_118_129 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_11 + r_118_129 * (const 64 (2**21)) + s_118_129 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_11,
    f_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_11,
    g_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 129)) <=s delta, delta <=s (const 64 (1 + 2*129)),
    (const 64 (-(2**20))) <=s u_118_129, u_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_129, v_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_129, r_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_129, s_118_129 <=s (const 64 ((2**20)-1)),
    u_118_129 + v_118_129 <=s (const 64 (2**20)),
    u_118_129 - v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 + v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 - v_118_129 <=s (const 64 (2**20)),
    r_118_129 + s_118_129 <=s (const 64 (2**20)),
    r_118_129 - s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 + s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 - s_118_129 <=s (const 64 (2**20)),
    u_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_118_129 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_129_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_11,
sint64 g_118_low60_0_low20_11,
sint64 f_118_low60_0_low20_12,
sint64 g_118_low60_0_low20_12,
sint64 u_118_129,
sint64 v_118_129,
sint64 r_118_129,
sint64 s_118_129,
sint64 u_118_130,
sint64 v_118_130,
sint64 r_118_130,
sint64 s_118_130,
bit ne
)={
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (-(2**20)),
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (-(2**20))
&&
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (const 64 (-(2**20))),
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_11 + u_118_129 * (const 64 (2**21)) + v_118_129 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_11 + r_118_129 * (const 64 (2**21)) + s_118_129 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_11,
    f_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_11,
    g_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 129)) <=s delta, delta <=s (const 64 (1 + 2*129)),
    (const 64 (-(2**20))) <=s u_118_129, u_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_129, v_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_129, r_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_129, s_118_129 <=s (const 64 ((2**20)-1)),
    u_118_129 + v_118_129 <=s (const 64 (2**20)),
    u_118_129 - v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 + v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 - v_118_129 <=s (const 64 (2**20)),
    r_118_129 + s_118_129 <=s (const 64 (2**20)),
    r_118_129 - s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 + s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 - s_118_129 <=s (const 64 (2**20)),
    u_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_118_129 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step129

// premise a
assume
g_118_low60_0_low20_11 = 0 (mod 2)
&&
g_118_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_12 f_118_low60_0_low20_11;
mov u_118_130 u_118_129;
mov v_118_130 v_118_129;

asr g_118_low60_0_low20_12 g_118_low60_0_low20_11 1;
asr r_118_130 r_118_129 1;
asr s_118_130 s_118_129 1;
assert
    true
&&
    f_118_low60_0_low20_12 = f_118_low60_0_low20_11,
    u_118_130 = u_118_129,
    v_118_130 = v_118_129,
    g_118_low60_0_low20_12 * (const 64 2) = g_118_low60_0_low20_11,
    r_118_130 * (const 64 2) = r_118_129,
    s_118_130 * (const 64 2) = s_118_129
;

assume
    f_118_low60_0_low20_12 = f_118_low60_0_low20_11,
    u_118_130 = u_118_129,
    v_118_130 = v_118_129,
    g_118_low60_0_low20_12 * 2 = g_118_low60_0_low20_11,
    r_118_130 * 2 = r_118_129,
    s_118_130 * 2 = s_118_129
&&
    true
;

{
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_12 + u_118_130 * (const 64 (2**21)) + v_118_130 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_12 + r_118_130 * (const 64 (2**21)) + s_118_130 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_12,
    f_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_12,
    g_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 130)) <=s delta, delta <=s (const 64 (1 + 2*130)),
    (const 64 (-(2**20))) <=s u_118_130, u_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_130, v_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_130, r_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_130, s_118_130 <=s (const 64 ((2**20)-1)),
    u_118_130 + v_118_130 <=s (const 64 (2**20)),
    u_118_130 - v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 + v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 - v_118_130 <=s (const 64 (2**20)),
    r_118_130 + s_118_130 <=s (const 64 (2**20)),
    r_118_130 - s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 + s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 - s_118_130 <=s (const 64 (2**20)),
    u_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_118_130 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_129_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_11,
sint64 g_118_low60_0_low20_11,
sint64 f_118_low60_0_low20_12,
sint64 g_118_low60_0_low20_12,
sint64 u_118_129,
sint64 v_118_129,
sint64 r_118_129,
sint64 s_118_129,
sint64 u_118_130,
sint64 v_118_130,
sint64 r_118_130,
sint64 s_118_130,
bit ne
)={
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (-(2**20)),
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (-(2**20))
&&
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (const 64 (-(2**20))),
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_11 + u_118_129 * (const 64 (2**21)) + v_118_129 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_11 + r_118_129 * (const 64 (2**21)) + s_118_129 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_11,
    f_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_11,
    g_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 129)) <=s delta, delta <=s (const 64 (1 + 2*129)),
    (const 64 (-(2**20))) <=s u_118_129, u_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_129, v_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_129, r_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_129, s_118_129 <=s (const 64 ((2**20)-1)),
    u_118_129 + v_118_129 <=s (const 64 (2**20)),
    u_118_129 - v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 + v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 - v_118_129 <=s (const 64 (2**20)),
    r_118_129 + s_118_129 <=s (const 64 (2**20)),
    r_118_129 - s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 + s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 - s_118_129 <=s (const 64 (2**20)),
    u_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_118_129 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step129

// premise b
assume
g_118_low60_0_low20_11 = 1 (mod 2)
&&
g_118_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_12 f_118_low60_0_low20_11;
mov u_118_130 u_118_129;
mov v_118_130 v_118_129;

add g_118_low60_0_low20_12 g_118_low60_0_low20_11 f_118_low60_0_low20_11;
asr g_118_low60_0_low20_12 g_118_low60_0_low20_12 1;
add r_118_130 r_118_129 u_118_129;
asr r_118_130 r_118_130 1;
add s_118_130 s_118_129 v_118_129;
asr s_118_130 s_118_130 1;
assert
    true
&&
    f_118_low60_0_low20_12 = f_118_low60_0_low20_11,
    u_118_130 = u_118_129,
    v_118_130 = v_118_129,
    g_118_low60_0_low20_12 * (const 64 2) = g_118_low60_0_low20_11 + f_118_low60_0_low20_11,
    r_118_130 * (const 64 2) = r_118_129 + u_118_129,
    s_118_130 * (const 64 2) = s_118_129 + v_118_129
;

assume
    f_118_low60_0_low20_12 = f_118_low60_0_low20_11,
    u_118_130 = u_118_129,
    v_118_130 = v_118_129,
    g_118_low60_0_low20_12 * 2 = g_118_low60_0_low20_11 + f_118_low60_0_low20_11,
    r_118_130 * 2 = r_118_129 + u_118_129,
    s_118_130 * 2 = s_118_129 + v_118_129
&&
    true
;

{
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_12 + u_118_130 * (const 64 (2**21)) + v_118_130 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_12 + r_118_130 * (const 64 (2**21)) + s_118_130 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_12,
    f_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_12,
    g_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 130)) <=s delta, delta <=s (const 64 (1 + 2*130)),
    (const 64 (-(2**20))) <=s u_118_130, u_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_130, v_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_130, r_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_130, s_118_130 <=s (const 64 ((2**20)-1)),
    u_118_130 + v_118_130 <=s (const 64 (2**20)),
    u_118_130 - v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 + v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 - v_118_130 <=s (const 64 (2**20)),
    r_118_130 + s_118_130 <=s (const 64 (2**20)),
    r_118_130 - s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 + s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 - s_118_130 <=s (const 64 (2**20)),
    u_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_118_130 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_129_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_11,
sint64 g_118_low60_0_low20_11,
sint64 f_118_low60_0_low20_12,
sint64 g_118_low60_0_low20_12,
sint64 u_118_129,
sint64 v_118_129,
sint64 r_118_129,
sint64 s_118_129,
sint64 u_118_130,
sint64 v_118_130,
sint64 r_118_130,
sint64 s_118_130,
bit ne
)={
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (-(2**20)),
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (-(2**20))
&&
    u_118_129 * f_118_low60_0_low20_0 + v_118_129 * g_118_low60_0_low20_0 = f_118_low60_0_low20_11 * (const 64 (-(2**20))),
    r_118_129 * f_118_low60_0_low20_0 + s_118_129 * g_118_low60_0_low20_0 = g_118_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_11 + u_118_129 * (const 64 (2**21)) + v_118_129 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_11 + r_118_129 * (const 64 (2**21)) + s_118_129 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_11,
    f_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_11,
    g_118_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 129)) <=s delta, delta <=s (const 64 (1 + 2*129)),
    (const 64 (-(2**20))) <=s u_118_129, u_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_129, v_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_129, r_118_129 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_129, s_118_129 <=s (const 64 ((2**20)-1)),
    u_118_129 + v_118_129 <=s (const 64 (2**20)),
    u_118_129 - v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 + v_118_129 <=s (const 64 (2**20)),
    (const 64 0) - u_118_129 - v_118_129 <=s (const 64 (2**20)),
    r_118_129 + s_118_129 <=s (const 64 (2**20)),
    r_118_129 - s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 + s_118_129 <=s (const 64 (2**20)),
    (const 64 0) - r_118_129 - s_118_129 <=s (const 64 (2**20)),
    u_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_118_129 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_118_129 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step129

// premise c
assume
g_118_low60_0_low20_11 = 1 (mod 2)
&&
g_118_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_12 g_118_low60_0_low20_11;
mov u_118_130 r_118_129;
mov v_118_130 s_118_129;

subs dc g_118_low60_0_low20_12 g_118_low60_0_low20_11 f_118_low60_0_low20_11;
asr g_118_low60_0_low20_12 g_118_low60_0_low20_12 1;
subs dc r_118_130 r_118_129 u_118_129;
asr r_118_130 r_118_130 1;
subs dc s_118_130 s_118_129 v_118_129;
asr s_118_130 s_118_130 1;
assert
    true
&&
    f_118_low60_0_low20_12 = g_118_low60_0_low20_11,
    u_118_130 = r_118_129,
    v_118_130 = s_118_129,
    g_118_low60_0_low20_12 * (const 64 2) = g_118_low60_0_low20_11 - f_118_low60_0_low20_11,
    r_118_130 * (const 64 2) = r_118_129 - u_118_129,
    s_118_130 * (const 64 2) = s_118_129 - v_118_129
;

assume
    f_118_low60_0_low20_12 = g_118_low60_0_low20_11,
    u_118_130 = r_118_129,
    v_118_130 = s_118_129,
    g_118_low60_0_low20_12 * 2 = g_118_low60_0_low20_11 - f_118_low60_0_low20_11,
    r_118_130 * 2 = r_118_129 - u_118_129,
    s_118_130 * 2 = s_118_129 - v_118_129
&&
    true
;

{
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_12 + u_118_130 * (const 64 (2**21)) + v_118_130 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_12 + r_118_130 * (const 64 (2**21)) + s_118_130 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_12,
    f_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_12,
    g_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 130)) <=s delta, delta <=s (const 64 (1 + 2*130)),
    (const 64 (-(2**20))) <=s u_118_130, u_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_130, v_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_130, r_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_130, s_118_130 <=s (const 64 ((2**20)-1)),
    u_118_130 + v_118_130 <=s (const 64 (2**20)),
    u_118_130 - v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 + v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 - v_118_130 <=s (const 64 (2**20)),
    r_118_130 + s_118_130 <=s (const 64 (2**20)),
    r_118_130 - s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 + s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 - s_118_130 <=s (const 64 (2**20)),
    u_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_118_130 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_130_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_12,
sint64 g_118_low60_0_low20_12,
sint64 f_118_low60_0_low20_13,
sint64 g_118_low60_0_low20_13,
sint64 u_118_130,
sint64 v_118_130,
sint64 r_118_130,
sint64 s_118_130,
sint64 u_118_131,
sint64 v_118_131,
sint64 r_118_131,
sint64 s_118_131,
bit ne
)={
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (-(2**20)),
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (-(2**20))
&&
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (const 64 (-(2**20))),
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_12 + u_118_130 * (const 64 (2**21)) + v_118_130 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_12 + r_118_130 * (const 64 (2**21)) + s_118_130 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_12,
    f_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_12,
    g_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 130)) <=s delta, delta <=s (const 64 (1 + 2*130)),
    (const 64 (-(2**20))) <=s u_118_130, u_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_130, v_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_130, r_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_130, s_118_130 <=s (const 64 ((2**20)-1)),
    u_118_130 + v_118_130 <=s (const 64 (2**20)),
    u_118_130 - v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 + v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 - v_118_130 <=s (const 64 (2**20)),
    r_118_130 + s_118_130 <=s (const 64 (2**20)),
    r_118_130 - s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 + s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 - s_118_130 <=s (const 64 (2**20)),
    u_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_118_130 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step130

// premise a
assume
g_118_low60_0_low20_12 = 0 (mod 2)
&&
g_118_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_13 f_118_low60_0_low20_12;
mov u_118_131 u_118_130;
mov v_118_131 v_118_130;

asr g_118_low60_0_low20_13 g_118_low60_0_low20_12 1;
asr r_118_131 r_118_130 1;
asr s_118_131 s_118_130 1;
assert
    true
&&
    f_118_low60_0_low20_13 = f_118_low60_0_low20_12,
    u_118_131 = u_118_130,
    v_118_131 = v_118_130,
    g_118_low60_0_low20_13 * (const 64 2) = g_118_low60_0_low20_12,
    r_118_131 * (const 64 2) = r_118_130,
    s_118_131 * (const 64 2) = s_118_130
;

assume
    f_118_low60_0_low20_13 = f_118_low60_0_low20_12,
    u_118_131 = u_118_130,
    v_118_131 = v_118_130,
    g_118_low60_0_low20_13 * 2 = g_118_low60_0_low20_12,
    r_118_131 * 2 = r_118_130,
    s_118_131 * 2 = s_118_130
&&
    true
;

{
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_13 + u_118_131 * (const 64 (2**21)) + v_118_131 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_13 + r_118_131 * (const 64 (2**21)) + s_118_131 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_13,
    f_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_13,
    g_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 131)) <=s delta, delta <=s (const 64 (1 + 2*131)),
    (const 64 (-(2**20))) <=s u_118_131, u_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_131, v_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_131, r_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_131, s_118_131 <=s (const 64 ((2**20)-1)),
    u_118_131 + v_118_131 <=s (const 64 (2**20)),
    u_118_131 - v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 + v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 - v_118_131 <=s (const 64 (2**20)),
    r_118_131 + s_118_131 <=s (const 64 (2**20)),
    r_118_131 - s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 + s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 - s_118_131 <=s (const 64 (2**20)),
    u_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_118_131 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_130_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_12,
sint64 g_118_low60_0_low20_12,
sint64 f_118_low60_0_low20_13,
sint64 g_118_low60_0_low20_13,
sint64 u_118_130,
sint64 v_118_130,
sint64 r_118_130,
sint64 s_118_130,
sint64 u_118_131,
sint64 v_118_131,
sint64 r_118_131,
sint64 s_118_131,
bit ne
)={
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (-(2**20)),
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (-(2**20))
&&
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (const 64 (-(2**20))),
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_12 + u_118_130 * (const 64 (2**21)) + v_118_130 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_12 + r_118_130 * (const 64 (2**21)) + s_118_130 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_12,
    f_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_12,
    g_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 130)) <=s delta, delta <=s (const 64 (1 + 2*130)),
    (const 64 (-(2**20))) <=s u_118_130, u_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_130, v_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_130, r_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_130, s_118_130 <=s (const 64 ((2**20)-1)),
    u_118_130 + v_118_130 <=s (const 64 (2**20)),
    u_118_130 - v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 + v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 - v_118_130 <=s (const 64 (2**20)),
    r_118_130 + s_118_130 <=s (const 64 (2**20)),
    r_118_130 - s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 + s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 - s_118_130 <=s (const 64 (2**20)),
    u_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_118_130 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step130

// premise b
assume
g_118_low60_0_low20_12 = 1 (mod 2)
&&
g_118_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_13 f_118_low60_0_low20_12;
mov u_118_131 u_118_130;
mov v_118_131 v_118_130;

add g_118_low60_0_low20_13 g_118_low60_0_low20_12 f_118_low60_0_low20_12;
asr g_118_low60_0_low20_13 g_118_low60_0_low20_13 1;
add r_118_131 r_118_130 u_118_130;
asr r_118_131 r_118_131 1;
add s_118_131 s_118_130 v_118_130;
asr s_118_131 s_118_131 1;
assert
    true
&&
    f_118_low60_0_low20_13 = f_118_low60_0_low20_12,
    u_118_131 = u_118_130,
    v_118_131 = v_118_130,
    g_118_low60_0_low20_13 * (const 64 2) = g_118_low60_0_low20_12 + f_118_low60_0_low20_12,
    r_118_131 * (const 64 2) = r_118_130 + u_118_130,
    s_118_131 * (const 64 2) = s_118_130 + v_118_130
;

assume
    f_118_low60_0_low20_13 = f_118_low60_0_low20_12,
    u_118_131 = u_118_130,
    v_118_131 = v_118_130,
    g_118_low60_0_low20_13 * 2 = g_118_low60_0_low20_12 + f_118_low60_0_low20_12,
    r_118_131 * 2 = r_118_130 + u_118_130,
    s_118_131 * 2 = s_118_130 + v_118_130
&&
    true
;

{
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_13 + u_118_131 * (const 64 (2**21)) + v_118_131 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_13 + r_118_131 * (const 64 (2**21)) + s_118_131 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_13,
    f_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_13,
    g_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 131)) <=s delta, delta <=s (const 64 (1 + 2*131)),
    (const 64 (-(2**20))) <=s u_118_131, u_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_131, v_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_131, r_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_131, s_118_131 <=s (const 64 ((2**20)-1)),
    u_118_131 + v_118_131 <=s (const 64 (2**20)),
    u_118_131 - v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 + v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 - v_118_131 <=s (const 64 (2**20)),
    r_118_131 + s_118_131 <=s (const 64 (2**20)),
    r_118_131 - s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 + s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 - s_118_131 <=s (const 64 (2**20)),
    u_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_118_131 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_130_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_12,
sint64 g_118_low60_0_low20_12,
sint64 f_118_low60_0_low20_13,
sint64 g_118_low60_0_low20_13,
sint64 u_118_130,
sint64 v_118_130,
sint64 r_118_130,
sint64 s_118_130,
sint64 u_118_131,
sint64 v_118_131,
sint64 r_118_131,
sint64 s_118_131,
bit ne
)={
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (-(2**20)),
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (-(2**20))
&&
    u_118_130 * f_118_low60_0_low20_0 + v_118_130 * g_118_low60_0_low20_0 = f_118_low60_0_low20_12 * (const 64 (-(2**20))),
    r_118_130 * f_118_low60_0_low20_0 + s_118_130 * g_118_low60_0_low20_0 = g_118_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_12 + u_118_130 * (const 64 (2**21)) + v_118_130 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_12 + r_118_130 * (const 64 (2**21)) + s_118_130 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_12,
    f_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_12,
    g_118_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 130)) <=s delta, delta <=s (const 64 (1 + 2*130)),
    (const 64 (-(2**20))) <=s u_118_130, u_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_130, v_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_130, r_118_130 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_130, s_118_130 <=s (const 64 ((2**20)-1)),
    u_118_130 + v_118_130 <=s (const 64 (2**20)),
    u_118_130 - v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 + v_118_130 <=s (const 64 (2**20)),
    (const 64 0) - u_118_130 - v_118_130 <=s (const 64 (2**20)),
    r_118_130 + s_118_130 <=s (const 64 (2**20)),
    r_118_130 - s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 + s_118_130 <=s (const 64 (2**20)),
    (const 64 0) - r_118_130 - s_118_130 <=s (const 64 (2**20)),
    u_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_118_130 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_118_130 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step130

// premise c
assume
g_118_low60_0_low20_12 = 1 (mod 2)
&&
g_118_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_13 g_118_low60_0_low20_12;
mov u_118_131 r_118_130;
mov v_118_131 s_118_130;

subs dc g_118_low60_0_low20_13 g_118_low60_0_low20_12 f_118_low60_0_low20_12;
asr g_118_low60_0_low20_13 g_118_low60_0_low20_13 1;
subs dc r_118_131 r_118_130 u_118_130;
asr r_118_131 r_118_131 1;
subs dc s_118_131 s_118_130 v_118_130;
asr s_118_131 s_118_131 1;
assert
    true
&&
    f_118_low60_0_low20_13 = g_118_low60_0_low20_12,
    u_118_131 = r_118_130,
    v_118_131 = s_118_130,
    g_118_low60_0_low20_13 * (const 64 2) = g_118_low60_0_low20_12 - f_118_low60_0_low20_12,
    r_118_131 * (const 64 2) = r_118_130 - u_118_130,
    s_118_131 * (const 64 2) = s_118_130 - v_118_130
;

assume
    f_118_low60_0_low20_13 = g_118_low60_0_low20_12,
    u_118_131 = r_118_130,
    v_118_131 = s_118_130,
    g_118_low60_0_low20_13 * 2 = g_118_low60_0_low20_12 - f_118_low60_0_low20_12,
    r_118_131 * 2 = r_118_130 - u_118_130,
    s_118_131 * 2 = s_118_130 - v_118_130
&&
    true
;

{
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_13 + u_118_131 * (const 64 (2**21)) + v_118_131 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_13 + r_118_131 * (const 64 (2**21)) + s_118_131 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_13,
    f_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_13,
    g_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 131)) <=s delta, delta <=s (const 64 (1 + 2*131)),
    (const 64 (-(2**20))) <=s u_118_131, u_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_131, v_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_131, r_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_131, s_118_131 <=s (const 64 ((2**20)-1)),
    u_118_131 + v_118_131 <=s (const 64 (2**20)),
    u_118_131 - v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 + v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 - v_118_131 <=s (const 64 (2**20)),
    r_118_131 + s_118_131 <=s (const 64 (2**20)),
    r_118_131 - s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 + s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 - s_118_131 <=s (const 64 (2**20)),
    u_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_118_131 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_131_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_13,
sint64 g_118_low60_0_low20_13,
sint64 f_118_low60_0_low20_14,
sint64 g_118_low60_0_low20_14,
sint64 u_118_131,
sint64 v_118_131,
sint64 r_118_131,
sint64 s_118_131,
sint64 u_118_132,
sint64 v_118_132,
sint64 r_118_132,
sint64 s_118_132,
bit ne
)={
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (-(2**20)),
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (-(2**20))
&&
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (const 64 (-(2**20))),
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_13 + u_118_131 * (const 64 (2**21)) + v_118_131 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_13 + r_118_131 * (const 64 (2**21)) + s_118_131 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_13,
    f_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_13,
    g_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 131)) <=s delta, delta <=s (const 64 (1 + 2*131)),
    (const 64 (-(2**20))) <=s u_118_131, u_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_131, v_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_131, r_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_131, s_118_131 <=s (const 64 ((2**20)-1)),
    u_118_131 + v_118_131 <=s (const 64 (2**20)),
    u_118_131 - v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 + v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 - v_118_131 <=s (const 64 (2**20)),
    r_118_131 + s_118_131 <=s (const 64 (2**20)),
    r_118_131 - s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 + s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 - s_118_131 <=s (const 64 (2**20)),
    u_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_118_131 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step131

// premise a
assume
g_118_low60_0_low20_13 = 0 (mod 2)
&&
g_118_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_14 f_118_low60_0_low20_13;
mov u_118_132 u_118_131;
mov v_118_132 v_118_131;

asr g_118_low60_0_low20_14 g_118_low60_0_low20_13 1;
asr r_118_132 r_118_131 1;
asr s_118_132 s_118_131 1;
assert
    true
&&
    f_118_low60_0_low20_14 = f_118_low60_0_low20_13,
    u_118_132 = u_118_131,
    v_118_132 = v_118_131,
    g_118_low60_0_low20_14 * (const 64 2) = g_118_low60_0_low20_13,
    r_118_132 * (const 64 2) = r_118_131,
    s_118_132 * (const 64 2) = s_118_131
;

assume
    f_118_low60_0_low20_14 = f_118_low60_0_low20_13,
    u_118_132 = u_118_131,
    v_118_132 = v_118_131,
    g_118_low60_0_low20_14 * 2 = g_118_low60_0_low20_13,
    r_118_132 * 2 = r_118_131,
    s_118_132 * 2 = s_118_131
&&
    true
;

{
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_14 + u_118_132 * (const 64 (2**21)) + v_118_132 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_14 + r_118_132 * (const 64 (2**21)) + s_118_132 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_14,
    f_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_14,
    g_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 132)) <=s delta, delta <=s (const 64 (1 + 2*132)),
    (const 64 (-(2**20))) <=s u_118_132, u_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_132, v_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_132, r_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_132, s_118_132 <=s (const 64 ((2**20)-1)),
    u_118_132 + v_118_132 <=s (const 64 (2**20)),
    u_118_132 - v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 + v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 - v_118_132 <=s (const 64 (2**20)),
    r_118_132 + s_118_132 <=s (const 64 (2**20)),
    r_118_132 - s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 + s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 - s_118_132 <=s (const 64 (2**20)),
    u_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_118_132 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_131_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_13,
sint64 g_118_low60_0_low20_13,
sint64 f_118_low60_0_low20_14,
sint64 g_118_low60_0_low20_14,
sint64 u_118_131,
sint64 v_118_131,
sint64 r_118_131,
sint64 s_118_131,
sint64 u_118_132,
sint64 v_118_132,
sint64 r_118_132,
sint64 s_118_132,
bit ne
)={
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (-(2**20)),
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (-(2**20))
&&
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (const 64 (-(2**20))),
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_13 + u_118_131 * (const 64 (2**21)) + v_118_131 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_13 + r_118_131 * (const 64 (2**21)) + s_118_131 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_13,
    f_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_13,
    g_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 131)) <=s delta, delta <=s (const 64 (1 + 2*131)),
    (const 64 (-(2**20))) <=s u_118_131, u_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_131, v_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_131, r_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_131, s_118_131 <=s (const 64 ((2**20)-1)),
    u_118_131 + v_118_131 <=s (const 64 (2**20)),
    u_118_131 - v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 + v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 - v_118_131 <=s (const 64 (2**20)),
    r_118_131 + s_118_131 <=s (const 64 (2**20)),
    r_118_131 - s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 + s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 - s_118_131 <=s (const 64 (2**20)),
    u_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_118_131 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step131

// premise b
assume
g_118_low60_0_low20_13 = 1 (mod 2)
&&
g_118_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_14 f_118_low60_0_low20_13;
mov u_118_132 u_118_131;
mov v_118_132 v_118_131;

add g_118_low60_0_low20_14 g_118_low60_0_low20_13 f_118_low60_0_low20_13;
asr g_118_low60_0_low20_14 g_118_low60_0_low20_14 1;
add r_118_132 r_118_131 u_118_131;
asr r_118_132 r_118_132 1;
add s_118_132 s_118_131 v_118_131;
asr s_118_132 s_118_132 1;
assert
    true
&&
    f_118_low60_0_low20_14 = f_118_low60_0_low20_13,
    u_118_132 = u_118_131,
    v_118_132 = v_118_131,
    g_118_low60_0_low20_14 * (const 64 2) = g_118_low60_0_low20_13 + f_118_low60_0_low20_13,
    r_118_132 * (const 64 2) = r_118_131 + u_118_131,
    s_118_132 * (const 64 2) = s_118_131 + v_118_131
;

assume
    f_118_low60_0_low20_14 = f_118_low60_0_low20_13,
    u_118_132 = u_118_131,
    v_118_132 = v_118_131,
    g_118_low60_0_low20_14 * 2 = g_118_low60_0_low20_13 + f_118_low60_0_low20_13,
    r_118_132 * 2 = r_118_131 + u_118_131,
    s_118_132 * 2 = s_118_131 + v_118_131
&&
    true
;

{
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_14 + u_118_132 * (const 64 (2**21)) + v_118_132 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_14 + r_118_132 * (const 64 (2**21)) + s_118_132 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_14,
    f_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_14,
    g_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 132)) <=s delta, delta <=s (const 64 (1 + 2*132)),
    (const 64 (-(2**20))) <=s u_118_132, u_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_132, v_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_132, r_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_132, s_118_132 <=s (const 64 ((2**20)-1)),
    u_118_132 + v_118_132 <=s (const 64 (2**20)),
    u_118_132 - v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 + v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 - v_118_132 <=s (const 64 (2**20)),
    r_118_132 + s_118_132 <=s (const 64 (2**20)),
    r_118_132 - s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 + s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 - s_118_132 <=s (const 64 (2**20)),
    u_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_118_132 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_131_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_13,
sint64 g_118_low60_0_low20_13,
sint64 f_118_low60_0_low20_14,
sint64 g_118_low60_0_low20_14,
sint64 u_118_131,
sint64 v_118_131,
sint64 r_118_131,
sint64 s_118_131,
sint64 u_118_132,
sint64 v_118_132,
sint64 r_118_132,
sint64 s_118_132,
bit ne
)={
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (-(2**20)),
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (-(2**20))
&&
    u_118_131 * f_118_low60_0_low20_0 + v_118_131 * g_118_low60_0_low20_0 = f_118_low60_0_low20_13 * (const 64 (-(2**20))),
    r_118_131 * f_118_low60_0_low20_0 + s_118_131 * g_118_low60_0_low20_0 = g_118_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_13 + u_118_131 * (const 64 (2**21)) + v_118_131 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_13 + r_118_131 * (const 64 (2**21)) + s_118_131 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_13,
    f_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_13,
    g_118_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 131)) <=s delta, delta <=s (const 64 (1 + 2*131)),
    (const 64 (-(2**20))) <=s u_118_131, u_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_131, v_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_131, r_118_131 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_131, s_118_131 <=s (const 64 ((2**20)-1)),
    u_118_131 + v_118_131 <=s (const 64 (2**20)),
    u_118_131 - v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 + v_118_131 <=s (const 64 (2**20)),
    (const 64 0) - u_118_131 - v_118_131 <=s (const 64 (2**20)),
    r_118_131 + s_118_131 <=s (const 64 (2**20)),
    r_118_131 - s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 + s_118_131 <=s (const 64 (2**20)),
    (const 64 0) - r_118_131 - s_118_131 <=s (const 64 (2**20)),
    u_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_118_131 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_118_131 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step131

// premise c
assume
g_118_low60_0_low20_13 = 1 (mod 2)
&&
g_118_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_14 g_118_low60_0_low20_13;
mov u_118_132 r_118_131;
mov v_118_132 s_118_131;

subs dc g_118_low60_0_low20_14 g_118_low60_0_low20_13 f_118_low60_0_low20_13;
asr g_118_low60_0_low20_14 g_118_low60_0_low20_14 1;
subs dc r_118_132 r_118_131 u_118_131;
asr r_118_132 r_118_132 1;
subs dc s_118_132 s_118_131 v_118_131;
asr s_118_132 s_118_132 1;
assert
    true
&&
    f_118_low60_0_low20_14 = g_118_low60_0_low20_13,
    u_118_132 = r_118_131,
    v_118_132 = s_118_131,
    g_118_low60_0_low20_14 * (const 64 2) = g_118_low60_0_low20_13 - f_118_low60_0_low20_13,
    r_118_132 * (const 64 2) = r_118_131 - u_118_131,
    s_118_132 * (const 64 2) = s_118_131 - v_118_131
;

assume
    f_118_low60_0_low20_14 = g_118_low60_0_low20_13,
    u_118_132 = r_118_131,
    v_118_132 = s_118_131,
    g_118_low60_0_low20_14 * 2 = g_118_low60_0_low20_13 - f_118_low60_0_low20_13,
    r_118_132 * 2 = r_118_131 - u_118_131,
    s_118_132 * 2 = s_118_131 - v_118_131
&&
    true
;

{
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_14 + u_118_132 * (const 64 (2**21)) + v_118_132 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_14 + r_118_132 * (const 64 (2**21)) + s_118_132 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_14,
    f_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_14,
    g_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 132)) <=s delta, delta <=s (const 64 (1 + 2*132)),
    (const 64 (-(2**20))) <=s u_118_132, u_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_132, v_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_132, r_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_132, s_118_132 <=s (const 64 ((2**20)-1)),
    u_118_132 + v_118_132 <=s (const 64 (2**20)),
    u_118_132 - v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 + v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 - v_118_132 <=s (const 64 (2**20)),
    r_118_132 + s_118_132 <=s (const 64 (2**20)),
    r_118_132 - s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 + s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 - s_118_132 <=s (const 64 (2**20)),
    u_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_118_132 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_132_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_14,
sint64 g_118_low60_0_low20_14,
sint64 f_118_low60_0_low20_15,
sint64 g_118_low60_0_low20_15,
sint64 u_118_132,
sint64 v_118_132,
sint64 r_118_132,
sint64 s_118_132,
sint64 u_118_133,
sint64 v_118_133,
sint64 r_118_133,
sint64 s_118_133,
bit ne
)={
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (-(2**20)),
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (-(2**20))
&&
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (const 64 (-(2**20))),
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_14 + u_118_132 * (const 64 (2**21)) + v_118_132 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_14 + r_118_132 * (const 64 (2**21)) + s_118_132 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_14,
    f_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_14,
    g_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 132)) <=s delta, delta <=s (const 64 (1 + 2*132)),
    (const 64 (-(2**20))) <=s u_118_132, u_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_132, v_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_132, r_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_132, s_118_132 <=s (const 64 ((2**20)-1)),
    u_118_132 + v_118_132 <=s (const 64 (2**20)),
    u_118_132 - v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 + v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 - v_118_132 <=s (const 64 (2**20)),
    r_118_132 + s_118_132 <=s (const 64 (2**20)),
    r_118_132 - s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 + s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 - s_118_132 <=s (const 64 (2**20)),
    u_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_118_132 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step132

// premise a
assume
g_118_low60_0_low20_14 = 0 (mod 2)
&&
g_118_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_15 f_118_low60_0_low20_14;
mov u_118_133 u_118_132;
mov v_118_133 v_118_132;

asr g_118_low60_0_low20_15 g_118_low60_0_low20_14 1;
asr r_118_133 r_118_132 1;
asr s_118_133 s_118_132 1;
assert
    true
&&
    f_118_low60_0_low20_15 = f_118_low60_0_low20_14,
    u_118_133 = u_118_132,
    v_118_133 = v_118_132,
    g_118_low60_0_low20_15 * (const 64 2) = g_118_low60_0_low20_14,
    r_118_133 * (const 64 2) = r_118_132,
    s_118_133 * (const 64 2) = s_118_132
;

assume
    f_118_low60_0_low20_15 = f_118_low60_0_low20_14,
    u_118_133 = u_118_132,
    v_118_133 = v_118_132,
    g_118_low60_0_low20_15 * 2 = g_118_low60_0_low20_14,
    r_118_133 * 2 = r_118_132,
    s_118_133 * 2 = s_118_132
&&
    true
;

{
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_15 + u_118_133 * (const 64 (2**21)) + v_118_133 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_15 + r_118_133 * (const 64 (2**21)) + s_118_133 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_15,
    f_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_15,
    g_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 133)) <=s delta, delta <=s (const 64 (1 + 2*133)),
    (const 64 (-(2**20))) <=s u_118_133, u_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_133, v_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_133, r_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_133, s_118_133 <=s (const 64 ((2**20)-1)),
    u_118_133 + v_118_133 <=s (const 64 (2**20)),
    u_118_133 - v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 + v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 - v_118_133 <=s (const 64 (2**20)),
    r_118_133 + s_118_133 <=s (const 64 (2**20)),
    r_118_133 - s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 + s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 - s_118_133 <=s (const 64 (2**20)),
    u_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_118_133 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_132_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_14,
sint64 g_118_low60_0_low20_14,
sint64 f_118_low60_0_low20_15,
sint64 g_118_low60_0_low20_15,
sint64 u_118_132,
sint64 v_118_132,
sint64 r_118_132,
sint64 s_118_132,
sint64 u_118_133,
sint64 v_118_133,
sint64 r_118_133,
sint64 s_118_133,
bit ne
)={
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (-(2**20)),
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (-(2**20))
&&
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (const 64 (-(2**20))),
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_14 + u_118_132 * (const 64 (2**21)) + v_118_132 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_14 + r_118_132 * (const 64 (2**21)) + s_118_132 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_14,
    f_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_14,
    g_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 132)) <=s delta, delta <=s (const 64 (1 + 2*132)),
    (const 64 (-(2**20))) <=s u_118_132, u_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_132, v_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_132, r_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_132, s_118_132 <=s (const 64 ((2**20)-1)),
    u_118_132 + v_118_132 <=s (const 64 (2**20)),
    u_118_132 - v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 + v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 - v_118_132 <=s (const 64 (2**20)),
    r_118_132 + s_118_132 <=s (const 64 (2**20)),
    r_118_132 - s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 + s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 - s_118_132 <=s (const 64 (2**20)),
    u_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_118_132 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step132

// premise b
assume
g_118_low60_0_low20_14 = 1 (mod 2)
&&
g_118_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_15 f_118_low60_0_low20_14;
mov u_118_133 u_118_132;
mov v_118_133 v_118_132;

add g_118_low60_0_low20_15 g_118_low60_0_low20_14 f_118_low60_0_low20_14;
asr g_118_low60_0_low20_15 g_118_low60_0_low20_15 1;
add r_118_133 r_118_132 u_118_132;
asr r_118_133 r_118_133 1;
add s_118_133 s_118_132 v_118_132;
asr s_118_133 s_118_133 1;
assert
    true
&&
    f_118_low60_0_low20_15 = f_118_low60_0_low20_14,
    u_118_133 = u_118_132,
    v_118_133 = v_118_132,
    g_118_low60_0_low20_15 * (const 64 2) = g_118_low60_0_low20_14 + f_118_low60_0_low20_14,
    r_118_133 * (const 64 2) = r_118_132 + u_118_132,
    s_118_133 * (const 64 2) = s_118_132 + v_118_132
;

assume
    f_118_low60_0_low20_15 = f_118_low60_0_low20_14,
    u_118_133 = u_118_132,
    v_118_133 = v_118_132,
    g_118_low60_0_low20_15 * 2 = g_118_low60_0_low20_14 + f_118_low60_0_low20_14,
    r_118_133 * 2 = r_118_132 + u_118_132,
    s_118_133 * 2 = s_118_132 + v_118_132
&&
    true
;

{
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_15 + u_118_133 * (const 64 (2**21)) + v_118_133 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_15 + r_118_133 * (const 64 (2**21)) + s_118_133 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_15,
    f_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_15,
    g_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 133)) <=s delta, delta <=s (const 64 (1 + 2*133)),
    (const 64 (-(2**20))) <=s u_118_133, u_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_133, v_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_133, r_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_133, s_118_133 <=s (const 64 ((2**20)-1)),
    u_118_133 + v_118_133 <=s (const 64 (2**20)),
    u_118_133 - v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 + v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 - v_118_133 <=s (const 64 (2**20)),
    r_118_133 + s_118_133 <=s (const 64 (2**20)),
    r_118_133 - s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 + s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 - s_118_133 <=s (const 64 (2**20)),
    u_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_118_133 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_132_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_14,
sint64 g_118_low60_0_low20_14,
sint64 f_118_low60_0_low20_15,
sint64 g_118_low60_0_low20_15,
sint64 u_118_132,
sint64 v_118_132,
sint64 r_118_132,
sint64 s_118_132,
sint64 u_118_133,
sint64 v_118_133,
sint64 r_118_133,
sint64 s_118_133,
bit ne
)={
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (-(2**20)),
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (-(2**20))
&&
    u_118_132 * f_118_low60_0_low20_0 + v_118_132 * g_118_low60_0_low20_0 = f_118_low60_0_low20_14 * (const 64 (-(2**20))),
    r_118_132 * f_118_low60_0_low20_0 + s_118_132 * g_118_low60_0_low20_0 = g_118_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_14 + u_118_132 * (const 64 (2**21)) + v_118_132 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_14 + r_118_132 * (const 64 (2**21)) + s_118_132 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_14,
    f_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_14,
    g_118_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 132)) <=s delta, delta <=s (const 64 (1 + 2*132)),
    (const 64 (-(2**20))) <=s u_118_132, u_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_132, v_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_132, r_118_132 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_132, s_118_132 <=s (const 64 ((2**20)-1)),
    u_118_132 + v_118_132 <=s (const 64 (2**20)),
    u_118_132 - v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 + v_118_132 <=s (const 64 (2**20)),
    (const 64 0) - u_118_132 - v_118_132 <=s (const 64 (2**20)),
    r_118_132 + s_118_132 <=s (const 64 (2**20)),
    r_118_132 - s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 + s_118_132 <=s (const 64 (2**20)),
    (const 64 0) - r_118_132 - s_118_132 <=s (const 64 (2**20)),
    u_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_118_132 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_118_132 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step132

// premise c
assume
g_118_low60_0_low20_14 = 1 (mod 2)
&&
g_118_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_15 g_118_low60_0_low20_14;
mov u_118_133 r_118_132;
mov v_118_133 s_118_132;

subs dc g_118_low60_0_low20_15 g_118_low60_0_low20_14 f_118_low60_0_low20_14;
asr g_118_low60_0_low20_15 g_118_low60_0_low20_15 1;
subs dc r_118_133 r_118_132 u_118_132;
asr r_118_133 r_118_133 1;
subs dc s_118_133 s_118_132 v_118_132;
asr s_118_133 s_118_133 1;
assert
    true
&&
    f_118_low60_0_low20_15 = g_118_low60_0_low20_14,
    u_118_133 = r_118_132,
    v_118_133 = s_118_132,
    g_118_low60_0_low20_15 * (const 64 2) = g_118_low60_0_low20_14 - f_118_low60_0_low20_14,
    r_118_133 * (const 64 2) = r_118_132 - u_118_132,
    s_118_133 * (const 64 2) = s_118_132 - v_118_132
;

assume
    f_118_low60_0_low20_15 = g_118_low60_0_low20_14,
    u_118_133 = r_118_132,
    v_118_133 = s_118_132,
    g_118_low60_0_low20_15 * 2 = g_118_low60_0_low20_14 - f_118_low60_0_low20_14,
    r_118_133 * 2 = r_118_132 - u_118_132,
    s_118_133 * 2 = s_118_132 - v_118_132
&&
    true
;

{
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_15 + u_118_133 * (const 64 (2**21)) + v_118_133 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_15 + r_118_133 * (const 64 (2**21)) + s_118_133 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_15,
    f_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_15,
    g_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 133)) <=s delta, delta <=s (const 64 (1 + 2*133)),
    (const 64 (-(2**20))) <=s u_118_133, u_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_133, v_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_133, r_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_133, s_118_133 <=s (const 64 ((2**20)-1)),
    u_118_133 + v_118_133 <=s (const 64 (2**20)),
    u_118_133 - v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 + v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 - v_118_133 <=s (const 64 (2**20)),
    r_118_133 + s_118_133 <=s (const 64 (2**20)),
    r_118_133 - s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 + s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 - s_118_133 <=s (const 64 (2**20)),
    u_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_118_133 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_133_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_15,
sint64 g_118_low60_0_low20_15,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 u_118_133,
sint64 v_118_133,
sint64 r_118_133,
sint64 s_118_133,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
bit ne
)={
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (-(2**20)),
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (-(2**20))
&&
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (const 64 (-(2**20))),
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_15 + u_118_133 * (const 64 (2**21)) + v_118_133 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_15 + r_118_133 * (const 64 (2**21)) + s_118_133 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_15,
    f_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_15,
    g_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 133)) <=s delta, delta <=s (const 64 (1 + 2*133)),
    (const 64 (-(2**20))) <=s u_118_133, u_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_133, v_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_133, r_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_133, s_118_133 <=s (const 64 ((2**20)-1)),
    u_118_133 + v_118_133 <=s (const 64 (2**20)),
    u_118_133 - v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 + v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 - v_118_133 <=s (const 64 (2**20)),
    r_118_133 + s_118_133 <=s (const 64 (2**20)),
    r_118_133 - s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 + s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 - s_118_133 <=s (const 64 (2**20)),
    u_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_118_133 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step133

// premise a
assume
g_118_low60_0_low20_15 = 0 (mod 2)
&&
g_118_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_16 f_118_low60_0_low20_15;
mov u_118_134 u_118_133;
mov v_118_134 v_118_133;

asr g_118_low60_0_low20_16 g_118_low60_0_low20_15 1;
asr r_118_134 r_118_133 1;
asr s_118_134 s_118_133 1;
assert
    true
&&
    f_118_low60_0_low20_16 = f_118_low60_0_low20_15,
    u_118_134 = u_118_133,
    v_118_134 = v_118_133,
    g_118_low60_0_low20_16 * (const 64 2) = g_118_low60_0_low20_15,
    r_118_134 * (const 64 2) = r_118_133,
    s_118_134 * (const 64 2) = s_118_133
;

assume
    f_118_low60_0_low20_16 = f_118_low60_0_low20_15,
    u_118_134 = u_118_133,
    v_118_134 = v_118_133,
    g_118_low60_0_low20_16 * 2 = g_118_low60_0_low20_15,
    r_118_134 * 2 = r_118_133,
    s_118_134 * 2 = s_118_133
&&
    true
;

{
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20)-1)),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_133_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_15,
sint64 g_118_low60_0_low20_15,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 u_118_133,
sint64 v_118_133,
sint64 r_118_133,
sint64 s_118_133,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
bit ne
)={
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (-(2**20)),
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (-(2**20))
&&
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (const 64 (-(2**20))),
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_15 + u_118_133 * (const 64 (2**21)) + v_118_133 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_15 + r_118_133 * (const 64 (2**21)) + s_118_133 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_15,
    f_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_15,
    g_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 133)) <=s delta, delta <=s (const 64 (1 + 2*133)),
    (const 64 (-(2**20))) <=s u_118_133, u_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_133, v_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_133, r_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_133, s_118_133 <=s (const 64 ((2**20)-1)),
    u_118_133 + v_118_133 <=s (const 64 (2**20)),
    u_118_133 - v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 + v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 - v_118_133 <=s (const 64 (2**20)),
    r_118_133 + s_118_133 <=s (const 64 (2**20)),
    r_118_133 - s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 + s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 - s_118_133 <=s (const 64 (2**20)),
    u_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_118_133 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step133

// premise b
assume
g_118_low60_0_low20_15 = 1 (mod 2)
&&
g_118_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_16 f_118_low60_0_low20_15;
mov u_118_134 u_118_133;
mov v_118_134 v_118_133;

add g_118_low60_0_low20_16 g_118_low60_0_low20_15 f_118_low60_0_low20_15;
asr g_118_low60_0_low20_16 g_118_low60_0_low20_16 1;
add r_118_134 r_118_133 u_118_133;
asr r_118_134 r_118_134 1;
add s_118_134 s_118_133 v_118_133;
asr s_118_134 s_118_134 1;
assert
    true
&&
    f_118_low60_0_low20_16 = f_118_low60_0_low20_15,
    u_118_134 = u_118_133,
    v_118_134 = v_118_133,
    g_118_low60_0_low20_16 * (const 64 2) = g_118_low60_0_low20_15 + f_118_low60_0_low20_15,
    r_118_134 * (const 64 2) = r_118_133 + u_118_133,
    s_118_134 * (const 64 2) = s_118_133 + v_118_133
;

assume
    f_118_low60_0_low20_16 = f_118_low60_0_low20_15,
    u_118_134 = u_118_133,
    v_118_134 = v_118_133,
    g_118_low60_0_low20_16 * 2 = g_118_low60_0_low20_15 + f_118_low60_0_low20_15,
    r_118_134 * 2 = r_118_133 + u_118_133,
    s_118_134 * 2 = s_118_133 + v_118_133
&&
    true
;

{
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20)-1)),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_133_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_15,
sint64 g_118_low60_0_low20_15,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 u_118_133,
sint64 v_118_133,
sint64 r_118_133,
sint64 s_118_133,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
bit ne
)={
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (-(2**20)),
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (-(2**20))
&&
    u_118_133 * f_118_low60_0_low20_0 + v_118_133 * g_118_low60_0_low20_0 = f_118_low60_0_low20_15 * (const 64 (-(2**20))),
    r_118_133 * f_118_low60_0_low20_0 + s_118_133 * g_118_low60_0_low20_0 = g_118_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_15 + u_118_133 * (const 64 (2**21)) + v_118_133 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_15 + r_118_133 * (const 64 (2**21)) + s_118_133 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_15,
    f_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_15,
    g_118_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 133)) <=s delta, delta <=s (const 64 (1 + 2*133)),
    (const 64 (-(2**20))) <=s u_118_133, u_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_133, v_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_133, r_118_133 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_133, s_118_133 <=s (const 64 ((2**20)-1)),
    u_118_133 + v_118_133 <=s (const 64 (2**20)),
    u_118_133 - v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 + v_118_133 <=s (const 64 (2**20)),
    (const 64 0) - u_118_133 - v_118_133 <=s (const 64 (2**20)),
    r_118_133 + s_118_133 <=s (const 64 (2**20)),
    r_118_133 - s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 + s_118_133 <=s (const 64 (2**20)),
    (const 64 0) - r_118_133 - s_118_133 <=s (const 64 (2**20)),
    u_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_118_133 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_118_133 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step133

// premise c
assume
g_118_low60_0_low20_15 = 1 (mod 2)
&&
g_118_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_16 g_118_low60_0_low20_15;
mov u_118_134 r_118_133;
mov v_118_134 s_118_133;

subs dc g_118_low60_0_low20_16 g_118_low60_0_low20_15 f_118_low60_0_low20_15;
asr g_118_low60_0_low20_16 g_118_low60_0_low20_16 1;
subs dc r_118_134 r_118_133 u_118_133;
asr r_118_134 r_118_134 1;
subs dc s_118_134 s_118_133 v_118_133;
asr s_118_134 s_118_134 1;
assert
    true
&&
    f_118_low60_0_low20_16 = g_118_low60_0_low20_15,
    u_118_134 = r_118_133,
    v_118_134 = s_118_133,
    g_118_low60_0_low20_16 * (const 64 2) = g_118_low60_0_low20_15 - f_118_low60_0_low20_15,
    r_118_134 * (const 64 2) = r_118_133 - u_118_133,
    s_118_134 * (const 64 2) = s_118_133 - v_118_133
;

assume
    f_118_low60_0_low20_16 = g_118_low60_0_low20_15,
    u_118_134 = r_118_133,
    v_118_134 = s_118_133,
    g_118_low60_0_low20_16 * 2 = g_118_low60_0_low20_15 - f_118_low60_0_low20_15,
    r_118_134 * 2 = r_118_133 - u_118_133,
    s_118_134 * 2 = s_118_133 - v_118_133
&&
    true
;

{
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20)-1)),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_134_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
bit ne
)={
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20))
&&
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (const 64 (-(2**20))),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20)-1)),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step134

// premise a
assume
g_118_low60_0_low20_16 = 0 (mod 2)
&&
g_118_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_17 f_118_low60_0_low20_16;
mov u_118_135 u_118_134;
mov v_118_135 v_118_134;

asr g_118_low60_0_low20_17 g_118_low60_0_low20_16 1;
asr r_118_135 r_118_134 1;
asr s_118_135 s_118_134 1;
assert
    true
&&
    f_118_low60_0_low20_17 = f_118_low60_0_low20_16,
    u_118_135 = u_118_134,
    v_118_135 = v_118_134,
    g_118_low60_0_low20_17 * (const 64 2) = g_118_low60_0_low20_16,
    r_118_135 * (const 64 2) = r_118_134,
    s_118_135 * (const 64 2) = s_118_134
;

assume
    f_118_low60_0_low20_17 = f_118_low60_0_low20_16,
    u_118_135 = u_118_134,
    v_118_135 = v_118_134,
    g_118_low60_0_low20_17 * 2 = g_118_low60_0_low20_16,
    r_118_135 * 2 = r_118_134,
    s_118_135 * 2 = s_118_134
&&
    true
;

{
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20)-1)),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_134_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
bit ne
)={
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20))
&&
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (const 64 (-(2**20))),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20)-1)),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step134

// premise b
assume
g_118_low60_0_low20_16 = 1 (mod 2)
&&
g_118_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_17 f_118_low60_0_low20_16;
mov u_118_135 u_118_134;
mov v_118_135 v_118_134;

add g_118_low60_0_low20_17 g_118_low60_0_low20_16 f_118_low60_0_low20_16;
asr g_118_low60_0_low20_17 g_118_low60_0_low20_17 1;
add r_118_135 r_118_134 u_118_134;
asr r_118_135 r_118_135 1;
add s_118_135 s_118_134 v_118_134;
asr s_118_135 s_118_135 1;
assert
    true
&&
    f_118_low60_0_low20_17 = f_118_low60_0_low20_16,
    u_118_135 = u_118_134,
    v_118_135 = v_118_134,
    g_118_low60_0_low20_17 * (const 64 2) = g_118_low60_0_low20_16 + f_118_low60_0_low20_16,
    r_118_135 * (const 64 2) = r_118_134 + u_118_134,
    s_118_135 * (const 64 2) = s_118_134 + v_118_134
;

assume
    f_118_low60_0_low20_17 = f_118_low60_0_low20_16,
    u_118_135 = u_118_134,
    v_118_135 = v_118_134,
    g_118_low60_0_low20_17 * 2 = g_118_low60_0_low20_16 + f_118_low60_0_low20_16,
    r_118_135 * 2 = r_118_134 + u_118_134,
    s_118_135 * 2 = s_118_134 + v_118_134
&&
    true
;

{
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20)-1)),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_134_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_16,
sint64 g_118_low60_0_low20_16,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 u_118_134,
sint64 v_118_134,
sint64 r_118_134,
sint64 s_118_134,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
bit ne
)={
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (-(2**20)),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (-(2**20))
&&
    u_118_134 * f_118_low60_0_low20_0 + v_118_134 * g_118_low60_0_low20_0 = f_118_low60_0_low20_16 * (const 64 (-(2**20))),
    r_118_134 * f_118_low60_0_low20_0 + s_118_134 * g_118_low60_0_low20_0 = g_118_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_16 + u_118_134 * (const 64 (2**21)) + v_118_134 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_16 + r_118_134 * (const 64 (2**21)) + s_118_134 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_16,
    f_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_16,
    g_118_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 134)) <=s delta, delta <=s (const 64 (1 + 2*134)),
    (const 64 (-(2**20))) <=s u_118_134, u_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_134, v_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_134, r_118_134 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_134, s_118_134 <=s (const 64 ((2**20)-1)),
    u_118_134 + v_118_134 <=s (const 64 (2**20)),
    u_118_134 - v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 + v_118_134 <=s (const 64 (2**20)),
    (const 64 0) - u_118_134 - v_118_134 <=s (const 64 (2**20)),
    r_118_134 + s_118_134 <=s (const 64 (2**20)),
    r_118_134 - s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 + s_118_134 <=s (const 64 (2**20)),
    (const 64 0) - r_118_134 - s_118_134 <=s (const 64 (2**20)),
    u_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_118_134 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_118_134 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step134

// premise c
assume
g_118_low60_0_low20_16 = 1 (mod 2)
&&
g_118_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_17 g_118_low60_0_low20_16;
mov u_118_135 r_118_134;
mov v_118_135 s_118_134;

subs dc g_118_low60_0_low20_17 g_118_low60_0_low20_16 f_118_low60_0_low20_16;
asr g_118_low60_0_low20_17 g_118_low60_0_low20_17 1;
subs dc r_118_135 r_118_134 u_118_134;
asr r_118_135 r_118_135 1;
subs dc s_118_135 s_118_134 v_118_134;
asr s_118_135 s_118_135 1;
assert
    true
&&
    f_118_low60_0_low20_17 = g_118_low60_0_low20_16,
    u_118_135 = r_118_134,
    v_118_135 = s_118_134,
    g_118_low60_0_low20_17 * (const 64 2) = g_118_low60_0_low20_16 - f_118_low60_0_low20_16,
    r_118_135 * (const 64 2) = r_118_134 - u_118_134,
    s_118_135 * (const 64 2) = s_118_134 - v_118_134
;

assume
    f_118_low60_0_low20_17 = g_118_low60_0_low20_16,
    u_118_135 = r_118_134,
    v_118_135 = s_118_134,
    g_118_low60_0_low20_17 * 2 = g_118_low60_0_low20_16 - f_118_low60_0_low20_16,
    r_118_135 * 2 = r_118_134 - u_118_134,
    s_118_135 * 2 = s_118_134 - v_118_134
&&
    true
;

{
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20)-1)),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_135_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 f_118_low60_0_low20_18,
sint64 g_118_low60_0_low20_18,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
sint64 u_118_136,
sint64 v_118_136,
sint64 r_118_136,
sint64 s_118_136,
bit ne
)={
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)),
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20))
&&
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (const 64 (-(2**20))),
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20)-1)),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step135

// premise a
assume
g_118_low60_0_low20_17 = 0 (mod 2)
&&
g_118_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_18 f_118_low60_0_low20_17;
mov u_118_136 u_118_135;
mov v_118_136 v_118_135;

asr g_118_low60_0_low20_18 g_118_low60_0_low20_17 1;
asr r_118_136 r_118_135 1;
asr s_118_136 s_118_135 1;
assert
    true
&&
    f_118_low60_0_low20_18 = f_118_low60_0_low20_17,
    u_118_136 = u_118_135,
    v_118_136 = v_118_135,
    g_118_low60_0_low20_18 * (const 64 2) = g_118_low60_0_low20_17,
    r_118_136 * (const 64 2) = r_118_135,
    s_118_136 * (const 64 2) = s_118_135
;

assume
    f_118_low60_0_low20_18 = f_118_low60_0_low20_17,
    u_118_136 = u_118_135,
    v_118_136 = v_118_135,
    g_118_low60_0_low20_18 * 2 = g_118_low60_0_low20_17,
    r_118_136 * 2 = r_118_135,
    s_118_136 * 2 = s_118_135
&&
    true
;

{
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_18 + u_118_136 * (const 64 (2**21)) + v_118_136 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_18 + r_118_136 * (const 64 (2**21)) + s_118_136 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_18,
    f_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_18,
    g_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 136)) <=s delta, delta <=s (const 64 (1 + 2*136)),
    (const 64 (-(2**20))) <=s u_118_136, u_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_136, v_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_136, r_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_136, s_118_136 <=s (const 64 ((2**20)-1)),
    u_118_136 + v_118_136 <=s (const 64 (2**20)),
    u_118_136 - v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 + v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 - v_118_136 <=s (const 64 (2**20)),
    r_118_136 + s_118_136 <=s (const 64 (2**20)),
    r_118_136 - s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 + s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 - s_118_136 <=s (const 64 (2**20)),
    u_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_118_136 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_135_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 f_118_low60_0_low20_18,
sint64 g_118_low60_0_low20_18,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
sint64 u_118_136,
sint64 v_118_136,
sint64 r_118_136,
sint64 s_118_136,
bit ne
)={
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)),
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20))
&&
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (const 64 (-(2**20))),
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20)-1)),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step135

// premise b
assume
g_118_low60_0_low20_17 = 1 (mod 2)
&&
g_118_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_18 f_118_low60_0_low20_17;
mov u_118_136 u_118_135;
mov v_118_136 v_118_135;

add g_118_low60_0_low20_18 g_118_low60_0_low20_17 f_118_low60_0_low20_17;
asr g_118_low60_0_low20_18 g_118_low60_0_low20_18 1;
add r_118_136 r_118_135 u_118_135;
asr r_118_136 r_118_136 1;
add s_118_136 s_118_135 v_118_135;
asr s_118_136 s_118_136 1;
assert
    true
&&
    f_118_low60_0_low20_18 = f_118_low60_0_low20_17,
    u_118_136 = u_118_135,
    v_118_136 = v_118_135,
    g_118_low60_0_low20_18 * (const 64 2) = g_118_low60_0_low20_17 + f_118_low60_0_low20_17,
    r_118_136 * (const 64 2) = r_118_135 + u_118_135,
    s_118_136 * (const 64 2) = s_118_135 + v_118_135
;

assume
    f_118_low60_0_low20_18 = f_118_low60_0_low20_17,
    u_118_136 = u_118_135,
    v_118_136 = v_118_135,
    g_118_low60_0_low20_18 * 2 = g_118_low60_0_low20_17 + f_118_low60_0_low20_17,
    r_118_136 * 2 = r_118_135 + u_118_135,
    s_118_136 * 2 = s_118_135 + v_118_135
&&
    true
;

{
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_18 + u_118_136 * (const 64 (2**21)) + v_118_136 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_18 + r_118_136 * (const 64 (2**21)) + s_118_136 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_18,
    f_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_18,
    g_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 136)) <=s delta, delta <=s (const 64 (1 + 2*136)),
    (const 64 (-(2**20))) <=s u_118_136, u_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_136, v_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_136, r_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_136, s_118_136 <=s (const 64 ((2**20)-1)),
    u_118_136 + v_118_136 <=s (const 64 (2**20)),
    u_118_136 - v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 + v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 - v_118_136 <=s (const 64 (2**20)),
    r_118_136 + s_118_136 <=s (const 64 (2**20)),
    r_118_136 - s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 + s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 - s_118_136 <=s (const 64 (2**20)),
    u_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_118_136 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_135_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_17,
sint64 g_118_low60_0_low20_17,
sint64 f_118_low60_0_low20_18,
sint64 g_118_low60_0_low20_18,
sint64 u_118_135,
sint64 v_118_135,
sint64 r_118_135,
sint64 s_118_135,
sint64 u_118_136,
sint64 v_118_136,
sint64 r_118_136,
sint64 s_118_136,
bit ne
)={
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (-(2**20)),
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (-(2**20))
&&
    u_118_135 * f_118_low60_0_low20_0 + v_118_135 * g_118_low60_0_low20_0 = f_118_low60_0_low20_17 * (const 64 (-(2**20))),
    r_118_135 * f_118_low60_0_low20_0 + s_118_135 * g_118_low60_0_low20_0 = g_118_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_17 + u_118_135 * (const 64 (2**21)) + v_118_135 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_17 + r_118_135 * (const 64 (2**21)) + s_118_135 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_17,
    f_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_17,
    g_118_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 135)) <=s delta, delta <=s (const 64 (1 + 2*135)),
    (const 64 (-(2**20))) <=s u_118_135, u_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_135, v_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_135, r_118_135 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_135, s_118_135 <=s (const 64 ((2**20)-1)),
    u_118_135 + v_118_135 <=s (const 64 (2**20)),
    u_118_135 - v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 + v_118_135 <=s (const 64 (2**20)),
    (const 64 0) - u_118_135 - v_118_135 <=s (const 64 (2**20)),
    r_118_135 + s_118_135 <=s (const 64 (2**20)),
    r_118_135 - s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 + s_118_135 <=s (const 64 (2**20)),
    (const 64 0) - r_118_135 - s_118_135 <=s (const 64 (2**20)),
    u_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_118_135 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_118_135 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step135

// premise c
assume
g_118_low60_0_low20_17 = 1 (mod 2)
&&
g_118_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_18 g_118_low60_0_low20_17;
mov u_118_136 r_118_135;
mov v_118_136 s_118_135;

subs dc g_118_low60_0_low20_18 g_118_low60_0_low20_17 f_118_low60_0_low20_17;
asr g_118_low60_0_low20_18 g_118_low60_0_low20_18 1;
subs dc r_118_136 r_118_135 u_118_135;
asr r_118_136 r_118_136 1;
subs dc s_118_136 s_118_135 v_118_135;
asr s_118_136 s_118_136 1;
assert
    true
&&
    f_118_low60_0_low20_18 = g_118_low60_0_low20_17,
    u_118_136 = r_118_135,
    v_118_136 = s_118_135,
    g_118_low60_0_low20_18 * (const 64 2) = g_118_low60_0_low20_17 - f_118_low60_0_low20_17,
    r_118_136 * (const 64 2) = r_118_135 - u_118_135,
    s_118_136 * (const 64 2) = s_118_135 - v_118_135
;

assume
    f_118_low60_0_low20_18 = g_118_low60_0_low20_17,
    u_118_136 = r_118_135,
    v_118_136 = s_118_135,
    g_118_low60_0_low20_18 * 2 = g_118_low60_0_low20_17 - f_118_low60_0_low20_17,
    r_118_136 * 2 = r_118_135 - u_118_135,
    s_118_136 * 2 = s_118_135 - v_118_135
&&
    true
;

{
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_18 + u_118_136 * (const 64 (2**21)) + v_118_136 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_18 + r_118_136 * (const 64 (2**21)) + s_118_136 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_18,
    f_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_18,
    g_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 136)) <=s delta, delta <=s (const 64 (1 + 2*136)),
    (const 64 (-(2**20))) <=s u_118_136, u_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_136, v_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_136, r_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_136, s_118_136 <=s (const 64 ((2**20)-1)),
    u_118_136 + v_118_136 <=s (const 64 (2**20)),
    u_118_136 - v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 + v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 - v_118_136 <=s (const 64 (2**20)),
    r_118_136 + s_118_136 <=s (const 64 (2**20)),
    r_118_136 - s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 + s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 - s_118_136 <=s (const 64 (2**20)),
    u_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_118_136 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_136_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_18,
sint64 g_118_low60_0_low20_18,
sint64 f_118_low60_0_low20_19,
sint64 g_118_low60_0_low20_19,
sint64 u_118_136,
sint64 v_118_136,
sint64 r_118_136,
sint64 s_118_136,
sint64 u_118_137,
sint64 v_118_137,
sint64 r_118_137,
sint64 s_118_137,
bit ne
)={
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (-(2**20)),
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (-(2**20))
&&
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (const 64 (-(2**20))),
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_18 + u_118_136 * (const 64 (2**21)) + v_118_136 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_18 + r_118_136 * (const 64 (2**21)) + s_118_136 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_18,
    f_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_18,
    g_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 136)) <=s delta, delta <=s (const 64 (1 + 2*136)),
    (const 64 (-(2**20))) <=s u_118_136, u_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_136, v_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_136, r_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_136, s_118_136 <=s (const 64 ((2**20)-1)),
    u_118_136 + v_118_136 <=s (const 64 (2**20)),
    u_118_136 - v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 + v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 - v_118_136 <=s (const 64 (2**20)),
    r_118_136 + s_118_136 <=s (const 64 (2**20)),
    r_118_136 - s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 + s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 - s_118_136 <=s (const 64 (2**20)),
    u_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_118_136 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step136

// premise a
assume
g_118_low60_0_low20_18 = 0 (mod 2)
&&
g_118_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_118_low60_0_low20_19 f_118_low60_0_low20_18;
mov u_118_137 u_118_136;
mov v_118_137 v_118_136;

asr g_118_low60_0_low20_19 g_118_low60_0_low20_18 1;
asr r_118_137 r_118_136 1;
asr s_118_137 s_118_136 1;
assert
    true
&&
    f_118_low60_0_low20_19 = f_118_low60_0_low20_18,
    u_118_137 = u_118_136,
    v_118_137 = v_118_136,
    g_118_low60_0_low20_19 * (const 64 2) = g_118_low60_0_low20_18,
    r_118_137 * (const 64 2) = r_118_136,
    s_118_137 * (const 64 2) = s_118_136
;

assume
    f_118_low60_0_low20_19 = f_118_low60_0_low20_18,
    u_118_137 = u_118_136,
    v_118_137 = v_118_136,
    g_118_low60_0_low20_19 * 2 = g_118_low60_0_low20_18,
    r_118_137 * 2 = r_118_136,
    s_118_137 * 2 = s_118_136
&&
    true
;

{
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_19 + u_118_137 * (const 64 (2**21)) + v_118_137 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_19 + r_118_137 * (const 64 (2**21)) + s_118_137 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_19,
    f_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_19,
    g_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 137)) <=s delta, delta <=s (const 64 (1 + 2*137)),
    (const 64 (-(2**20))) <=s u_118_137, u_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_137, v_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_137, r_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_137, s_118_137 <=s (const 64 ((2**20)-1)),
    u_118_137 + v_118_137 <=s (const 64 (2**20)),
    u_118_137 - v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 + v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 - v_118_137 <=s (const 64 (2**20)),
    r_118_137 + s_118_137 <=s (const 64 (2**20)),
    r_118_137 - s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 + s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 - s_118_137 <=s (const 64 (2**20)),
    u_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_118_137 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_136_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_18,
sint64 g_118_low60_0_low20_18,
sint64 f_118_low60_0_low20_19,
sint64 g_118_low60_0_low20_19,
sint64 u_118_136,
sint64 v_118_136,
sint64 r_118_136,
sint64 s_118_136,
sint64 u_118_137,
sint64 v_118_137,
sint64 r_118_137,
sint64 s_118_137,
bit ne
)={
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (-(2**20)),
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (-(2**20))
&&
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (const 64 (-(2**20))),
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_18 + u_118_136 * (const 64 (2**21)) + v_118_136 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_18 + r_118_136 * (const 64 (2**21)) + s_118_136 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_18,
    f_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_18,
    g_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 136)) <=s delta, delta <=s (const 64 (1 + 2*136)),
    (const 64 (-(2**20))) <=s u_118_136, u_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_136, v_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_136, r_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_136, s_118_136 <=s (const 64 ((2**20)-1)),
    u_118_136 + v_118_136 <=s (const 64 (2**20)),
    u_118_136 - v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 + v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 - v_118_136 <=s (const 64 (2**20)),
    r_118_136 + s_118_136 <=s (const 64 (2**20)),
    r_118_136 - s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 + s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 - s_118_136 <=s (const 64 (2**20)),
    u_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_118_136 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step136

// premise b
assume
g_118_low60_0_low20_18 = 1 (mod 2)
&&
g_118_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_19 f_118_low60_0_low20_18;
mov u_118_137 u_118_136;
mov v_118_137 v_118_136;

add g_118_low60_0_low20_19 g_118_low60_0_low20_18 f_118_low60_0_low20_18;
asr g_118_low60_0_low20_19 g_118_low60_0_low20_19 1;
add r_118_137 r_118_136 u_118_136;
asr r_118_137 r_118_137 1;
add s_118_137 s_118_136 v_118_136;
asr s_118_137 s_118_137 1;
assert
    true
&&
    f_118_low60_0_low20_19 = f_118_low60_0_low20_18,
    u_118_137 = u_118_136,
    v_118_137 = v_118_136,
    g_118_low60_0_low20_19 * (const 64 2) = g_118_low60_0_low20_18 + f_118_low60_0_low20_18,
    r_118_137 * (const 64 2) = r_118_136 + u_118_136,
    s_118_137 * (const 64 2) = s_118_136 + v_118_136
;

assume
    f_118_low60_0_low20_19 = f_118_low60_0_low20_18,
    u_118_137 = u_118_136,
    v_118_137 = v_118_136,
    g_118_low60_0_low20_19 * 2 = g_118_low60_0_low20_18 + f_118_low60_0_low20_18,
    r_118_137 * 2 = r_118_136 + u_118_136,
    s_118_137 * 2 = s_118_136 + v_118_136
&&
    true
;

{
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_19 + u_118_137 * (const 64 (2**21)) + v_118_137 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_19 + r_118_137 * (const 64 (2**21)) + s_118_137 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_19,
    f_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_19,
    g_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 137)) <=s delta, delta <=s (const 64 (1 + 2*137)),
    (const 64 (-(2**20))) <=s u_118_137, u_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_137, v_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_137, r_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_137, s_118_137 <=s (const 64 ((2**20)-1)),
    u_118_137 + v_118_137 <=s (const 64 (2**20)),
    u_118_137 - v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 + v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 - v_118_137 <=s (const 64 (2**20)),
    r_118_137 + s_118_137 <=s (const 64 (2**20)),
    r_118_137 - s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 + s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 - s_118_137 <=s (const 64 (2**20)),
    u_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_118_137 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_136_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_18,
sint64 g_118_low60_0_low20_18,
sint64 f_118_low60_0_low20_19,
sint64 g_118_low60_0_low20_19,
sint64 u_118_136,
sint64 v_118_136,
sint64 r_118_136,
sint64 s_118_136,
sint64 u_118_137,
sint64 v_118_137,
sint64 r_118_137,
sint64 s_118_137,
bit ne
)={
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (-(2**20)),
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (-(2**20))
&&
    u_118_136 * f_118_low60_0_low20_0 + v_118_136 * g_118_low60_0_low20_0 = f_118_low60_0_low20_18 * (const 64 (-(2**20))),
    r_118_136 * f_118_low60_0_low20_0 + s_118_136 * g_118_low60_0_low20_0 = g_118_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_18 + u_118_136 * (const 64 (2**21)) + v_118_136 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_18 + r_118_136 * (const 64 (2**21)) + s_118_136 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_18,
    f_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_18,
    g_118_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 136)) <=s delta, delta <=s (const 64 (1 + 2*136)),
    (const 64 (-(2**20))) <=s u_118_136, u_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_136, v_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_136, r_118_136 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_136, s_118_136 <=s (const 64 ((2**20)-1)),
    u_118_136 + v_118_136 <=s (const 64 (2**20)),
    u_118_136 - v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 + v_118_136 <=s (const 64 (2**20)),
    (const 64 0) - u_118_136 - v_118_136 <=s (const 64 (2**20)),
    r_118_136 + s_118_136 <=s (const 64 (2**20)),
    r_118_136 - s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 + s_118_136 <=s (const 64 (2**20)),
    (const 64 0) - r_118_136 - s_118_136 <=s (const 64 (2**20)),
    u_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_118_136 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_118_136 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step136

// premise c
assume
g_118_low60_0_low20_18 = 1 (mod 2)
&&
g_118_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_19 g_118_low60_0_low20_18;
mov u_118_137 r_118_136;
mov v_118_137 s_118_136;

subs dc g_118_low60_0_low20_19 g_118_low60_0_low20_18 f_118_low60_0_low20_18;
asr g_118_low60_0_low20_19 g_118_low60_0_low20_19 1;
subs dc r_118_137 r_118_136 u_118_136;
asr r_118_137 r_118_137 1;
subs dc s_118_137 s_118_136 v_118_136;
asr s_118_137 s_118_137 1;
assert
    true
&&
    f_118_low60_0_low20_19 = g_118_low60_0_low20_18,
    u_118_137 = r_118_136,
    v_118_137 = s_118_136,
    g_118_low60_0_low20_19 * (const 64 2) = g_118_low60_0_low20_18 - f_118_low60_0_low20_18,
    r_118_137 * (const 64 2) = r_118_136 - u_118_136,
    s_118_137 * (const 64 2) = s_118_136 - v_118_136
;

assume
    f_118_low60_0_low20_19 = g_118_low60_0_low20_18,
    u_118_137 = r_118_136,
    v_118_137 = s_118_136,
    g_118_low60_0_low20_19 * 2 = g_118_low60_0_low20_18 - f_118_low60_0_low20_18,
    r_118_137 * 2 = r_118_136 - u_118_136,
    s_118_137 * 2 = s_118_136 - v_118_136
&&
    true
;

{
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_19 + u_118_137 * (const 64 (2**21)) + v_118_137 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_19 + r_118_137 * (const 64 (2**21)) + s_118_137 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_19,
    f_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_19,
    g_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 137)) <=s delta, delta <=s (const 64 (1 + 2*137)),
    (const 64 (-(2**20))) <=s u_118_137, u_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_137, v_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_137, r_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_137, s_118_137 <=s (const 64 ((2**20)-1)),
    u_118_137 + v_118_137 <=s (const 64 (2**20)),
    u_118_137 - v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 + v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 - v_118_137 <=s (const 64 (2**20)),
    r_118_137 + s_118_137 <=s (const 64 (2**20)),
    r_118_137 - s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 + s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 - s_118_137 <=s (const 64 (2**20)),
    u_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_118_137 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_137_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_19,
sint64 g_118_low60_0_low20_19,
sint64 f_118_low60_0_low20_20,
sint64 g_118_low60_0_low20_20,
sint64 u_118_137,
sint64 v_118_137,
sint64 r_118_137,
sint64 s_118_137,
sint64 u_118_138,
sint64 v_118_138,
sint64 r_118_138,
sint64 s_118_138,
bit ne
)={
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (-(2**20)),
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (-(2**20))
&&
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (const 64 (-(2**20))),
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_19 + u_118_137 * (const 64 (2**21)) + v_118_137 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_19 + r_118_137 * (const 64 (2**21)) + s_118_137 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_19,
    f_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_19,
    g_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 137)) <=s delta, delta <=s (const 64 (1 + 2*137)),
    (const 64 (-(2**20))) <=s u_118_137, u_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_137, v_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_137, r_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_137, s_118_137 <=s (const 64 ((2**20)-1)),
    u_118_137 + v_118_137 <=s (const 64 (2**20)),
    u_118_137 - v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 + v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 - v_118_137 <=s (const 64 (2**20)),
    r_118_137 + s_118_137 <=s (const 64 (2**20)),
    r_118_137 - s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 + s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 - s_118_137 <=s (const 64 (2**20)),
    u_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_118_137 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step137

// premise a
assume
g_118_low60_0_low20_19 = 0 (mod 2)
&&
g_118_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
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

mov f_118_low60_0_low20_20 f_118_low60_0_low20_19;
mov u_118_138 u_118_137;
mov v_118_138 v_118_137;

asr g_118_low60_0_low20_20 g_118_low60_0_low20_19 1;
asr r_118_138 r_118_137 1;
asr s_118_138 s_118_137 1;
assert
    true
&&
    f_118_low60_0_low20_20 = f_118_low60_0_low20_19,
    u_118_138 = u_118_137,
    v_118_138 = v_118_137,
    g_118_low60_0_low20_20 * (const 64 2) = g_118_low60_0_low20_19,
    r_118_138 * (const 64 2) = r_118_137,
    s_118_138 * (const 64 2) = s_118_137
;

assume
    f_118_low60_0_low20_20 = f_118_low60_0_low20_19,
    u_118_138 = u_118_137,
    v_118_138 = v_118_137,
    g_118_low60_0_low20_20 * 2 = g_118_low60_0_low20_19,
    r_118_138 * 2 = r_118_137,
    s_118_138 * 2 = s_118_137
&&
    true
;

{
    u_118_138 * f_118_low60_0_low20_0 + v_118_138 * g_118_low60_0_low20_0 = f_118_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_138 * f_118_low60_0_low20_0 + s_118_138 * g_118_low60_0_low20_0 = g_118_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_20 + u_118_138 * (const 64 (2**21)) + v_118_138 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_20 + r_118_138 * (const 64 (2**21)) + s_118_138 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_20,
    f_118_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_20,
    g_118_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 138)) <=s delta, delta <=s (const 64 (1 + 2*138)),
    (const 64 (-(2**20))) <=s u_118_138, u_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_138, v_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_138, r_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_138, s_118_138 <=s (const 64 ((2**20)-1)),
    u_118_138 + v_118_138 <=s (const 64 (2**20)),
    u_118_138 - v_118_138 <=s (const 64 (2**20)),
    (const 64 0) - u_118_138 + v_118_138 <=s (const 64 (2**20)),
    (const 64 0) - u_118_138 - v_118_138 <=s (const 64 (2**20)),
    r_118_138 + s_118_138 <=s (const 64 (2**20)),
    r_118_138 - s_118_138 <=s (const 64 (2**20)),
    (const 64 0) - r_118_138 + s_118_138 <=s (const 64 (2**20)),
    (const 64 0) - r_118_138 - s_118_138 <=s (const 64 (2**20)),
    u_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_118_138 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_137_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_19,
sint64 g_118_low60_0_low20_19,
sint64 f_118_low60_0_low20_20,
sint64 g_118_low60_0_low20_20,
sint64 u_118_137,
sint64 v_118_137,
sint64 r_118_137,
sint64 s_118_137,
sint64 u_118_138,
sint64 v_118_138,
sint64 r_118_138,
sint64 s_118_138,
bit ne
)={
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (-(2**20)),
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (-(2**20))
&&
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (const 64 (-(2**20))),
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_19 + u_118_137 * (const 64 (2**21)) + v_118_137 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_19 + r_118_137 * (const 64 (2**21)) + s_118_137 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_19,
    f_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_19,
    g_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 137)) <=s delta, delta <=s (const 64 (1 + 2*137)),
    (const 64 (-(2**20))) <=s u_118_137, u_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_137, v_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_137, r_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_137, s_118_137 <=s (const 64 ((2**20)-1)),
    u_118_137 + v_118_137 <=s (const 64 (2**20)),
    u_118_137 - v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 + v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 - v_118_137 <=s (const 64 (2**20)),
    r_118_137 + s_118_137 <=s (const 64 (2**20)),
    r_118_137 - s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 + s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 - s_118_137 <=s (const 64 (2**20)),
    u_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_118_137 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step137

// premise b
assume
g_118_low60_0_low20_19 = 1 (mod 2)
&&
g_118_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_20 f_118_low60_0_low20_19;
mov u_118_138 u_118_137;
mov v_118_138 v_118_137;

add g_118_low60_0_low20_20 g_118_low60_0_low20_19 f_118_low60_0_low20_19;
asr g_118_low60_0_low20_20 g_118_low60_0_low20_20 1;
add r_118_138 r_118_137 u_118_137;
asr r_118_138 r_118_138 1;
add s_118_138 s_118_137 v_118_137;
asr s_118_138 s_118_138 1;
assert
    true
&&
    f_118_low60_0_low20_20 = f_118_low60_0_low20_19,
    u_118_138 = u_118_137,
    v_118_138 = v_118_137,
    g_118_low60_0_low20_20 * (const 64 2) = g_118_low60_0_low20_19 + f_118_low60_0_low20_19,
    r_118_138 * (const 64 2) = r_118_137 + u_118_137,
    s_118_138 * (const 64 2) = s_118_137 + v_118_137
;

assume
    f_118_low60_0_low20_20 = f_118_low60_0_low20_19,
    u_118_138 = u_118_137,
    v_118_138 = v_118_137,
    g_118_low60_0_low20_20 * 2 = g_118_low60_0_low20_19 + f_118_low60_0_low20_19,
    r_118_138 * 2 = r_118_137 + u_118_137,
    s_118_138 * 2 = s_118_137 + v_118_137
&&
    true
;

{
    u_118_138 * f_118_low60_0_low20_0 + v_118_138 * g_118_low60_0_low20_0 = f_118_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_138 * f_118_low60_0_low20_0 + s_118_138 * g_118_low60_0_low20_0 = g_118_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_20 + u_118_138 * (const 64 (2**21)) + v_118_138 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_20 + r_118_138 * (const 64 (2**21)) + s_118_138 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_20,
    f_118_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_20,
    g_118_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 138)) <=s delta, delta <=s (const 64 (1 + 2*138)),
    (const 64 (-(2**20))) <=s u_118_138, u_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_138, v_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_138, r_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_138, s_118_138 <=s (const 64 ((2**20)-1)),
    u_118_138 + v_118_138 <=s (const 64 (2**20)),
    u_118_138 - v_118_138 <=s (const 64 (2**20)),
    (const 64 0) - u_118_138 + v_118_138 <=s (const 64 (2**20)),
    (const 64 0) - u_118_138 - v_118_138 <=s (const 64 (2**20)),
    r_118_138 + s_118_138 <=s (const 64 (2**20)),
    r_118_138 - s_118_138 <=s (const 64 (2**20)),
    (const 64 0) - r_118_138 + s_118_138 <=s (const 64 (2**20)),
    (const 64 0) - r_118_138 - s_118_138 <=s (const 64 (2**20)),
    u_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_118_138 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_137_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_0_low20_0,
sint64 g_118_low60_0_low20_0,
sint64 f_118_low60_0_low20_19,
sint64 g_118_low60_0_low20_19,
sint64 f_118_low60_0_low20_20,
sint64 g_118_low60_0_low20_20,
sint64 u_118_137,
sint64 v_118_137,
sint64 r_118_137,
sint64 s_118_137,
sint64 u_118_138,
sint64 v_118_138,
sint64 r_118_138,
sint64 s_118_138,
bit ne
)={
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (-(2**20)),
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (-(2**20))
&&
    u_118_137 * f_118_low60_0_low20_0 + v_118_137 * g_118_low60_0_low20_0 = f_118_low60_0_low20_19 * (const 64 (-(2**20))),
    r_118_137 * f_118_low60_0_low20_0 + s_118_137 * g_118_low60_0_low20_0 = g_118_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_118_low60_0_low20_19 + u_118_137 * (const 64 (2**21)) + v_118_137 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_19 + r_118_137 * (const 64 (2**21)) + s_118_137 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_0_low20_0,
    f_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_0,
    g_118_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_0_low20_19,
    f_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_0_low20_19,
    g_118_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 137)) <=s delta, delta <=s (const 64 (1 + 2*137)),
    (const 64 (-(2**20))) <=s u_118_137, u_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_137, v_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_137, r_118_137 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_137, s_118_137 <=s (const 64 ((2**20)-1)),
    u_118_137 + v_118_137 <=s (const 64 (2**20)),
    u_118_137 - v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 + v_118_137 <=s (const 64 (2**20)),
    (const 64 0) - u_118_137 - v_118_137 <=s (const 64 (2**20)),
    r_118_137 + s_118_137 <=s (const 64 (2**20)),
    r_118_137 - s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 + s_118_137 <=s (const 64 (2**20)),
    (const 64 0) - r_118_137 - s_118_137 <=s (const 64 (2**20)),
    u_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_118_137 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_118_137 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step137

// premise c
assume
g_118_low60_0_low20_19 = 1 (mod 2)
&&
g_118_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_118_low60_0_low20_20 g_118_low60_0_low20_19;
mov u_118_138 r_118_137;
mov v_118_138 s_118_137;

subs dc g_118_low60_0_low20_20 g_118_low60_0_low20_19 f_118_low60_0_low20_19;
asr g_118_low60_0_low20_20 g_118_low60_0_low20_20 1;
subs dc r_118_138 r_118_137 u_118_137;
asr r_118_138 r_118_138 1;
subs dc s_118_138 s_118_137 v_118_137;
asr s_118_138 s_118_138 1;
assert
    true
&&
    f_118_low60_0_low20_20 = g_118_low60_0_low20_19,
    u_118_138 = r_118_137,
    v_118_138 = s_118_137,
    g_118_low60_0_low20_20 * (const 64 2) = g_118_low60_0_low20_19 - f_118_low60_0_low20_19,
    r_118_138 * (const 64 2) = r_118_137 - u_118_137,
    s_118_138 * (const 64 2) = s_118_137 - v_118_137
;

assume
    f_118_low60_0_low20_20 = g_118_low60_0_low20_19,
    u_118_138 = r_118_137,
    v_118_138 = s_118_137,
    g_118_low60_0_low20_20 * 2 = g_118_low60_0_low20_19 - f_118_low60_0_low20_19,
    r_118_138 * 2 = r_118_137 - u_118_137,
    s_118_138 * 2 = s_118_137 - v_118_137
&&
    true
;

{
    u_118_138 * f_118_low60_0_low20_0 + v_118_138 * g_118_low60_0_low20_0 = f_118_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_118_138 * f_118_low60_0_low20_0 + s_118_138 * g_118_low60_0_low20_0 = g_118_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_0_low20_20 + u_118_138 * (const 64 (2**21)) + v_118_138 * (const 64 (2**42)),
    grs = g_118_low60_0_low20_20 + r_118_138 * (const 64 (2**21)) + s_118_138 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_0_low20_20,
    f_118_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_0_low20_20,
    g_118_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 138)) <=s delta, delta <=s (const 64 (1 + 2*138)),
    (const 64 (-(2**20))) <=s u_118_138, u_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_118_138, v_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_118_138, r_118_138 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_118_138, s_118_138 <=s (const 64 ((2**20)-1)),
    u_118_138 + v_118_138 <=s (const 64 (2**20)),
    u_118_138 - v_118_138 <=s (const 64 (2**20)),
    (const 64 0) - u_118_138 + v_118_138 <=s (const 64 (2**20)),
    (const 64 0) - u_118_138 - v_118_138 <=s (const 64 (2**20)),
    r_118_138 + s_118_138 <=s (const 64 (2**20)),
    r_118_138 - s_118_138 <=s (const 64 (2**20)),
    (const 64 0) - r_118_138 + s_118_138 <=s (const 64 (2**20)),
    (const 64 0) - r_118_138 - s_118_138 <=s (const 64 (2**20)),
    u_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_118_138 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_118_138 = (const 64 0) (mod (const 64 (2**(20-20))))
}

