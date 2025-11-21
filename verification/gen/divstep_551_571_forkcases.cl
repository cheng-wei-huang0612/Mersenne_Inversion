proc divstep_551_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_1,
sint64 g_531_low60_20_low20_1,
sint64 u_551_551,
sint64 v_551_551,
sint64 r_551_551,
sint64 s_551_551,
sint64 u_551_552,
sint64 v_551_552,
sint64 r_551_552,
sint64 s_551_552,
bit ne
)={
    u_551_551 * f_531_low60_20_low20_0 + v_551_551 * g_531_low60_20_low20_0 = f_531_low60_20_low20_0 * (-(2**20)),
    r_551_551 * f_531_low60_20_low20_0 + s_551_551 * g_531_low60_20_low20_0 = g_531_low60_20_low20_0 * (-(2**20))
&&
    u_551_551 * f_531_low60_20_low20_0 + v_551_551 * g_531_low60_20_low20_0 = f_531_low60_20_low20_0 * (const 64 (-(2**20))),
    r_551_551 * f_531_low60_20_low20_0 + s_551_551 * g_531_low60_20_low20_0 = g_531_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_0 + u_551_551 * (const 64 (2**21)) + v_551_551 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_0 + r_551_551 * (const 64 (2**21)) + s_551_551 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 551)) <=s delta, delta <=s (const 64 (1 + 2*551)),
    u_551_551 = (const 64 (-(2**20))),
    v_551_551 = (const 64 (0)),
    r_551_551 = (const 64 (0)),
    s_551_551 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise a
assume
g_531_low60_20_low20_0 = 0 (mod 2)
&&
g_531_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_531_low60_20_low20_1 f_531_low60_20_low20_0;
mov u_551_552 u_551_551;
mov v_551_552 v_551_551;

asr g_531_low60_20_low20_1 g_531_low60_20_low20_0 1;
asr r_551_552 r_551_551 1;
asr s_551_552 s_551_551 1;
assert
    true
&&
    f_531_low60_20_low20_1 = f_531_low60_20_low20_0,
    u_551_552 = u_551_551,
    v_551_552 = v_551_551,
    g_531_low60_20_low20_1 * (const 64 2) = g_531_low60_20_low20_0,
    r_551_552 * (const 64 2) = r_551_551,
    s_551_552 * (const 64 2) = s_551_551
;

assume
    f_531_low60_20_low20_1 = f_531_low60_20_low20_0,
    u_551_552 = u_551_551,
    v_551_552 = v_551_551,
    g_531_low60_20_low20_1 * 2 = g_531_low60_20_low20_0,
    r_551_552 * 2 = r_551_551,
    s_551_552 * 2 = s_551_551
&&
    true
;

{
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_1 + u_551_552 * (const 64 (2**21)) + v_551_552 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_1 + r_551_552 * (const 64 (2**21)) + s_551_552 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_1,
    f_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_1,
    g_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 552)) <=s delta, delta <=s (const 64 (1 + 2*552)),
    (const 64 (-(2**20))) <=s u_551_552, u_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_552, v_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_552, r_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_552, s_551_552 <=s (const 64 ((2**20))),
    u_551_552 + v_551_552 <=s (const 64 (2**20)),
    u_551_552 - v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 + v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 - v_551_552 <=s (const 64 (2**20)),
    r_551_552 + s_551_552 <=s (const 64 (2**20)),
    r_551_552 - s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 + s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 - s_551_552 <=s (const 64 (2**20)),
    u_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_551_552 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_551_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_1,
sint64 g_531_low60_20_low20_1,
sint64 u_551_551,
sint64 v_551_551,
sint64 r_551_551,
sint64 s_551_551,
sint64 u_551_552,
sint64 v_551_552,
sint64 r_551_552,
sint64 s_551_552,
bit ne
)={
    u_551_551 * f_531_low60_20_low20_0 + v_551_551 * g_531_low60_20_low20_0 = f_531_low60_20_low20_0 * (-(2**20)),
    r_551_551 * f_531_low60_20_low20_0 + s_551_551 * g_531_low60_20_low20_0 = g_531_low60_20_low20_0 * (-(2**20))
&&
    u_551_551 * f_531_low60_20_low20_0 + v_551_551 * g_531_low60_20_low20_0 = f_531_low60_20_low20_0 * (const 64 (-(2**20))),
    r_551_551 * f_531_low60_20_low20_0 + s_551_551 * g_531_low60_20_low20_0 = g_531_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_0 + u_551_551 * (const 64 (2**21)) + v_551_551 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_0 + r_551_551 * (const 64 (2**21)) + s_551_551 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 551)) <=s delta, delta <=s (const 64 (1 + 2*551)),
    u_551_551 = (const 64 (-(2**20))),
    v_551_551 = (const 64 (0)),
    r_551_551 = (const 64 (0)),
    s_551_551 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise b
assume
g_531_low60_20_low20_0 = 1 (mod 2)
&&
g_531_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_1 f_531_low60_20_low20_0;
mov u_551_552 u_551_551;
mov v_551_552 v_551_551;

add g_531_low60_20_low20_1 g_531_low60_20_low20_0 f_531_low60_20_low20_0;
asr g_531_low60_20_low20_1 g_531_low60_20_low20_1 1;
add r_551_552 r_551_551 u_551_551;
asr r_551_552 r_551_552 1;
add s_551_552 s_551_551 v_551_551;
asr s_551_552 s_551_552 1;
assert
    true
&&
    f_531_low60_20_low20_1 = f_531_low60_20_low20_0,
    u_551_552 = u_551_551,
    v_551_552 = v_551_551,
    g_531_low60_20_low20_1 * (const 64 2) = g_531_low60_20_low20_0 + f_531_low60_20_low20_0,
    r_551_552 * (const 64 2) = r_551_551 + u_551_551,
    s_551_552 * (const 64 2) = s_551_551 + v_551_551
;

assume
    f_531_low60_20_low20_1 = f_531_low60_20_low20_0,
    u_551_552 = u_551_551,
    v_551_552 = v_551_551,
    g_531_low60_20_low20_1 * 2 = g_531_low60_20_low20_0 + f_531_low60_20_low20_0,
    r_551_552 * 2 = r_551_551 + u_551_551,
    s_551_552 * 2 = s_551_551 + v_551_551
&&
    true
;

{
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_1 + u_551_552 * (const 64 (2**21)) + v_551_552 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_1 + r_551_552 * (const 64 (2**21)) + s_551_552 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_1,
    f_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_1,
    g_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 552)) <=s delta, delta <=s (const 64 (1 + 2*552)),
    (const 64 (-(2**20))) <=s u_551_552, u_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_552, v_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_552, r_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_552, s_551_552 <=s (const 64 ((2**20))),
    u_551_552 + v_551_552 <=s (const 64 (2**20)),
    u_551_552 - v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 + v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 - v_551_552 <=s (const 64 (2**20)),
    r_551_552 + s_551_552 <=s (const 64 (2**20)),
    r_551_552 - s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 + s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 - s_551_552 <=s (const 64 (2**20)),
    u_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_551_552 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_551_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_1,
sint64 g_531_low60_20_low20_1,
sint64 u_551_551,
sint64 v_551_551,
sint64 r_551_551,
sint64 s_551_551,
sint64 u_551_552,
sint64 v_551_552,
sint64 r_551_552,
sint64 s_551_552,
bit ne
)={
    u_551_551 * f_531_low60_20_low20_0 + v_551_551 * g_531_low60_20_low20_0 = f_531_low60_20_low20_0 * (-(2**20)),
    r_551_551 * f_531_low60_20_low20_0 + s_551_551 * g_531_low60_20_low20_0 = g_531_low60_20_low20_0 * (-(2**20))
&&
    u_551_551 * f_531_low60_20_low20_0 + v_551_551 * g_531_low60_20_low20_0 = f_531_low60_20_low20_0 * (const 64 (-(2**20))),
    r_551_551 * f_531_low60_20_low20_0 + s_551_551 * g_531_low60_20_low20_0 = g_531_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_0 + u_551_551 * (const 64 (2**21)) + v_551_551 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_0 + r_551_551 * (const 64 (2**21)) + s_551_551 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 551)) <=s delta, delta <=s (const 64 (1 + 2*551)),
    u_551_551 = (const 64 (-(2**20))),
    v_551_551 = (const 64 (0)),
    r_551_551 = (const 64 (0)),
    s_551_551 = (const 64 (-(2**20)))
}



// divsteps
// step20

// premise c
assume
g_531_low60_20_low20_0 = 1 (mod 2)
&&
g_531_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_1 g_531_low60_20_low20_0;
mov u_551_552 r_551_551;
mov v_551_552 s_551_551;

subs dc g_531_low60_20_low20_1 g_531_low60_20_low20_0 f_531_low60_20_low20_0;
asr g_531_low60_20_low20_1 g_531_low60_20_low20_1 1;
subs dc r_551_552 r_551_551 u_551_551;
asr r_551_552 r_551_552 1;
subs dc s_551_552 s_551_551 v_551_551;
asr s_551_552 s_551_552 1;
assert
    true
&&
    f_531_low60_20_low20_1 = g_531_low60_20_low20_0,
    u_551_552 = r_551_551,
    v_551_552 = s_551_551,
    g_531_low60_20_low20_1 * (const 64 2) = g_531_low60_20_low20_0 - f_531_low60_20_low20_0,
    r_551_552 * (const 64 2) = r_551_551 - u_551_551,
    s_551_552 * (const 64 2) = s_551_551 - v_551_551
;

assume
    f_531_low60_20_low20_1 = g_531_low60_20_low20_0,
    u_551_552 = r_551_551,
    v_551_552 = s_551_551,
    g_531_low60_20_low20_1 * 2 = g_531_low60_20_low20_0 - f_531_low60_20_low20_0,
    r_551_552 * 2 = r_551_551 - u_551_551,
    s_551_552 * 2 = s_551_551 - v_551_551
&&
    true
;

{
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_1 + u_551_552 * (const 64 (2**21)) + v_551_552 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_1 + r_551_552 * (const 64 (2**21)) + s_551_552 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_1,
    f_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_1,
    g_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 552)) <=s delta, delta <=s (const 64 (1 + 2*552)),
    (const 64 (-(2**20))) <=s u_551_552, u_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_552, v_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_552, r_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_552, s_551_552 <=s (const 64 ((2**20))),
    u_551_552 + v_551_552 <=s (const 64 (2**20)),
    u_551_552 - v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 + v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 - v_551_552 <=s (const 64 (2**20)),
    r_551_552 + s_551_552 <=s (const 64 (2**20)),
    r_551_552 - s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 + s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 - s_551_552 <=s (const 64 (2**20)),
    u_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_551_552 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_552_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_1,
sint64 g_531_low60_20_low20_1,
sint64 f_531_low60_20_low20_2,
sint64 g_531_low60_20_low20_2,
sint64 u_551_552,
sint64 v_551_552,
sint64 r_551_552,
sint64 s_551_552,
sint64 u_551_553,
sint64 v_551_553,
sint64 r_551_553,
sint64 s_551_553,
bit ne
)={
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (-(2**20)),
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (-(2**20))
&&
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (const 64 (-(2**20))),
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_1 + u_551_552 * (const 64 (2**21)) + v_551_552 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_1 + r_551_552 * (const 64 (2**21)) + s_551_552 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_1,
    f_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_1,
    g_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 552)) <=s delta, delta <=s (const 64 (1 + 2*552)),
    (const 64 (-(2**20))) <=s u_551_552, u_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_552, v_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_552, r_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_552, s_551_552 <=s (const 64 ((2**20))),
    u_551_552 + v_551_552 <=s (const 64 (2**20)),
    u_551_552 - v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 + v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 - v_551_552 <=s (const 64 (2**20)),
    r_551_552 + s_551_552 <=s (const 64 (2**20)),
    r_551_552 - s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 + s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 - s_551_552 <=s (const 64 (2**20)),
    u_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_551_552 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise a
assume
g_531_low60_20_low20_1 = 0 (mod 2)
&&
g_531_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_2 f_531_low60_20_low20_1;
mov u_551_553 u_551_552;
mov v_551_553 v_551_552;

asr g_531_low60_20_low20_2 g_531_low60_20_low20_1 1;
asr r_551_553 r_551_552 1;
asr s_551_553 s_551_552 1;
assert
    true
&&
    f_531_low60_20_low20_2 = f_531_low60_20_low20_1,
    u_551_553 = u_551_552,
    v_551_553 = v_551_552,
    g_531_low60_20_low20_2 * (const 64 2) = g_531_low60_20_low20_1,
    r_551_553 * (const 64 2) = r_551_552,
    s_551_553 * (const 64 2) = s_551_552
;

assume
    f_531_low60_20_low20_2 = f_531_low60_20_low20_1,
    u_551_553 = u_551_552,
    v_551_553 = v_551_552,
    g_531_low60_20_low20_2 * 2 = g_531_low60_20_low20_1,
    r_551_553 * 2 = r_551_552,
    s_551_553 * 2 = s_551_552
&&
    true
;

{
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_2 + u_551_553 * (const 64 (2**21)) + v_551_553 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_2 + r_551_553 * (const 64 (2**21)) + s_551_553 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_2,
    f_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_2,
    g_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 553)) <=s delta, delta <=s (const 64 (1 + 2*553)),
    (const 64 (-(2**20))) <=s u_551_553, u_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_553, v_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_553, r_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_553, s_551_553 <=s (const 64 ((2**20))),
    u_551_553 + v_551_553 <=s (const 64 (2**20)),
    u_551_553 - v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 + v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 - v_551_553 <=s (const 64 (2**20)),
    r_551_553 + s_551_553 <=s (const 64 (2**20)),
    r_551_553 - s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 + s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 - s_551_553 <=s (const 64 (2**20)),
    u_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_551_553 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_552_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_1,
sint64 g_531_low60_20_low20_1,
sint64 f_531_low60_20_low20_2,
sint64 g_531_low60_20_low20_2,
sint64 u_551_552,
sint64 v_551_552,
sint64 r_551_552,
sint64 s_551_552,
sint64 u_551_553,
sint64 v_551_553,
sint64 r_551_553,
sint64 s_551_553,
bit ne
)={
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (-(2**20)),
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (-(2**20))
&&
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (const 64 (-(2**20))),
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_1 + u_551_552 * (const 64 (2**21)) + v_551_552 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_1 + r_551_552 * (const 64 (2**21)) + s_551_552 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_1,
    f_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_1,
    g_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 552)) <=s delta, delta <=s (const 64 (1 + 2*552)),
    (const 64 (-(2**20))) <=s u_551_552, u_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_552, v_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_552, r_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_552, s_551_552 <=s (const 64 ((2**20))),
    u_551_552 + v_551_552 <=s (const 64 (2**20)),
    u_551_552 - v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 + v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 - v_551_552 <=s (const 64 (2**20)),
    r_551_552 + s_551_552 <=s (const 64 (2**20)),
    r_551_552 - s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 + s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 - s_551_552 <=s (const 64 (2**20)),
    u_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_551_552 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise b
assume
g_531_low60_20_low20_1 = 1 (mod 2)
&&
g_531_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_2 f_531_low60_20_low20_1;
mov u_551_553 u_551_552;
mov v_551_553 v_551_552;

add g_531_low60_20_low20_2 g_531_low60_20_low20_1 f_531_low60_20_low20_1;
asr g_531_low60_20_low20_2 g_531_low60_20_low20_2 1;
add r_551_553 r_551_552 u_551_552;
asr r_551_553 r_551_553 1;
add s_551_553 s_551_552 v_551_552;
asr s_551_553 s_551_553 1;
assert
    true
&&
    f_531_low60_20_low20_2 = f_531_low60_20_low20_1,
    u_551_553 = u_551_552,
    v_551_553 = v_551_552,
    g_531_low60_20_low20_2 * (const 64 2) = g_531_low60_20_low20_1 + f_531_low60_20_low20_1,
    r_551_553 * (const 64 2) = r_551_552 + u_551_552,
    s_551_553 * (const 64 2) = s_551_552 + v_551_552
;

assume
    f_531_low60_20_low20_2 = f_531_low60_20_low20_1,
    u_551_553 = u_551_552,
    v_551_553 = v_551_552,
    g_531_low60_20_low20_2 * 2 = g_531_low60_20_low20_1 + f_531_low60_20_low20_1,
    r_551_553 * 2 = r_551_552 + u_551_552,
    s_551_553 * 2 = s_551_552 + v_551_552
&&
    true
;

{
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_2 + u_551_553 * (const 64 (2**21)) + v_551_553 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_2 + r_551_553 * (const 64 (2**21)) + s_551_553 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_2,
    f_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_2,
    g_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 553)) <=s delta, delta <=s (const 64 (1 + 2*553)),
    (const 64 (-(2**20))) <=s u_551_553, u_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_553, v_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_553, r_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_553, s_551_553 <=s (const 64 ((2**20))),
    u_551_553 + v_551_553 <=s (const 64 (2**20)),
    u_551_553 - v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 + v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 - v_551_553 <=s (const 64 (2**20)),
    r_551_553 + s_551_553 <=s (const 64 (2**20)),
    r_551_553 - s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 + s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 - s_551_553 <=s (const 64 (2**20)),
    u_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_551_553 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_552_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_1,
sint64 g_531_low60_20_low20_1,
sint64 f_531_low60_20_low20_2,
sint64 g_531_low60_20_low20_2,
sint64 u_551_552,
sint64 v_551_552,
sint64 r_551_552,
sint64 s_551_552,
sint64 u_551_553,
sint64 v_551_553,
sint64 r_551_553,
sint64 s_551_553,
bit ne
)={
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (-(2**20)),
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (-(2**20))
&&
    u_551_552 * f_531_low60_20_low20_0 + v_551_552 * g_531_low60_20_low20_0 = f_531_low60_20_low20_1 * (const 64 (-(2**20))),
    r_551_552 * f_531_low60_20_low20_0 + s_551_552 * g_531_low60_20_low20_0 = g_531_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_1 + u_551_552 * (const 64 (2**21)) + v_551_552 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_1 + r_551_552 * (const 64 (2**21)) + s_551_552 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_1,
    f_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_1,
    g_531_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 552)) <=s delta, delta <=s (const 64 (1 + 2*552)),
    (const 64 (-(2**20))) <=s u_551_552, u_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_552, v_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_552, r_551_552 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_552, s_551_552 <=s (const 64 ((2**20))),
    u_551_552 + v_551_552 <=s (const 64 (2**20)),
    u_551_552 - v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 + v_551_552 <=s (const 64 (2**20)),
    (const 64 0) - u_551_552 - v_551_552 <=s (const 64 (2**20)),
    r_551_552 + s_551_552 <=s (const 64 (2**20)),
    r_551_552 - s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 + s_551_552 <=s (const 64 (2**20)),
    (const 64 0) - r_551_552 - s_551_552 <=s (const 64 (2**20)),
    u_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_551_552 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_551_552 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step21

// premise c
assume
g_531_low60_20_low20_1 = 1 (mod 2)
&&
g_531_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_2 g_531_low60_20_low20_1;
mov u_551_553 r_551_552;
mov v_551_553 s_551_552;

subs dc g_531_low60_20_low20_2 g_531_low60_20_low20_1 f_531_low60_20_low20_1;
asr g_531_low60_20_low20_2 g_531_low60_20_low20_2 1;
subs dc r_551_553 r_551_552 u_551_552;
asr r_551_553 r_551_553 1;
subs dc s_551_553 s_551_552 v_551_552;
asr s_551_553 s_551_553 1;
assert
    true
&&
    f_531_low60_20_low20_2 = g_531_low60_20_low20_1,
    u_551_553 = r_551_552,
    v_551_553 = s_551_552,
    g_531_low60_20_low20_2 * (const 64 2) = g_531_low60_20_low20_1 - f_531_low60_20_low20_1,
    r_551_553 * (const 64 2) = r_551_552 - u_551_552,
    s_551_553 * (const 64 2) = s_551_552 - v_551_552
;

assume
    f_531_low60_20_low20_2 = g_531_low60_20_low20_1,
    u_551_553 = r_551_552,
    v_551_553 = s_551_552,
    g_531_low60_20_low20_2 * 2 = g_531_low60_20_low20_1 - f_531_low60_20_low20_1,
    r_551_553 * 2 = r_551_552 - u_551_552,
    s_551_553 * 2 = s_551_552 - v_551_552
&&
    true
;

{
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_2 + u_551_553 * (const 64 (2**21)) + v_551_553 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_2 + r_551_553 * (const 64 (2**21)) + s_551_553 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_2,
    f_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_2,
    g_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 553)) <=s delta, delta <=s (const 64 (1 + 2*553)),
    (const 64 (-(2**20))) <=s u_551_553, u_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_553, v_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_553, r_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_553, s_551_553 <=s (const 64 ((2**20))),
    u_551_553 + v_551_553 <=s (const 64 (2**20)),
    u_551_553 - v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 + v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 - v_551_553 <=s (const 64 (2**20)),
    r_551_553 + s_551_553 <=s (const 64 (2**20)),
    r_551_553 - s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 + s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 - s_551_553 <=s (const 64 (2**20)),
    u_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_551_553 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_553_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_2,
sint64 g_531_low60_20_low20_2,
sint64 f_531_low60_20_low20_3,
sint64 g_531_low60_20_low20_3,
sint64 u_551_553,
sint64 v_551_553,
sint64 r_551_553,
sint64 s_551_553,
sint64 u_551_554,
sint64 v_551_554,
sint64 r_551_554,
sint64 s_551_554,
bit ne
)={
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (-(2**20)),
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (-(2**20))
&&
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (const 64 (-(2**20))),
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_2 + u_551_553 * (const 64 (2**21)) + v_551_553 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_2 + r_551_553 * (const 64 (2**21)) + s_551_553 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_2,
    f_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_2,
    g_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 553)) <=s delta, delta <=s (const 64 (1 + 2*553)),
    (const 64 (-(2**20))) <=s u_551_553, u_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_553, v_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_553, r_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_553, s_551_553 <=s (const 64 ((2**20))),
    u_551_553 + v_551_553 <=s (const 64 (2**20)),
    u_551_553 - v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 + v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 - v_551_553 <=s (const 64 (2**20)),
    r_551_553 + s_551_553 <=s (const 64 (2**20)),
    r_551_553 - s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 + s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 - s_551_553 <=s (const 64 (2**20)),
    u_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_551_553 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise a
assume
g_531_low60_20_low20_2 = 0 (mod 2)
&&
g_531_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_3 f_531_low60_20_low20_2;
mov u_551_554 u_551_553;
mov v_551_554 v_551_553;

asr g_531_low60_20_low20_3 g_531_low60_20_low20_2 1;
asr r_551_554 r_551_553 1;
asr s_551_554 s_551_553 1;
assert
    true
&&
    f_531_low60_20_low20_3 = f_531_low60_20_low20_2,
    u_551_554 = u_551_553,
    v_551_554 = v_551_553,
    g_531_low60_20_low20_3 * (const 64 2) = g_531_low60_20_low20_2,
    r_551_554 * (const 64 2) = r_551_553,
    s_551_554 * (const 64 2) = s_551_553
;

assume
    f_531_low60_20_low20_3 = f_531_low60_20_low20_2,
    u_551_554 = u_551_553,
    v_551_554 = v_551_553,
    g_531_low60_20_low20_3 * 2 = g_531_low60_20_low20_2,
    r_551_554 * 2 = r_551_553,
    s_551_554 * 2 = s_551_553
&&
    true
;

{
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_3 + u_551_554 * (const 64 (2**21)) + v_551_554 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_3 + r_551_554 * (const 64 (2**21)) + s_551_554 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_3,
    f_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_3,
    g_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 554)) <=s delta, delta <=s (const 64 (1 + 2*554)),
    (const 64 (-(2**20))) <=s u_551_554, u_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_554, v_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_554, r_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_554, s_551_554 <=s (const 64 ((2**20))),
    u_551_554 + v_551_554 <=s (const 64 (2**20)),
    u_551_554 - v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 + v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 - v_551_554 <=s (const 64 (2**20)),
    r_551_554 + s_551_554 <=s (const 64 (2**20)),
    r_551_554 - s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 + s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 - s_551_554 <=s (const 64 (2**20)),
    u_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_551_554 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_553_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_2,
sint64 g_531_low60_20_low20_2,
sint64 f_531_low60_20_low20_3,
sint64 g_531_low60_20_low20_3,
sint64 u_551_553,
sint64 v_551_553,
sint64 r_551_553,
sint64 s_551_553,
sint64 u_551_554,
sint64 v_551_554,
sint64 r_551_554,
sint64 s_551_554,
bit ne
)={
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (-(2**20)),
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (-(2**20))
&&
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (const 64 (-(2**20))),
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_2 + u_551_553 * (const 64 (2**21)) + v_551_553 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_2 + r_551_553 * (const 64 (2**21)) + s_551_553 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_2,
    f_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_2,
    g_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 553)) <=s delta, delta <=s (const 64 (1 + 2*553)),
    (const 64 (-(2**20))) <=s u_551_553, u_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_553, v_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_553, r_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_553, s_551_553 <=s (const 64 ((2**20))),
    u_551_553 + v_551_553 <=s (const 64 (2**20)),
    u_551_553 - v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 + v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 - v_551_553 <=s (const 64 (2**20)),
    r_551_553 + s_551_553 <=s (const 64 (2**20)),
    r_551_553 - s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 + s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 - s_551_553 <=s (const 64 (2**20)),
    u_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_551_553 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise b
assume
g_531_low60_20_low20_2 = 1 (mod 2)
&&
g_531_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_3 f_531_low60_20_low20_2;
mov u_551_554 u_551_553;
mov v_551_554 v_551_553;

add g_531_low60_20_low20_3 g_531_low60_20_low20_2 f_531_low60_20_low20_2;
asr g_531_low60_20_low20_3 g_531_low60_20_low20_3 1;
add r_551_554 r_551_553 u_551_553;
asr r_551_554 r_551_554 1;
add s_551_554 s_551_553 v_551_553;
asr s_551_554 s_551_554 1;
assert
    true
&&
    f_531_low60_20_low20_3 = f_531_low60_20_low20_2,
    u_551_554 = u_551_553,
    v_551_554 = v_551_553,
    g_531_low60_20_low20_3 * (const 64 2) = g_531_low60_20_low20_2 + f_531_low60_20_low20_2,
    r_551_554 * (const 64 2) = r_551_553 + u_551_553,
    s_551_554 * (const 64 2) = s_551_553 + v_551_553
;

assume
    f_531_low60_20_low20_3 = f_531_low60_20_low20_2,
    u_551_554 = u_551_553,
    v_551_554 = v_551_553,
    g_531_low60_20_low20_3 * 2 = g_531_low60_20_low20_2 + f_531_low60_20_low20_2,
    r_551_554 * 2 = r_551_553 + u_551_553,
    s_551_554 * 2 = s_551_553 + v_551_553
&&
    true
;

{
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_3 + u_551_554 * (const 64 (2**21)) + v_551_554 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_3 + r_551_554 * (const 64 (2**21)) + s_551_554 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_3,
    f_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_3,
    g_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 554)) <=s delta, delta <=s (const 64 (1 + 2*554)),
    (const 64 (-(2**20))) <=s u_551_554, u_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_554, v_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_554, r_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_554, s_551_554 <=s (const 64 ((2**20))),
    u_551_554 + v_551_554 <=s (const 64 (2**20)),
    u_551_554 - v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 + v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 - v_551_554 <=s (const 64 (2**20)),
    r_551_554 + s_551_554 <=s (const 64 (2**20)),
    r_551_554 - s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 + s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 - s_551_554 <=s (const 64 (2**20)),
    u_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_551_554 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_553_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_2,
sint64 g_531_low60_20_low20_2,
sint64 f_531_low60_20_low20_3,
sint64 g_531_low60_20_low20_3,
sint64 u_551_553,
sint64 v_551_553,
sint64 r_551_553,
sint64 s_551_553,
sint64 u_551_554,
sint64 v_551_554,
sint64 r_551_554,
sint64 s_551_554,
bit ne
)={
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (-(2**20)),
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (-(2**20))
&&
    u_551_553 * f_531_low60_20_low20_0 + v_551_553 * g_531_low60_20_low20_0 = f_531_low60_20_low20_2 * (const 64 (-(2**20))),
    r_551_553 * f_531_low60_20_low20_0 + s_551_553 * g_531_low60_20_low20_0 = g_531_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_2 + u_551_553 * (const 64 (2**21)) + v_551_553 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_2 + r_551_553 * (const 64 (2**21)) + s_551_553 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_2,
    f_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_2,
    g_531_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 553)) <=s delta, delta <=s (const 64 (1 + 2*553)),
    (const 64 (-(2**20))) <=s u_551_553, u_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_553, v_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_553, r_551_553 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_553, s_551_553 <=s (const 64 ((2**20))),
    u_551_553 + v_551_553 <=s (const 64 (2**20)),
    u_551_553 - v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 + v_551_553 <=s (const 64 (2**20)),
    (const 64 0) - u_551_553 - v_551_553 <=s (const 64 (2**20)),
    r_551_553 + s_551_553 <=s (const 64 (2**20)),
    r_551_553 - s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 + s_551_553 <=s (const 64 (2**20)),
    (const 64 0) - r_551_553 - s_551_553 <=s (const 64 (2**20)),
    u_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_551_553 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_551_553 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step22

// premise c
assume
g_531_low60_20_low20_2 = 1 (mod 2)
&&
g_531_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_3 g_531_low60_20_low20_2;
mov u_551_554 r_551_553;
mov v_551_554 s_551_553;

subs dc g_531_low60_20_low20_3 g_531_low60_20_low20_2 f_531_low60_20_low20_2;
asr g_531_low60_20_low20_3 g_531_low60_20_low20_3 1;
subs dc r_551_554 r_551_553 u_551_553;
asr r_551_554 r_551_554 1;
subs dc s_551_554 s_551_553 v_551_553;
asr s_551_554 s_551_554 1;
assert
    true
&&
    f_531_low60_20_low20_3 = g_531_low60_20_low20_2,
    u_551_554 = r_551_553,
    v_551_554 = s_551_553,
    g_531_low60_20_low20_3 * (const 64 2) = g_531_low60_20_low20_2 - f_531_low60_20_low20_2,
    r_551_554 * (const 64 2) = r_551_553 - u_551_553,
    s_551_554 * (const 64 2) = s_551_553 - v_551_553
;

assume
    f_531_low60_20_low20_3 = g_531_low60_20_low20_2,
    u_551_554 = r_551_553,
    v_551_554 = s_551_553,
    g_531_low60_20_low20_3 * 2 = g_531_low60_20_low20_2 - f_531_low60_20_low20_2,
    r_551_554 * 2 = r_551_553 - u_551_553,
    s_551_554 * 2 = s_551_553 - v_551_553
&&
    true
;

{
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_3 + u_551_554 * (const 64 (2**21)) + v_551_554 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_3 + r_551_554 * (const 64 (2**21)) + s_551_554 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_3,
    f_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_3,
    g_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 554)) <=s delta, delta <=s (const 64 (1 + 2*554)),
    (const 64 (-(2**20))) <=s u_551_554, u_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_554, v_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_554, r_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_554, s_551_554 <=s (const 64 ((2**20))),
    u_551_554 + v_551_554 <=s (const 64 (2**20)),
    u_551_554 - v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 + v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 - v_551_554 <=s (const 64 (2**20)),
    r_551_554 + s_551_554 <=s (const 64 (2**20)),
    r_551_554 - s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 + s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 - s_551_554 <=s (const 64 (2**20)),
    u_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_551_554 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_554_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_3,
sint64 g_531_low60_20_low20_3,
sint64 f_531_low60_20_low20_4,
sint64 g_531_low60_20_low20_4,
sint64 u_551_554,
sint64 v_551_554,
sint64 r_551_554,
sint64 s_551_554,
sint64 u_551_555,
sint64 v_551_555,
sint64 r_551_555,
sint64 s_551_555,
bit ne
)={
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (-(2**20)),
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (-(2**20))
&&
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (const 64 (-(2**20))),
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_3 + u_551_554 * (const 64 (2**21)) + v_551_554 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_3 + r_551_554 * (const 64 (2**21)) + s_551_554 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_3,
    f_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_3,
    g_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 554)) <=s delta, delta <=s (const 64 (1 + 2*554)),
    (const 64 (-(2**20))) <=s u_551_554, u_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_554, v_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_554, r_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_554, s_551_554 <=s (const 64 ((2**20))),
    u_551_554 + v_551_554 <=s (const 64 (2**20)),
    u_551_554 - v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 + v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 - v_551_554 <=s (const 64 (2**20)),
    r_551_554 + s_551_554 <=s (const 64 (2**20)),
    r_551_554 - s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 + s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 - s_551_554 <=s (const 64 (2**20)),
    u_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_551_554 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise a
assume
g_531_low60_20_low20_3 = 0 (mod 2)
&&
g_531_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_4 f_531_low60_20_low20_3;
mov u_551_555 u_551_554;
mov v_551_555 v_551_554;

asr g_531_low60_20_low20_4 g_531_low60_20_low20_3 1;
asr r_551_555 r_551_554 1;
asr s_551_555 s_551_554 1;
assert
    true
&&
    f_531_low60_20_low20_4 = f_531_low60_20_low20_3,
    u_551_555 = u_551_554,
    v_551_555 = v_551_554,
    g_531_low60_20_low20_4 * (const 64 2) = g_531_low60_20_low20_3,
    r_551_555 * (const 64 2) = r_551_554,
    s_551_555 * (const 64 2) = s_551_554
;

assume
    f_531_low60_20_low20_4 = f_531_low60_20_low20_3,
    u_551_555 = u_551_554,
    v_551_555 = v_551_554,
    g_531_low60_20_low20_4 * 2 = g_531_low60_20_low20_3,
    r_551_555 * 2 = r_551_554,
    s_551_555 * 2 = s_551_554
&&
    true
;

{
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_4 + u_551_555 * (const 64 (2**21)) + v_551_555 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_4 + r_551_555 * (const 64 (2**21)) + s_551_555 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_4,
    f_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_4,
    g_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 555)) <=s delta, delta <=s (const 64 (1 + 2*555)),
    (const 64 (-(2**20))) <=s u_551_555, u_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_555, v_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_555, r_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_555, s_551_555 <=s (const 64 ((2**20))),
    u_551_555 + v_551_555 <=s (const 64 (2**20)),
    u_551_555 - v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 + v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 - v_551_555 <=s (const 64 (2**20)),
    r_551_555 + s_551_555 <=s (const 64 (2**20)),
    r_551_555 - s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 + s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 - s_551_555 <=s (const 64 (2**20)),
    u_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_551_555 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_554_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_3,
sint64 g_531_low60_20_low20_3,
sint64 f_531_low60_20_low20_4,
sint64 g_531_low60_20_low20_4,
sint64 u_551_554,
sint64 v_551_554,
sint64 r_551_554,
sint64 s_551_554,
sint64 u_551_555,
sint64 v_551_555,
sint64 r_551_555,
sint64 s_551_555,
bit ne
)={
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (-(2**20)),
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (-(2**20))
&&
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (const 64 (-(2**20))),
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_3 + u_551_554 * (const 64 (2**21)) + v_551_554 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_3 + r_551_554 * (const 64 (2**21)) + s_551_554 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_3,
    f_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_3,
    g_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 554)) <=s delta, delta <=s (const 64 (1 + 2*554)),
    (const 64 (-(2**20))) <=s u_551_554, u_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_554, v_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_554, r_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_554, s_551_554 <=s (const 64 ((2**20))),
    u_551_554 + v_551_554 <=s (const 64 (2**20)),
    u_551_554 - v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 + v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 - v_551_554 <=s (const 64 (2**20)),
    r_551_554 + s_551_554 <=s (const 64 (2**20)),
    r_551_554 - s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 + s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 - s_551_554 <=s (const 64 (2**20)),
    u_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_551_554 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise b
assume
g_531_low60_20_low20_3 = 1 (mod 2)
&&
g_531_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_4 f_531_low60_20_low20_3;
mov u_551_555 u_551_554;
mov v_551_555 v_551_554;

add g_531_low60_20_low20_4 g_531_low60_20_low20_3 f_531_low60_20_low20_3;
asr g_531_low60_20_low20_4 g_531_low60_20_low20_4 1;
add r_551_555 r_551_554 u_551_554;
asr r_551_555 r_551_555 1;
add s_551_555 s_551_554 v_551_554;
asr s_551_555 s_551_555 1;
assert
    true
&&
    f_531_low60_20_low20_4 = f_531_low60_20_low20_3,
    u_551_555 = u_551_554,
    v_551_555 = v_551_554,
    g_531_low60_20_low20_4 * (const 64 2) = g_531_low60_20_low20_3 + f_531_low60_20_low20_3,
    r_551_555 * (const 64 2) = r_551_554 + u_551_554,
    s_551_555 * (const 64 2) = s_551_554 + v_551_554
;

assume
    f_531_low60_20_low20_4 = f_531_low60_20_low20_3,
    u_551_555 = u_551_554,
    v_551_555 = v_551_554,
    g_531_low60_20_low20_4 * 2 = g_531_low60_20_low20_3 + f_531_low60_20_low20_3,
    r_551_555 * 2 = r_551_554 + u_551_554,
    s_551_555 * 2 = s_551_554 + v_551_554
&&
    true
;

{
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_4 + u_551_555 * (const 64 (2**21)) + v_551_555 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_4 + r_551_555 * (const 64 (2**21)) + s_551_555 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_4,
    f_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_4,
    g_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 555)) <=s delta, delta <=s (const 64 (1 + 2*555)),
    (const 64 (-(2**20))) <=s u_551_555, u_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_555, v_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_555, r_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_555, s_551_555 <=s (const 64 ((2**20))),
    u_551_555 + v_551_555 <=s (const 64 (2**20)),
    u_551_555 - v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 + v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 - v_551_555 <=s (const 64 (2**20)),
    r_551_555 + s_551_555 <=s (const 64 (2**20)),
    r_551_555 - s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 + s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 - s_551_555 <=s (const 64 (2**20)),
    u_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_551_555 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_554_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_3,
sint64 g_531_low60_20_low20_3,
sint64 f_531_low60_20_low20_4,
sint64 g_531_low60_20_low20_4,
sint64 u_551_554,
sint64 v_551_554,
sint64 r_551_554,
sint64 s_551_554,
sint64 u_551_555,
sint64 v_551_555,
sint64 r_551_555,
sint64 s_551_555,
bit ne
)={
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (-(2**20)),
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (-(2**20))
&&
    u_551_554 * f_531_low60_20_low20_0 + v_551_554 * g_531_low60_20_low20_0 = f_531_low60_20_low20_3 * (const 64 (-(2**20))),
    r_551_554 * f_531_low60_20_low20_0 + s_551_554 * g_531_low60_20_low20_0 = g_531_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_3 + u_551_554 * (const 64 (2**21)) + v_551_554 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_3 + r_551_554 * (const 64 (2**21)) + s_551_554 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_3,
    f_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_3,
    g_531_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 554)) <=s delta, delta <=s (const 64 (1 + 2*554)),
    (const 64 (-(2**20))) <=s u_551_554, u_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_554, v_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_554, r_551_554 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_554, s_551_554 <=s (const 64 ((2**20))),
    u_551_554 + v_551_554 <=s (const 64 (2**20)),
    u_551_554 - v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 + v_551_554 <=s (const 64 (2**20)),
    (const 64 0) - u_551_554 - v_551_554 <=s (const 64 (2**20)),
    r_551_554 + s_551_554 <=s (const 64 (2**20)),
    r_551_554 - s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 + s_551_554 <=s (const 64 (2**20)),
    (const 64 0) - r_551_554 - s_551_554 <=s (const 64 (2**20)),
    u_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_551_554 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_551_554 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step23

// premise c
assume
g_531_low60_20_low20_3 = 1 (mod 2)
&&
g_531_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_4 g_531_low60_20_low20_3;
mov u_551_555 r_551_554;
mov v_551_555 s_551_554;

subs dc g_531_low60_20_low20_4 g_531_low60_20_low20_3 f_531_low60_20_low20_3;
asr g_531_low60_20_low20_4 g_531_low60_20_low20_4 1;
subs dc r_551_555 r_551_554 u_551_554;
asr r_551_555 r_551_555 1;
subs dc s_551_555 s_551_554 v_551_554;
asr s_551_555 s_551_555 1;
assert
    true
&&
    f_531_low60_20_low20_4 = g_531_low60_20_low20_3,
    u_551_555 = r_551_554,
    v_551_555 = s_551_554,
    g_531_low60_20_low20_4 * (const 64 2) = g_531_low60_20_low20_3 - f_531_low60_20_low20_3,
    r_551_555 * (const 64 2) = r_551_554 - u_551_554,
    s_551_555 * (const 64 2) = s_551_554 - v_551_554
;

assume
    f_531_low60_20_low20_4 = g_531_low60_20_low20_3,
    u_551_555 = r_551_554,
    v_551_555 = s_551_554,
    g_531_low60_20_low20_4 * 2 = g_531_low60_20_low20_3 - f_531_low60_20_low20_3,
    r_551_555 * 2 = r_551_554 - u_551_554,
    s_551_555 * 2 = s_551_554 - v_551_554
&&
    true
;

{
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_4 + u_551_555 * (const 64 (2**21)) + v_551_555 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_4 + r_551_555 * (const 64 (2**21)) + s_551_555 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_4,
    f_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_4,
    g_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 555)) <=s delta, delta <=s (const 64 (1 + 2*555)),
    (const 64 (-(2**20))) <=s u_551_555, u_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_555, v_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_555, r_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_555, s_551_555 <=s (const 64 ((2**20))),
    u_551_555 + v_551_555 <=s (const 64 (2**20)),
    u_551_555 - v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 + v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 - v_551_555 <=s (const 64 (2**20)),
    r_551_555 + s_551_555 <=s (const 64 (2**20)),
    r_551_555 - s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 + s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 - s_551_555 <=s (const 64 (2**20)),
    u_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_551_555 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_555_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_4,
sint64 g_531_low60_20_low20_4,
sint64 f_531_low60_20_low20_5,
sint64 g_531_low60_20_low20_5,
sint64 u_551_555,
sint64 v_551_555,
sint64 r_551_555,
sint64 s_551_555,
sint64 u_551_556,
sint64 v_551_556,
sint64 r_551_556,
sint64 s_551_556,
bit ne
)={
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (-(2**20)),
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (-(2**20))
&&
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (const 64 (-(2**20))),
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_4 + u_551_555 * (const 64 (2**21)) + v_551_555 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_4 + r_551_555 * (const 64 (2**21)) + s_551_555 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_4,
    f_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_4,
    g_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 555)) <=s delta, delta <=s (const 64 (1 + 2*555)),
    (const 64 (-(2**20))) <=s u_551_555, u_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_555, v_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_555, r_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_555, s_551_555 <=s (const 64 ((2**20))),
    u_551_555 + v_551_555 <=s (const 64 (2**20)),
    u_551_555 - v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 + v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 - v_551_555 <=s (const 64 (2**20)),
    r_551_555 + s_551_555 <=s (const 64 (2**20)),
    r_551_555 - s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 + s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 - s_551_555 <=s (const 64 (2**20)),
    u_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_551_555 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise a
assume
g_531_low60_20_low20_4 = 0 (mod 2)
&&
g_531_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_5 f_531_low60_20_low20_4;
mov u_551_556 u_551_555;
mov v_551_556 v_551_555;

asr g_531_low60_20_low20_5 g_531_low60_20_low20_4 1;
asr r_551_556 r_551_555 1;
asr s_551_556 s_551_555 1;
assert
    true
&&
    f_531_low60_20_low20_5 = f_531_low60_20_low20_4,
    u_551_556 = u_551_555,
    v_551_556 = v_551_555,
    g_531_low60_20_low20_5 * (const 64 2) = g_531_low60_20_low20_4,
    r_551_556 * (const 64 2) = r_551_555,
    s_551_556 * (const 64 2) = s_551_555
;

assume
    f_531_low60_20_low20_5 = f_531_low60_20_low20_4,
    u_551_556 = u_551_555,
    v_551_556 = v_551_555,
    g_531_low60_20_low20_5 * 2 = g_531_low60_20_low20_4,
    r_551_556 * 2 = r_551_555,
    s_551_556 * 2 = s_551_555
&&
    true
;

{
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_5 + u_551_556 * (const 64 (2**21)) + v_551_556 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_5 + r_551_556 * (const 64 (2**21)) + s_551_556 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_5,
    f_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_5,
    g_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 556)) <=s delta, delta <=s (const 64 (1 + 2*556)),
    (const 64 (-(2**20))) <=s u_551_556, u_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_556, v_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_556, r_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_556, s_551_556 <=s (const 64 ((2**20))),
    u_551_556 + v_551_556 <=s (const 64 (2**20)),
    u_551_556 - v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 + v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 - v_551_556 <=s (const 64 (2**20)),
    r_551_556 + s_551_556 <=s (const 64 (2**20)),
    r_551_556 - s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 + s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 - s_551_556 <=s (const 64 (2**20)),
    u_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_551_556 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_555_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_4,
sint64 g_531_low60_20_low20_4,
sint64 f_531_low60_20_low20_5,
sint64 g_531_low60_20_low20_5,
sint64 u_551_555,
sint64 v_551_555,
sint64 r_551_555,
sint64 s_551_555,
sint64 u_551_556,
sint64 v_551_556,
sint64 r_551_556,
sint64 s_551_556,
bit ne
)={
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (-(2**20)),
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (-(2**20))
&&
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (const 64 (-(2**20))),
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_4 + u_551_555 * (const 64 (2**21)) + v_551_555 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_4 + r_551_555 * (const 64 (2**21)) + s_551_555 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_4,
    f_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_4,
    g_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 555)) <=s delta, delta <=s (const 64 (1 + 2*555)),
    (const 64 (-(2**20))) <=s u_551_555, u_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_555, v_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_555, r_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_555, s_551_555 <=s (const 64 ((2**20))),
    u_551_555 + v_551_555 <=s (const 64 (2**20)),
    u_551_555 - v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 + v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 - v_551_555 <=s (const 64 (2**20)),
    r_551_555 + s_551_555 <=s (const 64 (2**20)),
    r_551_555 - s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 + s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 - s_551_555 <=s (const 64 (2**20)),
    u_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_551_555 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise b
assume
g_531_low60_20_low20_4 = 1 (mod 2)
&&
g_531_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_5 f_531_low60_20_low20_4;
mov u_551_556 u_551_555;
mov v_551_556 v_551_555;

add g_531_low60_20_low20_5 g_531_low60_20_low20_4 f_531_low60_20_low20_4;
asr g_531_low60_20_low20_5 g_531_low60_20_low20_5 1;
add r_551_556 r_551_555 u_551_555;
asr r_551_556 r_551_556 1;
add s_551_556 s_551_555 v_551_555;
asr s_551_556 s_551_556 1;
assert
    true
&&
    f_531_low60_20_low20_5 = f_531_low60_20_low20_4,
    u_551_556 = u_551_555,
    v_551_556 = v_551_555,
    g_531_low60_20_low20_5 * (const 64 2) = g_531_low60_20_low20_4 + f_531_low60_20_low20_4,
    r_551_556 * (const 64 2) = r_551_555 + u_551_555,
    s_551_556 * (const 64 2) = s_551_555 + v_551_555
;

assume
    f_531_low60_20_low20_5 = f_531_low60_20_low20_4,
    u_551_556 = u_551_555,
    v_551_556 = v_551_555,
    g_531_low60_20_low20_5 * 2 = g_531_low60_20_low20_4 + f_531_low60_20_low20_4,
    r_551_556 * 2 = r_551_555 + u_551_555,
    s_551_556 * 2 = s_551_555 + v_551_555
&&
    true
;

{
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_5 + u_551_556 * (const 64 (2**21)) + v_551_556 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_5 + r_551_556 * (const 64 (2**21)) + s_551_556 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_5,
    f_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_5,
    g_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 556)) <=s delta, delta <=s (const 64 (1 + 2*556)),
    (const 64 (-(2**20))) <=s u_551_556, u_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_556, v_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_556, r_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_556, s_551_556 <=s (const 64 ((2**20))),
    u_551_556 + v_551_556 <=s (const 64 (2**20)),
    u_551_556 - v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 + v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 - v_551_556 <=s (const 64 (2**20)),
    r_551_556 + s_551_556 <=s (const 64 (2**20)),
    r_551_556 - s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 + s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 - s_551_556 <=s (const 64 (2**20)),
    u_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_551_556 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_555_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_4,
sint64 g_531_low60_20_low20_4,
sint64 f_531_low60_20_low20_5,
sint64 g_531_low60_20_low20_5,
sint64 u_551_555,
sint64 v_551_555,
sint64 r_551_555,
sint64 s_551_555,
sint64 u_551_556,
sint64 v_551_556,
sint64 r_551_556,
sint64 s_551_556,
bit ne
)={
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (-(2**20)),
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (-(2**20))
&&
    u_551_555 * f_531_low60_20_low20_0 + v_551_555 * g_531_low60_20_low20_0 = f_531_low60_20_low20_4 * (const 64 (-(2**20))),
    r_551_555 * f_531_low60_20_low20_0 + s_551_555 * g_531_low60_20_low20_0 = g_531_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_4 + u_551_555 * (const 64 (2**21)) + v_551_555 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_4 + r_551_555 * (const 64 (2**21)) + s_551_555 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_4,
    f_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_4,
    g_531_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 555)) <=s delta, delta <=s (const 64 (1 + 2*555)),
    (const 64 (-(2**20))) <=s u_551_555, u_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_555, v_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_555, r_551_555 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_555, s_551_555 <=s (const 64 ((2**20))),
    u_551_555 + v_551_555 <=s (const 64 (2**20)),
    u_551_555 - v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 + v_551_555 <=s (const 64 (2**20)),
    (const 64 0) - u_551_555 - v_551_555 <=s (const 64 (2**20)),
    r_551_555 + s_551_555 <=s (const 64 (2**20)),
    r_551_555 - s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 + s_551_555 <=s (const 64 (2**20)),
    (const 64 0) - r_551_555 - s_551_555 <=s (const 64 (2**20)),
    u_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_551_555 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_551_555 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step24

// premise c
assume
g_531_low60_20_low20_4 = 1 (mod 2)
&&
g_531_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_5 g_531_low60_20_low20_4;
mov u_551_556 r_551_555;
mov v_551_556 s_551_555;

subs dc g_531_low60_20_low20_5 g_531_low60_20_low20_4 f_531_low60_20_low20_4;
asr g_531_low60_20_low20_5 g_531_low60_20_low20_5 1;
subs dc r_551_556 r_551_555 u_551_555;
asr r_551_556 r_551_556 1;
subs dc s_551_556 s_551_555 v_551_555;
asr s_551_556 s_551_556 1;
assert
    true
&&
    f_531_low60_20_low20_5 = g_531_low60_20_low20_4,
    u_551_556 = r_551_555,
    v_551_556 = s_551_555,
    g_531_low60_20_low20_5 * (const 64 2) = g_531_low60_20_low20_4 - f_531_low60_20_low20_4,
    r_551_556 * (const 64 2) = r_551_555 - u_551_555,
    s_551_556 * (const 64 2) = s_551_555 - v_551_555
;

assume
    f_531_low60_20_low20_5 = g_531_low60_20_low20_4,
    u_551_556 = r_551_555,
    v_551_556 = s_551_555,
    g_531_low60_20_low20_5 * 2 = g_531_low60_20_low20_4 - f_531_low60_20_low20_4,
    r_551_556 * 2 = r_551_555 - u_551_555,
    s_551_556 * 2 = s_551_555 - v_551_555
&&
    true
;

{
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_5 + u_551_556 * (const 64 (2**21)) + v_551_556 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_5 + r_551_556 * (const 64 (2**21)) + s_551_556 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_5,
    f_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_5,
    g_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 556)) <=s delta, delta <=s (const 64 (1 + 2*556)),
    (const 64 (-(2**20))) <=s u_551_556, u_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_556, v_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_556, r_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_556, s_551_556 <=s (const 64 ((2**20))),
    u_551_556 + v_551_556 <=s (const 64 (2**20)),
    u_551_556 - v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 + v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 - v_551_556 <=s (const 64 (2**20)),
    r_551_556 + s_551_556 <=s (const 64 (2**20)),
    r_551_556 - s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 + s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 - s_551_556 <=s (const 64 (2**20)),
    u_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_551_556 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_556_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_5,
sint64 g_531_low60_20_low20_5,
sint64 f_531_low60_20_low20_6,
sint64 g_531_low60_20_low20_6,
sint64 u_551_556,
sint64 v_551_556,
sint64 r_551_556,
sint64 s_551_556,
sint64 u_551_557,
sint64 v_551_557,
sint64 r_551_557,
sint64 s_551_557,
bit ne
)={
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (-(2**20)),
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (-(2**20))
&&
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (const 64 (-(2**20))),
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_5 + u_551_556 * (const 64 (2**21)) + v_551_556 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_5 + r_551_556 * (const 64 (2**21)) + s_551_556 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_5,
    f_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_5,
    g_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 556)) <=s delta, delta <=s (const 64 (1 + 2*556)),
    (const 64 (-(2**20))) <=s u_551_556, u_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_556, v_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_556, r_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_556, s_551_556 <=s (const 64 ((2**20))),
    u_551_556 + v_551_556 <=s (const 64 (2**20)),
    u_551_556 - v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 + v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 - v_551_556 <=s (const 64 (2**20)),
    r_551_556 + s_551_556 <=s (const 64 (2**20)),
    r_551_556 - s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 + s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 - s_551_556 <=s (const 64 (2**20)),
    u_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_551_556 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise a
assume
g_531_low60_20_low20_5 = 0 (mod 2)
&&
g_531_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_6 f_531_low60_20_low20_5;
mov u_551_557 u_551_556;
mov v_551_557 v_551_556;

asr g_531_low60_20_low20_6 g_531_low60_20_low20_5 1;
asr r_551_557 r_551_556 1;
asr s_551_557 s_551_556 1;
assert
    true
&&
    f_531_low60_20_low20_6 = f_531_low60_20_low20_5,
    u_551_557 = u_551_556,
    v_551_557 = v_551_556,
    g_531_low60_20_low20_6 * (const 64 2) = g_531_low60_20_low20_5,
    r_551_557 * (const 64 2) = r_551_556,
    s_551_557 * (const 64 2) = s_551_556
;

assume
    f_531_low60_20_low20_6 = f_531_low60_20_low20_5,
    u_551_557 = u_551_556,
    v_551_557 = v_551_556,
    g_531_low60_20_low20_6 * 2 = g_531_low60_20_low20_5,
    r_551_557 * 2 = r_551_556,
    s_551_557 * 2 = s_551_556
&&
    true
;

{
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_6 + u_551_557 * (const 64 (2**21)) + v_551_557 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_6 + r_551_557 * (const 64 (2**21)) + s_551_557 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_6,
    f_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_6,
    g_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 557)) <=s delta, delta <=s (const 64 (1 + 2*557)),
    (const 64 (-(2**20))) <=s u_551_557, u_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_557, v_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_557, r_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_557, s_551_557 <=s (const 64 ((2**20))),
    u_551_557 + v_551_557 <=s (const 64 (2**20)),
    u_551_557 - v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 + v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 - v_551_557 <=s (const 64 (2**20)),
    r_551_557 + s_551_557 <=s (const 64 (2**20)),
    r_551_557 - s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 + s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 - s_551_557 <=s (const 64 (2**20)),
    u_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_551_557 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_556_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_5,
sint64 g_531_low60_20_low20_5,
sint64 f_531_low60_20_low20_6,
sint64 g_531_low60_20_low20_6,
sint64 u_551_556,
sint64 v_551_556,
sint64 r_551_556,
sint64 s_551_556,
sint64 u_551_557,
sint64 v_551_557,
sint64 r_551_557,
sint64 s_551_557,
bit ne
)={
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (-(2**20)),
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (-(2**20))
&&
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (const 64 (-(2**20))),
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_5 + u_551_556 * (const 64 (2**21)) + v_551_556 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_5 + r_551_556 * (const 64 (2**21)) + s_551_556 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_5,
    f_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_5,
    g_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 556)) <=s delta, delta <=s (const 64 (1 + 2*556)),
    (const 64 (-(2**20))) <=s u_551_556, u_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_556, v_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_556, r_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_556, s_551_556 <=s (const 64 ((2**20))),
    u_551_556 + v_551_556 <=s (const 64 (2**20)),
    u_551_556 - v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 + v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 - v_551_556 <=s (const 64 (2**20)),
    r_551_556 + s_551_556 <=s (const 64 (2**20)),
    r_551_556 - s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 + s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 - s_551_556 <=s (const 64 (2**20)),
    u_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_551_556 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise b
assume
g_531_low60_20_low20_5 = 1 (mod 2)
&&
g_531_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_6 f_531_low60_20_low20_5;
mov u_551_557 u_551_556;
mov v_551_557 v_551_556;

add g_531_low60_20_low20_6 g_531_low60_20_low20_5 f_531_low60_20_low20_5;
asr g_531_low60_20_low20_6 g_531_low60_20_low20_6 1;
add r_551_557 r_551_556 u_551_556;
asr r_551_557 r_551_557 1;
add s_551_557 s_551_556 v_551_556;
asr s_551_557 s_551_557 1;
assert
    true
&&
    f_531_low60_20_low20_6 = f_531_low60_20_low20_5,
    u_551_557 = u_551_556,
    v_551_557 = v_551_556,
    g_531_low60_20_low20_6 * (const 64 2) = g_531_low60_20_low20_5 + f_531_low60_20_low20_5,
    r_551_557 * (const 64 2) = r_551_556 + u_551_556,
    s_551_557 * (const 64 2) = s_551_556 + v_551_556
;

assume
    f_531_low60_20_low20_6 = f_531_low60_20_low20_5,
    u_551_557 = u_551_556,
    v_551_557 = v_551_556,
    g_531_low60_20_low20_6 * 2 = g_531_low60_20_low20_5 + f_531_low60_20_low20_5,
    r_551_557 * 2 = r_551_556 + u_551_556,
    s_551_557 * 2 = s_551_556 + v_551_556
&&
    true
;

{
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_6 + u_551_557 * (const 64 (2**21)) + v_551_557 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_6 + r_551_557 * (const 64 (2**21)) + s_551_557 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_6,
    f_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_6,
    g_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 557)) <=s delta, delta <=s (const 64 (1 + 2*557)),
    (const 64 (-(2**20))) <=s u_551_557, u_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_557, v_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_557, r_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_557, s_551_557 <=s (const 64 ((2**20))),
    u_551_557 + v_551_557 <=s (const 64 (2**20)),
    u_551_557 - v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 + v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 - v_551_557 <=s (const 64 (2**20)),
    r_551_557 + s_551_557 <=s (const 64 (2**20)),
    r_551_557 - s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 + s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 - s_551_557 <=s (const 64 (2**20)),
    u_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_551_557 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_556_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_5,
sint64 g_531_low60_20_low20_5,
sint64 f_531_low60_20_low20_6,
sint64 g_531_low60_20_low20_6,
sint64 u_551_556,
sint64 v_551_556,
sint64 r_551_556,
sint64 s_551_556,
sint64 u_551_557,
sint64 v_551_557,
sint64 r_551_557,
sint64 s_551_557,
bit ne
)={
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (-(2**20)),
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (-(2**20))
&&
    u_551_556 * f_531_low60_20_low20_0 + v_551_556 * g_531_low60_20_low20_0 = f_531_low60_20_low20_5 * (const 64 (-(2**20))),
    r_551_556 * f_531_low60_20_low20_0 + s_551_556 * g_531_low60_20_low20_0 = g_531_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_5 + u_551_556 * (const 64 (2**21)) + v_551_556 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_5 + r_551_556 * (const 64 (2**21)) + s_551_556 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_5,
    f_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_5,
    g_531_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 556)) <=s delta, delta <=s (const 64 (1 + 2*556)),
    (const 64 (-(2**20))) <=s u_551_556, u_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_556, v_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_556, r_551_556 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_556, s_551_556 <=s (const 64 ((2**20))),
    u_551_556 + v_551_556 <=s (const 64 (2**20)),
    u_551_556 - v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 + v_551_556 <=s (const 64 (2**20)),
    (const 64 0) - u_551_556 - v_551_556 <=s (const 64 (2**20)),
    r_551_556 + s_551_556 <=s (const 64 (2**20)),
    r_551_556 - s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 + s_551_556 <=s (const 64 (2**20)),
    (const 64 0) - r_551_556 - s_551_556 <=s (const 64 (2**20)),
    u_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_551_556 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_551_556 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step25

// premise c
assume
g_531_low60_20_low20_5 = 1 (mod 2)
&&
g_531_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_6 g_531_low60_20_low20_5;
mov u_551_557 r_551_556;
mov v_551_557 s_551_556;

subs dc g_531_low60_20_low20_6 g_531_low60_20_low20_5 f_531_low60_20_low20_5;
asr g_531_low60_20_low20_6 g_531_low60_20_low20_6 1;
subs dc r_551_557 r_551_556 u_551_556;
asr r_551_557 r_551_557 1;
subs dc s_551_557 s_551_556 v_551_556;
asr s_551_557 s_551_557 1;
assert
    true
&&
    f_531_low60_20_low20_6 = g_531_low60_20_low20_5,
    u_551_557 = r_551_556,
    v_551_557 = s_551_556,
    g_531_low60_20_low20_6 * (const 64 2) = g_531_low60_20_low20_5 - f_531_low60_20_low20_5,
    r_551_557 * (const 64 2) = r_551_556 - u_551_556,
    s_551_557 * (const 64 2) = s_551_556 - v_551_556
;

assume
    f_531_low60_20_low20_6 = g_531_low60_20_low20_5,
    u_551_557 = r_551_556,
    v_551_557 = s_551_556,
    g_531_low60_20_low20_6 * 2 = g_531_low60_20_low20_5 - f_531_low60_20_low20_5,
    r_551_557 * 2 = r_551_556 - u_551_556,
    s_551_557 * 2 = s_551_556 - v_551_556
&&
    true
;

{
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_6 + u_551_557 * (const 64 (2**21)) + v_551_557 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_6 + r_551_557 * (const 64 (2**21)) + s_551_557 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_6,
    f_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_6,
    g_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 557)) <=s delta, delta <=s (const 64 (1 + 2*557)),
    (const 64 (-(2**20))) <=s u_551_557, u_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_557, v_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_557, r_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_557, s_551_557 <=s (const 64 ((2**20))),
    u_551_557 + v_551_557 <=s (const 64 (2**20)),
    u_551_557 - v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 + v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 - v_551_557 <=s (const 64 (2**20)),
    r_551_557 + s_551_557 <=s (const 64 (2**20)),
    r_551_557 - s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 + s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 - s_551_557 <=s (const 64 (2**20)),
    u_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_551_557 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_557_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_6,
sint64 g_531_low60_20_low20_6,
sint64 f_531_low60_20_low20_7,
sint64 g_531_low60_20_low20_7,
sint64 u_551_557,
sint64 v_551_557,
sint64 r_551_557,
sint64 s_551_557,
sint64 u_551_558,
sint64 v_551_558,
sint64 r_551_558,
sint64 s_551_558,
bit ne
)={
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (-(2**20)),
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (-(2**20))
&&
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (const 64 (-(2**20))),
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_6 + u_551_557 * (const 64 (2**21)) + v_551_557 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_6 + r_551_557 * (const 64 (2**21)) + s_551_557 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_6,
    f_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_6,
    g_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 557)) <=s delta, delta <=s (const 64 (1 + 2*557)),
    (const 64 (-(2**20))) <=s u_551_557, u_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_557, v_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_557, r_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_557, s_551_557 <=s (const 64 ((2**20))),
    u_551_557 + v_551_557 <=s (const 64 (2**20)),
    u_551_557 - v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 + v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 - v_551_557 <=s (const 64 (2**20)),
    r_551_557 + s_551_557 <=s (const 64 (2**20)),
    r_551_557 - s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 + s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 - s_551_557 <=s (const 64 (2**20)),
    u_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_551_557 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise a
assume
g_531_low60_20_low20_6 = 0 (mod 2)
&&
g_531_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_7 f_531_low60_20_low20_6;
mov u_551_558 u_551_557;
mov v_551_558 v_551_557;

asr g_531_low60_20_low20_7 g_531_low60_20_low20_6 1;
asr r_551_558 r_551_557 1;
asr s_551_558 s_551_557 1;
assert
    true
&&
    f_531_low60_20_low20_7 = f_531_low60_20_low20_6,
    u_551_558 = u_551_557,
    v_551_558 = v_551_557,
    g_531_low60_20_low20_7 * (const 64 2) = g_531_low60_20_low20_6,
    r_551_558 * (const 64 2) = r_551_557,
    s_551_558 * (const 64 2) = s_551_557
;

assume
    f_531_low60_20_low20_7 = f_531_low60_20_low20_6,
    u_551_558 = u_551_557,
    v_551_558 = v_551_557,
    g_531_low60_20_low20_7 * 2 = g_531_low60_20_low20_6,
    r_551_558 * 2 = r_551_557,
    s_551_558 * 2 = s_551_557
&&
    true
;

{
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_7 + u_551_558 * (const 64 (2**21)) + v_551_558 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_7 + r_551_558 * (const 64 (2**21)) + s_551_558 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_7,
    f_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_7,
    g_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 558)) <=s delta, delta <=s (const 64 (1 + 2*558)),
    (const 64 (-(2**20))) <=s u_551_558, u_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_558, v_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_558, r_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_558, s_551_558 <=s (const 64 ((2**20))),
    u_551_558 + v_551_558 <=s (const 64 (2**20)),
    u_551_558 - v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 + v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 - v_551_558 <=s (const 64 (2**20)),
    r_551_558 + s_551_558 <=s (const 64 (2**20)),
    r_551_558 - s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 + s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 - s_551_558 <=s (const 64 (2**20)),
    u_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_551_558 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_557_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_6,
sint64 g_531_low60_20_low20_6,
sint64 f_531_low60_20_low20_7,
sint64 g_531_low60_20_low20_7,
sint64 u_551_557,
sint64 v_551_557,
sint64 r_551_557,
sint64 s_551_557,
sint64 u_551_558,
sint64 v_551_558,
sint64 r_551_558,
sint64 s_551_558,
bit ne
)={
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (-(2**20)),
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (-(2**20))
&&
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (const 64 (-(2**20))),
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_6 + u_551_557 * (const 64 (2**21)) + v_551_557 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_6 + r_551_557 * (const 64 (2**21)) + s_551_557 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_6,
    f_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_6,
    g_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 557)) <=s delta, delta <=s (const 64 (1 + 2*557)),
    (const 64 (-(2**20))) <=s u_551_557, u_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_557, v_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_557, r_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_557, s_551_557 <=s (const 64 ((2**20))),
    u_551_557 + v_551_557 <=s (const 64 (2**20)),
    u_551_557 - v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 + v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 - v_551_557 <=s (const 64 (2**20)),
    r_551_557 + s_551_557 <=s (const 64 (2**20)),
    r_551_557 - s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 + s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 - s_551_557 <=s (const 64 (2**20)),
    u_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_551_557 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise b
assume
g_531_low60_20_low20_6 = 1 (mod 2)
&&
g_531_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_7 f_531_low60_20_low20_6;
mov u_551_558 u_551_557;
mov v_551_558 v_551_557;

add g_531_low60_20_low20_7 g_531_low60_20_low20_6 f_531_low60_20_low20_6;
asr g_531_low60_20_low20_7 g_531_low60_20_low20_7 1;
add r_551_558 r_551_557 u_551_557;
asr r_551_558 r_551_558 1;
add s_551_558 s_551_557 v_551_557;
asr s_551_558 s_551_558 1;
assert
    true
&&
    f_531_low60_20_low20_7 = f_531_low60_20_low20_6,
    u_551_558 = u_551_557,
    v_551_558 = v_551_557,
    g_531_low60_20_low20_7 * (const 64 2) = g_531_low60_20_low20_6 + f_531_low60_20_low20_6,
    r_551_558 * (const 64 2) = r_551_557 + u_551_557,
    s_551_558 * (const 64 2) = s_551_557 + v_551_557
;

assume
    f_531_low60_20_low20_7 = f_531_low60_20_low20_6,
    u_551_558 = u_551_557,
    v_551_558 = v_551_557,
    g_531_low60_20_low20_7 * 2 = g_531_low60_20_low20_6 + f_531_low60_20_low20_6,
    r_551_558 * 2 = r_551_557 + u_551_557,
    s_551_558 * 2 = s_551_557 + v_551_557
&&
    true
;

{
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_7 + u_551_558 * (const 64 (2**21)) + v_551_558 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_7 + r_551_558 * (const 64 (2**21)) + s_551_558 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_7,
    f_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_7,
    g_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 558)) <=s delta, delta <=s (const 64 (1 + 2*558)),
    (const 64 (-(2**20))) <=s u_551_558, u_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_558, v_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_558, r_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_558, s_551_558 <=s (const 64 ((2**20))),
    u_551_558 + v_551_558 <=s (const 64 (2**20)),
    u_551_558 - v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 + v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 - v_551_558 <=s (const 64 (2**20)),
    r_551_558 + s_551_558 <=s (const 64 (2**20)),
    r_551_558 - s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 + s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 - s_551_558 <=s (const 64 (2**20)),
    u_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_551_558 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_557_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_6,
sint64 g_531_low60_20_low20_6,
sint64 f_531_low60_20_low20_7,
sint64 g_531_low60_20_low20_7,
sint64 u_551_557,
sint64 v_551_557,
sint64 r_551_557,
sint64 s_551_557,
sint64 u_551_558,
sint64 v_551_558,
sint64 r_551_558,
sint64 s_551_558,
bit ne
)={
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (-(2**20)),
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (-(2**20))
&&
    u_551_557 * f_531_low60_20_low20_0 + v_551_557 * g_531_low60_20_low20_0 = f_531_low60_20_low20_6 * (const 64 (-(2**20))),
    r_551_557 * f_531_low60_20_low20_0 + s_551_557 * g_531_low60_20_low20_0 = g_531_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_6 + u_551_557 * (const 64 (2**21)) + v_551_557 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_6 + r_551_557 * (const 64 (2**21)) + s_551_557 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_6,
    f_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_6,
    g_531_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 557)) <=s delta, delta <=s (const 64 (1 + 2*557)),
    (const 64 (-(2**20))) <=s u_551_557, u_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_557, v_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_557, r_551_557 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_557, s_551_557 <=s (const 64 ((2**20))),
    u_551_557 + v_551_557 <=s (const 64 (2**20)),
    u_551_557 - v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 + v_551_557 <=s (const 64 (2**20)),
    (const 64 0) - u_551_557 - v_551_557 <=s (const 64 (2**20)),
    r_551_557 + s_551_557 <=s (const 64 (2**20)),
    r_551_557 - s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 + s_551_557 <=s (const 64 (2**20)),
    (const 64 0) - r_551_557 - s_551_557 <=s (const 64 (2**20)),
    u_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_551_557 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_551_557 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step26

// premise c
assume
g_531_low60_20_low20_6 = 1 (mod 2)
&&
g_531_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_7 g_531_low60_20_low20_6;
mov u_551_558 r_551_557;
mov v_551_558 s_551_557;

subs dc g_531_low60_20_low20_7 g_531_low60_20_low20_6 f_531_low60_20_low20_6;
asr g_531_low60_20_low20_7 g_531_low60_20_low20_7 1;
subs dc r_551_558 r_551_557 u_551_557;
asr r_551_558 r_551_558 1;
subs dc s_551_558 s_551_557 v_551_557;
asr s_551_558 s_551_558 1;
assert
    true
&&
    f_531_low60_20_low20_7 = g_531_low60_20_low20_6,
    u_551_558 = r_551_557,
    v_551_558 = s_551_557,
    g_531_low60_20_low20_7 * (const 64 2) = g_531_low60_20_low20_6 - f_531_low60_20_low20_6,
    r_551_558 * (const 64 2) = r_551_557 - u_551_557,
    s_551_558 * (const 64 2) = s_551_557 - v_551_557
;

assume
    f_531_low60_20_low20_7 = g_531_low60_20_low20_6,
    u_551_558 = r_551_557,
    v_551_558 = s_551_557,
    g_531_low60_20_low20_7 * 2 = g_531_low60_20_low20_6 - f_531_low60_20_low20_6,
    r_551_558 * 2 = r_551_557 - u_551_557,
    s_551_558 * 2 = s_551_557 - v_551_557
&&
    true
;

{
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_7 + u_551_558 * (const 64 (2**21)) + v_551_558 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_7 + r_551_558 * (const 64 (2**21)) + s_551_558 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_7,
    f_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_7,
    g_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 558)) <=s delta, delta <=s (const 64 (1 + 2*558)),
    (const 64 (-(2**20))) <=s u_551_558, u_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_558, v_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_558, r_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_558, s_551_558 <=s (const 64 ((2**20))),
    u_551_558 + v_551_558 <=s (const 64 (2**20)),
    u_551_558 - v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 + v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 - v_551_558 <=s (const 64 (2**20)),
    r_551_558 + s_551_558 <=s (const 64 (2**20)),
    r_551_558 - s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 + s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 - s_551_558 <=s (const 64 (2**20)),
    u_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_551_558 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_558_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_7,
sint64 g_531_low60_20_low20_7,
sint64 f_531_low60_20_low20_8,
sint64 g_531_low60_20_low20_8,
sint64 u_551_558,
sint64 v_551_558,
sint64 r_551_558,
sint64 s_551_558,
sint64 u_551_559,
sint64 v_551_559,
sint64 r_551_559,
sint64 s_551_559,
bit ne
)={
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (-(2**20)),
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (-(2**20))
&&
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (const 64 (-(2**20))),
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_7 + u_551_558 * (const 64 (2**21)) + v_551_558 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_7 + r_551_558 * (const 64 (2**21)) + s_551_558 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_7,
    f_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_7,
    g_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 558)) <=s delta, delta <=s (const 64 (1 + 2*558)),
    (const 64 (-(2**20))) <=s u_551_558, u_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_558, v_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_558, r_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_558, s_551_558 <=s (const 64 ((2**20))),
    u_551_558 + v_551_558 <=s (const 64 (2**20)),
    u_551_558 - v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 + v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 - v_551_558 <=s (const 64 (2**20)),
    r_551_558 + s_551_558 <=s (const 64 (2**20)),
    r_551_558 - s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 + s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 - s_551_558 <=s (const 64 (2**20)),
    u_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_551_558 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise a
assume
g_531_low60_20_low20_7 = 0 (mod 2)
&&
g_531_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_8 f_531_low60_20_low20_7;
mov u_551_559 u_551_558;
mov v_551_559 v_551_558;

asr g_531_low60_20_low20_8 g_531_low60_20_low20_7 1;
asr r_551_559 r_551_558 1;
asr s_551_559 s_551_558 1;
assert
    true
&&
    f_531_low60_20_low20_8 = f_531_low60_20_low20_7,
    u_551_559 = u_551_558,
    v_551_559 = v_551_558,
    g_531_low60_20_low20_8 * (const 64 2) = g_531_low60_20_low20_7,
    r_551_559 * (const 64 2) = r_551_558,
    s_551_559 * (const 64 2) = s_551_558
;

assume
    f_531_low60_20_low20_8 = f_531_low60_20_low20_7,
    u_551_559 = u_551_558,
    v_551_559 = v_551_558,
    g_531_low60_20_low20_8 * 2 = g_531_low60_20_low20_7,
    r_551_559 * 2 = r_551_558,
    s_551_559 * 2 = s_551_558
&&
    true
;

{
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_8 + u_551_559 * (const 64 (2**21)) + v_551_559 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_8 + r_551_559 * (const 64 (2**21)) + s_551_559 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_8,
    f_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_8,
    g_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 559)) <=s delta, delta <=s (const 64 (1 + 2*559)),
    (const 64 (-(2**20))) <=s u_551_559, u_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_559, v_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_559, r_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_559, s_551_559 <=s (const 64 ((2**20))),
    u_551_559 + v_551_559 <=s (const 64 (2**20)),
    u_551_559 - v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 + v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 - v_551_559 <=s (const 64 (2**20)),
    r_551_559 + s_551_559 <=s (const 64 (2**20)),
    r_551_559 - s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 + s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 - s_551_559 <=s (const 64 (2**20)),
    u_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_551_559 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_558_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_7,
sint64 g_531_low60_20_low20_7,
sint64 f_531_low60_20_low20_8,
sint64 g_531_low60_20_low20_8,
sint64 u_551_558,
sint64 v_551_558,
sint64 r_551_558,
sint64 s_551_558,
sint64 u_551_559,
sint64 v_551_559,
sint64 r_551_559,
sint64 s_551_559,
bit ne
)={
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (-(2**20)),
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (-(2**20))
&&
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (const 64 (-(2**20))),
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_7 + u_551_558 * (const 64 (2**21)) + v_551_558 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_7 + r_551_558 * (const 64 (2**21)) + s_551_558 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_7,
    f_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_7,
    g_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 558)) <=s delta, delta <=s (const 64 (1 + 2*558)),
    (const 64 (-(2**20))) <=s u_551_558, u_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_558, v_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_558, r_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_558, s_551_558 <=s (const 64 ((2**20))),
    u_551_558 + v_551_558 <=s (const 64 (2**20)),
    u_551_558 - v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 + v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 - v_551_558 <=s (const 64 (2**20)),
    r_551_558 + s_551_558 <=s (const 64 (2**20)),
    r_551_558 - s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 + s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 - s_551_558 <=s (const 64 (2**20)),
    u_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_551_558 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise b
assume
g_531_low60_20_low20_7 = 1 (mod 2)
&&
g_531_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_8 f_531_low60_20_low20_7;
mov u_551_559 u_551_558;
mov v_551_559 v_551_558;

add g_531_low60_20_low20_8 g_531_low60_20_low20_7 f_531_low60_20_low20_7;
asr g_531_low60_20_low20_8 g_531_low60_20_low20_8 1;
add r_551_559 r_551_558 u_551_558;
asr r_551_559 r_551_559 1;
add s_551_559 s_551_558 v_551_558;
asr s_551_559 s_551_559 1;
assert
    true
&&
    f_531_low60_20_low20_8 = f_531_low60_20_low20_7,
    u_551_559 = u_551_558,
    v_551_559 = v_551_558,
    g_531_low60_20_low20_8 * (const 64 2) = g_531_low60_20_low20_7 + f_531_low60_20_low20_7,
    r_551_559 * (const 64 2) = r_551_558 + u_551_558,
    s_551_559 * (const 64 2) = s_551_558 + v_551_558
;

assume
    f_531_low60_20_low20_8 = f_531_low60_20_low20_7,
    u_551_559 = u_551_558,
    v_551_559 = v_551_558,
    g_531_low60_20_low20_8 * 2 = g_531_low60_20_low20_7 + f_531_low60_20_low20_7,
    r_551_559 * 2 = r_551_558 + u_551_558,
    s_551_559 * 2 = s_551_558 + v_551_558
&&
    true
;

{
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_8 + u_551_559 * (const 64 (2**21)) + v_551_559 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_8 + r_551_559 * (const 64 (2**21)) + s_551_559 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_8,
    f_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_8,
    g_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 559)) <=s delta, delta <=s (const 64 (1 + 2*559)),
    (const 64 (-(2**20))) <=s u_551_559, u_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_559, v_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_559, r_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_559, s_551_559 <=s (const 64 ((2**20))),
    u_551_559 + v_551_559 <=s (const 64 (2**20)),
    u_551_559 - v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 + v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 - v_551_559 <=s (const 64 (2**20)),
    r_551_559 + s_551_559 <=s (const 64 (2**20)),
    r_551_559 - s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 + s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 - s_551_559 <=s (const 64 (2**20)),
    u_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_551_559 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_558_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_7,
sint64 g_531_low60_20_low20_7,
sint64 f_531_low60_20_low20_8,
sint64 g_531_low60_20_low20_8,
sint64 u_551_558,
sint64 v_551_558,
sint64 r_551_558,
sint64 s_551_558,
sint64 u_551_559,
sint64 v_551_559,
sint64 r_551_559,
sint64 s_551_559,
bit ne
)={
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (-(2**20)),
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (-(2**20))
&&
    u_551_558 * f_531_low60_20_low20_0 + v_551_558 * g_531_low60_20_low20_0 = f_531_low60_20_low20_7 * (const 64 (-(2**20))),
    r_551_558 * f_531_low60_20_low20_0 + s_551_558 * g_531_low60_20_low20_0 = g_531_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_7 + u_551_558 * (const 64 (2**21)) + v_551_558 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_7 + r_551_558 * (const 64 (2**21)) + s_551_558 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_7,
    f_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_7,
    g_531_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 558)) <=s delta, delta <=s (const 64 (1 + 2*558)),
    (const 64 (-(2**20))) <=s u_551_558, u_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_558, v_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_558, r_551_558 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_558, s_551_558 <=s (const 64 ((2**20))),
    u_551_558 + v_551_558 <=s (const 64 (2**20)),
    u_551_558 - v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 + v_551_558 <=s (const 64 (2**20)),
    (const 64 0) - u_551_558 - v_551_558 <=s (const 64 (2**20)),
    r_551_558 + s_551_558 <=s (const 64 (2**20)),
    r_551_558 - s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 + s_551_558 <=s (const 64 (2**20)),
    (const 64 0) - r_551_558 - s_551_558 <=s (const 64 (2**20)),
    u_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_551_558 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_551_558 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step27

// premise c
assume
g_531_low60_20_low20_7 = 1 (mod 2)
&&
g_531_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_8 g_531_low60_20_low20_7;
mov u_551_559 r_551_558;
mov v_551_559 s_551_558;

subs dc g_531_low60_20_low20_8 g_531_low60_20_low20_7 f_531_low60_20_low20_7;
asr g_531_low60_20_low20_8 g_531_low60_20_low20_8 1;
subs dc r_551_559 r_551_558 u_551_558;
asr r_551_559 r_551_559 1;
subs dc s_551_559 s_551_558 v_551_558;
asr s_551_559 s_551_559 1;
assert
    true
&&
    f_531_low60_20_low20_8 = g_531_low60_20_low20_7,
    u_551_559 = r_551_558,
    v_551_559 = s_551_558,
    g_531_low60_20_low20_8 * (const 64 2) = g_531_low60_20_low20_7 - f_531_low60_20_low20_7,
    r_551_559 * (const 64 2) = r_551_558 - u_551_558,
    s_551_559 * (const 64 2) = s_551_558 - v_551_558
;

assume
    f_531_low60_20_low20_8 = g_531_low60_20_low20_7,
    u_551_559 = r_551_558,
    v_551_559 = s_551_558,
    g_531_low60_20_low20_8 * 2 = g_531_low60_20_low20_7 - f_531_low60_20_low20_7,
    r_551_559 * 2 = r_551_558 - u_551_558,
    s_551_559 * 2 = s_551_558 - v_551_558
&&
    true
;

{
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_8 + u_551_559 * (const 64 (2**21)) + v_551_559 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_8 + r_551_559 * (const 64 (2**21)) + s_551_559 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_8,
    f_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_8,
    g_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 559)) <=s delta, delta <=s (const 64 (1 + 2*559)),
    (const 64 (-(2**20))) <=s u_551_559, u_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_559, v_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_559, r_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_559, s_551_559 <=s (const 64 ((2**20))),
    u_551_559 + v_551_559 <=s (const 64 (2**20)),
    u_551_559 - v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 + v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 - v_551_559 <=s (const 64 (2**20)),
    r_551_559 + s_551_559 <=s (const 64 (2**20)),
    r_551_559 - s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 + s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 - s_551_559 <=s (const 64 (2**20)),
    u_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_551_559 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_559_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_8,
sint64 g_531_low60_20_low20_8,
sint64 f_531_low60_20_low20_9,
sint64 g_531_low60_20_low20_9,
sint64 u_551_559,
sint64 v_551_559,
sint64 r_551_559,
sint64 s_551_559,
sint64 u_551_560,
sint64 v_551_560,
sint64 r_551_560,
sint64 s_551_560,
bit ne
)={
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (-(2**20)),
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (-(2**20))
&&
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (const 64 (-(2**20))),
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_8 + u_551_559 * (const 64 (2**21)) + v_551_559 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_8 + r_551_559 * (const 64 (2**21)) + s_551_559 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_8,
    f_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_8,
    g_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 559)) <=s delta, delta <=s (const 64 (1 + 2*559)),
    (const 64 (-(2**20))) <=s u_551_559, u_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_559, v_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_559, r_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_559, s_551_559 <=s (const 64 ((2**20))),
    u_551_559 + v_551_559 <=s (const 64 (2**20)),
    u_551_559 - v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 + v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 - v_551_559 <=s (const 64 (2**20)),
    r_551_559 + s_551_559 <=s (const 64 (2**20)),
    r_551_559 - s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 + s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 - s_551_559 <=s (const 64 (2**20)),
    u_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_551_559 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise a
assume
g_531_low60_20_low20_8 = 0 (mod 2)
&&
g_531_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_9 f_531_low60_20_low20_8;
mov u_551_560 u_551_559;
mov v_551_560 v_551_559;

asr g_531_low60_20_low20_9 g_531_low60_20_low20_8 1;
asr r_551_560 r_551_559 1;
asr s_551_560 s_551_559 1;
assert
    true
&&
    f_531_low60_20_low20_9 = f_531_low60_20_low20_8,
    u_551_560 = u_551_559,
    v_551_560 = v_551_559,
    g_531_low60_20_low20_9 * (const 64 2) = g_531_low60_20_low20_8,
    r_551_560 * (const 64 2) = r_551_559,
    s_551_560 * (const 64 2) = s_551_559
;

assume
    f_531_low60_20_low20_9 = f_531_low60_20_low20_8,
    u_551_560 = u_551_559,
    v_551_560 = v_551_559,
    g_531_low60_20_low20_9 * 2 = g_531_low60_20_low20_8,
    r_551_560 * 2 = r_551_559,
    s_551_560 * 2 = s_551_559
&&
    true
;

{
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_9 + u_551_560 * (const 64 (2**21)) + v_551_560 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_9 + r_551_560 * (const 64 (2**21)) + s_551_560 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_9,
    f_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_9,
    g_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 560)) <=s delta, delta <=s (const 64 (1 + 2*560)),
    (const 64 (-(2**20))) <=s u_551_560, u_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_560, v_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_560, r_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_560, s_551_560 <=s (const 64 ((2**20))),
    u_551_560 + v_551_560 <=s (const 64 (2**20)),
    u_551_560 - v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 + v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 - v_551_560 <=s (const 64 (2**20)),
    r_551_560 + s_551_560 <=s (const 64 (2**20)),
    r_551_560 - s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 + s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 - s_551_560 <=s (const 64 (2**20)),
    u_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_551_560 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_559_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_8,
sint64 g_531_low60_20_low20_8,
sint64 f_531_low60_20_low20_9,
sint64 g_531_low60_20_low20_9,
sint64 u_551_559,
sint64 v_551_559,
sint64 r_551_559,
sint64 s_551_559,
sint64 u_551_560,
sint64 v_551_560,
sint64 r_551_560,
sint64 s_551_560,
bit ne
)={
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (-(2**20)),
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (-(2**20))
&&
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (const 64 (-(2**20))),
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_8 + u_551_559 * (const 64 (2**21)) + v_551_559 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_8 + r_551_559 * (const 64 (2**21)) + s_551_559 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_8,
    f_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_8,
    g_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 559)) <=s delta, delta <=s (const 64 (1 + 2*559)),
    (const 64 (-(2**20))) <=s u_551_559, u_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_559, v_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_559, r_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_559, s_551_559 <=s (const 64 ((2**20))),
    u_551_559 + v_551_559 <=s (const 64 (2**20)),
    u_551_559 - v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 + v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 - v_551_559 <=s (const 64 (2**20)),
    r_551_559 + s_551_559 <=s (const 64 (2**20)),
    r_551_559 - s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 + s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 - s_551_559 <=s (const 64 (2**20)),
    u_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_551_559 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise b
assume
g_531_low60_20_low20_8 = 1 (mod 2)
&&
g_531_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_9 f_531_low60_20_low20_8;
mov u_551_560 u_551_559;
mov v_551_560 v_551_559;

add g_531_low60_20_low20_9 g_531_low60_20_low20_8 f_531_low60_20_low20_8;
asr g_531_low60_20_low20_9 g_531_low60_20_low20_9 1;
add r_551_560 r_551_559 u_551_559;
asr r_551_560 r_551_560 1;
add s_551_560 s_551_559 v_551_559;
asr s_551_560 s_551_560 1;
assert
    true
&&
    f_531_low60_20_low20_9 = f_531_low60_20_low20_8,
    u_551_560 = u_551_559,
    v_551_560 = v_551_559,
    g_531_low60_20_low20_9 * (const 64 2) = g_531_low60_20_low20_8 + f_531_low60_20_low20_8,
    r_551_560 * (const 64 2) = r_551_559 + u_551_559,
    s_551_560 * (const 64 2) = s_551_559 + v_551_559
;

assume
    f_531_low60_20_low20_9 = f_531_low60_20_low20_8,
    u_551_560 = u_551_559,
    v_551_560 = v_551_559,
    g_531_low60_20_low20_9 * 2 = g_531_low60_20_low20_8 + f_531_low60_20_low20_8,
    r_551_560 * 2 = r_551_559 + u_551_559,
    s_551_560 * 2 = s_551_559 + v_551_559
&&
    true
;

{
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_9 + u_551_560 * (const 64 (2**21)) + v_551_560 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_9 + r_551_560 * (const 64 (2**21)) + s_551_560 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_9,
    f_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_9,
    g_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 560)) <=s delta, delta <=s (const 64 (1 + 2*560)),
    (const 64 (-(2**20))) <=s u_551_560, u_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_560, v_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_560, r_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_560, s_551_560 <=s (const 64 ((2**20))),
    u_551_560 + v_551_560 <=s (const 64 (2**20)),
    u_551_560 - v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 + v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 - v_551_560 <=s (const 64 (2**20)),
    r_551_560 + s_551_560 <=s (const 64 (2**20)),
    r_551_560 - s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 + s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 - s_551_560 <=s (const 64 (2**20)),
    u_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_551_560 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_559_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_8,
sint64 g_531_low60_20_low20_8,
sint64 f_531_low60_20_low20_9,
sint64 g_531_low60_20_low20_9,
sint64 u_551_559,
sint64 v_551_559,
sint64 r_551_559,
sint64 s_551_559,
sint64 u_551_560,
sint64 v_551_560,
sint64 r_551_560,
sint64 s_551_560,
bit ne
)={
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (-(2**20)),
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (-(2**20))
&&
    u_551_559 * f_531_low60_20_low20_0 + v_551_559 * g_531_low60_20_low20_0 = f_531_low60_20_low20_8 * (const 64 (-(2**20))),
    r_551_559 * f_531_low60_20_low20_0 + s_551_559 * g_531_low60_20_low20_0 = g_531_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_8 + u_551_559 * (const 64 (2**21)) + v_551_559 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_8 + r_551_559 * (const 64 (2**21)) + s_551_559 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_8,
    f_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_8,
    g_531_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 559)) <=s delta, delta <=s (const 64 (1 + 2*559)),
    (const 64 (-(2**20))) <=s u_551_559, u_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_559, v_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_559, r_551_559 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_559, s_551_559 <=s (const 64 ((2**20))),
    u_551_559 + v_551_559 <=s (const 64 (2**20)),
    u_551_559 - v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 + v_551_559 <=s (const 64 (2**20)),
    (const 64 0) - u_551_559 - v_551_559 <=s (const 64 (2**20)),
    r_551_559 + s_551_559 <=s (const 64 (2**20)),
    r_551_559 - s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 + s_551_559 <=s (const 64 (2**20)),
    (const 64 0) - r_551_559 - s_551_559 <=s (const 64 (2**20)),
    u_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_551_559 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_551_559 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step28

// premise c
assume
g_531_low60_20_low20_8 = 1 (mod 2)
&&
g_531_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_9 g_531_low60_20_low20_8;
mov u_551_560 r_551_559;
mov v_551_560 s_551_559;

subs dc g_531_low60_20_low20_9 g_531_low60_20_low20_8 f_531_low60_20_low20_8;
asr g_531_low60_20_low20_9 g_531_low60_20_low20_9 1;
subs dc r_551_560 r_551_559 u_551_559;
asr r_551_560 r_551_560 1;
subs dc s_551_560 s_551_559 v_551_559;
asr s_551_560 s_551_560 1;
assert
    true
&&
    f_531_low60_20_low20_9 = g_531_low60_20_low20_8,
    u_551_560 = r_551_559,
    v_551_560 = s_551_559,
    g_531_low60_20_low20_9 * (const 64 2) = g_531_low60_20_low20_8 - f_531_low60_20_low20_8,
    r_551_560 * (const 64 2) = r_551_559 - u_551_559,
    s_551_560 * (const 64 2) = s_551_559 - v_551_559
;

assume
    f_531_low60_20_low20_9 = g_531_low60_20_low20_8,
    u_551_560 = r_551_559,
    v_551_560 = s_551_559,
    g_531_low60_20_low20_9 * 2 = g_531_low60_20_low20_8 - f_531_low60_20_low20_8,
    r_551_560 * 2 = r_551_559 - u_551_559,
    s_551_560 * 2 = s_551_559 - v_551_559
&&
    true
;

{
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_9 + u_551_560 * (const 64 (2**21)) + v_551_560 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_9 + r_551_560 * (const 64 (2**21)) + s_551_560 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_9,
    f_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_9,
    g_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 560)) <=s delta, delta <=s (const 64 (1 + 2*560)),
    (const 64 (-(2**20))) <=s u_551_560, u_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_560, v_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_560, r_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_560, s_551_560 <=s (const 64 ((2**20))),
    u_551_560 + v_551_560 <=s (const 64 (2**20)),
    u_551_560 - v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 + v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 - v_551_560 <=s (const 64 (2**20)),
    r_551_560 + s_551_560 <=s (const 64 (2**20)),
    r_551_560 - s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 + s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 - s_551_560 <=s (const 64 (2**20)),
    u_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_551_560 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_560_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_9,
sint64 g_531_low60_20_low20_9,
sint64 f_531_low60_20_low20_10,
sint64 g_531_low60_20_low20_10,
sint64 u_551_560,
sint64 v_551_560,
sint64 r_551_560,
sint64 s_551_560,
sint64 u_551_561,
sint64 v_551_561,
sint64 r_551_561,
sint64 s_551_561,
bit ne
)={
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (-(2**20)),
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (-(2**20))
&&
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (const 64 (-(2**20))),
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_9 + u_551_560 * (const 64 (2**21)) + v_551_560 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_9 + r_551_560 * (const 64 (2**21)) + s_551_560 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_9,
    f_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_9,
    g_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 560)) <=s delta, delta <=s (const 64 (1 + 2*560)),
    (const 64 (-(2**20))) <=s u_551_560, u_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_560, v_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_560, r_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_560, s_551_560 <=s (const 64 ((2**20))),
    u_551_560 + v_551_560 <=s (const 64 (2**20)),
    u_551_560 - v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 + v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 - v_551_560 <=s (const 64 (2**20)),
    r_551_560 + s_551_560 <=s (const 64 (2**20)),
    r_551_560 - s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 + s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 - s_551_560 <=s (const 64 (2**20)),
    u_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_551_560 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise a
assume
g_531_low60_20_low20_9 = 0 (mod 2)
&&
g_531_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_10 f_531_low60_20_low20_9;
mov u_551_561 u_551_560;
mov v_551_561 v_551_560;

asr g_531_low60_20_low20_10 g_531_low60_20_low20_9 1;
asr r_551_561 r_551_560 1;
asr s_551_561 s_551_560 1;
assert
    true
&&
    f_531_low60_20_low20_10 = f_531_low60_20_low20_9,
    u_551_561 = u_551_560,
    v_551_561 = v_551_560,
    g_531_low60_20_low20_10 * (const 64 2) = g_531_low60_20_low20_9,
    r_551_561 * (const 64 2) = r_551_560,
    s_551_561 * (const 64 2) = s_551_560
;

assume
    f_531_low60_20_low20_10 = f_531_low60_20_low20_9,
    u_551_561 = u_551_560,
    v_551_561 = v_551_560,
    g_531_low60_20_low20_10 * 2 = g_531_low60_20_low20_9,
    r_551_561 * 2 = r_551_560,
    s_551_561 * 2 = s_551_560
&&
    true
;

{
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_10 + u_551_561 * (const 64 (2**21)) + v_551_561 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_10 + r_551_561 * (const 64 (2**21)) + s_551_561 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_10,
    f_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_10,
    g_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 561)) <=s delta, delta <=s (const 64 (1 + 2*561)),
    (const 64 (-(2**20))) <=s u_551_561, u_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_561, v_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_561, r_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_561, s_551_561 <=s (const 64 ((2**20))),
    u_551_561 + v_551_561 <=s (const 64 (2**20)),
    u_551_561 - v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 + v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 - v_551_561 <=s (const 64 (2**20)),
    r_551_561 + s_551_561 <=s (const 64 (2**20)),
    r_551_561 - s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 + s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 - s_551_561 <=s (const 64 (2**20)),
    u_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_551_561 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_560_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_9,
sint64 g_531_low60_20_low20_9,
sint64 f_531_low60_20_low20_10,
sint64 g_531_low60_20_low20_10,
sint64 u_551_560,
sint64 v_551_560,
sint64 r_551_560,
sint64 s_551_560,
sint64 u_551_561,
sint64 v_551_561,
sint64 r_551_561,
sint64 s_551_561,
bit ne
)={
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (-(2**20)),
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (-(2**20))
&&
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (const 64 (-(2**20))),
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_9 + u_551_560 * (const 64 (2**21)) + v_551_560 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_9 + r_551_560 * (const 64 (2**21)) + s_551_560 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_9,
    f_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_9,
    g_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 560)) <=s delta, delta <=s (const 64 (1 + 2*560)),
    (const 64 (-(2**20))) <=s u_551_560, u_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_560, v_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_560, r_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_560, s_551_560 <=s (const 64 ((2**20))),
    u_551_560 + v_551_560 <=s (const 64 (2**20)),
    u_551_560 - v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 + v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 - v_551_560 <=s (const 64 (2**20)),
    r_551_560 + s_551_560 <=s (const 64 (2**20)),
    r_551_560 - s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 + s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 - s_551_560 <=s (const 64 (2**20)),
    u_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_551_560 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise b
assume
g_531_low60_20_low20_9 = 1 (mod 2)
&&
g_531_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_10 f_531_low60_20_low20_9;
mov u_551_561 u_551_560;
mov v_551_561 v_551_560;

add g_531_low60_20_low20_10 g_531_low60_20_low20_9 f_531_low60_20_low20_9;
asr g_531_low60_20_low20_10 g_531_low60_20_low20_10 1;
add r_551_561 r_551_560 u_551_560;
asr r_551_561 r_551_561 1;
add s_551_561 s_551_560 v_551_560;
asr s_551_561 s_551_561 1;
assert
    true
&&
    f_531_low60_20_low20_10 = f_531_low60_20_low20_9,
    u_551_561 = u_551_560,
    v_551_561 = v_551_560,
    g_531_low60_20_low20_10 * (const 64 2) = g_531_low60_20_low20_9 + f_531_low60_20_low20_9,
    r_551_561 * (const 64 2) = r_551_560 + u_551_560,
    s_551_561 * (const 64 2) = s_551_560 + v_551_560
;

assume
    f_531_low60_20_low20_10 = f_531_low60_20_low20_9,
    u_551_561 = u_551_560,
    v_551_561 = v_551_560,
    g_531_low60_20_low20_10 * 2 = g_531_low60_20_low20_9 + f_531_low60_20_low20_9,
    r_551_561 * 2 = r_551_560 + u_551_560,
    s_551_561 * 2 = s_551_560 + v_551_560
&&
    true
;

{
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_10 + u_551_561 * (const 64 (2**21)) + v_551_561 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_10 + r_551_561 * (const 64 (2**21)) + s_551_561 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_10,
    f_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_10,
    g_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 561)) <=s delta, delta <=s (const 64 (1 + 2*561)),
    (const 64 (-(2**20))) <=s u_551_561, u_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_561, v_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_561, r_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_561, s_551_561 <=s (const 64 ((2**20))),
    u_551_561 + v_551_561 <=s (const 64 (2**20)),
    u_551_561 - v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 + v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 - v_551_561 <=s (const 64 (2**20)),
    r_551_561 + s_551_561 <=s (const 64 (2**20)),
    r_551_561 - s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 + s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 - s_551_561 <=s (const 64 (2**20)),
    u_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_551_561 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_560_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_9,
sint64 g_531_low60_20_low20_9,
sint64 f_531_low60_20_low20_10,
sint64 g_531_low60_20_low20_10,
sint64 u_551_560,
sint64 v_551_560,
sint64 r_551_560,
sint64 s_551_560,
sint64 u_551_561,
sint64 v_551_561,
sint64 r_551_561,
sint64 s_551_561,
bit ne
)={
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (-(2**20)),
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (-(2**20))
&&
    u_551_560 * f_531_low60_20_low20_0 + v_551_560 * g_531_low60_20_low20_0 = f_531_low60_20_low20_9 * (const 64 (-(2**20))),
    r_551_560 * f_531_low60_20_low20_0 + s_551_560 * g_531_low60_20_low20_0 = g_531_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_9 + u_551_560 * (const 64 (2**21)) + v_551_560 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_9 + r_551_560 * (const 64 (2**21)) + s_551_560 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_9,
    f_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_9,
    g_531_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 560)) <=s delta, delta <=s (const 64 (1 + 2*560)),
    (const 64 (-(2**20))) <=s u_551_560, u_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_560, v_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_560, r_551_560 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_560, s_551_560 <=s (const 64 ((2**20))),
    u_551_560 + v_551_560 <=s (const 64 (2**20)),
    u_551_560 - v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 + v_551_560 <=s (const 64 (2**20)),
    (const 64 0) - u_551_560 - v_551_560 <=s (const 64 (2**20)),
    r_551_560 + s_551_560 <=s (const 64 (2**20)),
    r_551_560 - s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 + s_551_560 <=s (const 64 (2**20)),
    (const 64 0) - r_551_560 - s_551_560 <=s (const 64 (2**20)),
    u_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_551_560 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_551_560 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step29

// premise c
assume
g_531_low60_20_low20_9 = 1 (mod 2)
&&
g_531_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_10 g_531_low60_20_low20_9;
mov u_551_561 r_551_560;
mov v_551_561 s_551_560;

subs dc g_531_low60_20_low20_10 g_531_low60_20_low20_9 f_531_low60_20_low20_9;
asr g_531_low60_20_low20_10 g_531_low60_20_low20_10 1;
subs dc r_551_561 r_551_560 u_551_560;
asr r_551_561 r_551_561 1;
subs dc s_551_561 s_551_560 v_551_560;
asr s_551_561 s_551_561 1;
assert
    true
&&
    f_531_low60_20_low20_10 = g_531_low60_20_low20_9,
    u_551_561 = r_551_560,
    v_551_561 = s_551_560,
    g_531_low60_20_low20_10 * (const 64 2) = g_531_low60_20_low20_9 - f_531_low60_20_low20_9,
    r_551_561 * (const 64 2) = r_551_560 - u_551_560,
    s_551_561 * (const 64 2) = s_551_560 - v_551_560
;

assume
    f_531_low60_20_low20_10 = g_531_low60_20_low20_9,
    u_551_561 = r_551_560,
    v_551_561 = s_551_560,
    g_531_low60_20_low20_10 * 2 = g_531_low60_20_low20_9 - f_531_low60_20_low20_9,
    r_551_561 * 2 = r_551_560 - u_551_560,
    s_551_561 * 2 = s_551_560 - v_551_560
&&
    true
;

{
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_10 + u_551_561 * (const 64 (2**21)) + v_551_561 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_10 + r_551_561 * (const 64 (2**21)) + s_551_561 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_10,
    f_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_10,
    g_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 561)) <=s delta, delta <=s (const 64 (1 + 2*561)),
    (const 64 (-(2**20))) <=s u_551_561, u_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_561, v_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_561, r_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_561, s_551_561 <=s (const 64 ((2**20))),
    u_551_561 + v_551_561 <=s (const 64 (2**20)),
    u_551_561 - v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 + v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 - v_551_561 <=s (const 64 (2**20)),
    r_551_561 + s_551_561 <=s (const 64 (2**20)),
    r_551_561 - s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 + s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 - s_551_561 <=s (const 64 (2**20)),
    u_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_551_561 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_561_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_10,
sint64 g_531_low60_20_low20_10,
sint64 f_531_low60_20_low20_11,
sint64 g_531_low60_20_low20_11,
sint64 u_551_561,
sint64 v_551_561,
sint64 r_551_561,
sint64 s_551_561,
sint64 u_551_562,
sint64 v_551_562,
sint64 r_551_562,
sint64 s_551_562,
bit ne
)={
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (-(2**20)),
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (-(2**20))
&&
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (const 64 (-(2**20))),
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_10 + u_551_561 * (const 64 (2**21)) + v_551_561 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_10 + r_551_561 * (const 64 (2**21)) + s_551_561 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_10,
    f_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_10,
    g_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 561)) <=s delta, delta <=s (const 64 (1 + 2*561)),
    (const 64 (-(2**20))) <=s u_551_561, u_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_561, v_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_561, r_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_561, s_551_561 <=s (const 64 ((2**20))),
    u_551_561 + v_551_561 <=s (const 64 (2**20)),
    u_551_561 - v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 + v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 - v_551_561 <=s (const 64 (2**20)),
    r_551_561 + s_551_561 <=s (const 64 (2**20)),
    r_551_561 - s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 + s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 - s_551_561 <=s (const 64 (2**20)),
    u_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_551_561 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise a
assume
g_531_low60_20_low20_10 = 0 (mod 2)
&&
g_531_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_11 f_531_low60_20_low20_10;
mov u_551_562 u_551_561;
mov v_551_562 v_551_561;

asr g_531_low60_20_low20_11 g_531_low60_20_low20_10 1;
asr r_551_562 r_551_561 1;
asr s_551_562 s_551_561 1;
assert
    true
&&
    f_531_low60_20_low20_11 = f_531_low60_20_low20_10,
    u_551_562 = u_551_561,
    v_551_562 = v_551_561,
    g_531_low60_20_low20_11 * (const 64 2) = g_531_low60_20_low20_10,
    r_551_562 * (const 64 2) = r_551_561,
    s_551_562 * (const 64 2) = s_551_561
;

assume
    f_531_low60_20_low20_11 = f_531_low60_20_low20_10,
    u_551_562 = u_551_561,
    v_551_562 = v_551_561,
    g_531_low60_20_low20_11 * 2 = g_531_low60_20_low20_10,
    r_551_562 * 2 = r_551_561,
    s_551_562 * 2 = s_551_561
&&
    true
;

{
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_11 + u_551_562 * (const 64 (2**21)) + v_551_562 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_11 + r_551_562 * (const 64 (2**21)) + s_551_562 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_11,
    f_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_11,
    g_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 562)) <=s delta, delta <=s (const 64 (1 + 2*562)),
    (const 64 (-(2**20))) <=s u_551_562, u_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_562, v_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_562, r_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_562, s_551_562 <=s (const 64 ((2**20))),
    u_551_562 + v_551_562 <=s (const 64 (2**20)),
    u_551_562 - v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 + v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 - v_551_562 <=s (const 64 (2**20)),
    r_551_562 + s_551_562 <=s (const 64 (2**20)),
    r_551_562 - s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 + s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 - s_551_562 <=s (const 64 (2**20)),
    u_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_551_562 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_561_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_10,
sint64 g_531_low60_20_low20_10,
sint64 f_531_low60_20_low20_11,
sint64 g_531_low60_20_low20_11,
sint64 u_551_561,
sint64 v_551_561,
sint64 r_551_561,
sint64 s_551_561,
sint64 u_551_562,
sint64 v_551_562,
sint64 r_551_562,
sint64 s_551_562,
bit ne
)={
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (-(2**20)),
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (-(2**20))
&&
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (const 64 (-(2**20))),
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_10 + u_551_561 * (const 64 (2**21)) + v_551_561 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_10 + r_551_561 * (const 64 (2**21)) + s_551_561 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_10,
    f_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_10,
    g_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 561)) <=s delta, delta <=s (const 64 (1 + 2*561)),
    (const 64 (-(2**20))) <=s u_551_561, u_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_561, v_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_561, r_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_561, s_551_561 <=s (const 64 ((2**20))),
    u_551_561 + v_551_561 <=s (const 64 (2**20)),
    u_551_561 - v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 + v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 - v_551_561 <=s (const 64 (2**20)),
    r_551_561 + s_551_561 <=s (const 64 (2**20)),
    r_551_561 - s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 + s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 - s_551_561 <=s (const 64 (2**20)),
    u_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_551_561 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise b
assume
g_531_low60_20_low20_10 = 1 (mod 2)
&&
g_531_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_11 f_531_low60_20_low20_10;
mov u_551_562 u_551_561;
mov v_551_562 v_551_561;

add g_531_low60_20_low20_11 g_531_low60_20_low20_10 f_531_low60_20_low20_10;
asr g_531_low60_20_low20_11 g_531_low60_20_low20_11 1;
add r_551_562 r_551_561 u_551_561;
asr r_551_562 r_551_562 1;
add s_551_562 s_551_561 v_551_561;
asr s_551_562 s_551_562 1;
assert
    true
&&
    f_531_low60_20_low20_11 = f_531_low60_20_low20_10,
    u_551_562 = u_551_561,
    v_551_562 = v_551_561,
    g_531_low60_20_low20_11 * (const 64 2) = g_531_low60_20_low20_10 + f_531_low60_20_low20_10,
    r_551_562 * (const 64 2) = r_551_561 + u_551_561,
    s_551_562 * (const 64 2) = s_551_561 + v_551_561
;

assume
    f_531_low60_20_low20_11 = f_531_low60_20_low20_10,
    u_551_562 = u_551_561,
    v_551_562 = v_551_561,
    g_531_low60_20_low20_11 * 2 = g_531_low60_20_low20_10 + f_531_low60_20_low20_10,
    r_551_562 * 2 = r_551_561 + u_551_561,
    s_551_562 * 2 = s_551_561 + v_551_561
&&
    true
;

{
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_11 + u_551_562 * (const 64 (2**21)) + v_551_562 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_11 + r_551_562 * (const 64 (2**21)) + s_551_562 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_11,
    f_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_11,
    g_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 562)) <=s delta, delta <=s (const 64 (1 + 2*562)),
    (const 64 (-(2**20))) <=s u_551_562, u_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_562, v_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_562, r_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_562, s_551_562 <=s (const 64 ((2**20))),
    u_551_562 + v_551_562 <=s (const 64 (2**20)),
    u_551_562 - v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 + v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 - v_551_562 <=s (const 64 (2**20)),
    r_551_562 + s_551_562 <=s (const 64 (2**20)),
    r_551_562 - s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 + s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 - s_551_562 <=s (const 64 (2**20)),
    u_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_551_562 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_561_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_10,
sint64 g_531_low60_20_low20_10,
sint64 f_531_low60_20_low20_11,
sint64 g_531_low60_20_low20_11,
sint64 u_551_561,
sint64 v_551_561,
sint64 r_551_561,
sint64 s_551_561,
sint64 u_551_562,
sint64 v_551_562,
sint64 r_551_562,
sint64 s_551_562,
bit ne
)={
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (-(2**20)),
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (-(2**20))
&&
    u_551_561 * f_531_low60_20_low20_0 + v_551_561 * g_531_low60_20_low20_0 = f_531_low60_20_low20_10 * (const 64 (-(2**20))),
    r_551_561 * f_531_low60_20_low20_0 + s_551_561 * g_531_low60_20_low20_0 = g_531_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_10 + u_551_561 * (const 64 (2**21)) + v_551_561 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_10 + r_551_561 * (const 64 (2**21)) + s_551_561 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_10,
    f_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_10,
    g_531_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 561)) <=s delta, delta <=s (const 64 (1 + 2*561)),
    (const 64 (-(2**20))) <=s u_551_561, u_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_561, v_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_561, r_551_561 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_561, s_551_561 <=s (const 64 ((2**20))),
    u_551_561 + v_551_561 <=s (const 64 (2**20)),
    u_551_561 - v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 + v_551_561 <=s (const 64 (2**20)),
    (const 64 0) - u_551_561 - v_551_561 <=s (const 64 (2**20)),
    r_551_561 + s_551_561 <=s (const 64 (2**20)),
    r_551_561 - s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 + s_551_561 <=s (const 64 (2**20)),
    (const 64 0) - r_551_561 - s_551_561 <=s (const 64 (2**20)),
    u_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_551_561 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_551_561 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step30

// premise c
assume
g_531_low60_20_low20_10 = 1 (mod 2)
&&
g_531_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_11 g_531_low60_20_low20_10;
mov u_551_562 r_551_561;
mov v_551_562 s_551_561;

subs dc g_531_low60_20_low20_11 g_531_low60_20_low20_10 f_531_low60_20_low20_10;
asr g_531_low60_20_low20_11 g_531_low60_20_low20_11 1;
subs dc r_551_562 r_551_561 u_551_561;
asr r_551_562 r_551_562 1;
subs dc s_551_562 s_551_561 v_551_561;
asr s_551_562 s_551_562 1;
assert
    true
&&
    f_531_low60_20_low20_11 = g_531_low60_20_low20_10,
    u_551_562 = r_551_561,
    v_551_562 = s_551_561,
    g_531_low60_20_low20_11 * (const 64 2) = g_531_low60_20_low20_10 - f_531_low60_20_low20_10,
    r_551_562 * (const 64 2) = r_551_561 - u_551_561,
    s_551_562 * (const 64 2) = s_551_561 - v_551_561
;

assume
    f_531_low60_20_low20_11 = g_531_low60_20_low20_10,
    u_551_562 = r_551_561,
    v_551_562 = s_551_561,
    g_531_low60_20_low20_11 * 2 = g_531_low60_20_low20_10 - f_531_low60_20_low20_10,
    r_551_562 * 2 = r_551_561 - u_551_561,
    s_551_562 * 2 = s_551_561 - v_551_561
&&
    true
;

{
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_11 + u_551_562 * (const 64 (2**21)) + v_551_562 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_11 + r_551_562 * (const 64 (2**21)) + s_551_562 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_11,
    f_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_11,
    g_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 562)) <=s delta, delta <=s (const 64 (1 + 2*562)),
    (const 64 (-(2**20))) <=s u_551_562, u_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_562, v_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_562, r_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_562, s_551_562 <=s (const 64 ((2**20))),
    u_551_562 + v_551_562 <=s (const 64 (2**20)),
    u_551_562 - v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 + v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 - v_551_562 <=s (const 64 (2**20)),
    r_551_562 + s_551_562 <=s (const 64 (2**20)),
    r_551_562 - s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 + s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 - s_551_562 <=s (const 64 (2**20)),
    u_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_551_562 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_562_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_11,
sint64 g_531_low60_20_low20_11,
sint64 f_531_low60_20_low20_12,
sint64 g_531_low60_20_low20_12,
sint64 u_551_562,
sint64 v_551_562,
sint64 r_551_562,
sint64 s_551_562,
sint64 u_551_563,
sint64 v_551_563,
sint64 r_551_563,
sint64 s_551_563,
bit ne
)={
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (-(2**20)),
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (-(2**20))
&&
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (const 64 (-(2**20))),
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_11 + u_551_562 * (const 64 (2**21)) + v_551_562 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_11 + r_551_562 * (const 64 (2**21)) + s_551_562 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_11,
    f_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_11,
    g_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 562)) <=s delta, delta <=s (const 64 (1 + 2*562)),
    (const 64 (-(2**20))) <=s u_551_562, u_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_562, v_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_562, r_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_562, s_551_562 <=s (const 64 ((2**20))),
    u_551_562 + v_551_562 <=s (const 64 (2**20)),
    u_551_562 - v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 + v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 - v_551_562 <=s (const 64 (2**20)),
    r_551_562 + s_551_562 <=s (const 64 (2**20)),
    r_551_562 - s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 + s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 - s_551_562 <=s (const 64 (2**20)),
    u_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_551_562 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise a
assume
g_531_low60_20_low20_11 = 0 (mod 2)
&&
g_531_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_12 f_531_low60_20_low20_11;
mov u_551_563 u_551_562;
mov v_551_563 v_551_562;

asr g_531_low60_20_low20_12 g_531_low60_20_low20_11 1;
asr r_551_563 r_551_562 1;
asr s_551_563 s_551_562 1;
assert
    true
&&
    f_531_low60_20_low20_12 = f_531_low60_20_low20_11,
    u_551_563 = u_551_562,
    v_551_563 = v_551_562,
    g_531_low60_20_low20_12 * (const 64 2) = g_531_low60_20_low20_11,
    r_551_563 * (const 64 2) = r_551_562,
    s_551_563 * (const 64 2) = s_551_562
;

assume
    f_531_low60_20_low20_12 = f_531_low60_20_low20_11,
    u_551_563 = u_551_562,
    v_551_563 = v_551_562,
    g_531_low60_20_low20_12 * 2 = g_531_low60_20_low20_11,
    r_551_563 * 2 = r_551_562,
    s_551_563 * 2 = s_551_562
&&
    true
;

{
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_12 + u_551_563 * (const 64 (2**21)) + v_551_563 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_12 + r_551_563 * (const 64 (2**21)) + s_551_563 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_12,
    f_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_12,
    g_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 563)) <=s delta, delta <=s (const 64 (1 + 2*563)),
    (const 64 (-(2**20))) <=s u_551_563, u_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_563, v_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_563, r_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_563, s_551_563 <=s (const 64 ((2**20))),
    u_551_563 + v_551_563 <=s (const 64 (2**20)),
    u_551_563 - v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 + v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 - v_551_563 <=s (const 64 (2**20)),
    r_551_563 + s_551_563 <=s (const 64 (2**20)),
    r_551_563 - s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 + s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 - s_551_563 <=s (const 64 (2**20)),
    u_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_551_563 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_562_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_11,
sint64 g_531_low60_20_low20_11,
sint64 f_531_low60_20_low20_12,
sint64 g_531_low60_20_low20_12,
sint64 u_551_562,
sint64 v_551_562,
sint64 r_551_562,
sint64 s_551_562,
sint64 u_551_563,
sint64 v_551_563,
sint64 r_551_563,
sint64 s_551_563,
bit ne
)={
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (-(2**20)),
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (-(2**20))
&&
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (const 64 (-(2**20))),
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_11 + u_551_562 * (const 64 (2**21)) + v_551_562 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_11 + r_551_562 * (const 64 (2**21)) + s_551_562 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_11,
    f_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_11,
    g_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 562)) <=s delta, delta <=s (const 64 (1 + 2*562)),
    (const 64 (-(2**20))) <=s u_551_562, u_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_562, v_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_562, r_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_562, s_551_562 <=s (const 64 ((2**20))),
    u_551_562 + v_551_562 <=s (const 64 (2**20)),
    u_551_562 - v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 + v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 - v_551_562 <=s (const 64 (2**20)),
    r_551_562 + s_551_562 <=s (const 64 (2**20)),
    r_551_562 - s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 + s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 - s_551_562 <=s (const 64 (2**20)),
    u_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_551_562 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise b
assume
g_531_low60_20_low20_11 = 1 (mod 2)
&&
g_531_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_12 f_531_low60_20_low20_11;
mov u_551_563 u_551_562;
mov v_551_563 v_551_562;

add g_531_low60_20_low20_12 g_531_low60_20_low20_11 f_531_low60_20_low20_11;
asr g_531_low60_20_low20_12 g_531_low60_20_low20_12 1;
add r_551_563 r_551_562 u_551_562;
asr r_551_563 r_551_563 1;
add s_551_563 s_551_562 v_551_562;
asr s_551_563 s_551_563 1;
assert
    true
&&
    f_531_low60_20_low20_12 = f_531_low60_20_low20_11,
    u_551_563 = u_551_562,
    v_551_563 = v_551_562,
    g_531_low60_20_low20_12 * (const 64 2) = g_531_low60_20_low20_11 + f_531_low60_20_low20_11,
    r_551_563 * (const 64 2) = r_551_562 + u_551_562,
    s_551_563 * (const 64 2) = s_551_562 + v_551_562
;

assume
    f_531_low60_20_low20_12 = f_531_low60_20_low20_11,
    u_551_563 = u_551_562,
    v_551_563 = v_551_562,
    g_531_low60_20_low20_12 * 2 = g_531_low60_20_low20_11 + f_531_low60_20_low20_11,
    r_551_563 * 2 = r_551_562 + u_551_562,
    s_551_563 * 2 = s_551_562 + v_551_562
&&
    true
;

{
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_12 + u_551_563 * (const 64 (2**21)) + v_551_563 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_12 + r_551_563 * (const 64 (2**21)) + s_551_563 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_12,
    f_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_12,
    g_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 563)) <=s delta, delta <=s (const 64 (1 + 2*563)),
    (const 64 (-(2**20))) <=s u_551_563, u_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_563, v_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_563, r_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_563, s_551_563 <=s (const 64 ((2**20))),
    u_551_563 + v_551_563 <=s (const 64 (2**20)),
    u_551_563 - v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 + v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 - v_551_563 <=s (const 64 (2**20)),
    r_551_563 + s_551_563 <=s (const 64 (2**20)),
    r_551_563 - s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 + s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 - s_551_563 <=s (const 64 (2**20)),
    u_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_551_563 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_562_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_11,
sint64 g_531_low60_20_low20_11,
sint64 f_531_low60_20_low20_12,
sint64 g_531_low60_20_low20_12,
sint64 u_551_562,
sint64 v_551_562,
sint64 r_551_562,
sint64 s_551_562,
sint64 u_551_563,
sint64 v_551_563,
sint64 r_551_563,
sint64 s_551_563,
bit ne
)={
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (-(2**20)),
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (-(2**20))
&&
    u_551_562 * f_531_low60_20_low20_0 + v_551_562 * g_531_low60_20_low20_0 = f_531_low60_20_low20_11 * (const 64 (-(2**20))),
    r_551_562 * f_531_low60_20_low20_0 + s_551_562 * g_531_low60_20_low20_0 = g_531_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_11 + u_551_562 * (const 64 (2**21)) + v_551_562 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_11 + r_551_562 * (const 64 (2**21)) + s_551_562 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_11,
    f_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_11,
    g_531_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 562)) <=s delta, delta <=s (const 64 (1 + 2*562)),
    (const 64 (-(2**20))) <=s u_551_562, u_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_562, v_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_562, r_551_562 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_562, s_551_562 <=s (const 64 ((2**20))),
    u_551_562 + v_551_562 <=s (const 64 (2**20)),
    u_551_562 - v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 + v_551_562 <=s (const 64 (2**20)),
    (const 64 0) - u_551_562 - v_551_562 <=s (const 64 (2**20)),
    r_551_562 + s_551_562 <=s (const 64 (2**20)),
    r_551_562 - s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 + s_551_562 <=s (const 64 (2**20)),
    (const 64 0) - r_551_562 - s_551_562 <=s (const 64 (2**20)),
    u_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_551_562 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_551_562 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step31

// premise c
assume
g_531_low60_20_low20_11 = 1 (mod 2)
&&
g_531_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_12 g_531_low60_20_low20_11;
mov u_551_563 r_551_562;
mov v_551_563 s_551_562;

subs dc g_531_low60_20_low20_12 g_531_low60_20_low20_11 f_531_low60_20_low20_11;
asr g_531_low60_20_low20_12 g_531_low60_20_low20_12 1;
subs dc r_551_563 r_551_562 u_551_562;
asr r_551_563 r_551_563 1;
subs dc s_551_563 s_551_562 v_551_562;
asr s_551_563 s_551_563 1;
assert
    true
&&
    f_531_low60_20_low20_12 = g_531_low60_20_low20_11,
    u_551_563 = r_551_562,
    v_551_563 = s_551_562,
    g_531_low60_20_low20_12 * (const 64 2) = g_531_low60_20_low20_11 - f_531_low60_20_low20_11,
    r_551_563 * (const 64 2) = r_551_562 - u_551_562,
    s_551_563 * (const 64 2) = s_551_562 - v_551_562
;

assume
    f_531_low60_20_low20_12 = g_531_low60_20_low20_11,
    u_551_563 = r_551_562,
    v_551_563 = s_551_562,
    g_531_low60_20_low20_12 * 2 = g_531_low60_20_low20_11 - f_531_low60_20_low20_11,
    r_551_563 * 2 = r_551_562 - u_551_562,
    s_551_563 * 2 = s_551_562 - v_551_562
&&
    true
;

{
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_12 + u_551_563 * (const 64 (2**21)) + v_551_563 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_12 + r_551_563 * (const 64 (2**21)) + s_551_563 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_12,
    f_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_12,
    g_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 563)) <=s delta, delta <=s (const 64 (1 + 2*563)),
    (const 64 (-(2**20))) <=s u_551_563, u_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_563, v_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_563, r_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_563, s_551_563 <=s (const 64 ((2**20))),
    u_551_563 + v_551_563 <=s (const 64 (2**20)),
    u_551_563 - v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 + v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 - v_551_563 <=s (const 64 (2**20)),
    r_551_563 + s_551_563 <=s (const 64 (2**20)),
    r_551_563 - s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 + s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 - s_551_563 <=s (const 64 (2**20)),
    u_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_551_563 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_563_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_12,
sint64 g_531_low60_20_low20_12,
sint64 f_531_low60_20_low20_13,
sint64 g_531_low60_20_low20_13,
sint64 u_551_563,
sint64 v_551_563,
sint64 r_551_563,
sint64 s_551_563,
sint64 u_551_564,
sint64 v_551_564,
sint64 r_551_564,
sint64 s_551_564,
bit ne
)={
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (-(2**20)),
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (-(2**20))
&&
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (const 64 (-(2**20))),
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_12 + u_551_563 * (const 64 (2**21)) + v_551_563 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_12 + r_551_563 * (const 64 (2**21)) + s_551_563 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_12,
    f_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_12,
    g_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 563)) <=s delta, delta <=s (const 64 (1 + 2*563)),
    (const 64 (-(2**20))) <=s u_551_563, u_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_563, v_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_563, r_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_563, s_551_563 <=s (const 64 ((2**20))),
    u_551_563 + v_551_563 <=s (const 64 (2**20)),
    u_551_563 - v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 + v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 - v_551_563 <=s (const 64 (2**20)),
    r_551_563 + s_551_563 <=s (const 64 (2**20)),
    r_551_563 - s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 + s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 - s_551_563 <=s (const 64 (2**20)),
    u_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_551_563 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise a
assume
g_531_low60_20_low20_12 = 0 (mod 2)
&&
g_531_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_13 f_531_low60_20_low20_12;
mov u_551_564 u_551_563;
mov v_551_564 v_551_563;

asr g_531_low60_20_low20_13 g_531_low60_20_low20_12 1;
asr r_551_564 r_551_563 1;
asr s_551_564 s_551_563 1;
assert
    true
&&
    f_531_low60_20_low20_13 = f_531_low60_20_low20_12,
    u_551_564 = u_551_563,
    v_551_564 = v_551_563,
    g_531_low60_20_low20_13 * (const 64 2) = g_531_low60_20_low20_12,
    r_551_564 * (const 64 2) = r_551_563,
    s_551_564 * (const 64 2) = s_551_563
;

assume
    f_531_low60_20_low20_13 = f_531_low60_20_low20_12,
    u_551_564 = u_551_563,
    v_551_564 = v_551_563,
    g_531_low60_20_low20_13 * 2 = g_531_low60_20_low20_12,
    r_551_564 * 2 = r_551_563,
    s_551_564 * 2 = s_551_563
&&
    true
;

{
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_13 + u_551_564 * (const 64 (2**21)) + v_551_564 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_13 + r_551_564 * (const 64 (2**21)) + s_551_564 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_13,
    f_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_13,
    g_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 564)) <=s delta, delta <=s (const 64 (1 + 2*564)),
    (const 64 (-(2**20))) <=s u_551_564, u_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_564, v_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_564, r_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_564, s_551_564 <=s (const 64 ((2**20))),
    u_551_564 + v_551_564 <=s (const 64 (2**20)),
    u_551_564 - v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 + v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 - v_551_564 <=s (const 64 (2**20)),
    r_551_564 + s_551_564 <=s (const 64 (2**20)),
    r_551_564 - s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 + s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 - s_551_564 <=s (const 64 (2**20)),
    u_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_551_564 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_563_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_12,
sint64 g_531_low60_20_low20_12,
sint64 f_531_low60_20_low20_13,
sint64 g_531_low60_20_low20_13,
sint64 u_551_563,
sint64 v_551_563,
sint64 r_551_563,
sint64 s_551_563,
sint64 u_551_564,
sint64 v_551_564,
sint64 r_551_564,
sint64 s_551_564,
bit ne
)={
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (-(2**20)),
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (-(2**20))
&&
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (const 64 (-(2**20))),
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_12 + u_551_563 * (const 64 (2**21)) + v_551_563 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_12 + r_551_563 * (const 64 (2**21)) + s_551_563 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_12,
    f_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_12,
    g_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 563)) <=s delta, delta <=s (const 64 (1 + 2*563)),
    (const 64 (-(2**20))) <=s u_551_563, u_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_563, v_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_563, r_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_563, s_551_563 <=s (const 64 ((2**20))),
    u_551_563 + v_551_563 <=s (const 64 (2**20)),
    u_551_563 - v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 + v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 - v_551_563 <=s (const 64 (2**20)),
    r_551_563 + s_551_563 <=s (const 64 (2**20)),
    r_551_563 - s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 + s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 - s_551_563 <=s (const 64 (2**20)),
    u_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_551_563 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise b
assume
g_531_low60_20_low20_12 = 1 (mod 2)
&&
g_531_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_13 f_531_low60_20_low20_12;
mov u_551_564 u_551_563;
mov v_551_564 v_551_563;

add g_531_low60_20_low20_13 g_531_low60_20_low20_12 f_531_low60_20_low20_12;
asr g_531_low60_20_low20_13 g_531_low60_20_low20_13 1;
add r_551_564 r_551_563 u_551_563;
asr r_551_564 r_551_564 1;
add s_551_564 s_551_563 v_551_563;
asr s_551_564 s_551_564 1;
assert
    true
&&
    f_531_low60_20_low20_13 = f_531_low60_20_low20_12,
    u_551_564 = u_551_563,
    v_551_564 = v_551_563,
    g_531_low60_20_low20_13 * (const 64 2) = g_531_low60_20_low20_12 + f_531_low60_20_low20_12,
    r_551_564 * (const 64 2) = r_551_563 + u_551_563,
    s_551_564 * (const 64 2) = s_551_563 + v_551_563
;

assume
    f_531_low60_20_low20_13 = f_531_low60_20_low20_12,
    u_551_564 = u_551_563,
    v_551_564 = v_551_563,
    g_531_low60_20_low20_13 * 2 = g_531_low60_20_low20_12 + f_531_low60_20_low20_12,
    r_551_564 * 2 = r_551_563 + u_551_563,
    s_551_564 * 2 = s_551_563 + v_551_563
&&
    true
;

{
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_13 + u_551_564 * (const 64 (2**21)) + v_551_564 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_13 + r_551_564 * (const 64 (2**21)) + s_551_564 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_13,
    f_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_13,
    g_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 564)) <=s delta, delta <=s (const 64 (1 + 2*564)),
    (const 64 (-(2**20))) <=s u_551_564, u_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_564, v_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_564, r_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_564, s_551_564 <=s (const 64 ((2**20))),
    u_551_564 + v_551_564 <=s (const 64 (2**20)),
    u_551_564 - v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 + v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 - v_551_564 <=s (const 64 (2**20)),
    r_551_564 + s_551_564 <=s (const 64 (2**20)),
    r_551_564 - s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 + s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 - s_551_564 <=s (const 64 (2**20)),
    u_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_551_564 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_563_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_12,
sint64 g_531_low60_20_low20_12,
sint64 f_531_low60_20_low20_13,
sint64 g_531_low60_20_low20_13,
sint64 u_551_563,
sint64 v_551_563,
sint64 r_551_563,
sint64 s_551_563,
sint64 u_551_564,
sint64 v_551_564,
sint64 r_551_564,
sint64 s_551_564,
bit ne
)={
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (-(2**20)),
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (-(2**20))
&&
    u_551_563 * f_531_low60_20_low20_0 + v_551_563 * g_531_low60_20_low20_0 = f_531_low60_20_low20_12 * (const 64 (-(2**20))),
    r_551_563 * f_531_low60_20_low20_0 + s_551_563 * g_531_low60_20_low20_0 = g_531_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_12 + u_551_563 * (const 64 (2**21)) + v_551_563 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_12 + r_551_563 * (const 64 (2**21)) + s_551_563 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_12,
    f_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_12,
    g_531_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 563)) <=s delta, delta <=s (const 64 (1 + 2*563)),
    (const 64 (-(2**20))) <=s u_551_563, u_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_563, v_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_563, r_551_563 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_563, s_551_563 <=s (const 64 ((2**20))),
    u_551_563 + v_551_563 <=s (const 64 (2**20)),
    u_551_563 - v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 + v_551_563 <=s (const 64 (2**20)),
    (const 64 0) - u_551_563 - v_551_563 <=s (const 64 (2**20)),
    r_551_563 + s_551_563 <=s (const 64 (2**20)),
    r_551_563 - s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 + s_551_563 <=s (const 64 (2**20)),
    (const 64 0) - r_551_563 - s_551_563 <=s (const 64 (2**20)),
    u_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_551_563 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_551_563 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step32

// premise c
assume
g_531_low60_20_low20_12 = 1 (mod 2)
&&
g_531_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_13 g_531_low60_20_low20_12;
mov u_551_564 r_551_563;
mov v_551_564 s_551_563;

subs dc g_531_low60_20_low20_13 g_531_low60_20_low20_12 f_531_low60_20_low20_12;
asr g_531_low60_20_low20_13 g_531_low60_20_low20_13 1;
subs dc r_551_564 r_551_563 u_551_563;
asr r_551_564 r_551_564 1;
subs dc s_551_564 s_551_563 v_551_563;
asr s_551_564 s_551_564 1;
assert
    true
&&
    f_531_low60_20_low20_13 = g_531_low60_20_low20_12,
    u_551_564 = r_551_563,
    v_551_564 = s_551_563,
    g_531_low60_20_low20_13 * (const 64 2) = g_531_low60_20_low20_12 - f_531_low60_20_low20_12,
    r_551_564 * (const 64 2) = r_551_563 - u_551_563,
    s_551_564 * (const 64 2) = s_551_563 - v_551_563
;

assume
    f_531_low60_20_low20_13 = g_531_low60_20_low20_12,
    u_551_564 = r_551_563,
    v_551_564 = s_551_563,
    g_531_low60_20_low20_13 * 2 = g_531_low60_20_low20_12 - f_531_low60_20_low20_12,
    r_551_564 * 2 = r_551_563 - u_551_563,
    s_551_564 * 2 = s_551_563 - v_551_563
&&
    true
;

{
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_13 + u_551_564 * (const 64 (2**21)) + v_551_564 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_13 + r_551_564 * (const 64 (2**21)) + s_551_564 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_13,
    f_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_13,
    g_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 564)) <=s delta, delta <=s (const 64 (1 + 2*564)),
    (const 64 (-(2**20))) <=s u_551_564, u_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_564, v_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_564, r_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_564, s_551_564 <=s (const 64 ((2**20))),
    u_551_564 + v_551_564 <=s (const 64 (2**20)),
    u_551_564 - v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 + v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 - v_551_564 <=s (const 64 (2**20)),
    r_551_564 + s_551_564 <=s (const 64 (2**20)),
    r_551_564 - s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 + s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 - s_551_564 <=s (const 64 (2**20)),
    u_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_551_564 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_564_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_13,
sint64 g_531_low60_20_low20_13,
sint64 f_531_low60_20_low20_14,
sint64 g_531_low60_20_low20_14,
sint64 u_551_564,
sint64 v_551_564,
sint64 r_551_564,
sint64 s_551_564,
sint64 u_551_565,
sint64 v_551_565,
sint64 r_551_565,
sint64 s_551_565,
bit ne
)={
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (-(2**20)),
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (-(2**20))
&&
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (const 64 (-(2**20))),
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_13 + u_551_564 * (const 64 (2**21)) + v_551_564 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_13 + r_551_564 * (const 64 (2**21)) + s_551_564 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_13,
    f_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_13,
    g_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 564)) <=s delta, delta <=s (const 64 (1 + 2*564)),
    (const 64 (-(2**20))) <=s u_551_564, u_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_564, v_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_564, r_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_564, s_551_564 <=s (const 64 ((2**20))),
    u_551_564 + v_551_564 <=s (const 64 (2**20)),
    u_551_564 - v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 + v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 - v_551_564 <=s (const 64 (2**20)),
    r_551_564 + s_551_564 <=s (const 64 (2**20)),
    r_551_564 - s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 + s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 - s_551_564 <=s (const 64 (2**20)),
    u_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_551_564 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise a
assume
g_531_low60_20_low20_13 = 0 (mod 2)
&&
g_531_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_14 f_531_low60_20_low20_13;
mov u_551_565 u_551_564;
mov v_551_565 v_551_564;

asr g_531_low60_20_low20_14 g_531_low60_20_low20_13 1;
asr r_551_565 r_551_564 1;
asr s_551_565 s_551_564 1;
assert
    true
&&
    f_531_low60_20_low20_14 = f_531_low60_20_low20_13,
    u_551_565 = u_551_564,
    v_551_565 = v_551_564,
    g_531_low60_20_low20_14 * (const 64 2) = g_531_low60_20_low20_13,
    r_551_565 * (const 64 2) = r_551_564,
    s_551_565 * (const 64 2) = s_551_564
;

assume
    f_531_low60_20_low20_14 = f_531_low60_20_low20_13,
    u_551_565 = u_551_564,
    v_551_565 = v_551_564,
    g_531_low60_20_low20_14 * 2 = g_531_low60_20_low20_13,
    r_551_565 * 2 = r_551_564,
    s_551_565 * 2 = s_551_564
&&
    true
;

{
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_14 + u_551_565 * (const 64 (2**21)) + v_551_565 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_14 + r_551_565 * (const 64 (2**21)) + s_551_565 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_14,
    f_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_14,
    g_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 565)) <=s delta, delta <=s (const 64 (1 + 2*565)),
    (const 64 (-(2**20))) <=s u_551_565, u_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_565, v_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_565, r_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_565, s_551_565 <=s (const 64 ((2**20))),
    u_551_565 + v_551_565 <=s (const 64 (2**20)),
    u_551_565 - v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 + v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 - v_551_565 <=s (const 64 (2**20)),
    r_551_565 + s_551_565 <=s (const 64 (2**20)),
    r_551_565 - s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 + s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 - s_551_565 <=s (const 64 (2**20)),
    u_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_551_565 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_564_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_13,
sint64 g_531_low60_20_low20_13,
sint64 f_531_low60_20_low20_14,
sint64 g_531_low60_20_low20_14,
sint64 u_551_564,
sint64 v_551_564,
sint64 r_551_564,
sint64 s_551_564,
sint64 u_551_565,
sint64 v_551_565,
sint64 r_551_565,
sint64 s_551_565,
bit ne
)={
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (-(2**20)),
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (-(2**20))
&&
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (const 64 (-(2**20))),
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_13 + u_551_564 * (const 64 (2**21)) + v_551_564 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_13 + r_551_564 * (const 64 (2**21)) + s_551_564 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_13,
    f_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_13,
    g_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 564)) <=s delta, delta <=s (const 64 (1 + 2*564)),
    (const 64 (-(2**20))) <=s u_551_564, u_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_564, v_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_564, r_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_564, s_551_564 <=s (const 64 ((2**20))),
    u_551_564 + v_551_564 <=s (const 64 (2**20)),
    u_551_564 - v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 + v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 - v_551_564 <=s (const 64 (2**20)),
    r_551_564 + s_551_564 <=s (const 64 (2**20)),
    r_551_564 - s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 + s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 - s_551_564 <=s (const 64 (2**20)),
    u_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_551_564 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise b
assume
g_531_low60_20_low20_13 = 1 (mod 2)
&&
g_531_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_14 f_531_low60_20_low20_13;
mov u_551_565 u_551_564;
mov v_551_565 v_551_564;

add g_531_low60_20_low20_14 g_531_low60_20_low20_13 f_531_low60_20_low20_13;
asr g_531_low60_20_low20_14 g_531_low60_20_low20_14 1;
add r_551_565 r_551_564 u_551_564;
asr r_551_565 r_551_565 1;
add s_551_565 s_551_564 v_551_564;
asr s_551_565 s_551_565 1;
assert
    true
&&
    f_531_low60_20_low20_14 = f_531_low60_20_low20_13,
    u_551_565 = u_551_564,
    v_551_565 = v_551_564,
    g_531_low60_20_low20_14 * (const 64 2) = g_531_low60_20_low20_13 + f_531_low60_20_low20_13,
    r_551_565 * (const 64 2) = r_551_564 + u_551_564,
    s_551_565 * (const 64 2) = s_551_564 + v_551_564
;

assume
    f_531_low60_20_low20_14 = f_531_low60_20_low20_13,
    u_551_565 = u_551_564,
    v_551_565 = v_551_564,
    g_531_low60_20_low20_14 * 2 = g_531_low60_20_low20_13 + f_531_low60_20_low20_13,
    r_551_565 * 2 = r_551_564 + u_551_564,
    s_551_565 * 2 = s_551_564 + v_551_564
&&
    true
;

{
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_14 + u_551_565 * (const 64 (2**21)) + v_551_565 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_14 + r_551_565 * (const 64 (2**21)) + s_551_565 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_14,
    f_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_14,
    g_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 565)) <=s delta, delta <=s (const 64 (1 + 2*565)),
    (const 64 (-(2**20))) <=s u_551_565, u_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_565, v_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_565, r_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_565, s_551_565 <=s (const 64 ((2**20))),
    u_551_565 + v_551_565 <=s (const 64 (2**20)),
    u_551_565 - v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 + v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 - v_551_565 <=s (const 64 (2**20)),
    r_551_565 + s_551_565 <=s (const 64 (2**20)),
    r_551_565 - s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 + s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 - s_551_565 <=s (const 64 (2**20)),
    u_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_551_565 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_564_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_13,
sint64 g_531_low60_20_low20_13,
sint64 f_531_low60_20_low20_14,
sint64 g_531_low60_20_low20_14,
sint64 u_551_564,
sint64 v_551_564,
sint64 r_551_564,
sint64 s_551_564,
sint64 u_551_565,
sint64 v_551_565,
sint64 r_551_565,
sint64 s_551_565,
bit ne
)={
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (-(2**20)),
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (-(2**20))
&&
    u_551_564 * f_531_low60_20_low20_0 + v_551_564 * g_531_low60_20_low20_0 = f_531_low60_20_low20_13 * (const 64 (-(2**20))),
    r_551_564 * f_531_low60_20_low20_0 + s_551_564 * g_531_low60_20_low20_0 = g_531_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_13 + u_551_564 * (const 64 (2**21)) + v_551_564 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_13 + r_551_564 * (const 64 (2**21)) + s_551_564 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_13,
    f_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_13,
    g_531_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 564)) <=s delta, delta <=s (const 64 (1 + 2*564)),
    (const 64 (-(2**20))) <=s u_551_564, u_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_564, v_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_564, r_551_564 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_564, s_551_564 <=s (const 64 ((2**20))),
    u_551_564 + v_551_564 <=s (const 64 (2**20)),
    u_551_564 - v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 + v_551_564 <=s (const 64 (2**20)),
    (const 64 0) - u_551_564 - v_551_564 <=s (const 64 (2**20)),
    r_551_564 + s_551_564 <=s (const 64 (2**20)),
    r_551_564 - s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 + s_551_564 <=s (const 64 (2**20)),
    (const 64 0) - r_551_564 - s_551_564 <=s (const 64 (2**20)),
    u_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_551_564 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_551_564 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step33

// premise c
assume
g_531_low60_20_low20_13 = 1 (mod 2)
&&
g_531_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_14 g_531_low60_20_low20_13;
mov u_551_565 r_551_564;
mov v_551_565 s_551_564;

subs dc g_531_low60_20_low20_14 g_531_low60_20_low20_13 f_531_low60_20_low20_13;
asr g_531_low60_20_low20_14 g_531_low60_20_low20_14 1;
subs dc r_551_565 r_551_564 u_551_564;
asr r_551_565 r_551_565 1;
subs dc s_551_565 s_551_564 v_551_564;
asr s_551_565 s_551_565 1;
assert
    true
&&
    f_531_low60_20_low20_14 = g_531_low60_20_low20_13,
    u_551_565 = r_551_564,
    v_551_565 = s_551_564,
    g_531_low60_20_low20_14 * (const 64 2) = g_531_low60_20_low20_13 - f_531_low60_20_low20_13,
    r_551_565 * (const 64 2) = r_551_564 - u_551_564,
    s_551_565 * (const 64 2) = s_551_564 - v_551_564
;

assume
    f_531_low60_20_low20_14 = g_531_low60_20_low20_13,
    u_551_565 = r_551_564,
    v_551_565 = s_551_564,
    g_531_low60_20_low20_14 * 2 = g_531_low60_20_low20_13 - f_531_low60_20_low20_13,
    r_551_565 * 2 = r_551_564 - u_551_564,
    s_551_565 * 2 = s_551_564 - v_551_564
&&
    true
;

{
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_14 + u_551_565 * (const 64 (2**21)) + v_551_565 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_14 + r_551_565 * (const 64 (2**21)) + s_551_565 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_14,
    f_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_14,
    g_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 565)) <=s delta, delta <=s (const 64 (1 + 2*565)),
    (const 64 (-(2**20))) <=s u_551_565, u_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_565, v_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_565, r_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_565, s_551_565 <=s (const 64 ((2**20))),
    u_551_565 + v_551_565 <=s (const 64 (2**20)),
    u_551_565 - v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 + v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 - v_551_565 <=s (const 64 (2**20)),
    r_551_565 + s_551_565 <=s (const 64 (2**20)),
    r_551_565 - s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 + s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 - s_551_565 <=s (const 64 (2**20)),
    u_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_551_565 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_565_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_14,
sint64 g_531_low60_20_low20_14,
sint64 f_531_low60_20_low20_15,
sint64 g_531_low60_20_low20_15,
sint64 u_551_565,
sint64 v_551_565,
sint64 r_551_565,
sint64 s_551_565,
sint64 u_551_566,
sint64 v_551_566,
sint64 r_551_566,
sint64 s_551_566,
bit ne
)={
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (-(2**20)),
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (-(2**20))
&&
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (const 64 (-(2**20))),
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_14 + u_551_565 * (const 64 (2**21)) + v_551_565 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_14 + r_551_565 * (const 64 (2**21)) + s_551_565 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_14,
    f_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_14,
    g_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 565)) <=s delta, delta <=s (const 64 (1 + 2*565)),
    (const 64 (-(2**20))) <=s u_551_565, u_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_565, v_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_565, r_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_565, s_551_565 <=s (const 64 ((2**20))),
    u_551_565 + v_551_565 <=s (const 64 (2**20)),
    u_551_565 - v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 + v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 - v_551_565 <=s (const 64 (2**20)),
    r_551_565 + s_551_565 <=s (const 64 (2**20)),
    r_551_565 - s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 + s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 - s_551_565 <=s (const 64 (2**20)),
    u_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_551_565 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise a
assume
g_531_low60_20_low20_14 = 0 (mod 2)
&&
g_531_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_15 f_531_low60_20_low20_14;
mov u_551_566 u_551_565;
mov v_551_566 v_551_565;

asr g_531_low60_20_low20_15 g_531_low60_20_low20_14 1;
asr r_551_566 r_551_565 1;
asr s_551_566 s_551_565 1;
assert
    true
&&
    f_531_low60_20_low20_15 = f_531_low60_20_low20_14,
    u_551_566 = u_551_565,
    v_551_566 = v_551_565,
    g_531_low60_20_low20_15 * (const 64 2) = g_531_low60_20_low20_14,
    r_551_566 * (const 64 2) = r_551_565,
    s_551_566 * (const 64 2) = s_551_565
;

assume
    f_531_low60_20_low20_15 = f_531_low60_20_low20_14,
    u_551_566 = u_551_565,
    v_551_566 = v_551_565,
    g_531_low60_20_low20_15 * 2 = g_531_low60_20_low20_14,
    r_551_566 * 2 = r_551_565,
    s_551_566 * 2 = s_551_565
&&
    true
;

{
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_15 + u_551_566 * (const 64 (2**21)) + v_551_566 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_15 + r_551_566 * (const 64 (2**21)) + s_551_566 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_15,
    f_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_15,
    g_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 566)) <=s delta, delta <=s (const 64 (1 + 2*566)),
    (const 64 (-(2**20))) <=s u_551_566, u_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_566, v_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_566, r_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_566, s_551_566 <=s (const 64 ((2**20))),
    u_551_566 + v_551_566 <=s (const 64 (2**20)),
    u_551_566 - v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 + v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 - v_551_566 <=s (const 64 (2**20)),
    r_551_566 + s_551_566 <=s (const 64 (2**20)),
    r_551_566 - s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 + s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 - s_551_566 <=s (const 64 (2**20)),
    u_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_551_566 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_565_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_14,
sint64 g_531_low60_20_low20_14,
sint64 f_531_low60_20_low20_15,
sint64 g_531_low60_20_low20_15,
sint64 u_551_565,
sint64 v_551_565,
sint64 r_551_565,
sint64 s_551_565,
sint64 u_551_566,
sint64 v_551_566,
sint64 r_551_566,
sint64 s_551_566,
bit ne
)={
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (-(2**20)),
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (-(2**20))
&&
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (const 64 (-(2**20))),
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_14 + u_551_565 * (const 64 (2**21)) + v_551_565 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_14 + r_551_565 * (const 64 (2**21)) + s_551_565 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_14,
    f_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_14,
    g_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 565)) <=s delta, delta <=s (const 64 (1 + 2*565)),
    (const 64 (-(2**20))) <=s u_551_565, u_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_565, v_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_565, r_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_565, s_551_565 <=s (const 64 ((2**20))),
    u_551_565 + v_551_565 <=s (const 64 (2**20)),
    u_551_565 - v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 + v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 - v_551_565 <=s (const 64 (2**20)),
    r_551_565 + s_551_565 <=s (const 64 (2**20)),
    r_551_565 - s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 + s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 - s_551_565 <=s (const 64 (2**20)),
    u_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_551_565 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise b
assume
g_531_low60_20_low20_14 = 1 (mod 2)
&&
g_531_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_15 f_531_low60_20_low20_14;
mov u_551_566 u_551_565;
mov v_551_566 v_551_565;

add g_531_low60_20_low20_15 g_531_low60_20_low20_14 f_531_low60_20_low20_14;
asr g_531_low60_20_low20_15 g_531_low60_20_low20_15 1;
add r_551_566 r_551_565 u_551_565;
asr r_551_566 r_551_566 1;
add s_551_566 s_551_565 v_551_565;
asr s_551_566 s_551_566 1;
assert
    true
&&
    f_531_low60_20_low20_15 = f_531_low60_20_low20_14,
    u_551_566 = u_551_565,
    v_551_566 = v_551_565,
    g_531_low60_20_low20_15 * (const 64 2) = g_531_low60_20_low20_14 + f_531_low60_20_low20_14,
    r_551_566 * (const 64 2) = r_551_565 + u_551_565,
    s_551_566 * (const 64 2) = s_551_565 + v_551_565
;

assume
    f_531_low60_20_low20_15 = f_531_low60_20_low20_14,
    u_551_566 = u_551_565,
    v_551_566 = v_551_565,
    g_531_low60_20_low20_15 * 2 = g_531_low60_20_low20_14 + f_531_low60_20_low20_14,
    r_551_566 * 2 = r_551_565 + u_551_565,
    s_551_566 * 2 = s_551_565 + v_551_565
&&
    true
;

{
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_15 + u_551_566 * (const 64 (2**21)) + v_551_566 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_15 + r_551_566 * (const 64 (2**21)) + s_551_566 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_15,
    f_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_15,
    g_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 566)) <=s delta, delta <=s (const 64 (1 + 2*566)),
    (const 64 (-(2**20))) <=s u_551_566, u_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_566, v_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_566, r_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_566, s_551_566 <=s (const 64 ((2**20))),
    u_551_566 + v_551_566 <=s (const 64 (2**20)),
    u_551_566 - v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 + v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 - v_551_566 <=s (const 64 (2**20)),
    r_551_566 + s_551_566 <=s (const 64 (2**20)),
    r_551_566 - s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 + s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 - s_551_566 <=s (const 64 (2**20)),
    u_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_551_566 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_565_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_14,
sint64 g_531_low60_20_low20_14,
sint64 f_531_low60_20_low20_15,
sint64 g_531_low60_20_low20_15,
sint64 u_551_565,
sint64 v_551_565,
sint64 r_551_565,
sint64 s_551_565,
sint64 u_551_566,
sint64 v_551_566,
sint64 r_551_566,
sint64 s_551_566,
bit ne
)={
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (-(2**20)),
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (-(2**20))
&&
    u_551_565 * f_531_low60_20_low20_0 + v_551_565 * g_531_low60_20_low20_0 = f_531_low60_20_low20_14 * (const 64 (-(2**20))),
    r_551_565 * f_531_low60_20_low20_0 + s_551_565 * g_531_low60_20_low20_0 = g_531_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_14 + u_551_565 * (const 64 (2**21)) + v_551_565 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_14 + r_551_565 * (const 64 (2**21)) + s_551_565 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_14,
    f_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_14,
    g_531_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 565)) <=s delta, delta <=s (const 64 (1 + 2*565)),
    (const 64 (-(2**20))) <=s u_551_565, u_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_565, v_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_565, r_551_565 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_565, s_551_565 <=s (const 64 ((2**20))),
    u_551_565 + v_551_565 <=s (const 64 (2**20)),
    u_551_565 - v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 + v_551_565 <=s (const 64 (2**20)),
    (const 64 0) - u_551_565 - v_551_565 <=s (const 64 (2**20)),
    r_551_565 + s_551_565 <=s (const 64 (2**20)),
    r_551_565 - s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 + s_551_565 <=s (const 64 (2**20)),
    (const 64 0) - r_551_565 - s_551_565 <=s (const 64 (2**20)),
    u_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_551_565 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_551_565 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step34

// premise c
assume
g_531_low60_20_low20_14 = 1 (mod 2)
&&
g_531_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_15 g_531_low60_20_low20_14;
mov u_551_566 r_551_565;
mov v_551_566 s_551_565;

subs dc g_531_low60_20_low20_15 g_531_low60_20_low20_14 f_531_low60_20_low20_14;
asr g_531_low60_20_low20_15 g_531_low60_20_low20_15 1;
subs dc r_551_566 r_551_565 u_551_565;
asr r_551_566 r_551_566 1;
subs dc s_551_566 s_551_565 v_551_565;
asr s_551_566 s_551_566 1;
assert
    true
&&
    f_531_low60_20_low20_15 = g_531_low60_20_low20_14,
    u_551_566 = r_551_565,
    v_551_566 = s_551_565,
    g_531_low60_20_low20_15 * (const 64 2) = g_531_low60_20_low20_14 - f_531_low60_20_low20_14,
    r_551_566 * (const 64 2) = r_551_565 - u_551_565,
    s_551_566 * (const 64 2) = s_551_565 - v_551_565
;

assume
    f_531_low60_20_low20_15 = g_531_low60_20_low20_14,
    u_551_566 = r_551_565,
    v_551_566 = s_551_565,
    g_531_low60_20_low20_15 * 2 = g_531_low60_20_low20_14 - f_531_low60_20_low20_14,
    r_551_566 * 2 = r_551_565 - u_551_565,
    s_551_566 * 2 = s_551_565 - v_551_565
&&
    true
;

{
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_15 + u_551_566 * (const 64 (2**21)) + v_551_566 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_15 + r_551_566 * (const 64 (2**21)) + s_551_566 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_15,
    f_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_15,
    g_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 566)) <=s delta, delta <=s (const 64 (1 + 2*566)),
    (const 64 (-(2**20))) <=s u_551_566, u_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_566, v_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_566, r_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_566, s_551_566 <=s (const 64 ((2**20))),
    u_551_566 + v_551_566 <=s (const 64 (2**20)),
    u_551_566 - v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 + v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 - v_551_566 <=s (const 64 (2**20)),
    r_551_566 + s_551_566 <=s (const 64 (2**20)),
    r_551_566 - s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 + s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 - s_551_566 <=s (const 64 (2**20)),
    u_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_551_566 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_566_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_15,
sint64 g_531_low60_20_low20_15,
sint64 f_531_low60_20_low20_16,
sint64 g_531_low60_20_low20_16,
sint64 u_551_566,
sint64 v_551_566,
sint64 r_551_566,
sint64 s_551_566,
sint64 u_551_567,
sint64 v_551_567,
sint64 r_551_567,
sint64 s_551_567,
bit ne
)={
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (-(2**20)),
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (-(2**20))
&&
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (const 64 (-(2**20))),
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_15 + u_551_566 * (const 64 (2**21)) + v_551_566 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_15 + r_551_566 * (const 64 (2**21)) + s_551_566 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_15,
    f_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_15,
    g_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 566)) <=s delta, delta <=s (const 64 (1 + 2*566)),
    (const 64 (-(2**20))) <=s u_551_566, u_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_566, v_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_566, r_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_566, s_551_566 <=s (const 64 ((2**20))),
    u_551_566 + v_551_566 <=s (const 64 (2**20)),
    u_551_566 - v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 + v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 - v_551_566 <=s (const 64 (2**20)),
    r_551_566 + s_551_566 <=s (const 64 (2**20)),
    r_551_566 - s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 + s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 - s_551_566 <=s (const 64 (2**20)),
    u_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_551_566 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise a
assume
g_531_low60_20_low20_15 = 0 (mod 2)
&&
g_531_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_16 f_531_low60_20_low20_15;
mov u_551_567 u_551_566;
mov v_551_567 v_551_566;

asr g_531_low60_20_low20_16 g_531_low60_20_low20_15 1;
asr r_551_567 r_551_566 1;
asr s_551_567 s_551_566 1;
assert
    true
&&
    f_531_low60_20_low20_16 = f_531_low60_20_low20_15,
    u_551_567 = u_551_566,
    v_551_567 = v_551_566,
    g_531_low60_20_low20_16 * (const 64 2) = g_531_low60_20_low20_15,
    r_551_567 * (const 64 2) = r_551_566,
    s_551_567 * (const 64 2) = s_551_566
;

assume
    f_531_low60_20_low20_16 = f_531_low60_20_low20_15,
    u_551_567 = u_551_566,
    v_551_567 = v_551_566,
    g_531_low60_20_low20_16 * 2 = g_531_low60_20_low20_15,
    r_551_567 * 2 = r_551_566,
    s_551_567 * 2 = s_551_566
&&
    true
;

{
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_16 + u_551_567 * (const 64 (2**21)) + v_551_567 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_16 + r_551_567 * (const 64 (2**21)) + s_551_567 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_16,
    f_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_16,
    g_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 567)) <=s delta, delta <=s (const 64 (1 + 2*567)),
    (const 64 (-(2**20))) <=s u_551_567, u_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_567, v_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_567, r_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_567, s_551_567 <=s (const 64 ((2**20))),
    u_551_567 + v_551_567 <=s (const 64 (2**20)),
    u_551_567 - v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 + v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 - v_551_567 <=s (const 64 (2**20)),
    r_551_567 + s_551_567 <=s (const 64 (2**20)),
    r_551_567 - s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 + s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 - s_551_567 <=s (const 64 (2**20)),
    u_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_551_567 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_566_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_15,
sint64 g_531_low60_20_low20_15,
sint64 f_531_low60_20_low20_16,
sint64 g_531_low60_20_low20_16,
sint64 u_551_566,
sint64 v_551_566,
sint64 r_551_566,
sint64 s_551_566,
sint64 u_551_567,
sint64 v_551_567,
sint64 r_551_567,
sint64 s_551_567,
bit ne
)={
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (-(2**20)),
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (-(2**20))
&&
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (const 64 (-(2**20))),
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_15 + u_551_566 * (const 64 (2**21)) + v_551_566 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_15 + r_551_566 * (const 64 (2**21)) + s_551_566 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_15,
    f_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_15,
    g_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 566)) <=s delta, delta <=s (const 64 (1 + 2*566)),
    (const 64 (-(2**20))) <=s u_551_566, u_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_566, v_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_566, r_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_566, s_551_566 <=s (const 64 ((2**20))),
    u_551_566 + v_551_566 <=s (const 64 (2**20)),
    u_551_566 - v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 + v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 - v_551_566 <=s (const 64 (2**20)),
    r_551_566 + s_551_566 <=s (const 64 (2**20)),
    r_551_566 - s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 + s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 - s_551_566 <=s (const 64 (2**20)),
    u_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_551_566 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise b
assume
g_531_low60_20_low20_15 = 1 (mod 2)
&&
g_531_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_16 f_531_low60_20_low20_15;
mov u_551_567 u_551_566;
mov v_551_567 v_551_566;

add g_531_low60_20_low20_16 g_531_low60_20_low20_15 f_531_low60_20_low20_15;
asr g_531_low60_20_low20_16 g_531_low60_20_low20_16 1;
add r_551_567 r_551_566 u_551_566;
asr r_551_567 r_551_567 1;
add s_551_567 s_551_566 v_551_566;
asr s_551_567 s_551_567 1;
assert
    true
&&
    f_531_low60_20_low20_16 = f_531_low60_20_low20_15,
    u_551_567 = u_551_566,
    v_551_567 = v_551_566,
    g_531_low60_20_low20_16 * (const 64 2) = g_531_low60_20_low20_15 + f_531_low60_20_low20_15,
    r_551_567 * (const 64 2) = r_551_566 + u_551_566,
    s_551_567 * (const 64 2) = s_551_566 + v_551_566
;

assume
    f_531_low60_20_low20_16 = f_531_low60_20_low20_15,
    u_551_567 = u_551_566,
    v_551_567 = v_551_566,
    g_531_low60_20_low20_16 * 2 = g_531_low60_20_low20_15 + f_531_low60_20_low20_15,
    r_551_567 * 2 = r_551_566 + u_551_566,
    s_551_567 * 2 = s_551_566 + v_551_566
&&
    true
;

{
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_16 + u_551_567 * (const 64 (2**21)) + v_551_567 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_16 + r_551_567 * (const 64 (2**21)) + s_551_567 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_16,
    f_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_16,
    g_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 567)) <=s delta, delta <=s (const 64 (1 + 2*567)),
    (const 64 (-(2**20))) <=s u_551_567, u_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_567, v_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_567, r_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_567, s_551_567 <=s (const 64 ((2**20))),
    u_551_567 + v_551_567 <=s (const 64 (2**20)),
    u_551_567 - v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 + v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 - v_551_567 <=s (const 64 (2**20)),
    r_551_567 + s_551_567 <=s (const 64 (2**20)),
    r_551_567 - s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 + s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 - s_551_567 <=s (const 64 (2**20)),
    u_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_551_567 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_566_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_15,
sint64 g_531_low60_20_low20_15,
sint64 f_531_low60_20_low20_16,
sint64 g_531_low60_20_low20_16,
sint64 u_551_566,
sint64 v_551_566,
sint64 r_551_566,
sint64 s_551_566,
sint64 u_551_567,
sint64 v_551_567,
sint64 r_551_567,
sint64 s_551_567,
bit ne
)={
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (-(2**20)),
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (-(2**20))
&&
    u_551_566 * f_531_low60_20_low20_0 + v_551_566 * g_531_low60_20_low20_0 = f_531_low60_20_low20_15 * (const 64 (-(2**20))),
    r_551_566 * f_531_low60_20_low20_0 + s_551_566 * g_531_low60_20_low20_0 = g_531_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_15 + u_551_566 * (const 64 (2**21)) + v_551_566 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_15 + r_551_566 * (const 64 (2**21)) + s_551_566 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_15,
    f_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_15,
    g_531_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 566)) <=s delta, delta <=s (const 64 (1 + 2*566)),
    (const 64 (-(2**20))) <=s u_551_566, u_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_566, v_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_566, r_551_566 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_566, s_551_566 <=s (const 64 ((2**20))),
    u_551_566 + v_551_566 <=s (const 64 (2**20)),
    u_551_566 - v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 + v_551_566 <=s (const 64 (2**20)),
    (const 64 0) - u_551_566 - v_551_566 <=s (const 64 (2**20)),
    r_551_566 + s_551_566 <=s (const 64 (2**20)),
    r_551_566 - s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 + s_551_566 <=s (const 64 (2**20)),
    (const 64 0) - r_551_566 - s_551_566 <=s (const 64 (2**20)),
    u_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_551_566 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_551_566 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step35

// premise c
assume
g_531_low60_20_low20_15 = 1 (mod 2)
&&
g_531_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_16 g_531_low60_20_low20_15;
mov u_551_567 r_551_566;
mov v_551_567 s_551_566;

subs dc g_531_low60_20_low20_16 g_531_low60_20_low20_15 f_531_low60_20_low20_15;
asr g_531_low60_20_low20_16 g_531_low60_20_low20_16 1;
subs dc r_551_567 r_551_566 u_551_566;
asr r_551_567 r_551_567 1;
subs dc s_551_567 s_551_566 v_551_566;
asr s_551_567 s_551_567 1;
assert
    true
&&
    f_531_low60_20_low20_16 = g_531_low60_20_low20_15,
    u_551_567 = r_551_566,
    v_551_567 = s_551_566,
    g_531_low60_20_low20_16 * (const 64 2) = g_531_low60_20_low20_15 - f_531_low60_20_low20_15,
    r_551_567 * (const 64 2) = r_551_566 - u_551_566,
    s_551_567 * (const 64 2) = s_551_566 - v_551_566
;

assume
    f_531_low60_20_low20_16 = g_531_low60_20_low20_15,
    u_551_567 = r_551_566,
    v_551_567 = s_551_566,
    g_531_low60_20_low20_16 * 2 = g_531_low60_20_low20_15 - f_531_low60_20_low20_15,
    r_551_567 * 2 = r_551_566 - u_551_566,
    s_551_567 * 2 = s_551_566 - v_551_566
&&
    true
;

{
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_16 + u_551_567 * (const 64 (2**21)) + v_551_567 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_16 + r_551_567 * (const 64 (2**21)) + s_551_567 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_16,
    f_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_16,
    g_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 567)) <=s delta, delta <=s (const 64 (1 + 2*567)),
    (const 64 (-(2**20))) <=s u_551_567, u_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_567, v_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_567, r_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_567, s_551_567 <=s (const 64 ((2**20))),
    u_551_567 + v_551_567 <=s (const 64 (2**20)),
    u_551_567 - v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 + v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 - v_551_567 <=s (const 64 (2**20)),
    r_551_567 + s_551_567 <=s (const 64 (2**20)),
    r_551_567 - s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 + s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 - s_551_567 <=s (const 64 (2**20)),
    u_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_551_567 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_567_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_16,
sint64 g_531_low60_20_low20_16,
sint64 f_531_low60_20_low20_17,
sint64 g_531_low60_20_low20_17,
sint64 u_551_567,
sint64 v_551_567,
sint64 r_551_567,
sint64 s_551_567,
sint64 u_551_568,
sint64 v_551_568,
sint64 r_551_568,
sint64 s_551_568,
bit ne
)={
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (-(2**20)),
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (-(2**20))
&&
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (const 64 (-(2**20))),
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_16 + u_551_567 * (const 64 (2**21)) + v_551_567 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_16 + r_551_567 * (const 64 (2**21)) + s_551_567 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_16,
    f_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_16,
    g_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 567)) <=s delta, delta <=s (const 64 (1 + 2*567)),
    (const 64 (-(2**20))) <=s u_551_567, u_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_567, v_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_567, r_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_567, s_551_567 <=s (const 64 ((2**20))),
    u_551_567 + v_551_567 <=s (const 64 (2**20)),
    u_551_567 - v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 + v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 - v_551_567 <=s (const 64 (2**20)),
    r_551_567 + s_551_567 <=s (const 64 (2**20)),
    r_551_567 - s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 + s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 - s_551_567 <=s (const 64 (2**20)),
    u_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_551_567 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise a
assume
g_531_low60_20_low20_16 = 0 (mod 2)
&&
g_531_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_17 f_531_low60_20_low20_16;
mov u_551_568 u_551_567;
mov v_551_568 v_551_567;

asr g_531_low60_20_low20_17 g_531_low60_20_low20_16 1;
asr r_551_568 r_551_567 1;
asr s_551_568 s_551_567 1;
assert
    true
&&
    f_531_low60_20_low20_17 = f_531_low60_20_low20_16,
    u_551_568 = u_551_567,
    v_551_568 = v_551_567,
    g_531_low60_20_low20_17 * (const 64 2) = g_531_low60_20_low20_16,
    r_551_568 * (const 64 2) = r_551_567,
    s_551_568 * (const 64 2) = s_551_567
;

assume
    f_531_low60_20_low20_17 = f_531_low60_20_low20_16,
    u_551_568 = u_551_567,
    v_551_568 = v_551_567,
    g_531_low60_20_low20_17 * 2 = g_531_low60_20_low20_16,
    r_551_568 * 2 = r_551_567,
    s_551_568 * 2 = s_551_567
&&
    true
;

{
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_17 + u_551_568 * (const 64 (2**21)) + v_551_568 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_17 + r_551_568 * (const 64 (2**21)) + s_551_568 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_17,
    f_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_17,
    g_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 568)) <=s delta, delta <=s (const 64 (1 + 2*568)),
    (const 64 (-(2**20))) <=s u_551_568, u_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_568, v_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_568, r_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_568, s_551_568 <=s (const 64 ((2**20))),
    u_551_568 + v_551_568 <=s (const 64 (2**20)),
    u_551_568 - v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 + v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 - v_551_568 <=s (const 64 (2**20)),
    r_551_568 + s_551_568 <=s (const 64 (2**20)),
    r_551_568 - s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 + s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 - s_551_568 <=s (const 64 (2**20)),
    u_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_551_568 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_567_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_16,
sint64 g_531_low60_20_low20_16,
sint64 f_531_low60_20_low20_17,
sint64 g_531_low60_20_low20_17,
sint64 u_551_567,
sint64 v_551_567,
sint64 r_551_567,
sint64 s_551_567,
sint64 u_551_568,
sint64 v_551_568,
sint64 r_551_568,
sint64 s_551_568,
bit ne
)={
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (-(2**20)),
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (-(2**20))
&&
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (const 64 (-(2**20))),
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_16 + u_551_567 * (const 64 (2**21)) + v_551_567 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_16 + r_551_567 * (const 64 (2**21)) + s_551_567 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_16,
    f_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_16,
    g_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 567)) <=s delta, delta <=s (const 64 (1 + 2*567)),
    (const 64 (-(2**20))) <=s u_551_567, u_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_567, v_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_567, r_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_567, s_551_567 <=s (const 64 ((2**20))),
    u_551_567 + v_551_567 <=s (const 64 (2**20)),
    u_551_567 - v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 + v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 - v_551_567 <=s (const 64 (2**20)),
    r_551_567 + s_551_567 <=s (const 64 (2**20)),
    r_551_567 - s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 + s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 - s_551_567 <=s (const 64 (2**20)),
    u_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_551_567 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise b
assume
g_531_low60_20_low20_16 = 1 (mod 2)
&&
g_531_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_17 f_531_low60_20_low20_16;
mov u_551_568 u_551_567;
mov v_551_568 v_551_567;

add g_531_low60_20_low20_17 g_531_low60_20_low20_16 f_531_low60_20_low20_16;
asr g_531_low60_20_low20_17 g_531_low60_20_low20_17 1;
add r_551_568 r_551_567 u_551_567;
asr r_551_568 r_551_568 1;
add s_551_568 s_551_567 v_551_567;
asr s_551_568 s_551_568 1;
assert
    true
&&
    f_531_low60_20_low20_17 = f_531_low60_20_low20_16,
    u_551_568 = u_551_567,
    v_551_568 = v_551_567,
    g_531_low60_20_low20_17 * (const 64 2) = g_531_low60_20_low20_16 + f_531_low60_20_low20_16,
    r_551_568 * (const 64 2) = r_551_567 + u_551_567,
    s_551_568 * (const 64 2) = s_551_567 + v_551_567
;

assume
    f_531_low60_20_low20_17 = f_531_low60_20_low20_16,
    u_551_568 = u_551_567,
    v_551_568 = v_551_567,
    g_531_low60_20_low20_17 * 2 = g_531_low60_20_low20_16 + f_531_low60_20_low20_16,
    r_551_568 * 2 = r_551_567 + u_551_567,
    s_551_568 * 2 = s_551_567 + v_551_567
&&
    true
;

{
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_17 + u_551_568 * (const 64 (2**21)) + v_551_568 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_17 + r_551_568 * (const 64 (2**21)) + s_551_568 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_17,
    f_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_17,
    g_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 568)) <=s delta, delta <=s (const 64 (1 + 2*568)),
    (const 64 (-(2**20))) <=s u_551_568, u_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_568, v_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_568, r_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_568, s_551_568 <=s (const 64 ((2**20))),
    u_551_568 + v_551_568 <=s (const 64 (2**20)),
    u_551_568 - v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 + v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 - v_551_568 <=s (const 64 (2**20)),
    r_551_568 + s_551_568 <=s (const 64 (2**20)),
    r_551_568 - s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 + s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 - s_551_568 <=s (const 64 (2**20)),
    u_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_551_568 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_567_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_16,
sint64 g_531_low60_20_low20_16,
sint64 f_531_low60_20_low20_17,
sint64 g_531_low60_20_low20_17,
sint64 u_551_567,
sint64 v_551_567,
sint64 r_551_567,
sint64 s_551_567,
sint64 u_551_568,
sint64 v_551_568,
sint64 r_551_568,
sint64 s_551_568,
bit ne
)={
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (-(2**20)),
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (-(2**20))
&&
    u_551_567 * f_531_low60_20_low20_0 + v_551_567 * g_531_low60_20_low20_0 = f_531_low60_20_low20_16 * (const 64 (-(2**20))),
    r_551_567 * f_531_low60_20_low20_0 + s_551_567 * g_531_low60_20_low20_0 = g_531_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_16 + u_551_567 * (const 64 (2**21)) + v_551_567 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_16 + r_551_567 * (const 64 (2**21)) + s_551_567 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_16,
    f_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_16,
    g_531_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 567)) <=s delta, delta <=s (const 64 (1 + 2*567)),
    (const 64 (-(2**20))) <=s u_551_567, u_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_567, v_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_567, r_551_567 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_567, s_551_567 <=s (const 64 ((2**20))),
    u_551_567 + v_551_567 <=s (const 64 (2**20)),
    u_551_567 - v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 + v_551_567 <=s (const 64 (2**20)),
    (const 64 0) - u_551_567 - v_551_567 <=s (const 64 (2**20)),
    r_551_567 + s_551_567 <=s (const 64 (2**20)),
    r_551_567 - s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 + s_551_567 <=s (const 64 (2**20)),
    (const 64 0) - r_551_567 - s_551_567 <=s (const 64 (2**20)),
    u_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_551_567 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_551_567 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step36

// premise c
assume
g_531_low60_20_low20_16 = 1 (mod 2)
&&
g_531_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_17 g_531_low60_20_low20_16;
mov u_551_568 r_551_567;
mov v_551_568 s_551_567;

subs dc g_531_low60_20_low20_17 g_531_low60_20_low20_16 f_531_low60_20_low20_16;
asr g_531_low60_20_low20_17 g_531_low60_20_low20_17 1;
subs dc r_551_568 r_551_567 u_551_567;
asr r_551_568 r_551_568 1;
subs dc s_551_568 s_551_567 v_551_567;
asr s_551_568 s_551_568 1;
assert
    true
&&
    f_531_low60_20_low20_17 = g_531_low60_20_low20_16,
    u_551_568 = r_551_567,
    v_551_568 = s_551_567,
    g_531_low60_20_low20_17 * (const 64 2) = g_531_low60_20_low20_16 - f_531_low60_20_low20_16,
    r_551_568 * (const 64 2) = r_551_567 - u_551_567,
    s_551_568 * (const 64 2) = s_551_567 - v_551_567
;

assume
    f_531_low60_20_low20_17 = g_531_low60_20_low20_16,
    u_551_568 = r_551_567,
    v_551_568 = s_551_567,
    g_531_low60_20_low20_17 * 2 = g_531_low60_20_low20_16 - f_531_low60_20_low20_16,
    r_551_568 * 2 = r_551_567 - u_551_567,
    s_551_568 * 2 = s_551_567 - v_551_567
&&
    true
;

{
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_17 + u_551_568 * (const 64 (2**21)) + v_551_568 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_17 + r_551_568 * (const 64 (2**21)) + s_551_568 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_17,
    f_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_17,
    g_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 568)) <=s delta, delta <=s (const 64 (1 + 2*568)),
    (const 64 (-(2**20))) <=s u_551_568, u_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_568, v_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_568, r_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_568, s_551_568 <=s (const 64 ((2**20))),
    u_551_568 + v_551_568 <=s (const 64 (2**20)),
    u_551_568 - v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 + v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 - v_551_568 <=s (const 64 (2**20)),
    r_551_568 + s_551_568 <=s (const 64 (2**20)),
    r_551_568 - s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 + s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 - s_551_568 <=s (const 64 (2**20)),
    u_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_551_568 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_568_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_17,
sint64 g_531_low60_20_low20_17,
sint64 f_531_low60_20_low20_18,
sint64 g_531_low60_20_low20_18,
sint64 u_551_568,
sint64 v_551_568,
sint64 r_551_568,
sint64 s_551_568,
sint64 u_551_569,
sint64 v_551_569,
sint64 r_551_569,
sint64 s_551_569,
bit ne
)={
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (-(2**20)),
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (-(2**20))
&&
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (const 64 (-(2**20))),
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_17 + u_551_568 * (const 64 (2**21)) + v_551_568 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_17 + r_551_568 * (const 64 (2**21)) + s_551_568 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_17,
    f_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_17,
    g_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 568)) <=s delta, delta <=s (const 64 (1 + 2*568)),
    (const 64 (-(2**20))) <=s u_551_568, u_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_568, v_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_568, r_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_568, s_551_568 <=s (const 64 ((2**20))),
    u_551_568 + v_551_568 <=s (const 64 (2**20)),
    u_551_568 - v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 + v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 - v_551_568 <=s (const 64 (2**20)),
    r_551_568 + s_551_568 <=s (const 64 (2**20)),
    r_551_568 - s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 + s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 - s_551_568 <=s (const 64 (2**20)),
    u_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_551_568 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise a
assume
g_531_low60_20_low20_17 = 0 (mod 2)
&&
g_531_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_18 f_531_low60_20_low20_17;
mov u_551_569 u_551_568;
mov v_551_569 v_551_568;

asr g_531_low60_20_low20_18 g_531_low60_20_low20_17 1;
asr r_551_569 r_551_568 1;
asr s_551_569 s_551_568 1;
assert
    true
&&
    f_531_low60_20_low20_18 = f_531_low60_20_low20_17,
    u_551_569 = u_551_568,
    v_551_569 = v_551_568,
    g_531_low60_20_low20_18 * (const 64 2) = g_531_low60_20_low20_17,
    r_551_569 * (const 64 2) = r_551_568,
    s_551_569 * (const 64 2) = s_551_568
;

assume
    f_531_low60_20_low20_18 = f_531_low60_20_low20_17,
    u_551_569 = u_551_568,
    v_551_569 = v_551_568,
    g_531_low60_20_low20_18 * 2 = g_531_low60_20_low20_17,
    r_551_569 * 2 = r_551_568,
    s_551_569 * 2 = s_551_568
&&
    true
;

{
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_18 + u_551_569 * (const 64 (2**21)) + v_551_569 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_18 + r_551_569 * (const 64 (2**21)) + s_551_569 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_18,
    f_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_18,
    g_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 569)) <=s delta, delta <=s (const 64 (1 + 2*569)),
    (const 64 (-(2**20))) <=s u_551_569, u_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_569, v_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_569, r_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_569, s_551_569 <=s (const 64 ((2**20))),
    u_551_569 + v_551_569 <=s (const 64 (2**20)),
    u_551_569 - v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 + v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 - v_551_569 <=s (const 64 (2**20)),
    r_551_569 + s_551_569 <=s (const 64 (2**20)),
    r_551_569 - s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 + s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 - s_551_569 <=s (const 64 (2**20)),
    u_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_551_569 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_568_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_17,
sint64 g_531_low60_20_low20_17,
sint64 f_531_low60_20_low20_18,
sint64 g_531_low60_20_low20_18,
sint64 u_551_568,
sint64 v_551_568,
sint64 r_551_568,
sint64 s_551_568,
sint64 u_551_569,
sint64 v_551_569,
sint64 r_551_569,
sint64 s_551_569,
bit ne
)={
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (-(2**20)),
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (-(2**20))
&&
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (const 64 (-(2**20))),
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_17 + u_551_568 * (const 64 (2**21)) + v_551_568 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_17 + r_551_568 * (const 64 (2**21)) + s_551_568 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_17,
    f_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_17,
    g_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 568)) <=s delta, delta <=s (const 64 (1 + 2*568)),
    (const 64 (-(2**20))) <=s u_551_568, u_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_568, v_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_568, r_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_568, s_551_568 <=s (const 64 ((2**20))),
    u_551_568 + v_551_568 <=s (const 64 (2**20)),
    u_551_568 - v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 + v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 - v_551_568 <=s (const 64 (2**20)),
    r_551_568 + s_551_568 <=s (const 64 (2**20)),
    r_551_568 - s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 + s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 - s_551_568 <=s (const 64 (2**20)),
    u_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_551_568 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise b
assume
g_531_low60_20_low20_17 = 1 (mod 2)
&&
g_531_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_18 f_531_low60_20_low20_17;
mov u_551_569 u_551_568;
mov v_551_569 v_551_568;

add g_531_low60_20_low20_18 g_531_low60_20_low20_17 f_531_low60_20_low20_17;
asr g_531_low60_20_low20_18 g_531_low60_20_low20_18 1;
add r_551_569 r_551_568 u_551_568;
asr r_551_569 r_551_569 1;
add s_551_569 s_551_568 v_551_568;
asr s_551_569 s_551_569 1;
assert
    true
&&
    f_531_low60_20_low20_18 = f_531_low60_20_low20_17,
    u_551_569 = u_551_568,
    v_551_569 = v_551_568,
    g_531_low60_20_low20_18 * (const 64 2) = g_531_low60_20_low20_17 + f_531_low60_20_low20_17,
    r_551_569 * (const 64 2) = r_551_568 + u_551_568,
    s_551_569 * (const 64 2) = s_551_568 + v_551_568
;

assume
    f_531_low60_20_low20_18 = f_531_low60_20_low20_17,
    u_551_569 = u_551_568,
    v_551_569 = v_551_568,
    g_531_low60_20_low20_18 * 2 = g_531_low60_20_low20_17 + f_531_low60_20_low20_17,
    r_551_569 * 2 = r_551_568 + u_551_568,
    s_551_569 * 2 = s_551_568 + v_551_568
&&
    true
;

{
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_18 + u_551_569 * (const 64 (2**21)) + v_551_569 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_18 + r_551_569 * (const 64 (2**21)) + s_551_569 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_18,
    f_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_18,
    g_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 569)) <=s delta, delta <=s (const 64 (1 + 2*569)),
    (const 64 (-(2**20))) <=s u_551_569, u_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_569, v_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_569, r_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_569, s_551_569 <=s (const 64 ((2**20))),
    u_551_569 + v_551_569 <=s (const 64 (2**20)),
    u_551_569 - v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 + v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 - v_551_569 <=s (const 64 (2**20)),
    r_551_569 + s_551_569 <=s (const 64 (2**20)),
    r_551_569 - s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 + s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 - s_551_569 <=s (const 64 (2**20)),
    u_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_551_569 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_568_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_17,
sint64 g_531_low60_20_low20_17,
sint64 f_531_low60_20_low20_18,
sint64 g_531_low60_20_low20_18,
sint64 u_551_568,
sint64 v_551_568,
sint64 r_551_568,
sint64 s_551_568,
sint64 u_551_569,
sint64 v_551_569,
sint64 r_551_569,
sint64 s_551_569,
bit ne
)={
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (-(2**20)),
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (-(2**20))
&&
    u_551_568 * f_531_low60_20_low20_0 + v_551_568 * g_531_low60_20_low20_0 = f_531_low60_20_low20_17 * (const 64 (-(2**20))),
    r_551_568 * f_531_low60_20_low20_0 + s_551_568 * g_531_low60_20_low20_0 = g_531_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_17 + u_551_568 * (const 64 (2**21)) + v_551_568 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_17 + r_551_568 * (const 64 (2**21)) + s_551_568 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_17,
    f_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_17,
    g_531_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 568)) <=s delta, delta <=s (const 64 (1 + 2*568)),
    (const 64 (-(2**20))) <=s u_551_568, u_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_568, v_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_568, r_551_568 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_568, s_551_568 <=s (const 64 ((2**20))),
    u_551_568 + v_551_568 <=s (const 64 (2**20)),
    u_551_568 - v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 + v_551_568 <=s (const 64 (2**20)),
    (const 64 0) - u_551_568 - v_551_568 <=s (const 64 (2**20)),
    r_551_568 + s_551_568 <=s (const 64 (2**20)),
    r_551_568 - s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 + s_551_568 <=s (const 64 (2**20)),
    (const 64 0) - r_551_568 - s_551_568 <=s (const 64 (2**20)),
    u_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_551_568 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_551_568 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step37

// premise c
assume
g_531_low60_20_low20_17 = 1 (mod 2)
&&
g_531_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_18 g_531_low60_20_low20_17;
mov u_551_569 r_551_568;
mov v_551_569 s_551_568;

subs dc g_531_low60_20_low20_18 g_531_low60_20_low20_17 f_531_low60_20_low20_17;
asr g_531_low60_20_low20_18 g_531_low60_20_low20_18 1;
subs dc r_551_569 r_551_568 u_551_568;
asr r_551_569 r_551_569 1;
subs dc s_551_569 s_551_568 v_551_568;
asr s_551_569 s_551_569 1;
assert
    true
&&
    f_531_low60_20_low20_18 = g_531_low60_20_low20_17,
    u_551_569 = r_551_568,
    v_551_569 = s_551_568,
    g_531_low60_20_low20_18 * (const 64 2) = g_531_low60_20_low20_17 - f_531_low60_20_low20_17,
    r_551_569 * (const 64 2) = r_551_568 - u_551_568,
    s_551_569 * (const 64 2) = s_551_568 - v_551_568
;

assume
    f_531_low60_20_low20_18 = g_531_low60_20_low20_17,
    u_551_569 = r_551_568,
    v_551_569 = s_551_568,
    g_531_low60_20_low20_18 * 2 = g_531_low60_20_low20_17 - f_531_low60_20_low20_17,
    r_551_569 * 2 = r_551_568 - u_551_568,
    s_551_569 * 2 = s_551_568 - v_551_568
&&
    true
;

{
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_18 + u_551_569 * (const 64 (2**21)) + v_551_569 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_18 + r_551_569 * (const 64 (2**21)) + s_551_569 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_18,
    f_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_18,
    g_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 569)) <=s delta, delta <=s (const 64 (1 + 2*569)),
    (const 64 (-(2**20))) <=s u_551_569, u_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_569, v_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_569, r_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_569, s_551_569 <=s (const 64 ((2**20))),
    u_551_569 + v_551_569 <=s (const 64 (2**20)),
    u_551_569 - v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 + v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 - v_551_569 <=s (const 64 (2**20)),
    r_551_569 + s_551_569 <=s (const 64 (2**20)),
    r_551_569 - s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 + s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 - s_551_569 <=s (const 64 (2**20)),
    u_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_551_569 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_569_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_18,
sint64 g_531_low60_20_low20_18,
sint64 f_531_low60_20_low20_19,
sint64 g_531_low60_20_low20_19,
sint64 u_551_569,
sint64 v_551_569,
sint64 r_551_569,
sint64 s_551_569,
sint64 u_551_570,
sint64 v_551_570,
sint64 r_551_570,
sint64 s_551_570,
bit ne
)={
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (-(2**20)),
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (-(2**20))
&&
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (const 64 (-(2**20))),
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_18 + u_551_569 * (const 64 (2**21)) + v_551_569 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_18 + r_551_569 * (const 64 (2**21)) + s_551_569 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_18,
    f_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_18,
    g_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 569)) <=s delta, delta <=s (const 64 (1 + 2*569)),
    (const 64 (-(2**20))) <=s u_551_569, u_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_569, v_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_569, r_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_569, s_551_569 <=s (const 64 ((2**20))),
    u_551_569 + v_551_569 <=s (const 64 (2**20)),
    u_551_569 - v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 + v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 - v_551_569 <=s (const 64 (2**20)),
    r_551_569 + s_551_569 <=s (const 64 (2**20)),
    r_551_569 - s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 + s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 - s_551_569 <=s (const 64 (2**20)),
    u_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_551_569 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise a
assume
g_531_low60_20_low20_18 = 0 (mod 2)
&&
g_531_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_19 f_531_low60_20_low20_18;
mov u_551_570 u_551_569;
mov v_551_570 v_551_569;

asr g_531_low60_20_low20_19 g_531_low60_20_low20_18 1;
asr r_551_570 r_551_569 1;
asr s_551_570 s_551_569 1;
assert
    true
&&
    f_531_low60_20_low20_19 = f_531_low60_20_low20_18,
    u_551_570 = u_551_569,
    v_551_570 = v_551_569,
    g_531_low60_20_low20_19 * (const 64 2) = g_531_low60_20_low20_18,
    r_551_570 * (const 64 2) = r_551_569,
    s_551_570 * (const 64 2) = s_551_569
;

assume
    f_531_low60_20_low20_19 = f_531_low60_20_low20_18,
    u_551_570 = u_551_569,
    v_551_570 = v_551_569,
    g_531_low60_20_low20_19 * 2 = g_531_low60_20_low20_18,
    r_551_570 * 2 = r_551_569,
    s_551_570 * 2 = s_551_569
&&
    true
;

{
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_19 + u_551_570 * (const 64 (2**21)) + v_551_570 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_19 + r_551_570 * (const 64 (2**21)) + s_551_570 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_19,
    f_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_19,
    g_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 570)) <=s delta, delta <=s (const 64 (1 + 2*570)),
    (const 64 (-(2**20))) <=s u_551_570, u_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_570, v_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_570, r_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_570, s_551_570 <=s (const 64 ((2**20))),
    u_551_570 + v_551_570 <=s (const 64 (2**20)),
    u_551_570 - v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 + v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 - v_551_570 <=s (const 64 (2**20)),
    r_551_570 + s_551_570 <=s (const 64 (2**20)),
    r_551_570 - s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 + s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 - s_551_570 <=s (const 64 (2**20)),
    u_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_551_570 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_569_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_18,
sint64 g_531_low60_20_low20_18,
sint64 f_531_low60_20_low20_19,
sint64 g_531_low60_20_low20_19,
sint64 u_551_569,
sint64 v_551_569,
sint64 r_551_569,
sint64 s_551_569,
sint64 u_551_570,
sint64 v_551_570,
sint64 r_551_570,
sint64 s_551_570,
bit ne
)={
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (-(2**20)),
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (-(2**20))
&&
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (const 64 (-(2**20))),
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_18 + u_551_569 * (const 64 (2**21)) + v_551_569 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_18 + r_551_569 * (const 64 (2**21)) + s_551_569 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_18,
    f_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_18,
    g_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 569)) <=s delta, delta <=s (const 64 (1 + 2*569)),
    (const 64 (-(2**20))) <=s u_551_569, u_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_569, v_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_569, r_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_569, s_551_569 <=s (const 64 ((2**20))),
    u_551_569 + v_551_569 <=s (const 64 (2**20)),
    u_551_569 - v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 + v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 - v_551_569 <=s (const 64 (2**20)),
    r_551_569 + s_551_569 <=s (const 64 (2**20)),
    r_551_569 - s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 + s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 - s_551_569 <=s (const 64 (2**20)),
    u_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_551_569 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise b
assume
g_531_low60_20_low20_18 = 1 (mod 2)
&&
g_531_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_19 f_531_low60_20_low20_18;
mov u_551_570 u_551_569;
mov v_551_570 v_551_569;

add g_531_low60_20_low20_19 g_531_low60_20_low20_18 f_531_low60_20_low20_18;
asr g_531_low60_20_low20_19 g_531_low60_20_low20_19 1;
add r_551_570 r_551_569 u_551_569;
asr r_551_570 r_551_570 1;
add s_551_570 s_551_569 v_551_569;
asr s_551_570 s_551_570 1;
assert
    true
&&
    f_531_low60_20_low20_19 = f_531_low60_20_low20_18,
    u_551_570 = u_551_569,
    v_551_570 = v_551_569,
    g_531_low60_20_low20_19 * (const 64 2) = g_531_low60_20_low20_18 + f_531_low60_20_low20_18,
    r_551_570 * (const 64 2) = r_551_569 + u_551_569,
    s_551_570 * (const 64 2) = s_551_569 + v_551_569
;

assume
    f_531_low60_20_low20_19 = f_531_low60_20_low20_18,
    u_551_570 = u_551_569,
    v_551_570 = v_551_569,
    g_531_low60_20_low20_19 * 2 = g_531_low60_20_low20_18 + f_531_low60_20_low20_18,
    r_551_570 * 2 = r_551_569 + u_551_569,
    s_551_570 * 2 = s_551_569 + v_551_569
&&
    true
;

{
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_19 + u_551_570 * (const 64 (2**21)) + v_551_570 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_19 + r_551_570 * (const 64 (2**21)) + s_551_570 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_19,
    f_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_19,
    g_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 570)) <=s delta, delta <=s (const 64 (1 + 2*570)),
    (const 64 (-(2**20))) <=s u_551_570, u_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_570, v_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_570, r_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_570, s_551_570 <=s (const 64 ((2**20))),
    u_551_570 + v_551_570 <=s (const 64 (2**20)),
    u_551_570 - v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 + v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 - v_551_570 <=s (const 64 (2**20)),
    r_551_570 + s_551_570 <=s (const 64 (2**20)),
    r_551_570 - s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 + s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 - s_551_570 <=s (const 64 (2**20)),
    u_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_551_570 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_569_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_18,
sint64 g_531_low60_20_low20_18,
sint64 f_531_low60_20_low20_19,
sint64 g_531_low60_20_low20_19,
sint64 u_551_569,
sint64 v_551_569,
sint64 r_551_569,
sint64 s_551_569,
sint64 u_551_570,
sint64 v_551_570,
sint64 r_551_570,
sint64 s_551_570,
bit ne
)={
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (-(2**20)),
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (-(2**20))
&&
    u_551_569 * f_531_low60_20_low20_0 + v_551_569 * g_531_low60_20_low20_0 = f_531_low60_20_low20_18 * (const 64 (-(2**20))),
    r_551_569 * f_531_low60_20_low20_0 + s_551_569 * g_531_low60_20_low20_0 = g_531_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_18 + u_551_569 * (const 64 (2**21)) + v_551_569 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_18 + r_551_569 * (const 64 (2**21)) + s_551_569 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_18,
    f_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_18,
    g_531_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 569)) <=s delta, delta <=s (const 64 (1 + 2*569)),
    (const 64 (-(2**20))) <=s u_551_569, u_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_569, v_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_569, r_551_569 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_569, s_551_569 <=s (const 64 ((2**20))),
    u_551_569 + v_551_569 <=s (const 64 (2**20)),
    u_551_569 - v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 + v_551_569 <=s (const 64 (2**20)),
    (const 64 0) - u_551_569 - v_551_569 <=s (const 64 (2**20)),
    r_551_569 + s_551_569 <=s (const 64 (2**20)),
    r_551_569 - s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 + s_551_569 <=s (const 64 (2**20)),
    (const 64 0) - r_551_569 - s_551_569 <=s (const 64 (2**20)),
    u_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_551_569 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_551_569 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step38

// premise c
assume
g_531_low60_20_low20_18 = 1 (mod 2)
&&
g_531_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_19 g_531_low60_20_low20_18;
mov u_551_570 r_551_569;
mov v_551_570 s_551_569;

subs dc g_531_low60_20_low20_19 g_531_low60_20_low20_18 f_531_low60_20_low20_18;
asr g_531_low60_20_low20_19 g_531_low60_20_low20_19 1;
subs dc r_551_570 r_551_569 u_551_569;
asr r_551_570 r_551_570 1;
subs dc s_551_570 s_551_569 v_551_569;
asr s_551_570 s_551_570 1;
assert
    true
&&
    f_531_low60_20_low20_19 = g_531_low60_20_low20_18,
    u_551_570 = r_551_569,
    v_551_570 = s_551_569,
    g_531_low60_20_low20_19 * (const 64 2) = g_531_low60_20_low20_18 - f_531_low60_20_low20_18,
    r_551_570 * (const 64 2) = r_551_569 - u_551_569,
    s_551_570 * (const 64 2) = s_551_569 - v_551_569
;

assume
    f_531_low60_20_low20_19 = g_531_low60_20_low20_18,
    u_551_570 = r_551_569,
    v_551_570 = s_551_569,
    g_531_low60_20_low20_19 * 2 = g_531_low60_20_low20_18 - f_531_low60_20_low20_18,
    r_551_570 * 2 = r_551_569 - u_551_569,
    s_551_570 * 2 = s_551_569 - v_551_569
&&
    true
;

{
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_19 + u_551_570 * (const 64 (2**21)) + v_551_570 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_19 + r_551_570 * (const 64 (2**21)) + s_551_570 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_19,
    f_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_19,
    g_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 570)) <=s delta, delta <=s (const 64 (1 + 2*570)),
    (const 64 (-(2**20))) <=s u_551_570, u_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_570, v_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_570, r_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_570, s_551_570 <=s (const 64 ((2**20))),
    u_551_570 + v_551_570 <=s (const 64 (2**20)),
    u_551_570 - v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 + v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 - v_551_570 <=s (const 64 (2**20)),
    r_551_570 + s_551_570 <=s (const 64 (2**20)),
    r_551_570 - s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 + s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 - s_551_570 <=s (const 64 (2**20)),
    u_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_551_570 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_570_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_19,
sint64 g_531_low60_20_low20_19,
sint64 f_531_low60_20_low20_20,
sint64 g_531_low60_20_low20_20,
sint64 u_551_570,
sint64 v_551_570,
sint64 r_551_570,
sint64 s_551_570,
sint64 u_551_571,
sint64 v_551_571,
sint64 r_551_571,
sint64 s_551_571,
bit ne
)={
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (-(2**20)),
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (-(2**20))
&&
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (const 64 (-(2**20))),
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_19 + u_551_570 * (const 64 (2**21)) + v_551_570 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_19 + r_551_570 * (const 64 (2**21)) + s_551_570 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_19,
    f_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_19,
    g_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 570)) <=s delta, delta <=s (const 64 (1 + 2*570)),
    (const 64 (-(2**20))) <=s u_551_570, u_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_570, v_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_570, r_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_570, s_551_570 <=s (const 64 ((2**20))),
    u_551_570 + v_551_570 <=s (const 64 (2**20)),
    u_551_570 - v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 + v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 - v_551_570 <=s (const 64 (2**20)),
    r_551_570 + s_551_570 <=s (const 64 (2**20)),
    r_551_570 - s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 + s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 - s_551_570 <=s (const 64 (2**20)),
    u_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_551_570 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise a
assume
g_531_low60_20_low20_19 = 0 (mod 2)
&&
g_531_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_531_low60_20_low20_20 f_531_low60_20_low20_19;
mov u_551_571 u_551_570;
mov v_551_571 v_551_570;

asr g_531_low60_20_low20_20 g_531_low60_20_low20_19 1;
asr r_551_571 r_551_570 1;
asr s_551_571 s_551_570 1;
assert
    true
&&
    f_531_low60_20_low20_20 = f_531_low60_20_low20_19,
    u_551_571 = u_551_570,
    v_551_571 = v_551_570,
    g_531_low60_20_low20_20 * (const 64 2) = g_531_low60_20_low20_19,
    r_551_571 * (const 64 2) = r_551_570,
    s_551_571 * (const 64 2) = s_551_570
;

assume
    f_531_low60_20_low20_20 = f_531_low60_20_low20_19,
    u_551_571 = u_551_570,
    v_551_571 = v_551_570,
    g_531_low60_20_low20_20 * 2 = g_531_low60_20_low20_19,
    r_551_571 * 2 = r_551_570,
    s_551_571 * 2 = s_551_570
&&
    true
;

{
    u_551_571 * f_531_low60_20_low20_0 + v_551_571 * g_531_low60_20_low20_0 = f_531_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_571 * f_531_low60_20_low20_0 + s_551_571 * g_531_low60_20_low20_0 = g_531_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_20 + u_551_571 * (const 64 (2**21)) + v_551_571 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_20 + r_551_571 * (const 64 (2**21)) + s_551_571 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_20,
    f_531_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_20,
    g_531_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 571)) <=s delta, delta <=s (const 64 (1 + 2*571)),
    (const 64 (-(2**20))) <=s u_551_571, u_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_571, v_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_571, r_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_571, s_551_571 <=s (const 64 ((2**20))),
    u_551_571 + v_551_571 <=s (const 64 (2**20)),
    u_551_571 - v_551_571 <=s (const 64 (2**20)),
    (const 64 0) - u_551_571 + v_551_571 <=s (const 64 (2**20)),
    (const 64 0) - u_551_571 - v_551_571 <=s (const 64 (2**20)),
    r_551_571 + s_551_571 <=s (const 64 (2**20)),
    r_551_571 - s_551_571 <=s (const 64 (2**20)),
    (const 64 0) - r_551_571 + s_551_571 <=s (const 64 (2**20)),
    (const 64 0) - r_551_571 - s_551_571 <=s (const 64 (2**20)),
    u_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_551_571 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_570_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_19,
sint64 g_531_low60_20_low20_19,
sint64 f_531_low60_20_low20_20,
sint64 g_531_low60_20_low20_20,
sint64 u_551_570,
sint64 v_551_570,
sint64 r_551_570,
sint64 s_551_570,
sint64 u_551_571,
sint64 v_551_571,
sint64 r_551_571,
sint64 s_551_571,
bit ne
)={
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (-(2**20)),
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (-(2**20))
&&
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (const 64 (-(2**20))),
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_19 + u_551_570 * (const 64 (2**21)) + v_551_570 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_19 + r_551_570 * (const 64 (2**21)) + s_551_570 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_19,
    f_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_19,
    g_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 570)) <=s delta, delta <=s (const 64 (1 + 2*570)),
    (const 64 (-(2**20))) <=s u_551_570, u_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_570, v_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_570, r_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_570, s_551_570 <=s (const 64 ((2**20))),
    u_551_570 + v_551_570 <=s (const 64 (2**20)),
    u_551_570 - v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 + v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 - v_551_570 <=s (const 64 (2**20)),
    r_551_570 + s_551_570 <=s (const 64 (2**20)),
    r_551_570 - s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 + s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 - s_551_570 <=s (const 64 (2**20)),
    u_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_551_570 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise b
assume
g_531_low60_20_low20_19 = 1 (mod 2)
&&
g_531_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_20 f_531_low60_20_low20_19;
mov u_551_571 u_551_570;
mov v_551_571 v_551_570;

add g_531_low60_20_low20_20 g_531_low60_20_low20_19 f_531_low60_20_low20_19;
asr g_531_low60_20_low20_20 g_531_low60_20_low20_20 1;
add r_551_571 r_551_570 u_551_570;
asr r_551_571 r_551_571 1;
add s_551_571 s_551_570 v_551_570;
asr s_551_571 s_551_571 1;
assert
    true
&&
    f_531_low60_20_low20_20 = f_531_low60_20_low20_19,
    u_551_571 = u_551_570,
    v_551_571 = v_551_570,
    g_531_low60_20_low20_20 * (const 64 2) = g_531_low60_20_low20_19 + f_531_low60_20_low20_19,
    r_551_571 * (const 64 2) = r_551_570 + u_551_570,
    s_551_571 * (const 64 2) = s_551_570 + v_551_570
;

assume
    f_531_low60_20_low20_20 = f_531_low60_20_low20_19,
    u_551_571 = u_551_570,
    v_551_571 = v_551_570,
    g_531_low60_20_low20_20 * 2 = g_531_low60_20_low20_19 + f_531_low60_20_low20_19,
    r_551_571 * 2 = r_551_570 + u_551_570,
    s_551_571 * 2 = s_551_570 + v_551_570
&&
    true
;

{
    u_551_571 * f_531_low60_20_low20_0 + v_551_571 * g_531_low60_20_low20_0 = f_531_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_571 * f_531_low60_20_low20_0 + s_551_571 * g_531_low60_20_low20_0 = g_531_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_20 + u_551_571 * (const 64 (2**21)) + v_551_571 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_20 + r_551_571 * (const 64 (2**21)) + s_551_571 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_20,
    f_531_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_20,
    g_531_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 571)) <=s delta, delta <=s (const 64 (1 + 2*571)),
    (const 64 (-(2**20))) <=s u_551_571, u_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_571, v_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_571, r_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_571, s_551_571 <=s (const 64 ((2**20))),
    u_551_571 + v_551_571 <=s (const 64 (2**20)),
    u_551_571 - v_551_571 <=s (const 64 (2**20)),
    (const 64 0) - u_551_571 + v_551_571 <=s (const 64 (2**20)),
    (const 64 0) - u_551_571 - v_551_571 <=s (const 64 (2**20)),
    r_551_571 + s_551_571 <=s (const 64 (2**20)),
    r_551_571 - s_551_571 <=s (const 64 (2**20)),
    (const 64 0) - r_551_571 + s_551_571 <=s (const 64 (2**20)),
    (const 64 0) - r_551_571 - s_551_571 <=s (const 64 (2**20)),
    u_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_551_571 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_570_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_531_low60_20_low20_0,
sint64 g_531_low60_20_low20_0,
sint64 f_531_low60_20_low20_19,
sint64 g_531_low60_20_low20_19,
sint64 f_531_low60_20_low20_20,
sint64 g_531_low60_20_low20_20,
sint64 u_551_570,
sint64 v_551_570,
sint64 r_551_570,
sint64 s_551_570,
sint64 u_551_571,
sint64 v_551_571,
sint64 r_551_571,
sint64 s_551_571,
bit ne
)={
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (-(2**20)),
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (-(2**20))
&&
    u_551_570 * f_531_low60_20_low20_0 + v_551_570 * g_531_low60_20_low20_0 = f_531_low60_20_low20_19 * (const 64 (-(2**20))),
    r_551_570 * f_531_low60_20_low20_0 + s_551_570 * g_531_low60_20_low20_0 = g_531_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_531_low60_20_low20_19 + u_551_570 * (const 64 (2**21)) + v_551_570 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_19 + r_551_570 * (const 64 (2**21)) + s_551_570 * (const 64 (2**42)),
    const 64 0 <=s f_531_low60_20_low20_0,
    f_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_0,
    g_531_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_531_low60_20_low20_19,
    f_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_531_low60_20_low20_19,
    g_531_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 570)) <=s delta, delta <=s (const 64 (1 + 2*570)),
    (const 64 (-(2**20))) <=s u_551_570, u_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_570, v_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_570, r_551_570 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_570, s_551_570 <=s (const 64 ((2**20))),
    u_551_570 + v_551_570 <=s (const 64 (2**20)),
    u_551_570 - v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 + v_551_570 <=s (const 64 (2**20)),
    (const 64 0) - u_551_570 - v_551_570 <=s (const 64 (2**20)),
    r_551_570 + s_551_570 <=s (const 64 (2**20)),
    r_551_570 - s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 + s_551_570 <=s (const 64 (2**20)),
    (const 64 0) - r_551_570 - s_551_570 <=s (const 64 (2**20)),
    u_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_551_570 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_551_570 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step39

// premise c
assume
g_531_low60_20_low20_19 = 1 (mod 2)
&&
g_531_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_531_low60_20_low20_20 g_531_low60_20_low20_19;
mov u_551_571 r_551_570;
mov v_551_571 s_551_570;

subs dc g_531_low60_20_low20_20 g_531_low60_20_low20_19 f_531_low60_20_low20_19;
asr g_531_low60_20_low20_20 g_531_low60_20_low20_20 1;
subs dc r_551_571 r_551_570 u_551_570;
asr r_551_571 r_551_571 1;
subs dc s_551_571 s_551_570 v_551_570;
asr s_551_571 s_551_571 1;
assert
    true
&&
    f_531_low60_20_low20_20 = g_531_low60_20_low20_19,
    u_551_571 = r_551_570,
    v_551_571 = s_551_570,
    g_531_low60_20_low20_20 * (const 64 2) = g_531_low60_20_low20_19 - f_531_low60_20_low20_19,
    r_551_571 * (const 64 2) = r_551_570 - u_551_570,
    s_551_571 * (const 64 2) = s_551_570 - v_551_570
;

assume
    f_531_low60_20_low20_20 = g_531_low60_20_low20_19,
    u_551_571 = r_551_570,
    v_551_571 = s_551_570,
    g_531_low60_20_low20_20 * 2 = g_531_low60_20_low20_19 - f_531_low60_20_low20_19,
    r_551_571 * 2 = r_551_570 - u_551_570,
    s_551_571 * 2 = s_551_570 - v_551_570
&&
    true
;

{
    u_551_571 * f_531_low60_20_low20_0 + v_551_571 * g_531_low60_20_low20_0 = f_531_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_551_571 * f_531_low60_20_low20_0 + s_551_571 * g_531_low60_20_low20_0 = g_531_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_531_low60_20_low20_20 + u_551_571 * (const 64 (2**21)) + v_551_571 * (const 64 (2**42)),
    grs = g_531_low60_20_low20_20 + r_551_571 * (const 64 (2**21)) + s_551_571 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_531_low60_20_low20_20,
    f_531_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_531_low60_20_low20_20,
    g_531_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 571)) <=s delta, delta <=s (const 64 (1 + 2*571)),
    (const 64 (-(2**20))) <=s u_551_571, u_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_551_571, v_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_551_571, r_551_571 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_551_571, s_551_571 <=s (const 64 ((2**20))),
    u_551_571 + v_551_571 <=s (const 64 (2**20)),
    u_551_571 - v_551_571 <=s (const 64 (2**20)),
    (const 64 0) - u_551_571 + v_551_571 <=s (const 64 (2**20)),
    (const 64 0) - u_551_571 - v_551_571 <=s (const 64 (2**20)),
    r_551_571 + s_551_571 <=s (const 64 (2**20)),
    r_551_571 - s_551_571 <=s (const 64 (2**20)),
    (const 64 0) - r_551_571 + s_551_571 <=s (const 64 (2**20)),
    (const 64 0) - r_551_571 - s_551_571 <=s (const 64 (2**20)),
    u_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_551_571 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_551_571 = (const 64 0) (mod (const 64 (2**(20-20))))
}

