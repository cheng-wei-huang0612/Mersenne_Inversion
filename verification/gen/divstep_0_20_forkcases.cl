proc divstep_00_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 u_0_0,
sint64 v_0_0,
sint64 r_0_0,
sint64 s_0_0,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
bit ne
)={
    u_0_0 * f_0_low60_0_low20_0 + v_0_0 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
    r_0_0 * f_0_low60_0_low20_0 + s_0_0 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_0 + u_0_0 * (const 64 (2**21)) + v_0_0 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_0 + r_0_0 * (const 64 (2**21)) + s_0_0 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 0)) <=s delta, delta <=s (const 64 (1 + 2*0)),
    u_0_0 = (const 64 (-(2**20))),
    v_0_0 = (const 64 (0)),
    r_0_0 = (const 64 (0)),
    s_0_0 = (const 64 (-(2**20)))
}



// divsteps
// step0

// premise a
assume
    g_0_low60_0_low20_0 = 0 (mod 2)
&&
    g_0_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov f_0_low60_0_low20_1 f_0_low60_0_low20_0;
mov u_0_1 u_0_0;
mov v_0_1 v_0_0;

asr g_0_low60_0_low20_1 g_0_low60_0_low20_0 1;
asr r_0_1 r_0_0 1;
asr s_0_1 s_0_0 1;
assert
    true
&&
    f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
    u_0_1 = u_0_0,
    v_0_1 = v_0_0,
    g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0,
    r_0_1 * (const 64 2) = r_0_0,
    s_0_1 * (const 64 2) = s_0_0
;

assume
    f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
    u_0_1 = u_0_0,
    v_0_1 = v_0_0,
    g_0_low60_0_low20_1 * 2 = g_0_low60_0_low20_0,
    r_0_1 * 2 = r_0_0,
    s_0_1 * 2 = s_0_0
&&
    true
;

{
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20-1))-(2**20))) <=s r_0_1, r_0_1 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-1))-(2**20))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**19))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)))),
    u_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_0_1 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_00_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 u_0_0,
sint64 v_0_0,
sint64 r_0_0,
sint64 s_0_0,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
bit ne
)={
    u_0_0 * f_0_low60_0_low20_0 + v_0_0 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
    r_0_0 * f_0_low60_0_low20_0 + s_0_0 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_0 + u_0_0 * (const 64 (2**21)) + v_0_0 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_0 + r_0_0 * (const 64 (2**21)) + s_0_0 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 0)) <=s delta, delta <=s (const 64 (1 + 2*0)),
    u_0_0 = (const 64 (-(2**20))),
    v_0_0 = (const 64 (0)),
    r_0_0 = (const 64 (0)),
    s_0_0 = (const 64 (-(2**20)))
}



// divsteps
// step0

// premise b
assume
    g_0_low60_0_low20_0 = 1 (mod 2)
&&
    g_0_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_1 f_0_low60_0_low20_0;
mov u_0_1 u_0_0;
mov v_0_1 v_0_0;

add g_0_low60_0_low20_1 g_0_low60_0_low20_0 f_0_low60_0_low20_0;
asr g_0_low60_0_low20_1 g_0_low60_0_low20_1 1;
add r_0_1 r_0_0 u_0_0;
asr r_0_1 r_0_1 1;
add s_0_1 s_0_0 v_0_0;
asr s_0_1 s_0_1 1;
assert
    true
&&
    f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
    u_0_1 = u_0_0,
    v_0_1 = v_0_0,
    g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0 + f_0_low60_0_low20_0,
    r_0_1 * (const 64 2) = r_0_0 + u_0_0,
    s_0_1 * (const 64 2) = s_0_0 + v_0_0
;

assume
    f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
    u_0_1 = u_0_0,
    v_0_1 = v_0_0,
    g_0_low60_0_low20_1 * 2 = g_0_low60_0_low20_0 + f_0_low60_0_low20_0,
    r_0_1 * 2 = r_0_0 + u_0_0,
    s_0_1 * 2 = s_0_0 + v_0_0
&&
    true
;

{
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20-1))-(2**20))) <=s r_0_1, r_0_1 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-1))-(2**20))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**19))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)))),
    u_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_0_1 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_00_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 u_0_0,
sint64 v_0_0,
sint64 r_0_0,
sint64 s_0_0,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
bit ne
)={
    u_0_0 * f_0_low60_0_low20_0 + v_0_0 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
    r_0_0 * f_0_low60_0_low20_0 + s_0_0 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_0 + u_0_0 * (const 64 (2**21)) + v_0_0 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_0 + r_0_0 * (const 64 (2**21)) + s_0_0 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 0)) <=s delta, delta <=s (const 64 (1 + 2*0)),
    u_0_0 = (const 64 (-(2**20))),
    v_0_0 = (const 64 (0)),
    r_0_0 = (const 64 (0)),
    s_0_0 = (const 64 (-(2**20)))
}



// divsteps
// step0

// premise c
assume
    g_0_low60_0_low20_0 = 1 (mod 2)
&&
    g_0_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_1 g_0_low60_0_low20_0;
mov u_0_1 r_0_0;
mov v_0_1 s_0_0;

subs dc g_0_low60_0_low20_1 g_0_low60_0_low20_0 f_0_low60_0_low20_0;
asr g_0_low60_0_low20_1 g_0_low60_0_low20_1 1;
subs dc r_0_1 r_0_0 u_0_0;
asr r_0_1 r_0_1 1;
subs dc s_0_1 s_0_0 v_0_0;
asr s_0_1 s_0_1 1;
assert
    true
&&
    f_0_low60_0_low20_1 = g_0_low60_0_low20_0,
    u_0_1 = r_0_0,
    v_0_1 = s_0_0,
    g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0 - f_0_low60_0_low20_0,
    r_0_1 * (const 64 2) = r_0_0 - u_0_0,
    s_0_1 * (const 64 2) = s_0_0 - v_0_0
;

assume
    f_0_low60_0_low20_1 = g_0_low60_0_low20_0,
    u_0_1 = r_0_0,
    v_0_1 = s_0_0,
    g_0_low60_0_low20_1 * 2 = g_0_low60_0_low20_0 - f_0_low60_0_low20_0,
    r_0_1 * 2 = r_0_0 - u_0_0,
    s_0_1 * 2 = s_0_0 - v_0_0
&&
    true
;

{
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20-1))-(2**20))) <=s r_0_1, r_0_1 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-1))-(2**20))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**19))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)))),
    u_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_0_1 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_01_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
bit ne
)={
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20)),
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20-1))-(2**20))) <=s r_0_1, r_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**20))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**19))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)))),
    u_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_0_1 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step1

// premise a
assume
    g_0_low60_0_low20_1 = 0 (mod 2)
&&
    g_0_low60_0_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_2 f_0_low60_0_low20_1;
mov u_0_2 u_0_1;
mov v_0_2 v_0_1;

asr g_0_low60_0_low20_2 g_0_low60_0_low20_1 1;
asr r_0_2 r_0_1 1;
asr s_0_2 s_0_1 1;
assert
    true
&&
    f_0_low60_0_low20_2 = f_0_low60_0_low20_1,
    u_0_2 = u_0_1,
    v_0_2 = v_0_1,
    g_0_low60_0_low20_2 * (const 64 2) = g_0_low60_0_low20_1,
    r_0_2 * (const 64 2) = r_0_1,
    s_0_2 * (const 64 2) = s_0_1
;

assume
    f_0_low60_0_low20_2 = f_0_low60_0_low20_1,
    u_0_2 = u_0_1,
    v_0_2 = v_0_1,
    g_0_low60_0_low20_2 * 2 = g_0_low60_0_low20_1,
    r_0_2 * 2 = r_0_1,
    s_0_2 * 2 = s_0_1
&&
    true
;

{
    u_0_2 * f_0_low60_0_low20_0 + v_0_2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_2 * f_0_low60_0_low20_0 + s_0_2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_2 + u_0_2 * (const 64 (2**21)) + v_0_2 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_2 + r_0_2 * (const 64 (2**21)) + s_0_2 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_2,
    f_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_2,
    g_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 2)) <=s delta, delta <=s (const 64 (1 + 2*2)),
    (const 64 (-(2**20))) <=s u_0_2, u_0_2 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_2, v_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)) )),
    (const 64 ((2**(20-2))-(2**20))) <=s r_0_2, r_0_2 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-2))-(2**20))) <=s s_0_2, s_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**19))) <=s (r_0_2 - u_0_2), (r_0_2 - u_0_2) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_2 - v_0_2), (s_0_2 - v_0_2) <=s (const 64 ((2**20) - (2**(20 - 2)))),
    u_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_0_2 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_01_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
bit ne
)={
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20)),
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20-1))-(2**20))) <=s r_0_1, r_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**20))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**19))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)))),
    u_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_0_1 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step1

// premise b
assume
    g_0_low60_0_low20_1 = 1 (mod 2)
&&
    g_0_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_2 f_0_low60_0_low20_1;
mov u_0_2 u_0_1;
mov v_0_2 v_0_1;

add g_0_low60_0_low20_2 g_0_low60_0_low20_1 f_0_low60_0_low20_1;
asr g_0_low60_0_low20_2 g_0_low60_0_low20_2 1;
add r_0_2 r_0_1 u_0_1;
asr r_0_2 r_0_2 1;
add s_0_2 s_0_1 v_0_1;
asr s_0_2 s_0_2 1;
assert
    true
&&
    f_0_low60_0_low20_2 = f_0_low60_0_low20_1,
    u_0_2 = u_0_1,
    v_0_2 = v_0_1,
    g_0_low60_0_low20_2 * (const 64 2) = g_0_low60_0_low20_1 + f_0_low60_0_low20_1,
    r_0_2 * (const 64 2) = r_0_1 + u_0_1,
    s_0_2 * (const 64 2) = s_0_1 + v_0_1
;

assume
    f_0_low60_0_low20_2 = f_0_low60_0_low20_1,
    u_0_2 = u_0_1,
    v_0_2 = v_0_1,
    g_0_low60_0_low20_2 * 2 = g_0_low60_0_low20_1 + f_0_low60_0_low20_1,
    r_0_2 * 2 = r_0_1 + u_0_1,
    s_0_2 * 2 = s_0_1 + v_0_1
&&
    true
;

{
    u_0_2 * f_0_low60_0_low20_0 + v_0_2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_2 * f_0_low60_0_low20_0 + s_0_2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_2 + u_0_2 * (const 64 (2**21)) + v_0_2 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_2 + r_0_2 * (const 64 (2**21)) + s_0_2 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_2,
    f_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_2,
    g_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 2)) <=s delta, delta <=s (const 64 (1 + 2*2)),
    (const 64 (-(2**20))) <=s u_0_2, u_0_2 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_2, v_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)) )),
    (const 64 ((2**(20-2))-(2**20))) <=s r_0_2, r_0_2 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-2))-(2**20))) <=s s_0_2, s_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**19))) <=s (r_0_2 - u_0_2), (r_0_2 - u_0_2) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_2 - v_0_2), (s_0_2 - v_0_2) <=s (const 64 ((2**20) - (2**(20 - 2)))),
    u_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_0_2 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_01_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
bit ne
)={
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (-(2**20)),
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20-1))-(2**20))) <=s r_0_1, r_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**20))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20-1))-(2**19))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)))),
    u_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_0_1 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_0_1 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step1

// premise c
assume
    g_0_low60_0_low20_1 = 1 (mod 2)
&&
    g_0_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_2 g_0_low60_0_low20_1;
mov u_0_2 r_0_1;
mov v_0_2 s_0_1;

subs dc g_0_low60_0_low20_2 g_0_low60_0_low20_1 f_0_low60_0_low20_1;
asr g_0_low60_0_low20_2 g_0_low60_0_low20_2 1;
subs dc r_0_2 r_0_1 u_0_1;
asr r_0_2 r_0_2 1;
subs dc s_0_2 s_0_1 v_0_1;
asr s_0_2 s_0_2 1;
assert
    true
&&
    f_0_low60_0_low20_2 = g_0_low60_0_low20_1,
    u_0_2 = r_0_1,
    v_0_2 = s_0_1,
    g_0_low60_0_low20_2 * (const 64 2) = g_0_low60_0_low20_1 - f_0_low60_0_low20_1,
    r_0_2 * (const 64 2) = r_0_1 - u_0_1,
    s_0_2 * (const 64 2) = s_0_1 - v_0_1
;

assume
    f_0_low60_0_low20_2 = g_0_low60_0_low20_1,
    u_0_2 = r_0_1,
    v_0_2 = s_0_1,
    g_0_low60_0_low20_2 * 2 = g_0_low60_0_low20_1 - f_0_low60_0_low20_1,
    r_0_2 * 2 = r_0_1 - u_0_1,
    s_0_2 * 2 = s_0_1 - v_0_1
&&
    true
;

{
    u_0_2 * f_0_low60_0_low20_0 + v_0_2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_2 * f_0_low60_0_low20_0 + s_0_2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_2 + u_0_2 * (const 64 (2**21)) + v_0_2 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_2 + r_0_2 * (const 64 (2**21)) + s_0_2 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_2,
    f_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_2,
    g_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 2)) <=s delta, delta <=s (const 64 (1 + 2*2)),
    (const 64 (-(2**20))) <=s u_0_2, u_0_2 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_2, v_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)) )),
    (const 64 ((2**(20-2))-(2**20))) <=s r_0_2, r_0_2 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-2))-(2**20))) <=s s_0_2, s_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**19))) <=s (r_0_2 - u_0_2), (r_0_2 - u_0_2) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_2 - v_0_2), (s_0_2 - v_0_2) <=s (const 64 ((2**20) - (2**(20 - 2)))),
    u_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_0_2 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_02_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
bit ne
)={
    u_0_2 * f_0_low60_0_low20_0 + v_0_2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_2 * (-(2**20)),
    r_0_2 * f_0_low60_0_low20_0 + s_0_2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_2 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_2 + u_0_2 * (const 64 (2**21)) + v_0_2 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_2 + r_0_2 * (const 64 (2**21)) + s_0_2 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_2,
    f_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_2,
    g_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 2)) <=s delta, delta <=s (const 64 (1 + 2*2)),
    (const 64 (-(2**20))) <=s u_0_2, u_0_2 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_2, v_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)) )),
    (const 64 ((2**(20-2))-(2**20))) <=s r_0_2, r_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**20))) <=s s_0_2, s_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**19))) <=s (r_0_2 - u_0_2), (r_0_2 - u_0_2) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_2 - v_0_2), (s_0_2 - v_0_2) <=s (const 64 ((2**20) - (2**(20 - 2)))),
    u_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_0_2 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step2

// premise a
assume
    g_0_low60_0_low20_2 = 0 (mod 2)
&&
    g_0_low60_0_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_3 f_0_low60_0_low20_2;
mov u_0_3 u_0_2;
mov v_0_3 v_0_2;

asr g_0_low60_0_low20_3 g_0_low60_0_low20_2 1;
asr r_0_3 r_0_2 1;
asr s_0_3 s_0_2 1;
assert
    true
&&
    f_0_low60_0_low20_3 = f_0_low60_0_low20_2,
    u_0_3 = u_0_2,
    v_0_3 = v_0_2,
    g_0_low60_0_low20_3 * (const 64 2) = g_0_low60_0_low20_2,
    r_0_3 * (const 64 2) = r_0_2,
    s_0_3 * (const 64 2) = s_0_2
;

assume
    f_0_low60_0_low20_3 = f_0_low60_0_low20_2,
    u_0_3 = u_0_2,
    v_0_3 = v_0_2,
    g_0_low60_0_low20_3 * 2 = g_0_low60_0_low20_2,
    r_0_3 * 2 = r_0_2,
    s_0_3 * 2 = s_0_2
&&
    true
;

{
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_02_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
bit ne
)={
    u_0_2 * f_0_low60_0_low20_0 + v_0_2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_2 * (-(2**20)),
    r_0_2 * f_0_low60_0_low20_0 + s_0_2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_2 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_2 + u_0_2 * (const 64 (2**21)) + v_0_2 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_2 + r_0_2 * (const 64 (2**21)) + s_0_2 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_2,
    f_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_2,
    g_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 2)) <=s delta, delta <=s (const 64 (1 + 2*2)),
    (const 64 (-(2**20))) <=s u_0_2, u_0_2 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_2, v_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)) )),
    (const 64 ((2**(20-2))-(2**20))) <=s r_0_2, r_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**20))) <=s s_0_2, s_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**19))) <=s (r_0_2 - u_0_2), (r_0_2 - u_0_2) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_2 - v_0_2), (s_0_2 - v_0_2) <=s (const 64 ((2**20) - (2**(20 - 2)))),
    u_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_0_2 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step2

// premise b
assume
    g_0_low60_0_low20_2 = 1 (mod 2)
&&
    g_0_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_3 f_0_low60_0_low20_2;
mov u_0_3 u_0_2;
mov v_0_3 v_0_2;

add g_0_low60_0_low20_3 g_0_low60_0_low20_2 f_0_low60_0_low20_2;
asr g_0_low60_0_low20_3 g_0_low60_0_low20_3 1;
add r_0_3 r_0_2 u_0_2;
asr r_0_3 r_0_3 1;
add s_0_3 s_0_2 v_0_2;
asr s_0_3 s_0_3 1;
assert
    true
&&
    f_0_low60_0_low20_3 = f_0_low60_0_low20_2,
    u_0_3 = u_0_2,
    v_0_3 = v_0_2,
    g_0_low60_0_low20_3 * (const 64 2) = g_0_low60_0_low20_2 + f_0_low60_0_low20_2,
    r_0_3 * (const 64 2) = r_0_2 + u_0_2,
    s_0_3 * (const 64 2) = s_0_2 + v_0_2
;

assume
    f_0_low60_0_low20_3 = f_0_low60_0_low20_2,
    u_0_3 = u_0_2,
    v_0_3 = v_0_2,
    g_0_low60_0_low20_3 * 2 = g_0_low60_0_low20_2 + f_0_low60_0_low20_2,
    r_0_3 * 2 = r_0_2 + u_0_2,
    s_0_3 * 2 = s_0_2 + v_0_2
&&
    true
;

{
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_02_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
bit ne
)={
    u_0_2 * f_0_low60_0_low20_0 + v_0_2 * g_0_low60_0_low20_0 = f_0_low60_0_low20_2 * (-(2**20)),
    r_0_2 * f_0_low60_0_low20_0 + s_0_2 * g_0_low60_0_low20_0 = g_0_low60_0_low20_2 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_2 + u_0_2 * (const 64 (2**21)) + v_0_2 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_2 + r_0_2 * (const 64 (2**21)) + s_0_2 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_2,
    f_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_2,
    g_0_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 2)) <=s delta, delta <=s (const 64 (1 + 2*2)),
    (const 64 (-(2**20))) <=s u_0_2, u_0_2 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_2, v_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)) )),
    (const 64 ((2**(20-2))-(2**20))) <=s r_0_2, r_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**20))) <=s s_0_2, s_0_2 <=s (const 64 ((2**19) - (2**(20 - 2)))),
    (const 64 ((2**(20-2))-(2**19))) <=s (r_0_2 - u_0_2), (r_0_2 - u_0_2) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_2 - v_0_2), (s_0_2 - v_0_2) <=s (const 64 ((2**20) - (2**(20 - 2)))),
    u_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_0_2 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_0_2 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step2

// premise c
assume
    g_0_low60_0_low20_2 = 1 (mod 2)
&&
    g_0_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_3 g_0_low60_0_low20_2;
mov u_0_3 r_0_2;
mov v_0_3 s_0_2;

subs dc g_0_low60_0_low20_3 g_0_low60_0_low20_2 f_0_low60_0_low20_2;
asr g_0_low60_0_low20_3 g_0_low60_0_low20_3 1;
subs dc r_0_3 r_0_2 u_0_2;
asr r_0_3 r_0_3 1;
subs dc s_0_3 s_0_2 v_0_2;
asr s_0_3 s_0_3 1;
assert
    true
&&
    f_0_low60_0_low20_3 = g_0_low60_0_low20_2,
    u_0_3 = r_0_2,
    v_0_3 = s_0_2,
    g_0_low60_0_low20_3 * (const 64 2) = g_0_low60_0_low20_2 - f_0_low60_0_low20_2,
    r_0_3 * (const 64 2) = r_0_2 - u_0_2,
    s_0_3 * (const 64 2) = s_0_2 - v_0_2
;

assume
    f_0_low60_0_low20_3 = g_0_low60_0_low20_2,
    u_0_3 = r_0_2,
    v_0_3 = s_0_2,
    g_0_low60_0_low20_3 * 2 = g_0_low60_0_low20_2 - f_0_low60_0_low20_2,
    r_0_3 * 2 = r_0_2 - u_0_2,
    s_0_3 * 2 = s_0_2 - v_0_2
&&
    true
;

{
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_03_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
bit ne
)={
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)),
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise a
assume
    g_0_low60_0_low20_3 = 0 (mod 2)
&&
    g_0_low60_0_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_4 f_0_low60_0_low20_3;
mov u_0_4 u_0_3;
mov v_0_4 v_0_3;

asr g_0_low60_0_low20_4 g_0_low60_0_low20_3 1;
asr r_0_4 r_0_3 1;
asr s_0_4 s_0_3 1;
assert
    true
&&
    f_0_low60_0_low20_4 = f_0_low60_0_low20_3,
    u_0_4 = u_0_3,
    v_0_4 = v_0_3,
    g_0_low60_0_low20_4 * (const 64 2) = g_0_low60_0_low20_3,
    r_0_4 * (const 64 2) = r_0_3,
    s_0_4 * (const 64 2) = s_0_3
;

assume
    f_0_low60_0_low20_4 = f_0_low60_0_low20_3,
    u_0_4 = u_0_3,
    v_0_4 = v_0_3,
    g_0_low60_0_low20_4 * 2 = g_0_low60_0_low20_3,
    r_0_4 * 2 = r_0_3,
    s_0_4 * 2 = s_0_3
&&
    true
;

{
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_03_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
bit ne
)={
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)),
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise b
assume
    g_0_low60_0_low20_3 = 1 (mod 2)
&&
    g_0_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_4 f_0_low60_0_low20_3;
mov u_0_4 u_0_3;
mov v_0_4 v_0_3;

add g_0_low60_0_low20_4 g_0_low60_0_low20_3 f_0_low60_0_low20_3;
asr g_0_low60_0_low20_4 g_0_low60_0_low20_4 1;
add r_0_4 r_0_3 u_0_3;
asr r_0_4 r_0_4 1;
add s_0_4 s_0_3 v_0_3;
asr s_0_4 s_0_4 1;
assert
    true
&&
    f_0_low60_0_low20_4 = f_0_low60_0_low20_3,
    u_0_4 = u_0_3,
    v_0_4 = v_0_3,
    g_0_low60_0_low20_4 * (const 64 2) = g_0_low60_0_low20_3 + f_0_low60_0_low20_3,
    r_0_4 * (const 64 2) = r_0_3 + u_0_3,
    s_0_4 * (const 64 2) = s_0_3 + v_0_3
;

assume
    f_0_low60_0_low20_4 = f_0_low60_0_low20_3,
    u_0_4 = u_0_3,
    v_0_4 = v_0_3,
    g_0_low60_0_low20_4 * 2 = g_0_low60_0_low20_3 + f_0_low60_0_low20_3,
    r_0_4 * 2 = r_0_3 + u_0_3,
    s_0_4 * 2 = s_0_3 + v_0_3
&&
    true
;

{
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_03_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
bit ne
)={
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)),
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise c
assume
    g_0_low60_0_low20_3 = 1 (mod 2)
&&
    g_0_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_4 g_0_low60_0_low20_3;
mov u_0_4 r_0_3;
mov v_0_4 s_0_3;

subs dc g_0_low60_0_low20_4 g_0_low60_0_low20_3 f_0_low60_0_low20_3;
asr g_0_low60_0_low20_4 g_0_low60_0_low20_4 1;
subs dc r_0_4 r_0_3 u_0_3;
asr r_0_4 r_0_4 1;
subs dc s_0_4 s_0_3 v_0_3;
asr s_0_4 s_0_4 1;
assert
    true
&&
    f_0_low60_0_low20_4 = g_0_low60_0_low20_3,
    u_0_4 = r_0_3,
    v_0_4 = s_0_3,
    g_0_low60_0_low20_4 * (const 64 2) = g_0_low60_0_low20_3 - f_0_low60_0_low20_3,
    r_0_4 * (const 64 2) = r_0_3 - u_0_3,
    s_0_4 * (const 64 2) = s_0_3 - v_0_3
;

assume
    f_0_low60_0_low20_4 = g_0_low60_0_low20_3,
    u_0_4 = r_0_3,
    v_0_4 = s_0_3,
    g_0_low60_0_low20_4 * 2 = g_0_low60_0_low20_3 - f_0_low60_0_low20_3,
    r_0_4 * 2 = r_0_3 - u_0_3,
    s_0_4 * 2 = s_0_3 - v_0_3
&&
    true
;

{
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_04_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 f_0_low60_0_low20_5,
sint64 g_0_low60_0_low20_5,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
sint64 u_0_5,
sint64 v_0_5,
sint64 r_0_5,
sint64 s_0_5,
bit ne
)={
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)),
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step4

// premise a
assume
    g_0_low60_0_low20_4 = 0 (mod 2)
&&
    g_0_low60_0_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_5 f_0_low60_0_low20_4;
mov u_0_5 u_0_4;
mov v_0_5 v_0_4;

asr g_0_low60_0_low20_5 g_0_low60_0_low20_4 1;
asr r_0_5 r_0_4 1;
asr s_0_5 s_0_4 1;
assert
    true
&&
    f_0_low60_0_low20_5 = f_0_low60_0_low20_4,
    u_0_5 = u_0_4,
    v_0_5 = v_0_4,
    g_0_low60_0_low20_5 * (const 64 2) = g_0_low60_0_low20_4,
    r_0_5 * (const 64 2) = r_0_4,
    s_0_5 * (const 64 2) = s_0_4
;

assume
    f_0_low60_0_low20_5 = f_0_low60_0_low20_4,
    u_0_5 = u_0_4,
    v_0_5 = v_0_4,
    g_0_low60_0_low20_5 * 2 = g_0_low60_0_low20_4,
    r_0_5 * 2 = r_0_4,
    s_0_5 * 2 = s_0_4
&&
    true
;

{
    u_0_5 * f_0_low60_0_low20_0 + v_0_5 * g_0_low60_0_low20_0 = f_0_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_5 * f_0_low60_0_low20_0 + s_0_5 * g_0_low60_0_low20_0 = g_0_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_5 + u_0_5 * (const 64 (2**21)) + v_0_5 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_5 + r_0_5 * (const 64 (2**21)) + s_0_5 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_5,
    f_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_5,
    g_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 5)) <=s delta, delta <=s (const 64 (1 + 2*5)),
    (const 64 (-(2**20))) <=s u_0_5, u_0_5 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_5, v_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)) )),
    (const 64 ((2**(20-5))-(2**20))) <=s r_0_5, r_0_5 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-5))-(2**20))) <=s s_0_5, s_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**19))) <=s (r_0_5 - u_0_5), (r_0_5 - u_0_5) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_5 - v_0_5), (s_0_5 - v_0_5) <=s (const 64 ((2**20) - (2**(20 - 5)))),
    u_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_0_5 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_04_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 f_0_low60_0_low20_5,
sint64 g_0_low60_0_low20_5,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
sint64 u_0_5,
sint64 v_0_5,
sint64 r_0_5,
sint64 s_0_5,
bit ne
)={
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)),
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step4

// premise b
assume
    g_0_low60_0_low20_4 = 1 (mod 2)
&&
    g_0_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_5 f_0_low60_0_low20_4;
mov u_0_5 u_0_4;
mov v_0_5 v_0_4;

add g_0_low60_0_low20_5 g_0_low60_0_low20_4 f_0_low60_0_low20_4;
asr g_0_low60_0_low20_5 g_0_low60_0_low20_5 1;
add r_0_5 r_0_4 u_0_4;
asr r_0_5 r_0_5 1;
add s_0_5 s_0_4 v_0_4;
asr s_0_5 s_0_5 1;
assert
    true
&&
    f_0_low60_0_low20_5 = f_0_low60_0_low20_4,
    u_0_5 = u_0_4,
    v_0_5 = v_0_4,
    g_0_low60_0_low20_5 * (const 64 2) = g_0_low60_0_low20_4 + f_0_low60_0_low20_4,
    r_0_5 * (const 64 2) = r_0_4 + u_0_4,
    s_0_5 * (const 64 2) = s_0_4 + v_0_4
;

assume
    f_0_low60_0_low20_5 = f_0_low60_0_low20_4,
    u_0_5 = u_0_4,
    v_0_5 = v_0_4,
    g_0_low60_0_low20_5 * 2 = g_0_low60_0_low20_4 + f_0_low60_0_low20_4,
    r_0_5 * 2 = r_0_4 + u_0_4,
    s_0_5 * 2 = s_0_4 + v_0_4
&&
    true
;

{
    u_0_5 * f_0_low60_0_low20_0 + v_0_5 * g_0_low60_0_low20_0 = f_0_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_5 * f_0_low60_0_low20_0 + s_0_5 * g_0_low60_0_low20_0 = g_0_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_5 + u_0_5 * (const 64 (2**21)) + v_0_5 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_5 + r_0_5 * (const 64 (2**21)) + s_0_5 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_5,
    f_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_5,
    g_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 5)) <=s delta, delta <=s (const 64 (1 + 2*5)),
    (const 64 (-(2**20))) <=s u_0_5, u_0_5 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_5, v_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)) )),
    (const 64 ((2**(20-5))-(2**20))) <=s r_0_5, r_0_5 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-5))-(2**20))) <=s s_0_5, s_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**19))) <=s (r_0_5 - u_0_5), (r_0_5 - u_0_5) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_5 - v_0_5), (s_0_5 - v_0_5) <=s (const 64 ((2**20) - (2**(20 - 5)))),
    u_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_0_5 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_04_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 f_0_low60_0_low20_5,
sint64 g_0_low60_0_low20_5,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
sint64 u_0_5,
sint64 v_0_5,
sint64 r_0_5,
sint64 s_0_5,
bit ne
)={
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)),
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step4

// premise c
assume
    g_0_low60_0_low20_4 = 1 (mod 2)
&&
    g_0_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_5 g_0_low60_0_low20_4;
mov u_0_5 r_0_4;
mov v_0_5 s_0_4;

subs dc g_0_low60_0_low20_5 g_0_low60_0_low20_4 f_0_low60_0_low20_4;
asr g_0_low60_0_low20_5 g_0_low60_0_low20_5 1;
subs dc r_0_5 r_0_4 u_0_4;
asr r_0_5 r_0_5 1;
subs dc s_0_5 s_0_4 v_0_4;
asr s_0_5 s_0_5 1;
assert
    true
&&
    f_0_low60_0_low20_5 = g_0_low60_0_low20_4,
    u_0_5 = r_0_4,
    v_0_5 = s_0_4,
    g_0_low60_0_low20_5 * (const 64 2) = g_0_low60_0_low20_4 - f_0_low60_0_low20_4,
    r_0_5 * (const 64 2) = r_0_4 - u_0_4,
    s_0_5 * (const 64 2) = s_0_4 - v_0_4
;

assume
    f_0_low60_0_low20_5 = g_0_low60_0_low20_4,
    u_0_5 = r_0_4,
    v_0_5 = s_0_4,
    g_0_low60_0_low20_5 * 2 = g_0_low60_0_low20_4 - f_0_low60_0_low20_4,
    r_0_5 * 2 = r_0_4 - u_0_4,
    s_0_5 * 2 = s_0_4 - v_0_4
&&
    true
;

{
    u_0_5 * f_0_low60_0_low20_0 + v_0_5 * g_0_low60_0_low20_0 = f_0_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_5 * f_0_low60_0_low20_0 + s_0_5 * g_0_low60_0_low20_0 = g_0_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_5 + u_0_5 * (const 64 (2**21)) + v_0_5 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_5 + r_0_5 * (const 64 (2**21)) + s_0_5 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_5,
    f_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_5,
    g_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 5)) <=s delta, delta <=s (const 64 (1 + 2*5)),
    (const 64 (-(2**20))) <=s u_0_5, u_0_5 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_5, v_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)) )),
    (const 64 ((2**(20-5))-(2**20))) <=s r_0_5, r_0_5 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-5))-(2**20))) <=s s_0_5, s_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**19))) <=s (r_0_5 - u_0_5), (r_0_5 - u_0_5) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_5 - v_0_5), (s_0_5 - v_0_5) <=s (const 64 ((2**20) - (2**(20 - 5)))),
    u_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_0_5 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_05_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_5,
sint64 g_0_low60_0_low20_5,
sint64 f_0_low60_0_low20_6,
sint64 g_0_low60_0_low20_6,
sint64 u_0_5,
sint64 v_0_5,
sint64 r_0_5,
sint64 s_0_5,
sint64 u_0_6,
sint64 v_0_6,
sint64 r_0_6,
sint64 s_0_6,
bit ne
)={
    u_0_5 * f_0_low60_0_low20_0 + v_0_5 * g_0_low60_0_low20_0 = f_0_low60_0_low20_5 * (-(2**20)),
    r_0_5 * f_0_low60_0_low20_0 + s_0_5 * g_0_low60_0_low20_0 = g_0_low60_0_low20_5 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_5 + u_0_5 * (const 64 (2**21)) + v_0_5 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_5 + r_0_5 * (const 64 (2**21)) + s_0_5 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_5,
    f_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_5,
    g_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 5)) <=s delta, delta <=s (const 64 (1 + 2*5)),
    (const 64 (-(2**20))) <=s u_0_5, u_0_5 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_5, v_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)) )),
    (const 64 ((2**(20-5))-(2**20))) <=s r_0_5, r_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**20))) <=s s_0_5, s_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**19))) <=s (r_0_5 - u_0_5), (r_0_5 - u_0_5) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_5 - v_0_5), (s_0_5 - v_0_5) <=s (const 64 ((2**20) - (2**(20 - 5)))),
    u_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_0_5 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step5

// premise a
assume
    g_0_low60_0_low20_5 = 0 (mod 2)
&&
    g_0_low60_0_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_6 f_0_low60_0_low20_5;
mov u_0_6 u_0_5;
mov v_0_6 v_0_5;

asr g_0_low60_0_low20_6 g_0_low60_0_low20_5 1;
asr r_0_6 r_0_5 1;
asr s_0_6 s_0_5 1;
assert
    true
&&
    f_0_low60_0_low20_6 = f_0_low60_0_low20_5,
    u_0_6 = u_0_5,
    v_0_6 = v_0_5,
    g_0_low60_0_low20_6 * (const 64 2) = g_0_low60_0_low20_5,
    r_0_6 * (const 64 2) = r_0_5,
    s_0_6 * (const 64 2) = s_0_5
;

assume
    f_0_low60_0_low20_6 = f_0_low60_0_low20_5,
    u_0_6 = u_0_5,
    v_0_6 = v_0_5,
    g_0_low60_0_low20_6 * 2 = g_0_low60_0_low20_5,
    r_0_6 * 2 = r_0_5,
    s_0_6 * 2 = s_0_5
&&
    true
;

{
    u_0_6 * f_0_low60_0_low20_0 + v_0_6 * g_0_low60_0_low20_0 = f_0_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_6 * f_0_low60_0_low20_0 + s_0_6 * g_0_low60_0_low20_0 = g_0_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_6 + u_0_6 * (const 64 (2**21)) + v_0_6 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_6 + r_0_6 * (const 64 (2**21)) + s_0_6 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_6,
    f_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_6,
    g_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 6)) <=s delta, delta <=s (const 64 (1 + 2*6)),
    (const 64 (-(2**20))) <=s u_0_6, u_0_6 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_6, v_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)) )),
    (const 64 ((2**(20-6))-(2**20))) <=s r_0_6, r_0_6 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-6))-(2**20))) <=s s_0_6, s_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**19))) <=s (r_0_6 - u_0_6), (r_0_6 - u_0_6) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_6 - v_0_6), (s_0_6 - v_0_6) <=s (const 64 ((2**20) - (2**(20 - 6)))),
    u_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_0_6 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_05_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_5,
sint64 g_0_low60_0_low20_5,
sint64 f_0_low60_0_low20_6,
sint64 g_0_low60_0_low20_6,
sint64 u_0_5,
sint64 v_0_5,
sint64 r_0_5,
sint64 s_0_5,
sint64 u_0_6,
sint64 v_0_6,
sint64 r_0_6,
sint64 s_0_6,
bit ne
)={
    u_0_5 * f_0_low60_0_low20_0 + v_0_5 * g_0_low60_0_low20_0 = f_0_low60_0_low20_5 * (-(2**20)),
    r_0_5 * f_0_low60_0_low20_0 + s_0_5 * g_0_low60_0_low20_0 = g_0_low60_0_low20_5 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_5 + u_0_5 * (const 64 (2**21)) + v_0_5 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_5 + r_0_5 * (const 64 (2**21)) + s_0_5 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_5,
    f_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_5,
    g_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 5)) <=s delta, delta <=s (const 64 (1 + 2*5)),
    (const 64 (-(2**20))) <=s u_0_5, u_0_5 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_5, v_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)) )),
    (const 64 ((2**(20-5))-(2**20))) <=s r_0_5, r_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**20))) <=s s_0_5, s_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**19))) <=s (r_0_5 - u_0_5), (r_0_5 - u_0_5) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_5 - v_0_5), (s_0_5 - v_0_5) <=s (const 64 ((2**20) - (2**(20 - 5)))),
    u_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_0_5 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step5

// premise b
assume
    g_0_low60_0_low20_5 = 1 (mod 2)
&&
    g_0_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_6 f_0_low60_0_low20_5;
mov u_0_6 u_0_5;
mov v_0_6 v_0_5;

add g_0_low60_0_low20_6 g_0_low60_0_low20_5 f_0_low60_0_low20_5;
asr g_0_low60_0_low20_6 g_0_low60_0_low20_6 1;
add r_0_6 r_0_5 u_0_5;
asr r_0_6 r_0_6 1;
add s_0_6 s_0_5 v_0_5;
asr s_0_6 s_0_6 1;
assert
    true
&&
    f_0_low60_0_low20_6 = f_0_low60_0_low20_5,
    u_0_6 = u_0_5,
    v_0_6 = v_0_5,
    g_0_low60_0_low20_6 * (const 64 2) = g_0_low60_0_low20_5 + f_0_low60_0_low20_5,
    r_0_6 * (const 64 2) = r_0_5 + u_0_5,
    s_0_6 * (const 64 2) = s_0_5 + v_0_5
;

assume
    f_0_low60_0_low20_6 = f_0_low60_0_low20_5,
    u_0_6 = u_0_5,
    v_0_6 = v_0_5,
    g_0_low60_0_low20_6 * 2 = g_0_low60_0_low20_5 + f_0_low60_0_low20_5,
    r_0_6 * 2 = r_0_5 + u_0_5,
    s_0_6 * 2 = s_0_5 + v_0_5
&&
    true
;

{
    u_0_6 * f_0_low60_0_low20_0 + v_0_6 * g_0_low60_0_low20_0 = f_0_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_6 * f_0_low60_0_low20_0 + s_0_6 * g_0_low60_0_low20_0 = g_0_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_6 + u_0_6 * (const 64 (2**21)) + v_0_6 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_6 + r_0_6 * (const 64 (2**21)) + s_0_6 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_6,
    f_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_6,
    g_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 6)) <=s delta, delta <=s (const 64 (1 + 2*6)),
    (const 64 (-(2**20))) <=s u_0_6, u_0_6 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_6, v_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)) )),
    (const 64 ((2**(20-6))-(2**20))) <=s r_0_6, r_0_6 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-6))-(2**20))) <=s s_0_6, s_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**19))) <=s (r_0_6 - u_0_6), (r_0_6 - u_0_6) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_6 - v_0_6), (s_0_6 - v_0_6) <=s (const 64 ((2**20) - (2**(20 - 6)))),
    u_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_0_6 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_05_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_5,
sint64 g_0_low60_0_low20_5,
sint64 f_0_low60_0_low20_6,
sint64 g_0_low60_0_low20_6,
sint64 u_0_5,
sint64 v_0_5,
sint64 r_0_5,
sint64 s_0_5,
sint64 u_0_6,
sint64 v_0_6,
sint64 r_0_6,
sint64 s_0_6,
bit ne
)={
    u_0_5 * f_0_low60_0_low20_0 + v_0_5 * g_0_low60_0_low20_0 = f_0_low60_0_low20_5 * (-(2**20)),
    r_0_5 * f_0_low60_0_low20_0 + s_0_5 * g_0_low60_0_low20_0 = g_0_low60_0_low20_5 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_5 + u_0_5 * (const 64 (2**21)) + v_0_5 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_5 + r_0_5 * (const 64 (2**21)) + s_0_5 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_5,
    f_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_5,
    g_0_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 5)) <=s delta, delta <=s (const 64 (1 + 2*5)),
    (const 64 (-(2**20))) <=s u_0_5, u_0_5 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_5, v_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)) )),
    (const 64 ((2**(20-5))-(2**20))) <=s r_0_5, r_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**20))) <=s s_0_5, s_0_5 <=s (const 64 ((2**19) - (2**(20 - 5)))),
    (const 64 ((2**(20-5))-(2**19))) <=s (r_0_5 - u_0_5), (r_0_5 - u_0_5) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_5 - v_0_5), (s_0_5 - v_0_5) <=s (const 64 ((2**20) - (2**(20 - 5)))),
    u_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_0_5 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_0_5 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step5

// premise c
assume
    g_0_low60_0_low20_5 = 1 (mod 2)
&&
    g_0_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_6 g_0_low60_0_low20_5;
mov u_0_6 r_0_5;
mov v_0_6 s_0_5;

subs dc g_0_low60_0_low20_6 g_0_low60_0_low20_5 f_0_low60_0_low20_5;
asr g_0_low60_0_low20_6 g_0_low60_0_low20_6 1;
subs dc r_0_6 r_0_5 u_0_5;
asr r_0_6 r_0_6 1;
subs dc s_0_6 s_0_5 v_0_5;
asr s_0_6 s_0_6 1;
assert
    true
&&
    f_0_low60_0_low20_6 = g_0_low60_0_low20_5,
    u_0_6 = r_0_5,
    v_0_6 = s_0_5,
    g_0_low60_0_low20_6 * (const 64 2) = g_0_low60_0_low20_5 - f_0_low60_0_low20_5,
    r_0_6 * (const 64 2) = r_0_5 - u_0_5,
    s_0_6 * (const 64 2) = s_0_5 - v_0_5
;

assume
    f_0_low60_0_low20_6 = g_0_low60_0_low20_5,
    u_0_6 = r_0_5,
    v_0_6 = s_0_5,
    g_0_low60_0_low20_6 * 2 = g_0_low60_0_low20_5 - f_0_low60_0_low20_5,
    r_0_6 * 2 = r_0_5 - u_0_5,
    s_0_6 * 2 = s_0_5 - v_0_5
&&
    true
;

{
    u_0_6 * f_0_low60_0_low20_0 + v_0_6 * g_0_low60_0_low20_0 = f_0_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_6 * f_0_low60_0_low20_0 + s_0_6 * g_0_low60_0_low20_0 = g_0_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_6 + u_0_6 * (const 64 (2**21)) + v_0_6 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_6 + r_0_6 * (const 64 (2**21)) + s_0_6 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_6,
    f_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_6,
    g_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 6)) <=s delta, delta <=s (const 64 (1 + 2*6)),
    (const 64 (-(2**20))) <=s u_0_6, u_0_6 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_6, v_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)) )),
    (const 64 ((2**(20-6))-(2**20))) <=s r_0_6, r_0_6 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-6))-(2**20))) <=s s_0_6, s_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**19))) <=s (r_0_6 - u_0_6), (r_0_6 - u_0_6) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_6 - v_0_6), (s_0_6 - v_0_6) <=s (const 64 ((2**20) - (2**(20 - 6)))),
    u_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_0_6 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_06_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_6,
sint64 g_0_low60_0_low20_6,
sint64 f_0_low60_0_low20_7,
sint64 g_0_low60_0_low20_7,
sint64 u_0_6,
sint64 v_0_6,
sint64 r_0_6,
sint64 s_0_6,
sint64 u_0_7,
sint64 v_0_7,
sint64 r_0_7,
sint64 s_0_7,
bit ne
)={
    u_0_6 * f_0_low60_0_low20_0 + v_0_6 * g_0_low60_0_low20_0 = f_0_low60_0_low20_6 * (-(2**20)),
    r_0_6 * f_0_low60_0_low20_0 + s_0_6 * g_0_low60_0_low20_0 = g_0_low60_0_low20_6 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_6 + u_0_6 * (const 64 (2**21)) + v_0_6 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_6 + r_0_6 * (const 64 (2**21)) + s_0_6 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_6,
    f_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_6,
    g_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 6)) <=s delta, delta <=s (const 64 (1 + 2*6)),
    (const 64 (-(2**20))) <=s u_0_6, u_0_6 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_6, v_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)) )),
    (const 64 ((2**(20-6))-(2**20))) <=s r_0_6, r_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**20))) <=s s_0_6, s_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**19))) <=s (r_0_6 - u_0_6), (r_0_6 - u_0_6) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_6 - v_0_6), (s_0_6 - v_0_6) <=s (const 64 ((2**20) - (2**(20 - 6)))),
    u_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_0_6 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step6

// premise a
assume
    g_0_low60_0_low20_6 = 0 (mod 2)
&&
    g_0_low60_0_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_7 f_0_low60_0_low20_6;
mov u_0_7 u_0_6;
mov v_0_7 v_0_6;

asr g_0_low60_0_low20_7 g_0_low60_0_low20_6 1;
asr r_0_7 r_0_6 1;
asr s_0_7 s_0_6 1;
assert
    true
&&
    f_0_low60_0_low20_7 = f_0_low60_0_low20_6,
    u_0_7 = u_0_6,
    v_0_7 = v_0_6,
    g_0_low60_0_low20_7 * (const 64 2) = g_0_low60_0_low20_6,
    r_0_7 * (const 64 2) = r_0_6,
    s_0_7 * (const 64 2) = s_0_6
;

assume
    f_0_low60_0_low20_7 = f_0_low60_0_low20_6,
    u_0_7 = u_0_6,
    v_0_7 = v_0_6,
    g_0_low60_0_low20_7 * 2 = g_0_low60_0_low20_6,
    r_0_7 * 2 = r_0_6,
    s_0_7 * 2 = s_0_6
&&
    true
;

{
    u_0_7 * f_0_low60_0_low20_0 + v_0_7 * g_0_low60_0_low20_0 = f_0_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_7 * f_0_low60_0_low20_0 + s_0_7 * g_0_low60_0_low20_0 = g_0_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_7 + u_0_7 * (const 64 (2**21)) + v_0_7 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_7 + r_0_7 * (const 64 (2**21)) + s_0_7 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_7,
    f_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_7,
    g_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 7)) <=s delta, delta <=s (const 64 (1 + 2*7)),
    (const 64 (-(2**20))) <=s u_0_7, u_0_7 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_7, v_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)) )),
    (const 64 ((2**(20-7))-(2**20))) <=s r_0_7, r_0_7 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-7))-(2**20))) <=s s_0_7, s_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**19))) <=s (r_0_7 - u_0_7), (r_0_7 - u_0_7) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_7 - v_0_7), (s_0_7 - v_0_7) <=s (const 64 ((2**20) - (2**(20 - 7)))),
    u_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_0_7 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_06_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_6,
sint64 g_0_low60_0_low20_6,
sint64 f_0_low60_0_low20_7,
sint64 g_0_low60_0_low20_7,
sint64 u_0_6,
sint64 v_0_6,
sint64 r_0_6,
sint64 s_0_6,
sint64 u_0_7,
sint64 v_0_7,
sint64 r_0_7,
sint64 s_0_7,
bit ne
)={
    u_0_6 * f_0_low60_0_low20_0 + v_0_6 * g_0_low60_0_low20_0 = f_0_low60_0_low20_6 * (-(2**20)),
    r_0_6 * f_0_low60_0_low20_0 + s_0_6 * g_0_low60_0_low20_0 = g_0_low60_0_low20_6 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_6 + u_0_6 * (const 64 (2**21)) + v_0_6 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_6 + r_0_6 * (const 64 (2**21)) + s_0_6 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_6,
    f_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_6,
    g_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 6)) <=s delta, delta <=s (const 64 (1 + 2*6)),
    (const 64 (-(2**20))) <=s u_0_6, u_0_6 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_6, v_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)) )),
    (const 64 ((2**(20-6))-(2**20))) <=s r_0_6, r_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**20))) <=s s_0_6, s_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**19))) <=s (r_0_6 - u_0_6), (r_0_6 - u_0_6) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_6 - v_0_6), (s_0_6 - v_0_6) <=s (const 64 ((2**20) - (2**(20 - 6)))),
    u_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_0_6 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step6

// premise b
assume
    g_0_low60_0_low20_6 = 1 (mod 2)
&&
    g_0_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_7 f_0_low60_0_low20_6;
mov u_0_7 u_0_6;
mov v_0_7 v_0_6;

add g_0_low60_0_low20_7 g_0_low60_0_low20_6 f_0_low60_0_low20_6;
asr g_0_low60_0_low20_7 g_0_low60_0_low20_7 1;
add r_0_7 r_0_6 u_0_6;
asr r_0_7 r_0_7 1;
add s_0_7 s_0_6 v_0_6;
asr s_0_7 s_0_7 1;
assert
    true
&&
    f_0_low60_0_low20_7 = f_0_low60_0_low20_6,
    u_0_7 = u_0_6,
    v_0_7 = v_0_6,
    g_0_low60_0_low20_7 * (const 64 2) = g_0_low60_0_low20_6 + f_0_low60_0_low20_6,
    r_0_7 * (const 64 2) = r_0_6 + u_0_6,
    s_0_7 * (const 64 2) = s_0_6 + v_0_6
;

assume
    f_0_low60_0_low20_7 = f_0_low60_0_low20_6,
    u_0_7 = u_0_6,
    v_0_7 = v_0_6,
    g_0_low60_0_low20_7 * 2 = g_0_low60_0_low20_6 + f_0_low60_0_low20_6,
    r_0_7 * 2 = r_0_6 + u_0_6,
    s_0_7 * 2 = s_0_6 + v_0_6
&&
    true
;

{
    u_0_7 * f_0_low60_0_low20_0 + v_0_7 * g_0_low60_0_low20_0 = f_0_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_7 * f_0_low60_0_low20_0 + s_0_7 * g_0_low60_0_low20_0 = g_0_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_7 + u_0_7 * (const 64 (2**21)) + v_0_7 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_7 + r_0_7 * (const 64 (2**21)) + s_0_7 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_7,
    f_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_7,
    g_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 7)) <=s delta, delta <=s (const 64 (1 + 2*7)),
    (const 64 (-(2**20))) <=s u_0_7, u_0_7 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_7, v_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)) )),
    (const 64 ((2**(20-7))-(2**20))) <=s r_0_7, r_0_7 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-7))-(2**20))) <=s s_0_7, s_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**19))) <=s (r_0_7 - u_0_7), (r_0_7 - u_0_7) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_7 - v_0_7), (s_0_7 - v_0_7) <=s (const 64 ((2**20) - (2**(20 - 7)))),
    u_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_0_7 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_06_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_6,
sint64 g_0_low60_0_low20_6,
sint64 f_0_low60_0_low20_7,
sint64 g_0_low60_0_low20_7,
sint64 u_0_6,
sint64 v_0_6,
sint64 r_0_6,
sint64 s_0_6,
sint64 u_0_7,
sint64 v_0_7,
sint64 r_0_7,
sint64 s_0_7,
bit ne
)={
    u_0_6 * f_0_low60_0_low20_0 + v_0_6 * g_0_low60_0_low20_0 = f_0_low60_0_low20_6 * (-(2**20)),
    r_0_6 * f_0_low60_0_low20_0 + s_0_6 * g_0_low60_0_low20_0 = g_0_low60_0_low20_6 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_6 + u_0_6 * (const 64 (2**21)) + v_0_6 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_6 + r_0_6 * (const 64 (2**21)) + s_0_6 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_6,
    f_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_6,
    g_0_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 6)) <=s delta, delta <=s (const 64 (1 + 2*6)),
    (const 64 (-(2**20))) <=s u_0_6, u_0_6 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_6, v_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)) )),
    (const 64 ((2**(20-6))-(2**20))) <=s r_0_6, r_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**20))) <=s s_0_6, s_0_6 <=s (const 64 ((2**19) - (2**(20 - 6)))),
    (const 64 ((2**(20-6))-(2**19))) <=s (r_0_6 - u_0_6), (r_0_6 - u_0_6) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_6 - v_0_6), (s_0_6 - v_0_6) <=s (const 64 ((2**20) - (2**(20 - 6)))),
    u_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_0_6 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_0_6 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step6

// premise c
assume
    g_0_low60_0_low20_6 = 1 (mod 2)
&&
    g_0_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_7 g_0_low60_0_low20_6;
mov u_0_7 r_0_6;
mov v_0_7 s_0_6;

subs dc g_0_low60_0_low20_7 g_0_low60_0_low20_6 f_0_low60_0_low20_6;
asr g_0_low60_0_low20_7 g_0_low60_0_low20_7 1;
subs dc r_0_7 r_0_6 u_0_6;
asr r_0_7 r_0_7 1;
subs dc s_0_7 s_0_6 v_0_6;
asr s_0_7 s_0_7 1;
assert
    true
&&
    f_0_low60_0_low20_7 = g_0_low60_0_low20_6,
    u_0_7 = r_0_6,
    v_0_7 = s_0_6,
    g_0_low60_0_low20_7 * (const 64 2) = g_0_low60_0_low20_6 - f_0_low60_0_low20_6,
    r_0_7 * (const 64 2) = r_0_6 - u_0_6,
    s_0_7 * (const 64 2) = s_0_6 - v_0_6
;

assume
    f_0_low60_0_low20_7 = g_0_low60_0_low20_6,
    u_0_7 = r_0_6,
    v_0_7 = s_0_6,
    g_0_low60_0_low20_7 * 2 = g_0_low60_0_low20_6 - f_0_low60_0_low20_6,
    r_0_7 * 2 = r_0_6 - u_0_6,
    s_0_7 * 2 = s_0_6 - v_0_6
&&
    true
;

{
    u_0_7 * f_0_low60_0_low20_0 + v_0_7 * g_0_low60_0_low20_0 = f_0_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_7 * f_0_low60_0_low20_0 + s_0_7 * g_0_low60_0_low20_0 = g_0_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_7 + u_0_7 * (const 64 (2**21)) + v_0_7 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_7 + r_0_7 * (const 64 (2**21)) + s_0_7 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_7,
    f_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_7,
    g_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 7)) <=s delta, delta <=s (const 64 (1 + 2*7)),
    (const 64 (-(2**20))) <=s u_0_7, u_0_7 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_7, v_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)) )),
    (const 64 ((2**(20-7))-(2**20))) <=s r_0_7, r_0_7 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-7))-(2**20))) <=s s_0_7, s_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**19))) <=s (r_0_7 - u_0_7), (r_0_7 - u_0_7) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_7 - v_0_7), (s_0_7 - v_0_7) <=s (const 64 ((2**20) - (2**(20 - 7)))),
    u_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_0_7 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_07_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_7,
sint64 g_0_low60_0_low20_7,
sint64 f_0_low60_0_low20_8,
sint64 g_0_low60_0_low20_8,
sint64 u_0_7,
sint64 v_0_7,
sint64 r_0_7,
sint64 s_0_7,
sint64 u_0_8,
sint64 v_0_8,
sint64 r_0_8,
sint64 s_0_8,
bit ne
)={
    u_0_7 * f_0_low60_0_low20_0 + v_0_7 * g_0_low60_0_low20_0 = f_0_low60_0_low20_7 * (-(2**20)),
    r_0_7 * f_0_low60_0_low20_0 + s_0_7 * g_0_low60_0_low20_0 = g_0_low60_0_low20_7 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_7 + u_0_7 * (const 64 (2**21)) + v_0_7 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_7 + r_0_7 * (const 64 (2**21)) + s_0_7 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_7,
    f_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_7,
    g_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 7)) <=s delta, delta <=s (const 64 (1 + 2*7)),
    (const 64 (-(2**20))) <=s u_0_7, u_0_7 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_7, v_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)) )),
    (const 64 ((2**(20-7))-(2**20))) <=s r_0_7, r_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**20))) <=s s_0_7, s_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**19))) <=s (r_0_7 - u_0_7), (r_0_7 - u_0_7) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_7 - v_0_7), (s_0_7 - v_0_7) <=s (const 64 ((2**20) - (2**(20 - 7)))),
    u_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_0_7 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step7

// premise a
assume
    g_0_low60_0_low20_7 = 0 (mod 2)
&&
    g_0_low60_0_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_8 f_0_low60_0_low20_7;
mov u_0_8 u_0_7;
mov v_0_8 v_0_7;

asr g_0_low60_0_low20_8 g_0_low60_0_low20_7 1;
asr r_0_8 r_0_7 1;
asr s_0_8 s_0_7 1;
assert
    true
&&
    f_0_low60_0_low20_8 = f_0_low60_0_low20_7,
    u_0_8 = u_0_7,
    v_0_8 = v_0_7,
    g_0_low60_0_low20_8 * (const 64 2) = g_0_low60_0_low20_7,
    r_0_8 * (const 64 2) = r_0_7,
    s_0_8 * (const 64 2) = s_0_7
;

assume
    f_0_low60_0_low20_8 = f_0_low60_0_low20_7,
    u_0_8 = u_0_7,
    v_0_8 = v_0_7,
    g_0_low60_0_low20_8 * 2 = g_0_low60_0_low20_7,
    r_0_8 * 2 = r_0_7,
    s_0_8 * 2 = s_0_7
&&
    true
;

{
    u_0_8 * f_0_low60_0_low20_0 + v_0_8 * g_0_low60_0_low20_0 = f_0_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_8 * f_0_low60_0_low20_0 + s_0_8 * g_0_low60_0_low20_0 = g_0_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_8 + u_0_8 * (const 64 (2**21)) + v_0_8 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_8 + r_0_8 * (const 64 (2**21)) + s_0_8 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_8,
    f_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_8,
    g_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 8)) <=s delta, delta <=s (const 64 (1 + 2*8)),
    (const 64 (-(2**20))) <=s u_0_8, u_0_8 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_8, v_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)) )),
    (const 64 ((2**(20-8))-(2**20))) <=s r_0_8, r_0_8 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-8))-(2**20))) <=s s_0_8, s_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**19))) <=s (r_0_8 - u_0_8), (r_0_8 - u_0_8) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_8 - v_0_8), (s_0_8 - v_0_8) <=s (const 64 ((2**20) - (2**(20 - 8)))),
    u_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_0_8 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_07_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_7,
sint64 g_0_low60_0_low20_7,
sint64 f_0_low60_0_low20_8,
sint64 g_0_low60_0_low20_8,
sint64 u_0_7,
sint64 v_0_7,
sint64 r_0_7,
sint64 s_0_7,
sint64 u_0_8,
sint64 v_0_8,
sint64 r_0_8,
sint64 s_0_8,
bit ne
)={
    u_0_7 * f_0_low60_0_low20_0 + v_0_7 * g_0_low60_0_low20_0 = f_0_low60_0_low20_7 * (-(2**20)),
    r_0_7 * f_0_low60_0_low20_0 + s_0_7 * g_0_low60_0_low20_0 = g_0_low60_0_low20_7 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_7 + u_0_7 * (const 64 (2**21)) + v_0_7 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_7 + r_0_7 * (const 64 (2**21)) + s_0_7 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_7,
    f_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_7,
    g_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 7)) <=s delta, delta <=s (const 64 (1 + 2*7)),
    (const 64 (-(2**20))) <=s u_0_7, u_0_7 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_7, v_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)) )),
    (const 64 ((2**(20-7))-(2**20))) <=s r_0_7, r_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**20))) <=s s_0_7, s_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**19))) <=s (r_0_7 - u_0_7), (r_0_7 - u_0_7) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_7 - v_0_7), (s_0_7 - v_0_7) <=s (const 64 ((2**20) - (2**(20 - 7)))),
    u_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_0_7 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step7

// premise b
assume
    g_0_low60_0_low20_7 = 1 (mod 2)
&&
    g_0_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_8 f_0_low60_0_low20_7;
mov u_0_8 u_0_7;
mov v_0_8 v_0_7;

add g_0_low60_0_low20_8 g_0_low60_0_low20_7 f_0_low60_0_low20_7;
asr g_0_low60_0_low20_8 g_0_low60_0_low20_8 1;
add r_0_8 r_0_7 u_0_7;
asr r_0_8 r_0_8 1;
add s_0_8 s_0_7 v_0_7;
asr s_0_8 s_0_8 1;
assert
    true
&&
    f_0_low60_0_low20_8 = f_0_low60_0_low20_7,
    u_0_8 = u_0_7,
    v_0_8 = v_0_7,
    g_0_low60_0_low20_8 * (const 64 2) = g_0_low60_0_low20_7 + f_0_low60_0_low20_7,
    r_0_8 * (const 64 2) = r_0_7 + u_0_7,
    s_0_8 * (const 64 2) = s_0_7 + v_0_7
;

assume
    f_0_low60_0_low20_8 = f_0_low60_0_low20_7,
    u_0_8 = u_0_7,
    v_0_8 = v_0_7,
    g_0_low60_0_low20_8 * 2 = g_0_low60_0_low20_7 + f_0_low60_0_low20_7,
    r_0_8 * 2 = r_0_7 + u_0_7,
    s_0_8 * 2 = s_0_7 + v_0_7
&&
    true
;

{
    u_0_8 * f_0_low60_0_low20_0 + v_0_8 * g_0_low60_0_low20_0 = f_0_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_8 * f_0_low60_0_low20_0 + s_0_8 * g_0_low60_0_low20_0 = g_0_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_8 + u_0_8 * (const 64 (2**21)) + v_0_8 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_8 + r_0_8 * (const 64 (2**21)) + s_0_8 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_8,
    f_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_8,
    g_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 8)) <=s delta, delta <=s (const 64 (1 + 2*8)),
    (const 64 (-(2**20))) <=s u_0_8, u_0_8 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_8, v_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)) )),
    (const 64 ((2**(20-8))-(2**20))) <=s r_0_8, r_0_8 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-8))-(2**20))) <=s s_0_8, s_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**19))) <=s (r_0_8 - u_0_8), (r_0_8 - u_0_8) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_8 - v_0_8), (s_0_8 - v_0_8) <=s (const 64 ((2**20) - (2**(20 - 8)))),
    u_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_0_8 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_07_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_7,
sint64 g_0_low60_0_low20_7,
sint64 f_0_low60_0_low20_8,
sint64 g_0_low60_0_low20_8,
sint64 u_0_7,
sint64 v_0_7,
sint64 r_0_7,
sint64 s_0_7,
sint64 u_0_8,
sint64 v_0_8,
sint64 r_0_8,
sint64 s_0_8,
bit ne
)={
    u_0_7 * f_0_low60_0_low20_0 + v_0_7 * g_0_low60_0_low20_0 = f_0_low60_0_low20_7 * (-(2**20)),
    r_0_7 * f_0_low60_0_low20_0 + s_0_7 * g_0_low60_0_low20_0 = g_0_low60_0_low20_7 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_7 + u_0_7 * (const 64 (2**21)) + v_0_7 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_7 + r_0_7 * (const 64 (2**21)) + s_0_7 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_7,
    f_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_7,
    g_0_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 7)) <=s delta, delta <=s (const 64 (1 + 2*7)),
    (const 64 (-(2**20))) <=s u_0_7, u_0_7 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_7, v_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)) )),
    (const 64 ((2**(20-7))-(2**20))) <=s r_0_7, r_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**20))) <=s s_0_7, s_0_7 <=s (const 64 ((2**19) - (2**(20 - 7)))),
    (const 64 ((2**(20-7))-(2**19))) <=s (r_0_7 - u_0_7), (r_0_7 - u_0_7) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_7 - v_0_7), (s_0_7 - v_0_7) <=s (const 64 ((2**20) - (2**(20 - 7)))),
    u_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_0_7 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_0_7 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step7

// premise c
assume
    g_0_low60_0_low20_7 = 1 (mod 2)
&&
    g_0_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_8 g_0_low60_0_low20_7;
mov u_0_8 r_0_7;
mov v_0_8 s_0_7;

subs dc g_0_low60_0_low20_8 g_0_low60_0_low20_7 f_0_low60_0_low20_7;
asr g_0_low60_0_low20_8 g_0_low60_0_low20_8 1;
subs dc r_0_8 r_0_7 u_0_7;
asr r_0_8 r_0_8 1;
subs dc s_0_8 s_0_7 v_0_7;
asr s_0_8 s_0_8 1;
assert
    true
&&
    f_0_low60_0_low20_8 = g_0_low60_0_low20_7,
    u_0_8 = r_0_7,
    v_0_8 = s_0_7,
    g_0_low60_0_low20_8 * (const 64 2) = g_0_low60_0_low20_7 - f_0_low60_0_low20_7,
    r_0_8 * (const 64 2) = r_0_7 - u_0_7,
    s_0_8 * (const 64 2) = s_0_7 - v_0_7
;

assume
    f_0_low60_0_low20_8 = g_0_low60_0_low20_7,
    u_0_8 = r_0_7,
    v_0_8 = s_0_7,
    g_0_low60_0_low20_8 * 2 = g_0_low60_0_low20_7 - f_0_low60_0_low20_7,
    r_0_8 * 2 = r_0_7 - u_0_7,
    s_0_8 * 2 = s_0_7 - v_0_7
&&
    true
;

{
    u_0_8 * f_0_low60_0_low20_0 + v_0_8 * g_0_low60_0_low20_0 = f_0_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_8 * f_0_low60_0_low20_0 + s_0_8 * g_0_low60_0_low20_0 = g_0_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_8 + u_0_8 * (const 64 (2**21)) + v_0_8 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_8 + r_0_8 * (const 64 (2**21)) + s_0_8 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_8,
    f_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_8,
    g_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 8)) <=s delta, delta <=s (const 64 (1 + 2*8)),
    (const 64 (-(2**20))) <=s u_0_8, u_0_8 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_8, v_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)) )),
    (const 64 ((2**(20-8))-(2**20))) <=s r_0_8, r_0_8 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-8))-(2**20))) <=s s_0_8, s_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**19))) <=s (r_0_8 - u_0_8), (r_0_8 - u_0_8) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_8 - v_0_8), (s_0_8 - v_0_8) <=s (const 64 ((2**20) - (2**(20 - 8)))),
    u_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_0_8 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_08_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_8,
sint64 g_0_low60_0_low20_8,
sint64 f_0_low60_0_low20_9,
sint64 g_0_low60_0_low20_9,
sint64 u_0_8,
sint64 v_0_8,
sint64 r_0_8,
sint64 s_0_8,
sint64 u_0_9,
sint64 v_0_9,
sint64 r_0_9,
sint64 s_0_9,
bit ne
)={
    u_0_8 * f_0_low60_0_low20_0 + v_0_8 * g_0_low60_0_low20_0 = f_0_low60_0_low20_8 * (-(2**20)),
    r_0_8 * f_0_low60_0_low20_0 + s_0_8 * g_0_low60_0_low20_0 = g_0_low60_0_low20_8 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_8 + u_0_8 * (const 64 (2**21)) + v_0_8 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_8 + r_0_8 * (const 64 (2**21)) + s_0_8 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_8,
    f_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_8,
    g_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 8)) <=s delta, delta <=s (const 64 (1 + 2*8)),
    (const 64 (-(2**20))) <=s u_0_8, u_0_8 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_8, v_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)) )),
    (const 64 ((2**(20-8))-(2**20))) <=s r_0_8, r_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**20))) <=s s_0_8, s_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**19))) <=s (r_0_8 - u_0_8), (r_0_8 - u_0_8) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_8 - v_0_8), (s_0_8 - v_0_8) <=s (const 64 ((2**20) - (2**(20 - 8)))),
    u_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_0_8 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise a
assume
    g_0_low60_0_low20_8 = 0 (mod 2)
&&
    g_0_low60_0_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_9 f_0_low60_0_low20_8;
mov u_0_9 u_0_8;
mov v_0_9 v_0_8;

asr g_0_low60_0_low20_9 g_0_low60_0_low20_8 1;
asr r_0_9 r_0_8 1;
asr s_0_9 s_0_8 1;
assert
    true
&&
    f_0_low60_0_low20_9 = f_0_low60_0_low20_8,
    u_0_9 = u_0_8,
    v_0_9 = v_0_8,
    g_0_low60_0_low20_9 * (const 64 2) = g_0_low60_0_low20_8,
    r_0_9 * (const 64 2) = r_0_8,
    s_0_9 * (const 64 2) = s_0_8
;

assume
    f_0_low60_0_low20_9 = f_0_low60_0_low20_8,
    u_0_9 = u_0_8,
    v_0_9 = v_0_8,
    g_0_low60_0_low20_9 * 2 = g_0_low60_0_low20_8,
    r_0_9 * 2 = r_0_8,
    s_0_9 * 2 = s_0_8
&&
    true
;

{
    u_0_9 * f_0_low60_0_low20_0 + v_0_9 * g_0_low60_0_low20_0 = f_0_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_9 * f_0_low60_0_low20_0 + s_0_9 * g_0_low60_0_low20_0 = g_0_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_9 + u_0_9 * (const 64 (2**21)) + v_0_9 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_9 + r_0_9 * (const 64 (2**21)) + s_0_9 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_9,
    f_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_9,
    g_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 9)) <=s delta, delta <=s (const 64 (1 + 2*9)),
    (const 64 (-(2**20))) <=s u_0_9, u_0_9 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_9, v_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)) )),
    (const 64 ((2**(20-9))-(2**20))) <=s r_0_9, r_0_9 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-9))-(2**20))) <=s s_0_9, s_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**19))) <=s (r_0_9 - u_0_9), (r_0_9 - u_0_9) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_9 - v_0_9), (s_0_9 - v_0_9) <=s (const 64 ((2**20) - (2**(20 - 9)))),
    u_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_0_9 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_08_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_8,
sint64 g_0_low60_0_low20_8,
sint64 f_0_low60_0_low20_9,
sint64 g_0_low60_0_low20_9,
sint64 u_0_8,
sint64 v_0_8,
sint64 r_0_8,
sint64 s_0_8,
sint64 u_0_9,
sint64 v_0_9,
sint64 r_0_9,
sint64 s_0_9,
bit ne
)={
    u_0_8 * f_0_low60_0_low20_0 + v_0_8 * g_0_low60_0_low20_0 = f_0_low60_0_low20_8 * (-(2**20)),
    r_0_8 * f_0_low60_0_low20_0 + s_0_8 * g_0_low60_0_low20_0 = g_0_low60_0_low20_8 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_8 + u_0_8 * (const 64 (2**21)) + v_0_8 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_8 + r_0_8 * (const 64 (2**21)) + s_0_8 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_8,
    f_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_8,
    g_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 8)) <=s delta, delta <=s (const 64 (1 + 2*8)),
    (const 64 (-(2**20))) <=s u_0_8, u_0_8 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_8, v_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)) )),
    (const 64 ((2**(20-8))-(2**20))) <=s r_0_8, r_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**20))) <=s s_0_8, s_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**19))) <=s (r_0_8 - u_0_8), (r_0_8 - u_0_8) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_8 - v_0_8), (s_0_8 - v_0_8) <=s (const 64 ((2**20) - (2**(20 - 8)))),
    u_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_0_8 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise b
assume
    g_0_low60_0_low20_8 = 1 (mod 2)
&&
    g_0_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_9 f_0_low60_0_low20_8;
mov u_0_9 u_0_8;
mov v_0_9 v_0_8;

add g_0_low60_0_low20_9 g_0_low60_0_low20_8 f_0_low60_0_low20_8;
asr g_0_low60_0_low20_9 g_0_low60_0_low20_9 1;
add r_0_9 r_0_8 u_0_8;
asr r_0_9 r_0_9 1;
add s_0_9 s_0_8 v_0_8;
asr s_0_9 s_0_9 1;
assert
    true
&&
    f_0_low60_0_low20_9 = f_0_low60_0_low20_8,
    u_0_9 = u_0_8,
    v_0_9 = v_0_8,
    g_0_low60_0_low20_9 * (const 64 2) = g_0_low60_0_low20_8 + f_0_low60_0_low20_8,
    r_0_9 * (const 64 2) = r_0_8 + u_0_8,
    s_0_9 * (const 64 2) = s_0_8 + v_0_8
;

assume
    f_0_low60_0_low20_9 = f_0_low60_0_low20_8,
    u_0_9 = u_0_8,
    v_0_9 = v_0_8,
    g_0_low60_0_low20_9 * 2 = g_0_low60_0_low20_8 + f_0_low60_0_low20_8,
    r_0_9 * 2 = r_0_8 + u_0_8,
    s_0_9 * 2 = s_0_8 + v_0_8
&&
    true
;

{
    u_0_9 * f_0_low60_0_low20_0 + v_0_9 * g_0_low60_0_low20_0 = f_0_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_9 * f_0_low60_0_low20_0 + s_0_9 * g_0_low60_0_low20_0 = g_0_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_9 + u_0_9 * (const 64 (2**21)) + v_0_9 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_9 + r_0_9 * (const 64 (2**21)) + s_0_9 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_9,
    f_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_9,
    g_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 9)) <=s delta, delta <=s (const 64 (1 + 2*9)),
    (const 64 (-(2**20))) <=s u_0_9, u_0_9 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_9, v_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)) )),
    (const 64 ((2**(20-9))-(2**20))) <=s r_0_9, r_0_9 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-9))-(2**20))) <=s s_0_9, s_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**19))) <=s (r_0_9 - u_0_9), (r_0_9 - u_0_9) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_9 - v_0_9), (s_0_9 - v_0_9) <=s (const 64 ((2**20) - (2**(20 - 9)))),
    u_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_0_9 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_08_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_8,
sint64 g_0_low60_0_low20_8,
sint64 f_0_low60_0_low20_9,
sint64 g_0_low60_0_low20_9,
sint64 u_0_8,
sint64 v_0_8,
sint64 r_0_8,
sint64 s_0_8,
sint64 u_0_9,
sint64 v_0_9,
sint64 r_0_9,
sint64 s_0_9,
bit ne
)={
    u_0_8 * f_0_low60_0_low20_0 + v_0_8 * g_0_low60_0_low20_0 = f_0_low60_0_low20_8 * (-(2**20)),
    r_0_8 * f_0_low60_0_low20_0 + s_0_8 * g_0_low60_0_low20_0 = g_0_low60_0_low20_8 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_8 + u_0_8 * (const 64 (2**21)) + v_0_8 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_8 + r_0_8 * (const 64 (2**21)) + s_0_8 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_8,
    f_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_8,
    g_0_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 8)) <=s delta, delta <=s (const 64 (1 + 2*8)),
    (const 64 (-(2**20))) <=s u_0_8, u_0_8 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_8, v_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)) )),
    (const 64 ((2**(20-8))-(2**20))) <=s r_0_8, r_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**20))) <=s s_0_8, s_0_8 <=s (const 64 ((2**19) - (2**(20 - 8)))),
    (const 64 ((2**(20-8))-(2**19))) <=s (r_0_8 - u_0_8), (r_0_8 - u_0_8) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_8 - v_0_8), (s_0_8 - v_0_8) <=s (const 64 ((2**20) - (2**(20 - 8)))),
    u_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_0_8 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_0_8 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise c
assume
    g_0_low60_0_low20_8 = 1 (mod 2)
&&
    g_0_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_9 g_0_low60_0_low20_8;
mov u_0_9 r_0_8;
mov v_0_9 s_0_8;

subs dc g_0_low60_0_low20_9 g_0_low60_0_low20_8 f_0_low60_0_low20_8;
asr g_0_low60_0_low20_9 g_0_low60_0_low20_9 1;
subs dc r_0_9 r_0_8 u_0_8;
asr r_0_9 r_0_9 1;
subs dc s_0_9 s_0_8 v_0_8;
asr s_0_9 s_0_9 1;
assert
    true
&&
    f_0_low60_0_low20_9 = g_0_low60_0_low20_8,
    u_0_9 = r_0_8,
    v_0_9 = s_0_8,
    g_0_low60_0_low20_9 * (const 64 2) = g_0_low60_0_low20_8 - f_0_low60_0_low20_8,
    r_0_9 * (const 64 2) = r_0_8 - u_0_8,
    s_0_9 * (const 64 2) = s_0_8 - v_0_8
;

assume
    f_0_low60_0_low20_9 = g_0_low60_0_low20_8,
    u_0_9 = r_0_8,
    v_0_9 = s_0_8,
    g_0_low60_0_low20_9 * 2 = g_0_low60_0_low20_8 - f_0_low60_0_low20_8,
    r_0_9 * 2 = r_0_8 - u_0_8,
    s_0_9 * 2 = s_0_8 - v_0_8
&&
    true
;

{
    u_0_9 * f_0_low60_0_low20_0 + v_0_9 * g_0_low60_0_low20_0 = f_0_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_9 * f_0_low60_0_low20_0 + s_0_9 * g_0_low60_0_low20_0 = g_0_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_9 + u_0_9 * (const 64 (2**21)) + v_0_9 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_9 + r_0_9 * (const 64 (2**21)) + s_0_9 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_9,
    f_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_9,
    g_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 9)) <=s delta, delta <=s (const 64 (1 + 2*9)),
    (const 64 (-(2**20))) <=s u_0_9, u_0_9 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_9, v_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)) )),
    (const 64 ((2**(20-9))-(2**20))) <=s r_0_9, r_0_9 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-9))-(2**20))) <=s s_0_9, s_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**19))) <=s (r_0_9 - u_0_9), (r_0_9 - u_0_9) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_9 - v_0_9), (s_0_9 - v_0_9) <=s (const 64 ((2**20) - (2**(20 - 9)))),
    u_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_0_9 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_09_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_9,
sint64 g_0_low60_0_low20_9,
sint64 f_0_low60_0_low20_10,
sint64 g_0_low60_0_low20_10,
sint64 u_0_9,
sint64 v_0_9,
sint64 r_0_9,
sint64 s_0_9,
sint64 u_0_10,
sint64 v_0_10,
sint64 r_0_10,
sint64 s_0_10,
bit ne
)={
    u_0_9 * f_0_low60_0_low20_0 + v_0_9 * g_0_low60_0_low20_0 = f_0_low60_0_low20_9 * (-(2**20)),
    r_0_9 * f_0_low60_0_low20_0 + s_0_9 * g_0_low60_0_low20_0 = g_0_low60_0_low20_9 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_9 + u_0_9 * (const 64 (2**21)) + v_0_9 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_9 + r_0_9 * (const 64 (2**21)) + s_0_9 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_9,
    f_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_9,
    g_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 9)) <=s delta, delta <=s (const 64 (1 + 2*9)),
    (const 64 (-(2**20))) <=s u_0_9, u_0_9 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_9, v_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)) )),
    (const 64 ((2**(20-9))-(2**20))) <=s r_0_9, r_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**20))) <=s s_0_9, s_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**19))) <=s (r_0_9 - u_0_9), (r_0_9 - u_0_9) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_9 - v_0_9), (s_0_9 - v_0_9) <=s (const 64 ((2**20) - (2**(20 - 9)))),
    u_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_0_9 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step9

// premise a
assume
    g_0_low60_0_low20_9 = 0 (mod 2)
&&
    g_0_low60_0_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_10 f_0_low60_0_low20_9;
mov u_0_10 u_0_9;
mov v_0_10 v_0_9;

asr g_0_low60_0_low20_10 g_0_low60_0_low20_9 1;
asr r_0_10 r_0_9 1;
asr s_0_10 s_0_9 1;
assert
    true
&&
    f_0_low60_0_low20_10 = f_0_low60_0_low20_9,
    u_0_10 = u_0_9,
    v_0_10 = v_0_9,
    g_0_low60_0_low20_10 * (const 64 2) = g_0_low60_0_low20_9,
    r_0_10 * (const 64 2) = r_0_9,
    s_0_10 * (const 64 2) = s_0_9
;

assume
    f_0_low60_0_low20_10 = f_0_low60_0_low20_9,
    u_0_10 = u_0_9,
    v_0_10 = v_0_9,
    g_0_low60_0_low20_10 * 2 = g_0_low60_0_low20_9,
    r_0_10 * 2 = r_0_9,
    s_0_10 * 2 = s_0_9
&&
    true
;

{
    u_0_10 * f_0_low60_0_low20_0 + v_0_10 * g_0_low60_0_low20_0 = f_0_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_10 * f_0_low60_0_low20_0 + s_0_10 * g_0_low60_0_low20_0 = g_0_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_10 + u_0_10 * (const 64 (2**21)) + v_0_10 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_10 + r_0_10 * (const 64 (2**21)) + s_0_10 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_10,
    f_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_10,
    g_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 10)) <=s delta, delta <=s (const 64 (1 + 2*10)),
    (const 64 (-(2**20))) <=s u_0_10, u_0_10 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_10, v_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)) )),
    (const 64 ((2**(20-10))-(2**20))) <=s r_0_10, r_0_10 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-10))-(2**20))) <=s s_0_10, s_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**19))) <=s (r_0_10 - u_0_10), (r_0_10 - u_0_10) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_10 - v_0_10), (s_0_10 - v_0_10) <=s (const 64 ((2**20) - (2**(20 - 10)))),
    u_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_0_10 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_09_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_9,
sint64 g_0_low60_0_low20_9,
sint64 f_0_low60_0_low20_10,
sint64 g_0_low60_0_low20_10,
sint64 u_0_9,
sint64 v_0_9,
sint64 r_0_9,
sint64 s_0_9,
sint64 u_0_10,
sint64 v_0_10,
sint64 r_0_10,
sint64 s_0_10,
bit ne
)={
    u_0_9 * f_0_low60_0_low20_0 + v_0_9 * g_0_low60_0_low20_0 = f_0_low60_0_low20_9 * (-(2**20)),
    r_0_9 * f_0_low60_0_low20_0 + s_0_9 * g_0_low60_0_low20_0 = g_0_low60_0_low20_9 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_9 + u_0_9 * (const 64 (2**21)) + v_0_9 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_9 + r_0_9 * (const 64 (2**21)) + s_0_9 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_9,
    f_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_9,
    g_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 9)) <=s delta, delta <=s (const 64 (1 + 2*9)),
    (const 64 (-(2**20))) <=s u_0_9, u_0_9 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_9, v_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)) )),
    (const 64 ((2**(20-9))-(2**20))) <=s r_0_9, r_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**20))) <=s s_0_9, s_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**19))) <=s (r_0_9 - u_0_9), (r_0_9 - u_0_9) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_9 - v_0_9), (s_0_9 - v_0_9) <=s (const 64 ((2**20) - (2**(20 - 9)))),
    u_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_0_9 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step9

// premise b
assume
    g_0_low60_0_low20_9 = 1 (mod 2)
&&
    g_0_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_10 f_0_low60_0_low20_9;
mov u_0_10 u_0_9;
mov v_0_10 v_0_9;

add g_0_low60_0_low20_10 g_0_low60_0_low20_9 f_0_low60_0_low20_9;
asr g_0_low60_0_low20_10 g_0_low60_0_low20_10 1;
add r_0_10 r_0_9 u_0_9;
asr r_0_10 r_0_10 1;
add s_0_10 s_0_9 v_0_9;
asr s_0_10 s_0_10 1;
assert
    true
&&
    f_0_low60_0_low20_10 = f_0_low60_0_low20_9,
    u_0_10 = u_0_9,
    v_0_10 = v_0_9,
    g_0_low60_0_low20_10 * (const 64 2) = g_0_low60_0_low20_9 + f_0_low60_0_low20_9,
    r_0_10 * (const 64 2) = r_0_9 + u_0_9,
    s_0_10 * (const 64 2) = s_0_9 + v_0_9
;

assume
    f_0_low60_0_low20_10 = f_0_low60_0_low20_9,
    u_0_10 = u_0_9,
    v_0_10 = v_0_9,
    g_0_low60_0_low20_10 * 2 = g_0_low60_0_low20_9 + f_0_low60_0_low20_9,
    r_0_10 * 2 = r_0_9 + u_0_9,
    s_0_10 * 2 = s_0_9 + v_0_9
&&
    true
;

{
    u_0_10 * f_0_low60_0_low20_0 + v_0_10 * g_0_low60_0_low20_0 = f_0_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_10 * f_0_low60_0_low20_0 + s_0_10 * g_0_low60_0_low20_0 = g_0_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_10 + u_0_10 * (const 64 (2**21)) + v_0_10 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_10 + r_0_10 * (const 64 (2**21)) + s_0_10 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_10,
    f_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_10,
    g_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 10)) <=s delta, delta <=s (const 64 (1 + 2*10)),
    (const 64 (-(2**20))) <=s u_0_10, u_0_10 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_10, v_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)) )),
    (const 64 ((2**(20-10))-(2**20))) <=s r_0_10, r_0_10 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-10))-(2**20))) <=s s_0_10, s_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**19))) <=s (r_0_10 - u_0_10), (r_0_10 - u_0_10) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_10 - v_0_10), (s_0_10 - v_0_10) <=s (const 64 ((2**20) - (2**(20 - 10)))),
    u_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_0_10 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_09_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_9,
sint64 g_0_low60_0_low20_9,
sint64 f_0_low60_0_low20_10,
sint64 g_0_low60_0_low20_10,
sint64 u_0_9,
sint64 v_0_9,
sint64 r_0_9,
sint64 s_0_9,
sint64 u_0_10,
sint64 v_0_10,
sint64 r_0_10,
sint64 s_0_10,
bit ne
)={
    u_0_9 * f_0_low60_0_low20_0 + v_0_9 * g_0_low60_0_low20_0 = f_0_low60_0_low20_9 * (-(2**20)),
    r_0_9 * f_0_low60_0_low20_0 + s_0_9 * g_0_low60_0_low20_0 = g_0_low60_0_low20_9 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_9 + u_0_9 * (const 64 (2**21)) + v_0_9 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_9 + r_0_9 * (const 64 (2**21)) + s_0_9 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_9,
    f_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_9,
    g_0_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 9)) <=s delta, delta <=s (const 64 (1 + 2*9)),
    (const 64 (-(2**20))) <=s u_0_9, u_0_9 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_9, v_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)) )),
    (const 64 ((2**(20-9))-(2**20))) <=s r_0_9, r_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**20))) <=s s_0_9, s_0_9 <=s (const 64 ((2**19) - (2**(20 - 9)))),
    (const 64 ((2**(20-9))-(2**19))) <=s (r_0_9 - u_0_9), (r_0_9 - u_0_9) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_9 - v_0_9), (s_0_9 - v_0_9) <=s (const 64 ((2**20) - (2**(20 - 9)))),
    u_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_0_9 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_0_9 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step9

// premise c
assume
    g_0_low60_0_low20_9 = 1 (mod 2)
&&
    g_0_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_10 g_0_low60_0_low20_9;
mov u_0_10 r_0_9;
mov v_0_10 s_0_9;

subs dc g_0_low60_0_low20_10 g_0_low60_0_low20_9 f_0_low60_0_low20_9;
asr g_0_low60_0_low20_10 g_0_low60_0_low20_10 1;
subs dc r_0_10 r_0_9 u_0_9;
asr r_0_10 r_0_10 1;
subs dc s_0_10 s_0_9 v_0_9;
asr s_0_10 s_0_10 1;
assert
    true
&&
    f_0_low60_0_low20_10 = g_0_low60_0_low20_9,
    u_0_10 = r_0_9,
    v_0_10 = s_0_9,
    g_0_low60_0_low20_10 * (const 64 2) = g_0_low60_0_low20_9 - f_0_low60_0_low20_9,
    r_0_10 * (const 64 2) = r_0_9 - u_0_9,
    s_0_10 * (const 64 2) = s_0_9 - v_0_9
;

assume
    f_0_low60_0_low20_10 = g_0_low60_0_low20_9,
    u_0_10 = r_0_9,
    v_0_10 = s_0_9,
    g_0_low60_0_low20_10 * 2 = g_0_low60_0_low20_9 - f_0_low60_0_low20_9,
    r_0_10 * 2 = r_0_9 - u_0_9,
    s_0_10 * 2 = s_0_9 - v_0_9
&&
    true
;

{
    u_0_10 * f_0_low60_0_low20_0 + v_0_10 * g_0_low60_0_low20_0 = f_0_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_10 * f_0_low60_0_low20_0 + s_0_10 * g_0_low60_0_low20_0 = g_0_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_10 + u_0_10 * (const 64 (2**21)) + v_0_10 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_10 + r_0_10 * (const 64 (2**21)) + s_0_10 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_10,
    f_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_10,
    g_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 10)) <=s delta, delta <=s (const 64 (1 + 2*10)),
    (const 64 (-(2**20))) <=s u_0_10, u_0_10 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_10, v_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)) )),
    (const 64 ((2**(20-10))-(2**20))) <=s r_0_10, r_0_10 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-10))-(2**20))) <=s s_0_10, s_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**19))) <=s (r_0_10 - u_0_10), (r_0_10 - u_0_10) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_10 - v_0_10), (s_0_10 - v_0_10) <=s (const 64 ((2**20) - (2**(20 - 10)))),
    u_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_0_10 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_10_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_10,
sint64 g_0_low60_0_low20_10,
sint64 f_0_low60_0_low20_11,
sint64 g_0_low60_0_low20_11,
sint64 u_0_10,
sint64 v_0_10,
sint64 r_0_10,
sint64 s_0_10,
sint64 u_0_11,
sint64 v_0_11,
sint64 r_0_11,
sint64 s_0_11,
bit ne
)={
    u_0_10 * f_0_low60_0_low20_0 + v_0_10 * g_0_low60_0_low20_0 = f_0_low60_0_low20_10 * (-(2**20)),
    r_0_10 * f_0_low60_0_low20_0 + s_0_10 * g_0_low60_0_low20_0 = g_0_low60_0_low20_10 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_10 + u_0_10 * (const 64 (2**21)) + v_0_10 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_10 + r_0_10 * (const 64 (2**21)) + s_0_10 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_10,
    f_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_10,
    g_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 10)) <=s delta, delta <=s (const 64 (1 + 2*10)),
    (const 64 (-(2**20))) <=s u_0_10, u_0_10 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_10, v_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)) )),
    (const 64 ((2**(20-10))-(2**20))) <=s r_0_10, r_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**20))) <=s s_0_10, s_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**19))) <=s (r_0_10 - u_0_10), (r_0_10 - u_0_10) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_10 - v_0_10), (s_0_10 - v_0_10) <=s (const 64 ((2**20) - (2**(20 - 10)))),
    u_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_0_10 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step10

// premise a
assume
    g_0_low60_0_low20_10 = 0 (mod 2)
&&
    g_0_low60_0_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_11 f_0_low60_0_low20_10;
mov u_0_11 u_0_10;
mov v_0_11 v_0_10;

asr g_0_low60_0_low20_11 g_0_low60_0_low20_10 1;
asr r_0_11 r_0_10 1;
asr s_0_11 s_0_10 1;
assert
    true
&&
    f_0_low60_0_low20_11 = f_0_low60_0_low20_10,
    u_0_11 = u_0_10,
    v_0_11 = v_0_10,
    g_0_low60_0_low20_11 * (const 64 2) = g_0_low60_0_low20_10,
    r_0_11 * (const 64 2) = r_0_10,
    s_0_11 * (const 64 2) = s_0_10
;

assume
    f_0_low60_0_low20_11 = f_0_low60_0_low20_10,
    u_0_11 = u_0_10,
    v_0_11 = v_0_10,
    g_0_low60_0_low20_11 * 2 = g_0_low60_0_low20_10,
    r_0_11 * 2 = r_0_10,
    s_0_11 * 2 = s_0_10
&&
    true
;

{
    u_0_11 * f_0_low60_0_low20_0 + v_0_11 * g_0_low60_0_low20_0 = f_0_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_11 * f_0_low60_0_low20_0 + s_0_11 * g_0_low60_0_low20_0 = g_0_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_11 + u_0_11 * (const 64 (2**21)) + v_0_11 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_11 + r_0_11 * (const 64 (2**21)) + s_0_11 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_11,
    f_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_11,
    g_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 11)) <=s delta, delta <=s (const 64 (1 + 2*11)),
    (const 64 (-(2**20))) <=s u_0_11, u_0_11 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_11, v_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)) )),
    (const 64 ((2**(20-11))-(2**20))) <=s r_0_11, r_0_11 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-11))-(2**20))) <=s s_0_11, s_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**19))) <=s (r_0_11 - u_0_11), (r_0_11 - u_0_11) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_11 - v_0_11), (s_0_11 - v_0_11) <=s (const 64 ((2**20) - (2**(20 - 11)))),
    u_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_0_11 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_10_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_10,
sint64 g_0_low60_0_low20_10,
sint64 f_0_low60_0_low20_11,
sint64 g_0_low60_0_low20_11,
sint64 u_0_10,
sint64 v_0_10,
sint64 r_0_10,
sint64 s_0_10,
sint64 u_0_11,
sint64 v_0_11,
sint64 r_0_11,
sint64 s_0_11,
bit ne
)={
    u_0_10 * f_0_low60_0_low20_0 + v_0_10 * g_0_low60_0_low20_0 = f_0_low60_0_low20_10 * (-(2**20)),
    r_0_10 * f_0_low60_0_low20_0 + s_0_10 * g_0_low60_0_low20_0 = g_0_low60_0_low20_10 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_10 + u_0_10 * (const 64 (2**21)) + v_0_10 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_10 + r_0_10 * (const 64 (2**21)) + s_0_10 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_10,
    f_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_10,
    g_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 10)) <=s delta, delta <=s (const 64 (1 + 2*10)),
    (const 64 (-(2**20))) <=s u_0_10, u_0_10 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_10, v_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)) )),
    (const 64 ((2**(20-10))-(2**20))) <=s r_0_10, r_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**20))) <=s s_0_10, s_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**19))) <=s (r_0_10 - u_0_10), (r_0_10 - u_0_10) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_10 - v_0_10), (s_0_10 - v_0_10) <=s (const 64 ((2**20) - (2**(20 - 10)))),
    u_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_0_10 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step10

// premise b
assume
    g_0_low60_0_low20_10 = 1 (mod 2)
&&
    g_0_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_11 f_0_low60_0_low20_10;
mov u_0_11 u_0_10;
mov v_0_11 v_0_10;

add g_0_low60_0_low20_11 g_0_low60_0_low20_10 f_0_low60_0_low20_10;
asr g_0_low60_0_low20_11 g_0_low60_0_low20_11 1;
add r_0_11 r_0_10 u_0_10;
asr r_0_11 r_0_11 1;
add s_0_11 s_0_10 v_0_10;
asr s_0_11 s_0_11 1;
assert
    true
&&
    f_0_low60_0_low20_11 = f_0_low60_0_low20_10,
    u_0_11 = u_0_10,
    v_0_11 = v_0_10,
    g_0_low60_0_low20_11 * (const 64 2) = g_0_low60_0_low20_10 + f_0_low60_0_low20_10,
    r_0_11 * (const 64 2) = r_0_10 + u_0_10,
    s_0_11 * (const 64 2) = s_0_10 + v_0_10
;

assume
    f_0_low60_0_low20_11 = f_0_low60_0_low20_10,
    u_0_11 = u_0_10,
    v_0_11 = v_0_10,
    g_0_low60_0_low20_11 * 2 = g_0_low60_0_low20_10 + f_0_low60_0_low20_10,
    r_0_11 * 2 = r_0_10 + u_0_10,
    s_0_11 * 2 = s_0_10 + v_0_10
&&
    true
;

{
    u_0_11 * f_0_low60_0_low20_0 + v_0_11 * g_0_low60_0_low20_0 = f_0_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_11 * f_0_low60_0_low20_0 + s_0_11 * g_0_low60_0_low20_0 = g_0_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_11 + u_0_11 * (const 64 (2**21)) + v_0_11 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_11 + r_0_11 * (const 64 (2**21)) + s_0_11 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_11,
    f_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_11,
    g_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 11)) <=s delta, delta <=s (const 64 (1 + 2*11)),
    (const 64 (-(2**20))) <=s u_0_11, u_0_11 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_11, v_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)) )),
    (const 64 ((2**(20-11))-(2**20))) <=s r_0_11, r_0_11 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-11))-(2**20))) <=s s_0_11, s_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**19))) <=s (r_0_11 - u_0_11), (r_0_11 - u_0_11) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_11 - v_0_11), (s_0_11 - v_0_11) <=s (const 64 ((2**20) - (2**(20 - 11)))),
    u_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_0_11 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_10_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_10,
sint64 g_0_low60_0_low20_10,
sint64 f_0_low60_0_low20_11,
sint64 g_0_low60_0_low20_11,
sint64 u_0_10,
sint64 v_0_10,
sint64 r_0_10,
sint64 s_0_10,
sint64 u_0_11,
sint64 v_0_11,
sint64 r_0_11,
sint64 s_0_11,
bit ne
)={
    u_0_10 * f_0_low60_0_low20_0 + v_0_10 * g_0_low60_0_low20_0 = f_0_low60_0_low20_10 * (-(2**20)),
    r_0_10 * f_0_low60_0_low20_0 + s_0_10 * g_0_low60_0_low20_0 = g_0_low60_0_low20_10 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_10 + u_0_10 * (const 64 (2**21)) + v_0_10 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_10 + r_0_10 * (const 64 (2**21)) + s_0_10 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_10,
    f_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_10,
    g_0_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 10)) <=s delta, delta <=s (const 64 (1 + 2*10)),
    (const 64 (-(2**20))) <=s u_0_10, u_0_10 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_10, v_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)) )),
    (const 64 ((2**(20-10))-(2**20))) <=s r_0_10, r_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**20))) <=s s_0_10, s_0_10 <=s (const 64 ((2**19) - (2**(20 - 10)))),
    (const 64 ((2**(20-10))-(2**19))) <=s (r_0_10 - u_0_10), (r_0_10 - u_0_10) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_10 - v_0_10), (s_0_10 - v_0_10) <=s (const 64 ((2**20) - (2**(20 - 10)))),
    u_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_0_10 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_0_10 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step10

// premise c
assume
    g_0_low60_0_low20_10 = 1 (mod 2)
&&
    g_0_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_11 g_0_low60_0_low20_10;
mov u_0_11 r_0_10;
mov v_0_11 s_0_10;

subs dc g_0_low60_0_low20_11 g_0_low60_0_low20_10 f_0_low60_0_low20_10;
asr g_0_low60_0_low20_11 g_0_low60_0_low20_11 1;
subs dc r_0_11 r_0_10 u_0_10;
asr r_0_11 r_0_11 1;
subs dc s_0_11 s_0_10 v_0_10;
asr s_0_11 s_0_11 1;
assert
    true
&&
    f_0_low60_0_low20_11 = g_0_low60_0_low20_10,
    u_0_11 = r_0_10,
    v_0_11 = s_0_10,
    g_0_low60_0_low20_11 * (const 64 2) = g_0_low60_0_low20_10 - f_0_low60_0_low20_10,
    r_0_11 * (const 64 2) = r_0_10 - u_0_10,
    s_0_11 * (const 64 2) = s_0_10 - v_0_10
;

assume
    f_0_low60_0_low20_11 = g_0_low60_0_low20_10,
    u_0_11 = r_0_10,
    v_0_11 = s_0_10,
    g_0_low60_0_low20_11 * 2 = g_0_low60_0_low20_10 - f_0_low60_0_low20_10,
    r_0_11 * 2 = r_0_10 - u_0_10,
    s_0_11 * 2 = s_0_10 - v_0_10
&&
    true
;

{
    u_0_11 * f_0_low60_0_low20_0 + v_0_11 * g_0_low60_0_low20_0 = f_0_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_11 * f_0_low60_0_low20_0 + s_0_11 * g_0_low60_0_low20_0 = g_0_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_11 + u_0_11 * (const 64 (2**21)) + v_0_11 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_11 + r_0_11 * (const 64 (2**21)) + s_0_11 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_11,
    f_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_11,
    g_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 11)) <=s delta, delta <=s (const 64 (1 + 2*11)),
    (const 64 (-(2**20))) <=s u_0_11, u_0_11 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_11, v_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)) )),
    (const 64 ((2**(20-11))-(2**20))) <=s r_0_11, r_0_11 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-11))-(2**20))) <=s s_0_11, s_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**19))) <=s (r_0_11 - u_0_11), (r_0_11 - u_0_11) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_11 - v_0_11), (s_0_11 - v_0_11) <=s (const 64 ((2**20) - (2**(20 - 11)))),
    u_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_0_11 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_11_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_11,
sint64 g_0_low60_0_low20_11,
sint64 f_0_low60_0_low20_12,
sint64 g_0_low60_0_low20_12,
sint64 u_0_11,
sint64 v_0_11,
sint64 r_0_11,
sint64 s_0_11,
sint64 u_0_12,
sint64 v_0_12,
sint64 r_0_12,
sint64 s_0_12,
bit ne
)={
    u_0_11 * f_0_low60_0_low20_0 + v_0_11 * g_0_low60_0_low20_0 = f_0_low60_0_low20_11 * (-(2**20)),
    r_0_11 * f_0_low60_0_low20_0 + s_0_11 * g_0_low60_0_low20_0 = g_0_low60_0_low20_11 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_11 + u_0_11 * (const 64 (2**21)) + v_0_11 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_11 + r_0_11 * (const 64 (2**21)) + s_0_11 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_11,
    f_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_11,
    g_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 11)) <=s delta, delta <=s (const 64 (1 + 2*11)),
    (const 64 (-(2**20))) <=s u_0_11, u_0_11 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_11, v_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)) )),
    (const 64 ((2**(20-11))-(2**20))) <=s r_0_11, r_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**20))) <=s s_0_11, s_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**19))) <=s (r_0_11 - u_0_11), (r_0_11 - u_0_11) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_11 - v_0_11), (s_0_11 - v_0_11) <=s (const 64 ((2**20) - (2**(20 - 11)))),
    u_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_0_11 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step11

// premise a
assume
    g_0_low60_0_low20_11 = 0 (mod 2)
&&
    g_0_low60_0_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_12 f_0_low60_0_low20_11;
mov u_0_12 u_0_11;
mov v_0_12 v_0_11;

asr g_0_low60_0_low20_12 g_0_low60_0_low20_11 1;
asr r_0_12 r_0_11 1;
asr s_0_12 s_0_11 1;
assert
    true
&&
    f_0_low60_0_low20_12 = f_0_low60_0_low20_11,
    u_0_12 = u_0_11,
    v_0_12 = v_0_11,
    g_0_low60_0_low20_12 * (const 64 2) = g_0_low60_0_low20_11,
    r_0_12 * (const 64 2) = r_0_11,
    s_0_12 * (const 64 2) = s_0_11
;

assume
    f_0_low60_0_low20_12 = f_0_low60_0_low20_11,
    u_0_12 = u_0_11,
    v_0_12 = v_0_11,
    g_0_low60_0_low20_12 * 2 = g_0_low60_0_low20_11,
    r_0_12 * 2 = r_0_11,
    s_0_12 * 2 = s_0_11
&&
    true
;

{
    u_0_12 * f_0_low60_0_low20_0 + v_0_12 * g_0_low60_0_low20_0 = f_0_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_12 * f_0_low60_0_low20_0 + s_0_12 * g_0_low60_0_low20_0 = g_0_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_12 + u_0_12 * (const 64 (2**21)) + v_0_12 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_12 + r_0_12 * (const 64 (2**21)) + s_0_12 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_12,
    f_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_12,
    g_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 12)) <=s delta, delta <=s (const 64 (1 + 2*12)),
    (const 64 (-(2**20))) <=s u_0_12, u_0_12 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_12, v_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)) )),
    (const 64 ((2**(20-12))-(2**20))) <=s r_0_12, r_0_12 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-12))-(2**20))) <=s s_0_12, s_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**19))) <=s (r_0_12 - u_0_12), (r_0_12 - u_0_12) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_12 - v_0_12), (s_0_12 - v_0_12) <=s (const 64 ((2**20) - (2**(20 - 12)))),
    u_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_0_12 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_11_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_11,
sint64 g_0_low60_0_low20_11,
sint64 f_0_low60_0_low20_12,
sint64 g_0_low60_0_low20_12,
sint64 u_0_11,
sint64 v_0_11,
sint64 r_0_11,
sint64 s_0_11,
sint64 u_0_12,
sint64 v_0_12,
sint64 r_0_12,
sint64 s_0_12,
bit ne
)={
    u_0_11 * f_0_low60_0_low20_0 + v_0_11 * g_0_low60_0_low20_0 = f_0_low60_0_low20_11 * (-(2**20)),
    r_0_11 * f_0_low60_0_low20_0 + s_0_11 * g_0_low60_0_low20_0 = g_0_low60_0_low20_11 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_11 + u_0_11 * (const 64 (2**21)) + v_0_11 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_11 + r_0_11 * (const 64 (2**21)) + s_0_11 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_11,
    f_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_11,
    g_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 11)) <=s delta, delta <=s (const 64 (1 + 2*11)),
    (const 64 (-(2**20))) <=s u_0_11, u_0_11 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_11, v_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)) )),
    (const 64 ((2**(20-11))-(2**20))) <=s r_0_11, r_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**20))) <=s s_0_11, s_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**19))) <=s (r_0_11 - u_0_11), (r_0_11 - u_0_11) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_11 - v_0_11), (s_0_11 - v_0_11) <=s (const 64 ((2**20) - (2**(20 - 11)))),
    u_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_0_11 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step11

// premise b
assume
    g_0_low60_0_low20_11 = 1 (mod 2)
&&
    g_0_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_12 f_0_low60_0_low20_11;
mov u_0_12 u_0_11;
mov v_0_12 v_0_11;

add g_0_low60_0_low20_12 g_0_low60_0_low20_11 f_0_low60_0_low20_11;
asr g_0_low60_0_low20_12 g_0_low60_0_low20_12 1;
add r_0_12 r_0_11 u_0_11;
asr r_0_12 r_0_12 1;
add s_0_12 s_0_11 v_0_11;
asr s_0_12 s_0_12 1;
assert
    true
&&
    f_0_low60_0_low20_12 = f_0_low60_0_low20_11,
    u_0_12 = u_0_11,
    v_0_12 = v_0_11,
    g_0_low60_0_low20_12 * (const 64 2) = g_0_low60_0_low20_11 + f_0_low60_0_low20_11,
    r_0_12 * (const 64 2) = r_0_11 + u_0_11,
    s_0_12 * (const 64 2) = s_0_11 + v_0_11
;

assume
    f_0_low60_0_low20_12 = f_0_low60_0_low20_11,
    u_0_12 = u_0_11,
    v_0_12 = v_0_11,
    g_0_low60_0_low20_12 * 2 = g_0_low60_0_low20_11 + f_0_low60_0_low20_11,
    r_0_12 * 2 = r_0_11 + u_0_11,
    s_0_12 * 2 = s_0_11 + v_0_11
&&
    true
;

{
    u_0_12 * f_0_low60_0_low20_0 + v_0_12 * g_0_low60_0_low20_0 = f_0_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_12 * f_0_low60_0_low20_0 + s_0_12 * g_0_low60_0_low20_0 = g_0_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_12 + u_0_12 * (const 64 (2**21)) + v_0_12 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_12 + r_0_12 * (const 64 (2**21)) + s_0_12 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_12,
    f_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_12,
    g_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 12)) <=s delta, delta <=s (const 64 (1 + 2*12)),
    (const 64 (-(2**20))) <=s u_0_12, u_0_12 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_12, v_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)) )),
    (const 64 ((2**(20-12))-(2**20))) <=s r_0_12, r_0_12 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-12))-(2**20))) <=s s_0_12, s_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**19))) <=s (r_0_12 - u_0_12), (r_0_12 - u_0_12) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_12 - v_0_12), (s_0_12 - v_0_12) <=s (const 64 ((2**20) - (2**(20 - 12)))),
    u_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_0_12 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_11_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_11,
sint64 g_0_low60_0_low20_11,
sint64 f_0_low60_0_low20_12,
sint64 g_0_low60_0_low20_12,
sint64 u_0_11,
sint64 v_0_11,
sint64 r_0_11,
sint64 s_0_11,
sint64 u_0_12,
sint64 v_0_12,
sint64 r_0_12,
sint64 s_0_12,
bit ne
)={
    u_0_11 * f_0_low60_0_low20_0 + v_0_11 * g_0_low60_0_low20_0 = f_0_low60_0_low20_11 * (-(2**20)),
    r_0_11 * f_0_low60_0_low20_0 + s_0_11 * g_0_low60_0_low20_0 = g_0_low60_0_low20_11 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_11 + u_0_11 * (const 64 (2**21)) + v_0_11 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_11 + r_0_11 * (const 64 (2**21)) + s_0_11 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_11,
    f_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_11,
    g_0_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 11)) <=s delta, delta <=s (const 64 (1 + 2*11)),
    (const 64 (-(2**20))) <=s u_0_11, u_0_11 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_11, v_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)) )),
    (const 64 ((2**(20-11))-(2**20))) <=s r_0_11, r_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**20))) <=s s_0_11, s_0_11 <=s (const 64 ((2**19) - (2**(20 - 11)))),
    (const 64 ((2**(20-11))-(2**19))) <=s (r_0_11 - u_0_11), (r_0_11 - u_0_11) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_11 - v_0_11), (s_0_11 - v_0_11) <=s (const 64 ((2**20) - (2**(20 - 11)))),
    u_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_0_11 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_0_11 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step11

// premise c
assume
    g_0_low60_0_low20_11 = 1 (mod 2)
&&
    g_0_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_12 g_0_low60_0_low20_11;
mov u_0_12 r_0_11;
mov v_0_12 s_0_11;

subs dc g_0_low60_0_low20_12 g_0_low60_0_low20_11 f_0_low60_0_low20_11;
asr g_0_low60_0_low20_12 g_0_low60_0_low20_12 1;
subs dc r_0_12 r_0_11 u_0_11;
asr r_0_12 r_0_12 1;
subs dc s_0_12 s_0_11 v_0_11;
asr s_0_12 s_0_12 1;
assert
    true
&&
    f_0_low60_0_low20_12 = g_0_low60_0_low20_11,
    u_0_12 = r_0_11,
    v_0_12 = s_0_11,
    g_0_low60_0_low20_12 * (const 64 2) = g_0_low60_0_low20_11 - f_0_low60_0_low20_11,
    r_0_12 * (const 64 2) = r_0_11 - u_0_11,
    s_0_12 * (const 64 2) = s_0_11 - v_0_11
;

assume
    f_0_low60_0_low20_12 = g_0_low60_0_low20_11,
    u_0_12 = r_0_11,
    v_0_12 = s_0_11,
    g_0_low60_0_low20_12 * 2 = g_0_low60_0_low20_11 - f_0_low60_0_low20_11,
    r_0_12 * 2 = r_0_11 - u_0_11,
    s_0_12 * 2 = s_0_11 - v_0_11
&&
    true
;

{
    u_0_12 * f_0_low60_0_low20_0 + v_0_12 * g_0_low60_0_low20_0 = f_0_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_12 * f_0_low60_0_low20_0 + s_0_12 * g_0_low60_0_low20_0 = g_0_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_12 + u_0_12 * (const 64 (2**21)) + v_0_12 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_12 + r_0_12 * (const 64 (2**21)) + s_0_12 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_12,
    f_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_12,
    g_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 12)) <=s delta, delta <=s (const 64 (1 + 2*12)),
    (const 64 (-(2**20))) <=s u_0_12, u_0_12 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_12, v_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)) )),
    (const 64 ((2**(20-12))-(2**20))) <=s r_0_12, r_0_12 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-12))-(2**20))) <=s s_0_12, s_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**19))) <=s (r_0_12 - u_0_12), (r_0_12 - u_0_12) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_12 - v_0_12), (s_0_12 - v_0_12) <=s (const 64 ((2**20) - (2**(20 - 12)))),
    u_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_0_12 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_12_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_12,
sint64 g_0_low60_0_low20_12,
sint64 f_0_low60_0_low20_13,
sint64 g_0_low60_0_low20_13,
sint64 u_0_12,
sint64 v_0_12,
sint64 r_0_12,
sint64 s_0_12,
sint64 u_0_13,
sint64 v_0_13,
sint64 r_0_13,
sint64 s_0_13,
bit ne
)={
    u_0_12 * f_0_low60_0_low20_0 + v_0_12 * g_0_low60_0_low20_0 = f_0_low60_0_low20_12 * (-(2**20)),
    r_0_12 * f_0_low60_0_low20_0 + s_0_12 * g_0_low60_0_low20_0 = g_0_low60_0_low20_12 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_12 + u_0_12 * (const 64 (2**21)) + v_0_12 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_12 + r_0_12 * (const 64 (2**21)) + s_0_12 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_12,
    f_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_12,
    g_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 12)) <=s delta, delta <=s (const 64 (1 + 2*12)),
    (const 64 (-(2**20))) <=s u_0_12, u_0_12 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_12, v_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)) )),
    (const 64 ((2**(20-12))-(2**20))) <=s r_0_12, r_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**20))) <=s s_0_12, s_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**19))) <=s (r_0_12 - u_0_12), (r_0_12 - u_0_12) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_12 - v_0_12), (s_0_12 - v_0_12) <=s (const 64 ((2**20) - (2**(20 - 12)))),
    u_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_0_12 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step12

// premise a
assume
    g_0_low60_0_low20_12 = 0 (mod 2)
&&
    g_0_low60_0_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_13 f_0_low60_0_low20_12;
mov u_0_13 u_0_12;
mov v_0_13 v_0_12;

asr g_0_low60_0_low20_13 g_0_low60_0_low20_12 1;
asr r_0_13 r_0_12 1;
asr s_0_13 s_0_12 1;
assert
    true
&&
    f_0_low60_0_low20_13 = f_0_low60_0_low20_12,
    u_0_13 = u_0_12,
    v_0_13 = v_0_12,
    g_0_low60_0_low20_13 * (const 64 2) = g_0_low60_0_low20_12,
    r_0_13 * (const 64 2) = r_0_12,
    s_0_13 * (const 64 2) = s_0_12
;

assume
    f_0_low60_0_low20_13 = f_0_low60_0_low20_12,
    u_0_13 = u_0_12,
    v_0_13 = v_0_12,
    g_0_low60_0_low20_13 * 2 = g_0_low60_0_low20_12,
    r_0_13 * 2 = r_0_12,
    s_0_13 * 2 = s_0_12
&&
    true
;

{
    u_0_13 * f_0_low60_0_low20_0 + v_0_13 * g_0_low60_0_low20_0 = f_0_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_13 * f_0_low60_0_low20_0 + s_0_13 * g_0_low60_0_low20_0 = g_0_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_13 + u_0_13 * (const 64 (2**21)) + v_0_13 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_13 + r_0_13 * (const 64 (2**21)) + s_0_13 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_13,
    f_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_13,
    g_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 13)) <=s delta, delta <=s (const 64 (1 + 2*13)),
    (const 64 (-(2**20))) <=s u_0_13, u_0_13 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_13, v_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)) )),
    (const 64 ((2**(20-13))-(2**20))) <=s r_0_13, r_0_13 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-13))-(2**20))) <=s s_0_13, s_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**19))) <=s (r_0_13 - u_0_13), (r_0_13 - u_0_13) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_13 - v_0_13), (s_0_13 - v_0_13) <=s (const 64 ((2**20) - (2**(20 - 13)))),
    u_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_0_13 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_12_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_12,
sint64 g_0_low60_0_low20_12,
sint64 f_0_low60_0_low20_13,
sint64 g_0_low60_0_low20_13,
sint64 u_0_12,
sint64 v_0_12,
sint64 r_0_12,
sint64 s_0_12,
sint64 u_0_13,
sint64 v_0_13,
sint64 r_0_13,
sint64 s_0_13,
bit ne
)={
    u_0_12 * f_0_low60_0_low20_0 + v_0_12 * g_0_low60_0_low20_0 = f_0_low60_0_low20_12 * (-(2**20)),
    r_0_12 * f_0_low60_0_low20_0 + s_0_12 * g_0_low60_0_low20_0 = g_0_low60_0_low20_12 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_12 + u_0_12 * (const 64 (2**21)) + v_0_12 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_12 + r_0_12 * (const 64 (2**21)) + s_0_12 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_12,
    f_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_12,
    g_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 12)) <=s delta, delta <=s (const 64 (1 + 2*12)),
    (const 64 (-(2**20))) <=s u_0_12, u_0_12 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_12, v_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)) )),
    (const 64 ((2**(20-12))-(2**20))) <=s r_0_12, r_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**20))) <=s s_0_12, s_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**19))) <=s (r_0_12 - u_0_12), (r_0_12 - u_0_12) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_12 - v_0_12), (s_0_12 - v_0_12) <=s (const 64 ((2**20) - (2**(20 - 12)))),
    u_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_0_12 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step12

// premise b
assume
    g_0_low60_0_low20_12 = 1 (mod 2)
&&
    g_0_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_13 f_0_low60_0_low20_12;
mov u_0_13 u_0_12;
mov v_0_13 v_0_12;

add g_0_low60_0_low20_13 g_0_low60_0_low20_12 f_0_low60_0_low20_12;
asr g_0_low60_0_low20_13 g_0_low60_0_low20_13 1;
add r_0_13 r_0_12 u_0_12;
asr r_0_13 r_0_13 1;
add s_0_13 s_0_12 v_0_12;
asr s_0_13 s_0_13 1;
assert
    true
&&
    f_0_low60_0_low20_13 = f_0_low60_0_low20_12,
    u_0_13 = u_0_12,
    v_0_13 = v_0_12,
    g_0_low60_0_low20_13 * (const 64 2) = g_0_low60_0_low20_12 + f_0_low60_0_low20_12,
    r_0_13 * (const 64 2) = r_0_12 + u_0_12,
    s_0_13 * (const 64 2) = s_0_12 + v_0_12
;

assume
    f_0_low60_0_low20_13 = f_0_low60_0_low20_12,
    u_0_13 = u_0_12,
    v_0_13 = v_0_12,
    g_0_low60_0_low20_13 * 2 = g_0_low60_0_low20_12 + f_0_low60_0_low20_12,
    r_0_13 * 2 = r_0_12 + u_0_12,
    s_0_13 * 2 = s_0_12 + v_0_12
&&
    true
;

{
    u_0_13 * f_0_low60_0_low20_0 + v_0_13 * g_0_low60_0_low20_0 = f_0_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_13 * f_0_low60_0_low20_0 + s_0_13 * g_0_low60_0_low20_0 = g_0_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_13 + u_0_13 * (const 64 (2**21)) + v_0_13 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_13 + r_0_13 * (const 64 (2**21)) + s_0_13 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_13,
    f_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_13,
    g_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 13)) <=s delta, delta <=s (const 64 (1 + 2*13)),
    (const 64 (-(2**20))) <=s u_0_13, u_0_13 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_13, v_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)) )),
    (const 64 ((2**(20-13))-(2**20))) <=s r_0_13, r_0_13 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-13))-(2**20))) <=s s_0_13, s_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**19))) <=s (r_0_13 - u_0_13), (r_0_13 - u_0_13) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_13 - v_0_13), (s_0_13 - v_0_13) <=s (const 64 ((2**20) - (2**(20 - 13)))),
    u_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_0_13 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_12_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_12,
sint64 g_0_low60_0_low20_12,
sint64 f_0_low60_0_low20_13,
sint64 g_0_low60_0_low20_13,
sint64 u_0_12,
sint64 v_0_12,
sint64 r_0_12,
sint64 s_0_12,
sint64 u_0_13,
sint64 v_0_13,
sint64 r_0_13,
sint64 s_0_13,
bit ne
)={
    u_0_12 * f_0_low60_0_low20_0 + v_0_12 * g_0_low60_0_low20_0 = f_0_low60_0_low20_12 * (-(2**20)),
    r_0_12 * f_0_low60_0_low20_0 + s_0_12 * g_0_low60_0_low20_0 = g_0_low60_0_low20_12 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_12 + u_0_12 * (const 64 (2**21)) + v_0_12 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_12 + r_0_12 * (const 64 (2**21)) + s_0_12 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_12,
    f_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_12,
    g_0_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 12)) <=s delta, delta <=s (const 64 (1 + 2*12)),
    (const 64 (-(2**20))) <=s u_0_12, u_0_12 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_12, v_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)) )),
    (const 64 ((2**(20-12))-(2**20))) <=s r_0_12, r_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**20))) <=s s_0_12, s_0_12 <=s (const 64 ((2**19) - (2**(20 - 12)))),
    (const 64 ((2**(20-12))-(2**19))) <=s (r_0_12 - u_0_12), (r_0_12 - u_0_12) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_12 - v_0_12), (s_0_12 - v_0_12) <=s (const 64 ((2**20) - (2**(20 - 12)))),
    u_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_0_12 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_0_12 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step12

// premise c
assume
    g_0_low60_0_low20_12 = 1 (mod 2)
&&
    g_0_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_13 g_0_low60_0_low20_12;
mov u_0_13 r_0_12;
mov v_0_13 s_0_12;

subs dc g_0_low60_0_low20_13 g_0_low60_0_low20_12 f_0_low60_0_low20_12;
asr g_0_low60_0_low20_13 g_0_low60_0_low20_13 1;
subs dc r_0_13 r_0_12 u_0_12;
asr r_0_13 r_0_13 1;
subs dc s_0_13 s_0_12 v_0_12;
asr s_0_13 s_0_13 1;
assert
    true
&&
    f_0_low60_0_low20_13 = g_0_low60_0_low20_12,
    u_0_13 = r_0_12,
    v_0_13 = s_0_12,
    g_0_low60_0_low20_13 * (const 64 2) = g_0_low60_0_low20_12 - f_0_low60_0_low20_12,
    r_0_13 * (const 64 2) = r_0_12 - u_0_12,
    s_0_13 * (const 64 2) = s_0_12 - v_0_12
;

assume
    f_0_low60_0_low20_13 = g_0_low60_0_low20_12,
    u_0_13 = r_0_12,
    v_0_13 = s_0_12,
    g_0_low60_0_low20_13 * 2 = g_0_low60_0_low20_12 - f_0_low60_0_low20_12,
    r_0_13 * 2 = r_0_12 - u_0_12,
    s_0_13 * 2 = s_0_12 - v_0_12
&&
    true
;

{
    u_0_13 * f_0_low60_0_low20_0 + v_0_13 * g_0_low60_0_low20_0 = f_0_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_13 * f_0_low60_0_low20_0 + s_0_13 * g_0_low60_0_low20_0 = g_0_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_13 + u_0_13 * (const 64 (2**21)) + v_0_13 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_13 + r_0_13 * (const 64 (2**21)) + s_0_13 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_13,
    f_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_13,
    g_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 13)) <=s delta, delta <=s (const 64 (1 + 2*13)),
    (const 64 (-(2**20))) <=s u_0_13, u_0_13 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_13, v_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)) )),
    (const 64 ((2**(20-13))-(2**20))) <=s r_0_13, r_0_13 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-13))-(2**20))) <=s s_0_13, s_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**19))) <=s (r_0_13 - u_0_13), (r_0_13 - u_0_13) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_13 - v_0_13), (s_0_13 - v_0_13) <=s (const 64 ((2**20) - (2**(20 - 13)))),
    u_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_0_13 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_13_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_13,
sint64 g_0_low60_0_low20_13,
sint64 f_0_low60_0_low20_14,
sint64 g_0_low60_0_low20_14,
sint64 u_0_13,
sint64 v_0_13,
sint64 r_0_13,
sint64 s_0_13,
sint64 u_0_14,
sint64 v_0_14,
sint64 r_0_14,
sint64 s_0_14,
bit ne
)={
    u_0_13 * f_0_low60_0_low20_0 + v_0_13 * g_0_low60_0_low20_0 = f_0_low60_0_low20_13 * (-(2**20)),
    r_0_13 * f_0_low60_0_low20_0 + s_0_13 * g_0_low60_0_low20_0 = g_0_low60_0_low20_13 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_13 + u_0_13 * (const 64 (2**21)) + v_0_13 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_13 + r_0_13 * (const 64 (2**21)) + s_0_13 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_13,
    f_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_13,
    g_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 13)) <=s delta, delta <=s (const 64 (1 + 2*13)),
    (const 64 (-(2**20))) <=s u_0_13, u_0_13 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_13, v_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)) )),
    (const 64 ((2**(20-13))-(2**20))) <=s r_0_13, r_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**20))) <=s s_0_13, s_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**19))) <=s (r_0_13 - u_0_13), (r_0_13 - u_0_13) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_13 - v_0_13), (s_0_13 - v_0_13) <=s (const 64 ((2**20) - (2**(20 - 13)))),
    u_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_0_13 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step13

// premise a
assume
    g_0_low60_0_low20_13 = 0 (mod 2)
&&
    g_0_low60_0_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_14 f_0_low60_0_low20_13;
mov u_0_14 u_0_13;
mov v_0_14 v_0_13;

asr g_0_low60_0_low20_14 g_0_low60_0_low20_13 1;
asr r_0_14 r_0_13 1;
asr s_0_14 s_0_13 1;
assert
    true
&&
    f_0_low60_0_low20_14 = f_0_low60_0_low20_13,
    u_0_14 = u_0_13,
    v_0_14 = v_0_13,
    g_0_low60_0_low20_14 * (const 64 2) = g_0_low60_0_low20_13,
    r_0_14 * (const 64 2) = r_0_13,
    s_0_14 * (const 64 2) = s_0_13
;

assume
    f_0_low60_0_low20_14 = f_0_low60_0_low20_13,
    u_0_14 = u_0_13,
    v_0_14 = v_0_13,
    g_0_low60_0_low20_14 * 2 = g_0_low60_0_low20_13,
    r_0_14 * 2 = r_0_13,
    s_0_14 * 2 = s_0_13
&&
    true
;

{
    u_0_14 * f_0_low60_0_low20_0 + v_0_14 * g_0_low60_0_low20_0 = f_0_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_14 * f_0_low60_0_low20_0 + s_0_14 * g_0_low60_0_low20_0 = g_0_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_14 + u_0_14 * (const 64 (2**21)) + v_0_14 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_14 + r_0_14 * (const 64 (2**21)) + s_0_14 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_14,
    f_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_14,
    g_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 14)) <=s delta, delta <=s (const 64 (1 + 2*14)),
    (const 64 (-(2**20))) <=s u_0_14, u_0_14 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_14, v_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)) )),
    (const 64 ((2**(20-14))-(2**20))) <=s r_0_14, r_0_14 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-14))-(2**20))) <=s s_0_14, s_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**19))) <=s (r_0_14 - u_0_14), (r_0_14 - u_0_14) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_14 - v_0_14), (s_0_14 - v_0_14) <=s (const 64 ((2**20) - (2**(20 - 14)))),
    u_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_0_14 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_13_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_13,
sint64 g_0_low60_0_low20_13,
sint64 f_0_low60_0_low20_14,
sint64 g_0_low60_0_low20_14,
sint64 u_0_13,
sint64 v_0_13,
sint64 r_0_13,
sint64 s_0_13,
sint64 u_0_14,
sint64 v_0_14,
sint64 r_0_14,
sint64 s_0_14,
bit ne
)={
    u_0_13 * f_0_low60_0_low20_0 + v_0_13 * g_0_low60_0_low20_0 = f_0_low60_0_low20_13 * (-(2**20)),
    r_0_13 * f_0_low60_0_low20_0 + s_0_13 * g_0_low60_0_low20_0 = g_0_low60_0_low20_13 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_13 + u_0_13 * (const 64 (2**21)) + v_0_13 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_13 + r_0_13 * (const 64 (2**21)) + s_0_13 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_13,
    f_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_13,
    g_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 13)) <=s delta, delta <=s (const 64 (1 + 2*13)),
    (const 64 (-(2**20))) <=s u_0_13, u_0_13 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_13, v_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)) )),
    (const 64 ((2**(20-13))-(2**20))) <=s r_0_13, r_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**20))) <=s s_0_13, s_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**19))) <=s (r_0_13 - u_0_13), (r_0_13 - u_0_13) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_13 - v_0_13), (s_0_13 - v_0_13) <=s (const 64 ((2**20) - (2**(20 - 13)))),
    u_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_0_13 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step13

// premise b
assume
    g_0_low60_0_low20_13 = 1 (mod 2)
&&
    g_0_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_14 f_0_low60_0_low20_13;
mov u_0_14 u_0_13;
mov v_0_14 v_0_13;

add g_0_low60_0_low20_14 g_0_low60_0_low20_13 f_0_low60_0_low20_13;
asr g_0_low60_0_low20_14 g_0_low60_0_low20_14 1;
add r_0_14 r_0_13 u_0_13;
asr r_0_14 r_0_14 1;
add s_0_14 s_0_13 v_0_13;
asr s_0_14 s_0_14 1;
assert
    true
&&
    f_0_low60_0_low20_14 = f_0_low60_0_low20_13,
    u_0_14 = u_0_13,
    v_0_14 = v_0_13,
    g_0_low60_0_low20_14 * (const 64 2) = g_0_low60_0_low20_13 + f_0_low60_0_low20_13,
    r_0_14 * (const 64 2) = r_0_13 + u_0_13,
    s_0_14 * (const 64 2) = s_0_13 + v_0_13
;

assume
    f_0_low60_0_low20_14 = f_0_low60_0_low20_13,
    u_0_14 = u_0_13,
    v_0_14 = v_0_13,
    g_0_low60_0_low20_14 * 2 = g_0_low60_0_low20_13 + f_0_low60_0_low20_13,
    r_0_14 * 2 = r_0_13 + u_0_13,
    s_0_14 * 2 = s_0_13 + v_0_13
&&
    true
;

{
    u_0_14 * f_0_low60_0_low20_0 + v_0_14 * g_0_low60_0_low20_0 = f_0_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_14 * f_0_low60_0_low20_0 + s_0_14 * g_0_low60_0_low20_0 = g_0_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_14 + u_0_14 * (const 64 (2**21)) + v_0_14 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_14 + r_0_14 * (const 64 (2**21)) + s_0_14 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_14,
    f_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_14,
    g_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 14)) <=s delta, delta <=s (const 64 (1 + 2*14)),
    (const 64 (-(2**20))) <=s u_0_14, u_0_14 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_14, v_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)) )),
    (const 64 ((2**(20-14))-(2**20))) <=s r_0_14, r_0_14 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-14))-(2**20))) <=s s_0_14, s_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**19))) <=s (r_0_14 - u_0_14), (r_0_14 - u_0_14) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_14 - v_0_14), (s_0_14 - v_0_14) <=s (const 64 ((2**20) - (2**(20 - 14)))),
    u_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_0_14 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_13_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_13,
sint64 g_0_low60_0_low20_13,
sint64 f_0_low60_0_low20_14,
sint64 g_0_low60_0_low20_14,
sint64 u_0_13,
sint64 v_0_13,
sint64 r_0_13,
sint64 s_0_13,
sint64 u_0_14,
sint64 v_0_14,
sint64 r_0_14,
sint64 s_0_14,
bit ne
)={
    u_0_13 * f_0_low60_0_low20_0 + v_0_13 * g_0_low60_0_low20_0 = f_0_low60_0_low20_13 * (-(2**20)),
    r_0_13 * f_0_low60_0_low20_0 + s_0_13 * g_0_low60_0_low20_0 = g_0_low60_0_low20_13 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_13 + u_0_13 * (const 64 (2**21)) + v_0_13 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_13 + r_0_13 * (const 64 (2**21)) + s_0_13 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_13,
    f_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_13,
    g_0_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 13)) <=s delta, delta <=s (const 64 (1 + 2*13)),
    (const 64 (-(2**20))) <=s u_0_13, u_0_13 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_13, v_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)) )),
    (const 64 ((2**(20-13))-(2**20))) <=s r_0_13, r_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**20))) <=s s_0_13, s_0_13 <=s (const 64 ((2**19) - (2**(20 - 13)))),
    (const 64 ((2**(20-13))-(2**19))) <=s (r_0_13 - u_0_13), (r_0_13 - u_0_13) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_13 - v_0_13), (s_0_13 - v_0_13) <=s (const 64 ((2**20) - (2**(20 - 13)))),
    u_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_0_13 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_0_13 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step13

// premise c
assume
    g_0_low60_0_low20_13 = 1 (mod 2)
&&
    g_0_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_14 g_0_low60_0_low20_13;
mov u_0_14 r_0_13;
mov v_0_14 s_0_13;

subs dc g_0_low60_0_low20_14 g_0_low60_0_low20_13 f_0_low60_0_low20_13;
asr g_0_low60_0_low20_14 g_0_low60_0_low20_14 1;
subs dc r_0_14 r_0_13 u_0_13;
asr r_0_14 r_0_14 1;
subs dc s_0_14 s_0_13 v_0_13;
asr s_0_14 s_0_14 1;
assert
    true
&&
    f_0_low60_0_low20_14 = g_0_low60_0_low20_13,
    u_0_14 = r_0_13,
    v_0_14 = s_0_13,
    g_0_low60_0_low20_14 * (const 64 2) = g_0_low60_0_low20_13 - f_0_low60_0_low20_13,
    r_0_14 * (const 64 2) = r_0_13 - u_0_13,
    s_0_14 * (const 64 2) = s_0_13 - v_0_13
;

assume
    f_0_low60_0_low20_14 = g_0_low60_0_low20_13,
    u_0_14 = r_0_13,
    v_0_14 = s_0_13,
    g_0_low60_0_low20_14 * 2 = g_0_low60_0_low20_13 - f_0_low60_0_low20_13,
    r_0_14 * 2 = r_0_13 - u_0_13,
    s_0_14 * 2 = s_0_13 - v_0_13
&&
    true
;

{
    u_0_14 * f_0_low60_0_low20_0 + v_0_14 * g_0_low60_0_low20_0 = f_0_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_14 * f_0_low60_0_low20_0 + s_0_14 * g_0_low60_0_low20_0 = g_0_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_14 + u_0_14 * (const 64 (2**21)) + v_0_14 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_14 + r_0_14 * (const 64 (2**21)) + s_0_14 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_14,
    f_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_14,
    g_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 14)) <=s delta, delta <=s (const 64 (1 + 2*14)),
    (const 64 (-(2**20))) <=s u_0_14, u_0_14 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_14, v_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)) )),
    (const 64 ((2**(20-14))-(2**20))) <=s r_0_14, r_0_14 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-14))-(2**20))) <=s s_0_14, s_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**19))) <=s (r_0_14 - u_0_14), (r_0_14 - u_0_14) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_14 - v_0_14), (s_0_14 - v_0_14) <=s (const 64 ((2**20) - (2**(20 - 14)))),
    u_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_0_14 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_14_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_14,
sint64 g_0_low60_0_low20_14,
sint64 f_0_low60_0_low20_15,
sint64 g_0_low60_0_low20_15,
sint64 u_0_14,
sint64 v_0_14,
sint64 r_0_14,
sint64 s_0_14,
sint64 u_0_15,
sint64 v_0_15,
sint64 r_0_15,
sint64 s_0_15,
bit ne
)={
    u_0_14 * f_0_low60_0_low20_0 + v_0_14 * g_0_low60_0_low20_0 = f_0_low60_0_low20_14 * (-(2**20)),
    r_0_14 * f_0_low60_0_low20_0 + s_0_14 * g_0_low60_0_low20_0 = g_0_low60_0_low20_14 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_14 + u_0_14 * (const 64 (2**21)) + v_0_14 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_14 + r_0_14 * (const 64 (2**21)) + s_0_14 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_14,
    f_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_14,
    g_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 14)) <=s delta, delta <=s (const 64 (1 + 2*14)),
    (const 64 (-(2**20))) <=s u_0_14, u_0_14 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_14, v_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)) )),
    (const 64 ((2**(20-14))-(2**20))) <=s r_0_14, r_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**20))) <=s s_0_14, s_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**19))) <=s (r_0_14 - u_0_14), (r_0_14 - u_0_14) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_14 - v_0_14), (s_0_14 - v_0_14) <=s (const 64 ((2**20) - (2**(20 - 14)))),
    u_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_0_14 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step14

// premise a
assume
    g_0_low60_0_low20_14 = 0 (mod 2)
&&
    g_0_low60_0_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_15 f_0_low60_0_low20_14;
mov u_0_15 u_0_14;
mov v_0_15 v_0_14;

asr g_0_low60_0_low20_15 g_0_low60_0_low20_14 1;
asr r_0_15 r_0_14 1;
asr s_0_15 s_0_14 1;
assert
    true
&&
    f_0_low60_0_low20_15 = f_0_low60_0_low20_14,
    u_0_15 = u_0_14,
    v_0_15 = v_0_14,
    g_0_low60_0_low20_15 * (const 64 2) = g_0_low60_0_low20_14,
    r_0_15 * (const 64 2) = r_0_14,
    s_0_15 * (const 64 2) = s_0_14
;

assume
    f_0_low60_0_low20_15 = f_0_low60_0_low20_14,
    u_0_15 = u_0_14,
    v_0_15 = v_0_14,
    g_0_low60_0_low20_15 * 2 = g_0_low60_0_low20_14,
    r_0_15 * 2 = r_0_14,
    s_0_15 * 2 = s_0_14
&&
    true
;

{
    u_0_15 * f_0_low60_0_low20_0 + v_0_15 * g_0_low60_0_low20_0 = f_0_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_15 * f_0_low60_0_low20_0 + s_0_15 * g_0_low60_0_low20_0 = g_0_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_15 + u_0_15 * (const 64 (2**21)) + v_0_15 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_15 + r_0_15 * (const 64 (2**21)) + s_0_15 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_15,
    f_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_15,
    g_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 15)) <=s delta, delta <=s (const 64 (1 + 2*15)),
    (const 64 (-(2**20))) <=s u_0_15, u_0_15 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_15, v_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)) )),
    (const 64 ((2**(20-15))-(2**20))) <=s r_0_15, r_0_15 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-15))-(2**20))) <=s s_0_15, s_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**19))) <=s (r_0_15 - u_0_15), (r_0_15 - u_0_15) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_15 - v_0_15), (s_0_15 - v_0_15) <=s (const 64 ((2**20) - (2**(20 - 15)))),
    u_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_0_15 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_14_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_14,
sint64 g_0_low60_0_low20_14,
sint64 f_0_low60_0_low20_15,
sint64 g_0_low60_0_low20_15,
sint64 u_0_14,
sint64 v_0_14,
sint64 r_0_14,
sint64 s_0_14,
sint64 u_0_15,
sint64 v_0_15,
sint64 r_0_15,
sint64 s_0_15,
bit ne
)={
    u_0_14 * f_0_low60_0_low20_0 + v_0_14 * g_0_low60_0_low20_0 = f_0_low60_0_low20_14 * (-(2**20)),
    r_0_14 * f_0_low60_0_low20_0 + s_0_14 * g_0_low60_0_low20_0 = g_0_low60_0_low20_14 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_14 + u_0_14 * (const 64 (2**21)) + v_0_14 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_14 + r_0_14 * (const 64 (2**21)) + s_0_14 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_14,
    f_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_14,
    g_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 14)) <=s delta, delta <=s (const 64 (1 + 2*14)),
    (const 64 (-(2**20))) <=s u_0_14, u_0_14 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_14, v_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)) )),
    (const 64 ((2**(20-14))-(2**20))) <=s r_0_14, r_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**20))) <=s s_0_14, s_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**19))) <=s (r_0_14 - u_0_14), (r_0_14 - u_0_14) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_14 - v_0_14), (s_0_14 - v_0_14) <=s (const 64 ((2**20) - (2**(20 - 14)))),
    u_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_0_14 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step14

// premise b
assume
    g_0_low60_0_low20_14 = 1 (mod 2)
&&
    g_0_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_15 f_0_low60_0_low20_14;
mov u_0_15 u_0_14;
mov v_0_15 v_0_14;

add g_0_low60_0_low20_15 g_0_low60_0_low20_14 f_0_low60_0_low20_14;
asr g_0_low60_0_low20_15 g_0_low60_0_low20_15 1;
add r_0_15 r_0_14 u_0_14;
asr r_0_15 r_0_15 1;
add s_0_15 s_0_14 v_0_14;
asr s_0_15 s_0_15 1;
assert
    true
&&
    f_0_low60_0_low20_15 = f_0_low60_0_low20_14,
    u_0_15 = u_0_14,
    v_0_15 = v_0_14,
    g_0_low60_0_low20_15 * (const 64 2) = g_0_low60_0_low20_14 + f_0_low60_0_low20_14,
    r_0_15 * (const 64 2) = r_0_14 + u_0_14,
    s_0_15 * (const 64 2) = s_0_14 + v_0_14
;

assume
    f_0_low60_0_low20_15 = f_0_low60_0_low20_14,
    u_0_15 = u_0_14,
    v_0_15 = v_0_14,
    g_0_low60_0_low20_15 * 2 = g_0_low60_0_low20_14 + f_0_low60_0_low20_14,
    r_0_15 * 2 = r_0_14 + u_0_14,
    s_0_15 * 2 = s_0_14 + v_0_14
&&
    true
;

{
    u_0_15 * f_0_low60_0_low20_0 + v_0_15 * g_0_low60_0_low20_0 = f_0_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_15 * f_0_low60_0_low20_0 + s_0_15 * g_0_low60_0_low20_0 = g_0_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_15 + u_0_15 * (const 64 (2**21)) + v_0_15 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_15 + r_0_15 * (const 64 (2**21)) + s_0_15 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_15,
    f_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_15,
    g_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 15)) <=s delta, delta <=s (const 64 (1 + 2*15)),
    (const 64 (-(2**20))) <=s u_0_15, u_0_15 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_15, v_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)) )),
    (const 64 ((2**(20-15))-(2**20))) <=s r_0_15, r_0_15 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-15))-(2**20))) <=s s_0_15, s_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**19))) <=s (r_0_15 - u_0_15), (r_0_15 - u_0_15) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_15 - v_0_15), (s_0_15 - v_0_15) <=s (const 64 ((2**20) - (2**(20 - 15)))),
    u_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_0_15 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_14_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_14,
sint64 g_0_low60_0_low20_14,
sint64 f_0_low60_0_low20_15,
sint64 g_0_low60_0_low20_15,
sint64 u_0_14,
sint64 v_0_14,
sint64 r_0_14,
sint64 s_0_14,
sint64 u_0_15,
sint64 v_0_15,
sint64 r_0_15,
sint64 s_0_15,
bit ne
)={
    u_0_14 * f_0_low60_0_low20_0 + v_0_14 * g_0_low60_0_low20_0 = f_0_low60_0_low20_14 * (-(2**20)),
    r_0_14 * f_0_low60_0_low20_0 + s_0_14 * g_0_low60_0_low20_0 = g_0_low60_0_low20_14 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_14 + u_0_14 * (const 64 (2**21)) + v_0_14 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_14 + r_0_14 * (const 64 (2**21)) + s_0_14 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_14,
    f_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_14,
    g_0_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 14)) <=s delta, delta <=s (const 64 (1 + 2*14)),
    (const 64 (-(2**20))) <=s u_0_14, u_0_14 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_14, v_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)) )),
    (const 64 ((2**(20-14))-(2**20))) <=s r_0_14, r_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**20))) <=s s_0_14, s_0_14 <=s (const 64 ((2**19) - (2**(20 - 14)))),
    (const 64 ((2**(20-14))-(2**19))) <=s (r_0_14 - u_0_14), (r_0_14 - u_0_14) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_14 - v_0_14), (s_0_14 - v_0_14) <=s (const 64 ((2**20) - (2**(20 - 14)))),
    u_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_0_14 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_0_14 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step14

// premise c
assume
    g_0_low60_0_low20_14 = 1 (mod 2)
&&
    g_0_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_15 g_0_low60_0_low20_14;
mov u_0_15 r_0_14;
mov v_0_15 s_0_14;

subs dc g_0_low60_0_low20_15 g_0_low60_0_low20_14 f_0_low60_0_low20_14;
asr g_0_low60_0_low20_15 g_0_low60_0_low20_15 1;
subs dc r_0_15 r_0_14 u_0_14;
asr r_0_15 r_0_15 1;
subs dc s_0_15 s_0_14 v_0_14;
asr s_0_15 s_0_15 1;
assert
    true
&&
    f_0_low60_0_low20_15 = g_0_low60_0_low20_14,
    u_0_15 = r_0_14,
    v_0_15 = s_0_14,
    g_0_low60_0_low20_15 * (const 64 2) = g_0_low60_0_low20_14 - f_0_low60_0_low20_14,
    r_0_15 * (const 64 2) = r_0_14 - u_0_14,
    s_0_15 * (const 64 2) = s_0_14 - v_0_14
;

assume
    f_0_low60_0_low20_15 = g_0_low60_0_low20_14,
    u_0_15 = r_0_14,
    v_0_15 = s_0_14,
    g_0_low60_0_low20_15 * 2 = g_0_low60_0_low20_14 - f_0_low60_0_low20_14,
    r_0_15 * 2 = r_0_14 - u_0_14,
    s_0_15 * 2 = s_0_14 - v_0_14
&&
    true
;

{
    u_0_15 * f_0_low60_0_low20_0 + v_0_15 * g_0_low60_0_low20_0 = f_0_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_15 * f_0_low60_0_low20_0 + s_0_15 * g_0_low60_0_low20_0 = g_0_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_15 + u_0_15 * (const 64 (2**21)) + v_0_15 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_15 + r_0_15 * (const 64 (2**21)) + s_0_15 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_15,
    f_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_15,
    g_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 15)) <=s delta, delta <=s (const 64 (1 + 2*15)),
    (const 64 (-(2**20))) <=s u_0_15, u_0_15 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_15, v_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)) )),
    (const 64 ((2**(20-15))-(2**20))) <=s r_0_15, r_0_15 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-15))-(2**20))) <=s s_0_15, s_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**19))) <=s (r_0_15 - u_0_15), (r_0_15 - u_0_15) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_15 - v_0_15), (s_0_15 - v_0_15) <=s (const 64 ((2**20) - (2**(20 - 15)))),
    u_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_0_15 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_15_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_15,
sint64 g_0_low60_0_low20_15,
sint64 f_0_low60_0_low20_16,
sint64 g_0_low60_0_low20_16,
sint64 u_0_15,
sint64 v_0_15,
sint64 r_0_15,
sint64 s_0_15,
sint64 u_0_16,
sint64 v_0_16,
sint64 r_0_16,
sint64 s_0_16,
bit ne
)={
    u_0_15 * f_0_low60_0_low20_0 + v_0_15 * g_0_low60_0_low20_0 = f_0_low60_0_low20_15 * (-(2**20)),
    r_0_15 * f_0_low60_0_low20_0 + s_0_15 * g_0_low60_0_low20_0 = g_0_low60_0_low20_15 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_15 + u_0_15 * (const 64 (2**21)) + v_0_15 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_15 + r_0_15 * (const 64 (2**21)) + s_0_15 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_15,
    f_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_15,
    g_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 15)) <=s delta, delta <=s (const 64 (1 + 2*15)),
    (const 64 (-(2**20))) <=s u_0_15, u_0_15 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_15, v_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)) )),
    (const 64 ((2**(20-15))-(2**20))) <=s r_0_15, r_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**20))) <=s s_0_15, s_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**19))) <=s (r_0_15 - u_0_15), (r_0_15 - u_0_15) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_15 - v_0_15), (s_0_15 - v_0_15) <=s (const 64 ((2**20) - (2**(20 - 15)))),
    u_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_0_15 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step15

// premise a
assume
    g_0_low60_0_low20_15 = 0 (mod 2)
&&
    g_0_low60_0_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_16 f_0_low60_0_low20_15;
mov u_0_16 u_0_15;
mov v_0_16 v_0_15;

asr g_0_low60_0_low20_16 g_0_low60_0_low20_15 1;
asr r_0_16 r_0_15 1;
asr s_0_16 s_0_15 1;
assert
    true
&&
    f_0_low60_0_low20_16 = f_0_low60_0_low20_15,
    u_0_16 = u_0_15,
    v_0_16 = v_0_15,
    g_0_low60_0_low20_16 * (const 64 2) = g_0_low60_0_low20_15,
    r_0_16 * (const 64 2) = r_0_15,
    s_0_16 * (const 64 2) = s_0_15
;

assume
    f_0_low60_0_low20_16 = f_0_low60_0_low20_15,
    u_0_16 = u_0_15,
    v_0_16 = v_0_15,
    g_0_low60_0_low20_16 * 2 = g_0_low60_0_low20_15,
    r_0_16 * 2 = r_0_15,
    s_0_16 * 2 = s_0_15
&&
    true
;

{
    u_0_16 * f_0_low60_0_low20_0 + v_0_16 * g_0_low60_0_low20_0 = f_0_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_16 * f_0_low60_0_low20_0 + s_0_16 * g_0_low60_0_low20_0 = g_0_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_16 + u_0_16 * (const 64 (2**21)) + v_0_16 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_16 + r_0_16 * (const 64 (2**21)) + s_0_16 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_16,
    f_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_16,
    g_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 16)) <=s delta, delta <=s (const 64 (1 + 2*16)),
    (const 64 (-(2**20))) <=s u_0_16, u_0_16 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_16, v_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)) )),
    (const 64 ((2**(20-16))-(2**20))) <=s r_0_16, r_0_16 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-16))-(2**20))) <=s s_0_16, s_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**19))) <=s (r_0_16 - u_0_16), (r_0_16 - u_0_16) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_16 - v_0_16), (s_0_16 - v_0_16) <=s (const 64 ((2**20) - (2**(20 - 16)))),
    u_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_0_16 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_15_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_15,
sint64 g_0_low60_0_low20_15,
sint64 f_0_low60_0_low20_16,
sint64 g_0_low60_0_low20_16,
sint64 u_0_15,
sint64 v_0_15,
sint64 r_0_15,
sint64 s_0_15,
sint64 u_0_16,
sint64 v_0_16,
sint64 r_0_16,
sint64 s_0_16,
bit ne
)={
    u_0_15 * f_0_low60_0_low20_0 + v_0_15 * g_0_low60_0_low20_0 = f_0_low60_0_low20_15 * (-(2**20)),
    r_0_15 * f_0_low60_0_low20_0 + s_0_15 * g_0_low60_0_low20_0 = g_0_low60_0_low20_15 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_15 + u_0_15 * (const 64 (2**21)) + v_0_15 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_15 + r_0_15 * (const 64 (2**21)) + s_0_15 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_15,
    f_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_15,
    g_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 15)) <=s delta, delta <=s (const 64 (1 + 2*15)),
    (const 64 (-(2**20))) <=s u_0_15, u_0_15 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_15, v_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)) )),
    (const 64 ((2**(20-15))-(2**20))) <=s r_0_15, r_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**20))) <=s s_0_15, s_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**19))) <=s (r_0_15 - u_0_15), (r_0_15 - u_0_15) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_15 - v_0_15), (s_0_15 - v_0_15) <=s (const 64 ((2**20) - (2**(20 - 15)))),
    u_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_0_15 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step15

// premise b
assume
    g_0_low60_0_low20_15 = 1 (mod 2)
&&
    g_0_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_16 f_0_low60_0_low20_15;
mov u_0_16 u_0_15;
mov v_0_16 v_0_15;

add g_0_low60_0_low20_16 g_0_low60_0_low20_15 f_0_low60_0_low20_15;
asr g_0_low60_0_low20_16 g_0_low60_0_low20_16 1;
add r_0_16 r_0_15 u_0_15;
asr r_0_16 r_0_16 1;
add s_0_16 s_0_15 v_0_15;
asr s_0_16 s_0_16 1;
assert
    true
&&
    f_0_low60_0_low20_16 = f_0_low60_0_low20_15,
    u_0_16 = u_0_15,
    v_0_16 = v_0_15,
    g_0_low60_0_low20_16 * (const 64 2) = g_0_low60_0_low20_15 + f_0_low60_0_low20_15,
    r_0_16 * (const 64 2) = r_0_15 + u_0_15,
    s_0_16 * (const 64 2) = s_0_15 + v_0_15
;

assume
    f_0_low60_0_low20_16 = f_0_low60_0_low20_15,
    u_0_16 = u_0_15,
    v_0_16 = v_0_15,
    g_0_low60_0_low20_16 * 2 = g_0_low60_0_low20_15 + f_0_low60_0_low20_15,
    r_0_16 * 2 = r_0_15 + u_0_15,
    s_0_16 * 2 = s_0_15 + v_0_15
&&
    true
;

{
    u_0_16 * f_0_low60_0_low20_0 + v_0_16 * g_0_low60_0_low20_0 = f_0_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_16 * f_0_low60_0_low20_0 + s_0_16 * g_0_low60_0_low20_0 = g_0_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_16 + u_0_16 * (const 64 (2**21)) + v_0_16 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_16 + r_0_16 * (const 64 (2**21)) + s_0_16 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_16,
    f_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_16,
    g_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 16)) <=s delta, delta <=s (const 64 (1 + 2*16)),
    (const 64 (-(2**20))) <=s u_0_16, u_0_16 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_16, v_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)) )),
    (const 64 ((2**(20-16))-(2**20))) <=s r_0_16, r_0_16 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-16))-(2**20))) <=s s_0_16, s_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**19))) <=s (r_0_16 - u_0_16), (r_0_16 - u_0_16) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_16 - v_0_16), (s_0_16 - v_0_16) <=s (const 64 ((2**20) - (2**(20 - 16)))),
    u_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_0_16 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_15_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_15,
sint64 g_0_low60_0_low20_15,
sint64 f_0_low60_0_low20_16,
sint64 g_0_low60_0_low20_16,
sint64 u_0_15,
sint64 v_0_15,
sint64 r_0_15,
sint64 s_0_15,
sint64 u_0_16,
sint64 v_0_16,
sint64 r_0_16,
sint64 s_0_16,
bit ne
)={
    u_0_15 * f_0_low60_0_low20_0 + v_0_15 * g_0_low60_0_low20_0 = f_0_low60_0_low20_15 * (-(2**20)),
    r_0_15 * f_0_low60_0_low20_0 + s_0_15 * g_0_low60_0_low20_0 = g_0_low60_0_low20_15 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_15 + u_0_15 * (const 64 (2**21)) + v_0_15 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_15 + r_0_15 * (const 64 (2**21)) + s_0_15 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_15,
    f_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_15,
    g_0_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 15)) <=s delta, delta <=s (const 64 (1 + 2*15)),
    (const 64 (-(2**20))) <=s u_0_15, u_0_15 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_15, v_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)) )),
    (const 64 ((2**(20-15))-(2**20))) <=s r_0_15, r_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**20))) <=s s_0_15, s_0_15 <=s (const 64 ((2**19) - (2**(20 - 15)))),
    (const 64 ((2**(20-15))-(2**19))) <=s (r_0_15 - u_0_15), (r_0_15 - u_0_15) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_15 - v_0_15), (s_0_15 - v_0_15) <=s (const 64 ((2**20) - (2**(20 - 15)))),
    u_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_0_15 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_0_15 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step15

// premise c
assume
    g_0_low60_0_low20_15 = 1 (mod 2)
&&
    g_0_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_16 g_0_low60_0_low20_15;
mov u_0_16 r_0_15;
mov v_0_16 s_0_15;

subs dc g_0_low60_0_low20_16 g_0_low60_0_low20_15 f_0_low60_0_low20_15;
asr g_0_low60_0_low20_16 g_0_low60_0_low20_16 1;
subs dc r_0_16 r_0_15 u_0_15;
asr r_0_16 r_0_16 1;
subs dc s_0_16 s_0_15 v_0_15;
asr s_0_16 s_0_16 1;
assert
    true
&&
    f_0_low60_0_low20_16 = g_0_low60_0_low20_15,
    u_0_16 = r_0_15,
    v_0_16 = s_0_15,
    g_0_low60_0_low20_16 * (const 64 2) = g_0_low60_0_low20_15 - f_0_low60_0_low20_15,
    r_0_16 * (const 64 2) = r_0_15 - u_0_15,
    s_0_16 * (const 64 2) = s_0_15 - v_0_15
;

assume
    f_0_low60_0_low20_16 = g_0_low60_0_low20_15,
    u_0_16 = r_0_15,
    v_0_16 = s_0_15,
    g_0_low60_0_low20_16 * 2 = g_0_low60_0_low20_15 - f_0_low60_0_low20_15,
    r_0_16 * 2 = r_0_15 - u_0_15,
    s_0_16 * 2 = s_0_15 - v_0_15
&&
    true
;

{
    u_0_16 * f_0_low60_0_low20_0 + v_0_16 * g_0_low60_0_low20_0 = f_0_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_16 * f_0_low60_0_low20_0 + s_0_16 * g_0_low60_0_low20_0 = g_0_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_16 + u_0_16 * (const 64 (2**21)) + v_0_16 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_16 + r_0_16 * (const 64 (2**21)) + s_0_16 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_16,
    f_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_16,
    g_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 16)) <=s delta, delta <=s (const 64 (1 + 2*16)),
    (const 64 (-(2**20))) <=s u_0_16, u_0_16 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_16, v_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)) )),
    (const 64 ((2**(20-16))-(2**20))) <=s r_0_16, r_0_16 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-16))-(2**20))) <=s s_0_16, s_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**19))) <=s (r_0_16 - u_0_16), (r_0_16 - u_0_16) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_16 - v_0_16), (s_0_16 - v_0_16) <=s (const 64 ((2**20) - (2**(20 - 16)))),
    u_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_0_16 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_16_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_16,
sint64 g_0_low60_0_low20_16,
sint64 f_0_low60_0_low20_17,
sint64 g_0_low60_0_low20_17,
sint64 u_0_16,
sint64 v_0_16,
sint64 r_0_16,
sint64 s_0_16,
sint64 u_0_17,
sint64 v_0_17,
sint64 r_0_17,
sint64 s_0_17,
bit ne
)={
    u_0_16 * f_0_low60_0_low20_0 + v_0_16 * g_0_low60_0_low20_0 = f_0_low60_0_low20_16 * (-(2**20)),
    r_0_16 * f_0_low60_0_low20_0 + s_0_16 * g_0_low60_0_low20_0 = g_0_low60_0_low20_16 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_16 + u_0_16 * (const 64 (2**21)) + v_0_16 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_16 + r_0_16 * (const 64 (2**21)) + s_0_16 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_16,
    f_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_16,
    g_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 16)) <=s delta, delta <=s (const 64 (1 + 2*16)),
    (const 64 (-(2**20))) <=s u_0_16, u_0_16 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_16, v_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)) )),
    (const 64 ((2**(20-16))-(2**20))) <=s r_0_16, r_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**20))) <=s s_0_16, s_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**19))) <=s (r_0_16 - u_0_16), (r_0_16 - u_0_16) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_16 - v_0_16), (s_0_16 - v_0_16) <=s (const 64 ((2**20) - (2**(20 - 16)))),
    u_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_0_16 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise a
assume
    g_0_low60_0_low20_16 = 0 (mod 2)
&&
    g_0_low60_0_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_17 f_0_low60_0_low20_16;
mov u_0_17 u_0_16;
mov v_0_17 v_0_16;

asr g_0_low60_0_low20_17 g_0_low60_0_low20_16 1;
asr r_0_17 r_0_16 1;
asr s_0_17 s_0_16 1;
assert
    true
&&
    f_0_low60_0_low20_17 = f_0_low60_0_low20_16,
    u_0_17 = u_0_16,
    v_0_17 = v_0_16,
    g_0_low60_0_low20_17 * (const 64 2) = g_0_low60_0_low20_16,
    r_0_17 * (const 64 2) = r_0_16,
    s_0_17 * (const 64 2) = s_0_16
;

assume
    f_0_low60_0_low20_17 = f_0_low60_0_low20_16,
    u_0_17 = u_0_16,
    v_0_17 = v_0_16,
    g_0_low60_0_low20_17 * 2 = g_0_low60_0_low20_16,
    r_0_17 * 2 = r_0_16,
    s_0_17 * 2 = s_0_16
&&
    true
;

{
    u_0_17 * f_0_low60_0_low20_0 + v_0_17 * g_0_low60_0_low20_0 = f_0_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_17 * f_0_low60_0_low20_0 + s_0_17 * g_0_low60_0_low20_0 = g_0_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_17 + u_0_17 * (const 64 (2**21)) + v_0_17 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_17 + r_0_17 * (const 64 (2**21)) + s_0_17 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_17,
    f_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_17,
    g_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 17)) <=s delta, delta <=s (const 64 (1 + 2*17)),
    (const 64 (-(2**20))) <=s u_0_17, u_0_17 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_17, v_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)) )),
    (const 64 ((2**(20-17))-(2**20))) <=s r_0_17, r_0_17 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-17))-(2**20))) <=s s_0_17, s_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**19))) <=s (r_0_17 - u_0_17), (r_0_17 - u_0_17) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_17 - v_0_17), (s_0_17 - v_0_17) <=s (const 64 ((2**20) - (2**(20 - 17)))),
    u_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_0_17 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_16_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_16,
sint64 g_0_low60_0_low20_16,
sint64 f_0_low60_0_low20_17,
sint64 g_0_low60_0_low20_17,
sint64 u_0_16,
sint64 v_0_16,
sint64 r_0_16,
sint64 s_0_16,
sint64 u_0_17,
sint64 v_0_17,
sint64 r_0_17,
sint64 s_0_17,
bit ne
)={
    u_0_16 * f_0_low60_0_low20_0 + v_0_16 * g_0_low60_0_low20_0 = f_0_low60_0_low20_16 * (-(2**20)),
    r_0_16 * f_0_low60_0_low20_0 + s_0_16 * g_0_low60_0_low20_0 = g_0_low60_0_low20_16 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_16 + u_0_16 * (const 64 (2**21)) + v_0_16 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_16 + r_0_16 * (const 64 (2**21)) + s_0_16 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_16,
    f_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_16,
    g_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 16)) <=s delta, delta <=s (const 64 (1 + 2*16)),
    (const 64 (-(2**20))) <=s u_0_16, u_0_16 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_16, v_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)) )),
    (const 64 ((2**(20-16))-(2**20))) <=s r_0_16, r_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**20))) <=s s_0_16, s_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**19))) <=s (r_0_16 - u_0_16), (r_0_16 - u_0_16) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_16 - v_0_16), (s_0_16 - v_0_16) <=s (const 64 ((2**20) - (2**(20 - 16)))),
    u_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_0_16 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise b
assume
    g_0_low60_0_low20_16 = 1 (mod 2)
&&
    g_0_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_17 f_0_low60_0_low20_16;
mov u_0_17 u_0_16;
mov v_0_17 v_0_16;

add g_0_low60_0_low20_17 g_0_low60_0_low20_16 f_0_low60_0_low20_16;
asr g_0_low60_0_low20_17 g_0_low60_0_low20_17 1;
add r_0_17 r_0_16 u_0_16;
asr r_0_17 r_0_17 1;
add s_0_17 s_0_16 v_0_16;
asr s_0_17 s_0_17 1;
assert
    true
&&
    f_0_low60_0_low20_17 = f_0_low60_0_low20_16,
    u_0_17 = u_0_16,
    v_0_17 = v_0_16,
    g_0_low60_0_low20_17 * (const 64 2) = g_0_low60_0_low20_16 + f_0_low60_0_low20_16,
    r_0_17 * (const 64 2) = r_0_16 + u_0_16,
    s_0_17 * (const 64 2) = s_0_16 + v_0_16
;

assume
    f_0_low60_0_low20_17 = f_0_low60_0_low20_16,
    u_0_17 = u_0_16,
    v_0_17 = v_0_16,
    g_0_low60_0_low20_17 * 2 = g_0_low60_0_low20_16 + f_0_low60_0_low20_16,
    r_0_17 * 2 = r_0_16 + u_0_16,
    s_0_17 * 2 = s_0_16 + v_0_16
&&
    true
;

{
    u_0_17 * f_0_low60_0_low20_0 + v_0_17 * g_0_low60_0_low20_0 = f_0_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_17 * f_0_low60_0_low20_0 + s_0_17 * g_0_low60_0_low20_0 = g_0_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_17 + u_0_17 * (const 64 (2**21)) + v_0_17 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_17 + r_0_17 * (const 64 (2**21)) + s_0_17 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_17,
    f_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_17,
    g_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 17)) <=s delta, delta <=s (const 64 (1 + 2*17)),
    (const 64 (-(2**20))) <=s u_0_17, u_0_17 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_17, v_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)) )),
    (const 64 ((2**(20-17))-(2**20))) <=s r_0_17, r_0_17 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-17))-(2**20))) <=s s_0_17, s_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**19))) <=s (r_0_17 - u_0_17), (r_0_17 - u_0_17) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_17 - v_0_17), (s_0_17 - v_0_17) <=s (const 64 ((2**20) - (2**(20 - 17)))),
    u_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_0_17 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_16_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_16,
sint64 g_0_low60_0_low20_16,
sint64 f_0_low60_0_low20_17,
sint64 g_0_low60_0_low20_17,
sint64 u_0_16,
sint64 v_0_16,
sint64 r_0_16,
sint64 s_0_16,
sint64 u_0_17,
sint64 v_0_17,
sint64 r_0_17,
sint64 s_0_17,
bit ne
)={
    u_0_16 * f_0_low60_0_low20_0 + v_0_16 * g_0_low60_0_low20_0 = f_0_low60_0_low20_16 * (-(2**20)),
    r_0_16 * f_0_low60_0_low20_0 + s_0_16 * g_0_low60_0_low20_0 = g_0_low60_0_low20_16 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_16 + u_0_16 * (const 64 (2**21)) + v_0_16 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_16 + r_0_16 * (const 64 (2**21)) + s_0_16 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_16,
    f_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_16,
    g_0_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 16)) <=s delta, delta <=s (const 64 (1 + 2*16)),
    (const 64 (-(2**20))) <=s u_0_16, u_0_16 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_16, v_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)) )),
    (const 64 ((2**(20-16))-(2**20))) <=s r_0_16, r_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**20))) <=s s_0_16, s_0_16 <=s (const 64 ((2**19) - (2**(20 - 16)))),
    (const 64 ((2**(20-16))-(2**19))) <=s (r_0_16 - u_0_16), (r_0_16 - u_0_16) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_16 - v_0_16), (s_0_16 - v_0_16) <=s (const 64 ((2**20) - (2**(20 - 16)))),
    u_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_0_16 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_0_16 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step16

// premise c
assume
    g_0_low60_0_low20_16 = 1 (mod 2)
&&
    g_0_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_17 g_0_low60_0_low20_16;
mov u_0_17 r_0_16;
mov v_0_17 s_0_16;

subs dc g_0_low60_0_low20_17 g_0_low60_0_low20_16 f_0_low60_0_low20_16;
asr g_0_low60_0_low20_17 g_0_low60_0_low20_17 1;
subs dc r_0_17 r_0_16 u_0_16;
asr r_0_17 r_0_17 1;
subs dc s_0_17 s_0_16 v_0_16;
asr s_0_17 s_0_17 1;
assert
    true
&&
    f_0_low60_0_low20_17 = g_0_low60_0_low20_16,
    u_0_17 = r_0_16,
    v_0_17 = s_0_16,
    g_0_low60_0_low20_17 * (const 64 2) = g_0_low60_0_low20_16 - f_0_low60_0_low20_16,
    r_0_17 * (const 64 2) = r_0_16 - u_0_16,
    s_0_17 * (const 64 2) = s_0_16 - v_0_16
;

assume
    f_0_low60_0_low20_17 = g_0_low60_0_low20_16,
    u_0_17 = r_0_16,
    v_0_17 = s_0_16,
    g_0_low60_0_low20_17 * 2 = g_0_low60_0_low20_16 - f_0_low60_0_low20_16,
    r_0_17 * 2 = r_0_16 - u_0_16,
    s_0_17 * 2 = s_0_16 - v_0_16
&&
    true
;

{
    u_0_17 * f_0_low60_0_low20_0 + v_0_17 * g_0_low60_0_low20_0 = f_0_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_17 * f_0_low60_0_low20_0 + s_0_17 * g_0_low60_0_low20_0 = g_0_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_17 + u_0_17 * (const 64 (2**21)) + v_0_17 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_17 + r_0_17 * (const 64 (2**21)) + s_0_17 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_17,
    f_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_17,
    g_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 17)) <=s delta, delta <=s (const 64 (1 + 2*17)),
    (const 64 (-(2**20))) <=s u_0_17, u_0_17 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_17, v_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)) )),
    (const 64 ((2**(20-17))-(2**20))) <=s r_0_17, r_0_17 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-17))-(2**20))) <=s s_0_17, s_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**19))) <=s (r_0_17 - u_0_17), (r_0_17 - u_0_17) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_17 - v_0_17), (s_0_17 - v_0_17) <=s (const 64 ((2**20) - (2**(20 - 17)))),
    u_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_0_17 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_17_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_17,
sint64 g_0_low60_0_low20_17,
sint64 f_0_low60_0_low20_18,
sint64 g_0_low60_0_low20_18,
sint64 u_0_17,
sint64 v_0_17,
sint64 r_0_17,
sint64 s_0_17,
sint64 u_0_18,
sint64 v_0_18,
sint64 r_0_18,
sint64 s_0_18,
bit ne
)={
    u_0_17 * f_0_low60_0_low20_0 + v_0_17 * g_0_low60_0_low20_0 = f_0_low60_0_low20_17 * (-(2**20)),
    r_0_17 * f_0_low60_0_low20_0 + s_0_17 * g_0_low60_0_low20_0 = g_0_low60_0_low20_17 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_17 + u_0_17 * (const 64 (2**21)) + v_0_17 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_17 + r_0_17 * (const 64 (2**21)) + s_0_17 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_17,
    f_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_17,
    g_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 17)) <=s delta, delta <=s (const 64 (1 + 2*17)),
    (const 64 (-(2**20))) <=s u_0_17, u_0_17 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_17, v_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)) )),
    (const 64 ((2**(20-17))-(2**20))) <=s r_0_17, r_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**20))) <=s s_0_17, s_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**19))) <=s (r_0_17 - u_0_17), (r_0_17 - u_0_17) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_17 - v_0_17), (s_0_17 - v_0_17) <=s (const 64 ((2**20) - (2**(20 - 17)))),
    u_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_0_17 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step17

// premise a
assume
    g_0_low60_0_low20_17 = 0 (mod 2)
&&
    g_0_low60_0_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_18 f_0_low60_0_low20_17;
mov u_0_18 u_0_17;
mov v_0_18 v_0_17;

asr g_0_low60_0_low20_18 g_0_low60_0_low20_17 1;
asr r_0_18 r_0_17 1;
asr s_0_18 s_0_17 1;
assert
    true
&&
    f_0_low60_0_low20_18 = f_0_low60_0_low20_17,
    u_0_18 = u_0_17,
    v_0_18 = v_0_17,
    g_0_low60_0_low20_18 * (const 64 2) = g_0_low60_0_low20_17,
    r_0_18 * (const 64 2) = r_0_17,
    s_0_18 * (const 64 2) = s_0_17
;

assume
    f_0_low60_0_low20_18 = f_0_low60_0_low20_17,
    u_0_18 = u_0_17,
    v_0_18 = v_0_17,
    g_0_low60_0_low20_18 * 2 = g_0_low60_0_low20_17,
    r_0_18 * 2 = r_0_17,
    s_0_18 * 2 = s_0_17
&&
    true
;

{
    u_0_18 * f_0_low60_0_low20_0 + v_0_18 * g_0_low60_0_low20_0 = f_0_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_18 * f_0_low60_0_low20_0 + s_0_18 * g_0_low60_0_low20_0 = g_0_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_18 + u_0_18 * (const 64 (2**21)) + v_0_18 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_18 + r_0_18 * (const 64 (2**21)) + s_0_18 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_18,
    f_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_18,
    g_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 18)) <=s delta, delta <=s (const 64 (1 + 2*18)),
    (const 64 (-(2**20))) <=s u_0_18, u_0_18 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_18, v_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)) )),
    (const 64 ((2**(20-18))-(2**20))) <=s r_0_18, r_0_18 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-18))-(2**20))) <=s s_0_18, s_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**19))) <=s (r_0_18 - u_0_18), (r_0_18 - u_0_18) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_18 - v_0_18), (s_0_18 - v_0_18) <=s (const 64 ((2**20) - (2**(20 - 18)))),
    u_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_0_18 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_17_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_17,
sint64 g_0_low60_0_low20_17,
sint64 f_0_low60_0_low20_18,
sint64 g_0_low60_0_low20_18,
sint64 u_0_17,
sint64 v_0_17,
sint64 r_0_17,
sint64 s_0_17,
sint64 u_0_18,
sint64 v_0_18,
sint64 r_0_18,
sint64 s_0_18,
bit ne
)={
    u_0_17 * f_0_low60_0_low20_0 + v_0_17 * g_0_low60_0_low20_0 = f_0_low60_0_low20_17 * (-(2**20)),
    r_0_17 * f_0_low60_0_low20_0 + s_0_17 * g_0_low60_0_low20_0 = g_0_low60_0_low20_17 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_17 + u_0_17 * (const 64 (2**21)) + v_0_17 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_17 + r_0_17 * (const 64 (2**21)) + s_0_17 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_17,
    f_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_17,
    g_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 17)) <=s delta, delta <=s (const 64 (1 + 2*17)),
    (const 64 (-(2**20))) <=s u_0_17, u_0_17 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_17, v_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)) )),
    (const 64 ((2**(20-17))-(2**20))) <=s r_0_17, r_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**20))) <=s s_0_17, s_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**19))) <=s (r_0_17 - u_0_17), (r_0_17 - u_0_17) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_17 - v_0_17), (s_0_17 - v_0_17) <=s (const 64 ((2**20) - (2**(20 - 17)))),
    u_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_0_17 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step17

// premise b
assume
    g_0_low60_0_low20_17 = 1 (mod 2)
&&
    g_0_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_18 f_0_low60_0_low20_17;
mov u_0_18 u_0_17;
mov v_0_18 v_0_17;

add g_0_low60_0_low20_18 g_0_low60_0_low20_17 f_0_low60_0_low20_17;
asr g_0_low60_0_low20_18 g_0_low60_0_low20_18 1;
add r_0_18 r_0_17 u_0_17;
asr r_0_18 r_0_18 1;
add s_0_18 s_0_17 v_0_17;
asr s_0_18 s_0_18 1;
assert
    true
&&
    f_0_low60_0_low20_18 = f_0_low60_0_low20_17,
    u_0_18 = u_0_17,
    v_0_18 = v_0_17,
    g_0_low60_0_low20_18 * (const 64 2) = g_0_low60_0_low20_17 + f_0_low60_0_low20_17,
    r_0_18 * (const 64 2) = r_0_17 + u_0_17,
    s_0_18 * (const 64 2) = s_0_17 + v_0_17
;

assume
    f_0_low60_0_low20_18 = f_0_low60_0_low20_17,
    u_0_18 = u_0_17,
    v_0_18 = v_0_17,
    g_0_low60_0_low20_18 * 2 = g_0_low60_0_low20_17 + f_0_low60_0_low20_17,
    r_0_18 * 2 = r_0_17 + u_0_17,
    s_0_18 * 2 = s_0_17 + v_0_17
&&
    true
;

{
    u_0_18 * f_0_low60_0_low20_0 + v_0_18 * g_0_low60_0_low20_0 = f_0_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_18 * f_0_low60_0_low20_0 + s_0_18 * g_0_low60_0_low20_0 = g_0_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_18 + u_0_18 * (const 64 (2**21)) + v_0_18 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_18 + r_0_18 * (const 64 (2**21)) + s_0_18 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_18,
    f_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_18,
    g_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 18)) <=s delta, delta <=s (const 64 (1 + 2*18)),
    (const 64 (-(2**20))) <=s u_0_18, u_0_18 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_18, v_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)) )),
    (const 64 ((2**(20-18))-(2**20))) <=s r_0_18, r_0_18 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-18))-(2**20))) <=s s_0_18, s_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**19))) <=s (r_0_18 - u_0_18), (r_0_18 - u_0_18) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_18 - v_0_18), (s_0_18 - v_0_18) <=s (const 64 ((2**20) - (2**(20 - 18)))),
    u_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_0_18 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_17_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_17,
sint64 g_0_low60_0_low20_17,
sint64 f_0_low60_0_low20_18,
sint64 g_0_low60_0_low20_18,
sint64 u_0_17,
sint64 v_0_17,
sint64 r_0_17,
sint64 s_0_17,
sint64 u_0_18,
sint64 v_0_18,
sint64 r_0_18,
sint64 s_0_18,
bit ne
)={
    u_0_17 * f_0_low60_0_low20_0 + v_0_17 * g_0_low60_0_low20_0 = f_0_low60_0_low20_17 * (-(2**20)),
    r_0_17 * f_0_low60_0_low20_0 + s_0_17 * g_0_low60_0_low20_0 = g_0_low60_0_low20_17 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_17 + u_0_17 * (const 64 (2**21)) + v_0_17 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_17 + r_0_17 * (const 64 (2**21)) + s_0_17 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_17,
    f_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_17,
    g_0_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 17)) <=s delta, delta <=s (const 64 (1 + 2*17)),
    (const 64 (-(2**20))) <=s u_0_17, u_0_17 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_17, v_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)) )),
    (const 64 ((2**(20-17))-(2**20))) <=s r_0_17, r_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**20))) <=s s_0_17, s_0_17 <=s (const 64 ((2**19) - (2**(20 - 17)))),
    (const 64 ((2**(20-17))-(2**19))) <=s (r_0_17 - u_0_17), (r_0_17 - u_0_17) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_17 - v_0_17), (s_0_17 - v_0_17) <=s (const 64 ((2**20) - (2**(20 - 17)))),
    u_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_0_17 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_0_17 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step17

// premise c
assume
    g_0_low60_0_low20_17 = 1 (mod 2)
&&
    g_0_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_18 g_0_low60_0_low20_17;
mov u_0_18 r_0_17;
mov v_0_18 s_0_17;

subs dc g_0_low60_0_low20_18 g_0_low60_0_low20_17 f_0_low60_0_low20_17;
asr g_0_low60_0_low20_18 g_0_low60_0_low20_18 1;
subs dc r_0_18 r_0_17 u_0_17;
asr r_0_18 r_0_18 1;
subs dc s_0_18 s_0_17 v_0_17;
asr s_0_18 s_0_18 1;
assert
    true
&&
    f_0_low60_0_low20_18 = g_0_low60_0_low20_17,
    u_0_18 = r_0_17,
    v_0_18 = s_0_17,
    g_0_low60_0_low20_18 * (const 64 2) = g_0_low60_0_low20_17 - f_0_low60_0_low20_17,
    r_0_18 * (const 64 2) = r_0_17 - u_0_17,
    s_0_18 * (const 64 2) = s_0_17 - v_0_17
;

assume
    f_0_low60_0_low20_18 = g_0_low60_0_low20_17,
    u_0_18 = r_0_17,
    v_0_18 = s_0_17,
    g_0_low60_0_low20_18 * 2 = g_0_low60_0_low20_17 - f_0_low60_0_low20_17,
    r_0_18 * 2 = r_0_17 - u_0_17,
    s_0_18 * 2 = s_0_17 - v_0_17
&&
    true
;

{
    u_0_18 * f_0_low60_0_low20_0 + v_0_18 * g_0_low60_0_low20_0 = f_0_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_18 * f_0_low60_0_low20_0 + s_0_18 * g_0_low60_0_low20_0 = g_0_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_18 + u_0_18 * (const 64 (2**21)) + v_0_18 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_18 + r_0_18 * (const 64 (2**21)) + s_0_18 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_18,
    f_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_18,
    g_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 18)) <=s delta, delta <=s (const 64 (1 + 2*18)),
    (const 64 (-(2**20))) <=s u_0_18, u_0_18 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_18, v_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)) )),
    (const 64 ((2**(20-18))-(2**20))) <=s r_0_18, r_0_18 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-18))-(2**20))) <=s s_0_18, s_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**19))) <=s (r_0_18 - u_0_18), (r_0_18 - u_0_18) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_18 - v_0_18), (s_0_18 - v_0_18) <=s (const 64 ((2**20) - (2**(20 - 18)))),
    u_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_0_18 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_18_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_18,
sint64 g_0_low60_0_low20_18,
sint64 f_0_low60_0_low20_19,
sint64 g_0_low60_0_low20_19,
sint64 u_0_18,
sint64 v_0_18,
sint64 r_0_18,
sint64 s_0_18,
sint64 u_0_19,
sint64 v_0_19,
sint64 r_0_19,
sint64 s_0_19,
bit ne
)={
    u_0_18 * f_0_low60_0_low20_0 + v_0_18 * g_0_low60_0_low20_0 = f_0_low60_0_low20_18 * (-(2**20)),
    r_0_18 * f_0_low60_0_low20_0 + s_0_18 * g_0_low60_0_low20_0 = g_0_low60_0_low20_18 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_18 + u_0_18 * (const 64 (2**21)) + v_0_18 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_18 + r_0_18 * (const 64 (2**21)) + s_0_18 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_18,
    f_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_18,
    g_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 18)) <=s delta, delta <=s (const 64 (1 + 2*18)),
    (const 64 (-(2**20))) <=s u_0_18, u_0_18 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_18, v_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)) )),
    (const 64 ((2**(20-18))-(2**20))) <=s r_0_18, r_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**20))) <=s s_0_18, s_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**19))) <=s (r_0_18 - u_0_18), (r_0_18 - u_0_18) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_18 - v_0_18), (s_0_18 - v_0_18) <=s (const 64 ((2**20) - (2**(20 - 18)))),
    u_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_0_18 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step18

// premise a
assume
    g_0_low60_0_low20_18 = 0 (mod 2)
&&
    g_0_low60_0_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_19 f_0_low60_0_low20_18;
mov u_0_19 u_0_18;
mov v_0_19 v_0_18;

asr g_0_low60_0_low20_19 g_0_low60_0_low20_18 1;
asr r_0_19 r_0_18 1;
asr s_0_19 s_0_18 1;
assert
    true
&&
    f_0_low60_0_low20_19 = f_0_low60_0_low20_18,
    u_0_19 = u_0_18,
    v_0_19 = v_0_18,
    g_0_low60_0_low20_19 * (const 64 2) = g_0_low60_0_low20_18,
    r_0_19 * (const 64 2) = r_0_18,
    s_0_19 * (const 64 2) = s_0_18
;

assume
    f_0_low60_0_low20_19 = f_0_low60_0_low20_18,
    u_0_19 = u_0_18,
    v_0_19 = v_0_18,
    g_0_low60_0_low20_19 * 2 = g_0_low60_0_low20_18,
    r_0_19 * 2 = r_0_18,
    s_0_19 * 2 = s_0_18
&&
    true
;

{
    u_0_19 * f_0_low60_0_low20_0 + v_0_19 * g_0_low60_0_low20_0 = f_0_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_19 * f_0_low60_0_low20_0 + s_0_19 * g_0_low60_0_low20_0 = g_0_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_19 + u_0_19 * (const 64 (2**21)) + v_0_19 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_19 + r_0_19 * (const 64 (2**21)) + s_0_19 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_19,
    f_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_19,
    g_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 19)) <=s delta, delta <=s (const 64 (1 + 2*19)),
    (const 64 (-(2**20))) <=s u_0_19, u_0_19 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_19, v_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)) )),
    (const 64 ((2**(20-19))-(2**20))) <=s r_0_19, r_0_19 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-19))-(2**20))) <=s s_0_19, s_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**19))) <=s (r_0_19 - u_0_19), (r_0_19 - u_0_19) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_19 - v_0_19), (s_0_19 - v_0_19) <=s (const 64 ((2**20) - (2**(20 - 19)))),
    u_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_0_19 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_18_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_18,
sint64 g_0_low60_0_low20_18,
sint64 f_0_low60_0_low20_19,
sint64 g_0_low60_0_low20_19,
sint64 u_0_18,
sint64 v_0_18,
sint64 r_0_18,
sint64 s_0_18,
sint64 u_0_19,
sint64 v_0_19,
sint64 r_0_19,
sint64 s_0_19,
bit ne
)={
    u_0_18 * f_0_low60_0_low20_0 + v_0_18 * g_0_low60_0_low20_0 = f_0_low60_0_low20_18 * (-(2**20)),
    r_0_18 * f_0_low60_0_low20_0 + s_0_18 * g_0_low60_0_low20_0 = g_0_low60_0_low20_18 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_18 + u_0_18 * (const 64 (2**21)) + v_0_18 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_18 + r_0_18 * (const 64 (2**21)) + s_0_18 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_18,
    f_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_18,
    g_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 18)) <=s delta, delta <=s (const 64 (1 + 2*18)),
    (const 64 (-(2**20))) <=s u_0_18, u_0_18 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_18, v_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)) )),
    (const 64 ((2**(20-18))-(2**20))) <=s r_0_18, r_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**20))) <=s s_0_18, s_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**19))) <=s (r_0_18 - u_0_18), (r_0_18 - u_0_18) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_18 - v_0_18), (s_0_18 - v_0_18) <=s (const 64 ((2**20) - (2**(20 - 18)))),
    u_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_0_18 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step18

// premise b
assume
    g_0_low60_0_low20_18 = 1 (mod 2)
&&
    g_0_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_19 f_0_low60_0_low20_18;
mov u_0_19 u_0_18;
mov v_0_19 v_0_18;

add g_0_low60_0_low20_19 g_0_low60_0_low20_18 f_0_low60_0_low20_18;
asr g_0_low60_0_low20_19 g_0_low60_0_low20_19 1;
add r_0_19 r_0_18 u_0_18;
asr r_0_19 r_0_19 1;
add s_0_19 s_0_18 v_0_18;
asr s_0_19 s_0_19 1;
assert
    true
&&
    f_0_low60_0_low20_19 = f_0_low60_0_low20_18,
    u_0_19 = u_0_18,
    v_0_19 = v_0_18,
    g_0_low60_0_low20_19 * (const 64 2) = g_0_low60_0_low20_18 + f_0_low60_0_low20_18,
    r_0_19 * (const 64 2) = r_0_18 + u_0_18,
    s_0_19 * (const 64 2) = s_0_18 + v_0_18
;

assume
    f_0_low60_0_low20_19 = f_0_low60_0_low20_18,
    u_0_19 = u_0_18,
    v_0_19 = v_0_18,
    g_0_low60_0_low20_19 * 2 = g_0_low60_0_low20_18 + f_0_low60_0_low20_18,
    r_0_19 * 2 = r_0_18 + u_0_18,
    s_0_19 * 2 = s_0_18 + v_0_18
&&
    true
;

{
    u_0_19 * f_0_low60_0_low20_0 + v_0_19 * g_0_low60_0_low20_0 = f_0_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_19 * f_0_low60_0_low20_0 + s_0_19 * g_0_low60_0_low20_0 = g_0_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_19 + u_0_19 * (const 64 (2**21)) + v_0_19 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_19 + r_0_19 * (const 64 (2**21)) + s_0_19 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_19,
    f_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_19,
    g_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 19)) <=s delta, delta <=s (const 64 (1 + 2*19)),
    (const 64 (-(2**20))) <=s u_0_19, u_0_19 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_19, v_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)) )),
    (const 64 ((2**(20-19))-(2**20))) <=s r_0_19, r_0_19 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-19))-(2**20))) <=s s_0_19, s_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**19))) <=s (r_0_19 - u_0_19), (r_0_19 - u_0_19) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_19 - v_0_19), (s_0_19 - v_0_19) <=s (const 64 ((2**20) - (2**(20 - 19)))),
    u_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_0_19 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_18_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_18,
sint64 g_0_low60_0_low20_18,
sint64 f_0_low60_0_low20_19,
sint64 g_0_low60_0_low20_19,
sint64 u_0_18,
sint64 v_0_18,
sint64 r_0_18,
sint64 s_0_18,
sint64 u_0_19,
sint64 v_0_19,
sint64 r_0_19,
sint64 s_0_19,
bit ne
)={
    u_0_18 * f_0_low60_0_low20_0 + v_0_18 * g_0_low60_0_low20_0 = f_0_low60_0_low20_18 * (-(2**20)),
    r_0_18 * f_0_low60_0_low20_0 + s_0_18 * g_0_low60_0_low20_0 = g_0_low60_0_low20_18 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_18 + u_0_18 * (const 64 (2**21)) + v_0_18 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_18 + r_0_18 * (const 64 (2**21)) + s_0_18 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_18,
    f_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_18,
    g_0_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 18)) <=s delta, delta <=s (const 64 (1 + 2*18)),
    (const 64 (-(2**20))) <=s u_0_18, u_0_18 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_18, v_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)) )),
    (const 64 ((2**(20-18))-(2**20))) <=s r_0_18, r_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**20))) <=s s_0_18, s_0_18 <=s (const 64 ((2**19) - (2**(20 - 18)))),
    (const 64 ((2**(20-18))-(2**19))) <=s (r_0_18 - u_0_18), (r_0_18 - u_0_18) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_18 - v_0_18), (s_0_18 - v_0_18) <=s (const 64 ((2**20) - (2**(20 - 18)))),
    u_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_0_18 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_0_18 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step18

// premise c
assume
    g_0_low60_0_low20_18 = 1 (mod 2)
&&
    g_0_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_19 g_0_low60_0_low20_18;
mov u_0_19 r_0_18;
mov v_0_19 s_0_18;

subs dc g_0_low60_0_low20_19 g_0_low60_0_low20_18 f_0_low60_0_low20_18;
asr g_0_low60_0_low20_19 g_0_low60_0_low20_19 1;
subs dc r_0_19 r_0_18 u_0_18;
asr r_0_19 r_0_19 1;
subs dc s_0_19 s_0_18 v_0_18;
asr s_0_19 s_0_19 1;
assert
    true
&&
    f_0_low60_0_low20_19 = g_0_low60_0_low20_18,
    u_0_19 = r_0_18,
    v_0_19 = s_0_18,
    g_0_low60_0_low20_19 * (const 64 2) = g_0_low60_0_low20_18 - f_0_low60_0_low20_18,
    r_0_19 * (const 64 2) = r_0_18 - u_0_18,
    s_0_19 * (const 64 2) = s_0_18 - v_0_18
;

assume
    f_0_low60_0_low20_19 = g_0_low60_0_low20_18,
    u_0_19 = r_0_18,
    v_0_19 = s_0_18,
    g_0_low60_0_low20_19 * 2 = g_0_low60_0_low20_18 - f_0_low60_0_low20_18,
    r_0_19 * 2 = r_0_18 - u_0_18,
    s_0_19 * 2 = s_0_18 - v_0_18
&&
    true
;

{
    u_0_19 * f_0_low60_0_low20_0 + v_0_19 * g_0_low60_0_low20_0 = f_0_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_19 * f_0_low60_0_low20_0 + s_0_19 * g_0_low60_0_low20_0 = g_0_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_19 + u_0_19 * (const 64 (2**21)) + v_0_19 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_19 + r_0_19 * (const 64 (2**21)) + s_0_19 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_19,
    f_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_19,
    g_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 19)) <=s delta, delta <=s (const 64 (1 + 2*19)),
    (const 64 (-(2**20))) <=s u_0_19, u_0_19 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_19, v_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)) )),
    (const 64 ((2**(20-19))-(2**20))) <=s r_0_19, r_0_19 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-19))-(2**20))) <=s s_0_19, s_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**19))) <=s (r_0_19 - u_0_19), (r_0_19 - u_0_19) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_19 - v_0_19), (s_0_19 - v_0_19) <=s (const 64 ((2**20) - (2**(20 - 19)))),
    u_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_0_19 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_19_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_19,
sint64 g_0_low60_0_low20_19,
sint64 f_0_low60_0_low20_20,
sint64 g_0_low60_0_low20_20,
sint64 u_0_19,
sint64 v_0_19,
sint64 r_0_19,
sint64 s_0_19,
sint64 u_0_20,
sint64 v_0_20,
sint64 r_0_20,
sint64 s_0_20,
bit ne
)={
    u_0_19 * f_0_low60_0_low20_0 + v_0_19 * g_0_low60_0_low20_0 = f_0_low60_0_low20_19 * (-(2**20)),
    r_0_19 * f_0_low60_0_low20_0 + s_0_19 * g_0_low60_0_low20_0 = g_0_low60_0_low20_19 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_19 + u_0_19 * (const 64 (2**21)) + v_0_19 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_19 + r_0_19 * (const 64 (2**21)) + s_0_19 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_19,
    f_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_19,
    g_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 19)) <=s delta, delta <=s (const 64 (1 + 2*19)),
    (const 64 (-(2**20))) <=s u_0_19, u_0_19 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_19, v_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)) )),
    (const 64 ((2**(20-19))-(2**20))) <=s r_0_19, r_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**20))) <=s s_0_19, s_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**19))) <=s (r_0_19 - u_0_19), (r_0_19 - u_0_19) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_19 - v_0_19), (s_0_19 - v_0_19) <=s (const 64 ((2**20) - (2**(20 - 19)))),
    u_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_0_19 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step19

// premise a
assume
    g_0_low60_0_low20_19 = 0 (mod 2)
&&
    g_0_low60_0_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov f_0_low60_0_low20_20 f_0_low60_0_low20_19;
mov u_0_20 u_0_19;
mov v_0_20 v_0_19;

asr g_0_low60_0_low20_20 g_0_low60_0_low20_19 1;
asr r_0_20 r_0_19 1;
asr s_0_20 s_0_19 1;
assert
    true
&&
    f_0_low60_0_low20_20 = f_0_low60_0_low20_19,
    u_0_20 = u_0_19,
    v_0_20 = v_0_19,
    g_0_low60_0_low20_20 * (const 64 2) = g_0_low60_0_low20_19,
    r_0_20 * (const 64 2) = r_0_19,
    s_0_20 * (const 64 2) = s_0_19
;

assume
    f_0_low60_0_low20_20 = f_0_low60_0_low20_19,
    u_0_20 = u_0_19,
    v_0_20 = v_0_19,
    g_0_low60_0_low20_20 * 2 = g_0_low60_0_low20_19,
    r_0_20 * 2 = r_0_19,
    s_0_20 * 2 = s_0_19
&&
    true
;

{
    u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 20)) <=s delta, delta <=s (const 64 (1 + 2*20)),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**19) - (2**(20 - 20)) )),
    (const 64 ((2**(20-20))-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-20))-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**19) - (2**(20 - 20)))),
    (const 64 ((2**(20-20))-(2**19))) <=s (r_0_20 - u_0_20), (r_0_20 - u_0_20) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_20 - v_0_20), (s_0_20 - v_0_20) <=s (const 64 ((2**20) - (2**(20 - 20)))),
    u_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_0_20 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_19_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_19,
sint64 g_0_low60_0_low20_19,
sint64 f_0_low60_0_low20_20,
sint64 g_0_low60_0_low20_20,
sint64 u_0_19,
sint64 v_0_19,
sint64 r_0_19,
sint64 s_0_19,
sint64 u_0_20,
sint64 v_0_20,
sint64 r_0_20,
sint64 s_0_20,
bit ne
)={
    u_0_19 * f_0_low60_0_low20_0 + v_0_19 * g_0_low60_0_low20_0 = f_0_low60_0_low20_19 * (-(2**20)),
    r_0_19 * f_0_low60_0_low20_0 + s_0_19 * g_0_low60_0_low20_0 = g_0_low60_0_low20_19 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_19 + u_0_19 * (const 64 (2**21)) + v_0_19 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_19 + r_0_19 * (const 64 (2**21)) + s_0_19 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_19,
    f_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_19,
    g_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 19)) <=s delta, delta <=s (const 64 (1 + 2*19)),
    (const 64 (-(2**20))) <=s u_0_19, u_0_19 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_19, v_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)) )),
    (const 64 ((2**(20-19))-(2**20))) <=s r_0_19, r_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**20))) <=s s_0_19, s_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**19))) <=s (r_0_19 - u_0_19), (r_0_19 - u_0_19) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_19 - v_0_19), (s_0_19 - v_0_19) <=s (const 64 ((2**20) - (2**(20 - 19)))),
    u_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_0_19 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step19

// premise b
assume
    g_0_low60_0_low20_19 = 1 (mod 2)
&&
    g_0_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_20 f_0_low60_0_low20_19;
mov u_0_20 u_0_19;
mov v_0_20 v_0_19;

add g_0_low60_0_low20_20 g_0_low60_0_low20_19 f_0_low60_0_low20_19;
asr g_0_low60_0_low20_20 g_0_low60_0_low20_20 1;
add r_0_20 r_0_19 u_0_19;
asr r_0_20 r_0_20 1;
add s_0_20 s_0_19 v_0_19;
asr s_0_20 s_0_20 1;
assert
    true
&&
    f_0_low60_0_low20_20 = f_0_low60_0_low20_19,
    u_0_20 = u_0_19,
    v_0_20 = v_0_19,
    g_0_low60_0_low20_20 * (const 64 2) = g_0_low60_0_low20_19 + f_0_low60_0_low20_19,
    r_0_20 * (const 64 2) = r_0_19 + u_0_19,
    s_0_20 * (const 64 2) = s_0_19 + v_0_19
;

assume
    f_0_low60_0_low20_20 = f_0_low60_0_low20_19,
    u_0_20 = u_0_19,
    v_0_20 = v_0_19,
    g_0_low60_0_low20_20 * 2 = g_0_low60_0_low20_19 + f_0_low60_0_low20_19,
    r_0_20 * 2 = r_0_19 + u_0_19,
    s_0_20 * 2 = s_0_19 + v_0_19
&&
    true
;

{
    u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 20)) <=s delta, delta <=s (const 64 (1 + 2*20)),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**19) - (2**(20 - 20)) )),
    (const 64 ((2**(20-20))-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-20))-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**19) - (2**(20 - 20)))),
    (const 64 ((2**(20-20))-(2**19))) <=s (r_0_20 - u_0_20), (r_0_20 - u_0_20) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_20 - v_0_20), (s_0_20 - v_0_20) <=s (const 64 ((2**20) - (2**(20 - 20)))),
    u_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_0_20 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_19_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_19,
sint64 g_0_low60_0_low20_19,
sint64 f_0_low60_0_low20_20,
sint64 g_0_low60_0_low20_20,
sint64 u_0_19,
sint64 v_0_19,
sint64 r_0_19,
sint64 s_0_19,
sint64 u_0_20,
sint64 v_0_20,
sint64 r_0_20,
sint64 s_0_20,
bit ne
)={
    u_0_19 * f_0_low60_0_low20_0 + v_0_19 * g_0_low60_0_low20_0 = f_0_low60_0_low20_19 * (-(2**20)),
    r_0_19 * f_0_low60_0_low20_0 + s_0_19 * g_0_low60_0_low20_0 = g_0_low60_0_low20_19 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_19 + u_0_19 * (const 64 (2**21)) + v_0_19 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_19 + r_0_19 * (const 64 (2**21)) + s_0_19 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_19,
    f_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_19,
    g_0_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 19)) <=s delta, delta <=s (const 64 (1 + 2*19)),
    (const 64 (-(2**20))) <=s u_0_19, u_0_19 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_19, v_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)) )),
    (const 64 ((2**(20-19))-(2**20))) <=s r_0_19, r_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**20))) <=s s_0_19, s_0_19 <=s (const 64 ((2**19) - (2**(20 - 19)))),
    (const 64 ((2**(20-19))-(2**19))) <=s (r_0_19 - u_0_19), (r_0_19 - u_0_19) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_19 - v_0_19), (s_0_19 - v_0_19) <=s (const 64 ((2**20) - (2**(20 - 19)))),
    u_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_0_19 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_0_19 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step19

// premise c
assume
    g_0_low60_0_low20_19 = 1 (mod 2)
&&
    g_0_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_20 g_0_low60_0_low20_19;
mov u_0_20 r_0_19;
mov v_0_20 s_0_19;

subs dc g_0_low60_0_low20_20 g_0_low60_0_low20_19 f_0_low60_0_low20_19;
asr g_0_low60_0_low20_20 g_0_low60_0_low20_20 1;
subs dc r_0_20 r_0_19 u_0_19;
asr r_0_20 r_0_20 1;
subs dc s_0_20 s_0_19 v_0_19;
asr s_0_20 s_0_20 1;
assert
    true
&&
    f_0_low60_0_low20_20 = g_0_low60_0_low20_19,
    u_0_20 = r_0_19,
    v_0_20 = s_0_19,
    g_0_low60_0_low20_20 * (const 64 2) = g_0_low60_0_low20_19 - f_0_low60_0_low20_19,
    r_0_20 * (const 64 2) = r_0_19 - u_0_19,
    s_0_20 * (const 64 2) = s_0_19 - v_0_19
;

assume
    f_0_low60_0_low20_20 = g_0_low60_0_low20_19,
    u_0_20 = r_0_19,
    v_0_20 = s_0_19,
    g_0_low60_0_low20_20 * 2 = g_0_low60_0_low20_19 - f_0_low60_0_low20_19,
    r_0_20 * 2 = r_0_19 - u_0_19,
    s_0_20 * 2 = s_0_19 - v_0_19
&&
    true
;

{
    u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 20)) <=s delta, delta <=s (const 64 (1 + 2*20)),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**19) - (2**(20 - 20)) )),
    (const 64 ((2**(20-20))-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-20))-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**19) - (2**(20 - 20)))),
    (const 64 ((2**(20-20))-(2**19))) <=s (r_0_20 - u_0_20), (r_0_20 - u_0_20) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_20 - v_0_20), (s_0_20 - v_0_20) <=s (const 64 ((2**20) - (2**(20 - 20)))),
    u_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_0_20 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_0_20 = (const 64 0) (mod (const 64 (2**(20-20))))
}

