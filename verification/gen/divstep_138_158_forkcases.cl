proc divstep_138_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_1,
sint64 neg_g_118_low60_20_low20_1,
sint64 u_138_138,
sint64 v_138_138,
sint64 r_138_138,
sint64 s_138_138,
sint64 u_138_139,
sint64 v_138_139,
sint64 r_138_139,
sint64 s_138_139,
bit ne
)={
    u_138_138 * neg_f_118_low60_20_low20_0 + v_138_138 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_0 * (-(2**20)),
    r_138_138 * neg_f_118_low60_20_low20_0 + s_138_138 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_0 * (-(2**20))
&&
    u_138_138 * neg_f_118_low60_20_low20_0 + v_138_138 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_0 * (const 64 (-(2**20))),
    r_138_138 * neg_f_118_low60_20_low20_0 + s_138_138 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_0 + u_138_138 * (const 64 (2**21)) + v_138_138 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_0 + r_138_138 * (const 64 (2**21)) + s_138_138 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 138)) <=s delta, delta <=s (const 64 (1 + 2*138)),
    u_138_138 = (const 64 (-(2**20))),
    v_138_138 = (const 64 (0)),
    r_138_138 = (const 64 (0)),
    s_138_138 = (const 64 (-(2**20)))
}



// divsteps
// step138

// premise a
assume
neg_g_118_low60_20_low20_0 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_118_low60_20_low20_1 neg_f_118_low60_20_low20_0;
mov u_138_139 u_138_138;
mov v_138_139 v_138_138;

asr neg_g_118_low60_20_low20_1 neg_g_118_low60_20_low20_0 1;
asr r_138_139 r_138_138 1;
asr s_138_139 s_138_138 1;
assert
    true
&&
    neg_f_118_low60_20_low20_1 = neg_f_118_low60_20_low20_0,
    u_138_139 = u_138_138,
    v_138_139 = v_138_138,
    neg_g_118_low60_20_low20_1 * (const 64 2) = neg_g_118_low60_20_low20_0,
    r_138_139 * (const 64 2) = r_138_138,
    s_138_139 * (const 64 2) = s_138_138
;

assume
    neg_f_118_low60_20_low20_1 = neg_f_118_low60_20_low20_0,
    u_138_139 = u_138_138,
    v_138_139 = v_138_138,
    neg_g_118_low60_20_low20_1 * 2 = neg_g_118_low60_20_low20_0,
    r_138_139 * 2 = r_138_138,
    s_138_139 * 2 = s_138_138
&&
    true
;

{
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_1 + u_138_139 * (const 64 (2**21)) + v_138_139 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_1 + r_138_139 * (const 64 (2**21)) + s_138_139 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_1,
    neg_f_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_1,
    neg_g_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 139)) <=s delta, delta <=s (const 64 (1 + 2*139)),
    (const 64 (-(2**20))) <=s u_138_139, u_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_139, v_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_139, r_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_139, s_138_139 <=s (const 64 ((2**20))),
    u_138_139 + v_138_139 <=s (const 64 (2**20)),
    u_138_139 - v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 + v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 - v_138_139 <=s (const 64 (2**20)),
    r_138_139 + s_138_139 <=s (const 64 (2**20)),
    r_138_139 - s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 + s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 - s_138_139 <=s (const 64 (2**20)),
    u_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_138_139 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_138_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_1,
sint64 neg_g_118_low60_20_low20_1,
sint64 u_138_138,
sint64 v_138_138,
sint64 r_138_138,
sint64 s_138_138,
sint64 u_138_139,
sint64 v_138_139,
sint64 r_138_139,
sint64 s_138_139,
bit ne
)={
    u_138_138 * neg_f_118_low60_20_low20_0 + v_138_138 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_0 * (-(2**20)),
    r_138_138 * neg_f_118_low60_20_low20_0 + s_138_138 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_0 * (-(2**20))
&&
    u_138_138 * neg_f_118_low60_20_low20_0 + v_138_138 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_0 * (const 64 (-(2**20))),
    r_138_138 * neg_f_118_low60_20_low20_0 + s_138_138 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_0 + u_138_138 * (const 64 (2**21)) + v_138_138 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_0 + r_138_138 * (const 64 (2**21)) + s_138_138 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 138)) <=s delta, delta <=s (const 64 (1 + 2*138)),
    u_138_138 = (const 64 (-(2**20))),
    v_138_138 = (const 64 (0)),
    r_138_138 = (const 64 (0)),
    s_138_138 = (const 64 (-(2**20)))
}



// divsteps
// step138

// premise b
assume
neg_g_118_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_1 neg_f_118_low60_20_low20_0;
mov u_138_139 u_138_138;
mov v_138_139 v_138_138;

add neg_g_118_low60_20_low20_1 neg_g_118_low60_20_low20_0 neg_f_118_low60_20_low20_0;
asr neg_g_118_low60_20_low20_1 neg_g_118_low60_20_low20_1 1;
add r_138_139 r_138_138 u_138_138;
asr r_138_139 r_138_139 1;
add s_138_139 s_138_138 v_138_138;
asr s_138_139 s_138_139 1;
assert
    true
&&
    neg_f_118_low60_20_low20_1 = neg_f_118_low60_20_low20_0,
    u_138_139 = u_138_138,
    v_138_139 = v_138_138,
    neg_g_118_low60_20_low20_1 * (const 64 2) = neg_g_118_low60_20_low20_0 + neg_f_118_low60_20_low20_0,
    r_138_139 * (const 64 2) = r_138_138 + u_138_138,
    s_138_139 * (const 64 2) = s_138_138 + v_138_138
;

assume
    neg_f_118_low60_20_low20_1 = neg_f_118_low60_20_low20_0,
    u_138_139 = u_138_138,
    v_138_139 = v_138_138,
    neg_g_118_low60_20_low20_1 * 2 = neg_g_118_low60_20_low20_0 + neg_f_118_low60_20_low20_0,
    r_138_139 * 2 = r_138_138 + u_138_138,
    s_138_139 * 2 = s_138_138 + v_138_138
&&
    true
;

{
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_1 + u_138_139 * (const 64 (2**21)) + v_138_139 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_1 + r_138_139 * (const 64 (2**21)) + s_138_139 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_1,
    neg_f_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_1,
    neg_g_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 139)) <=s delta, delta <=s (const 64 (1 + 2*139)),
    (const 64 (-(2**20))) <=s u_138_139, u_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_139, v_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_139, r_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_139, s_138_139 <=s (const 64 ((2**20))),
    u_138_139 + v_138_139 <=s (const 64 (2**20)),
    u_138_139 - v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 + v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 - v_138_139 <=s (const 64 (2**20)),
    r_138_139 + s_138_139 <=s (const 64 (2**20)),
    r_138_139 - s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 + s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 - s_138_139 <=s (const 64 (2**20)),
    u_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_138_139 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_138_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_1,
sint64 neg_g_118_low60_20_low20_1,
sint64 u_138_138,
sint64 v_138_138,
sint64 r_138_138,
sint64 s_138_138,
sint64 u_138_139,
sint64 v_138_139,
sint64 r_138_139,
sint64 s_138_139,
bit ne
)={
    u_138_138 * neg_f_118_low60_20_low20_0 + v_138_138 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_0 * (-(2**20)),
    r_138_138 * neg_f_118_low60_20_low20_0 + s_138_138 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_0 * (-(2**20))
&&
    u_138_138 * neg_f_118_low60_20_low20_0 + v_138_138 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_0 * (const 64 (-(2**20))),
    r_138_138 * neg_f_118_low60_20_low20_0 + s_138_138 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_0 + u_138_138 * (const 64 (2**21)) + v_138_138 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_0 + r_138_138 * (const 64 (2**21)) + s_138_138 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 138)) <=s delta, delta <=s (const 64 (1 + 2*138)),
    u_138_138 = (const 64 (-(2**20))),
    v_138_138 = (const 64 (0)),
    r_138_138 = (const 64 (0)),
    s_138_138 = (const 64 (-(2**20)))
}



// divsteps
// step138

// premise c
assume
neg_g_118_low60_20_low20_0 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_1 neg_g_118_low60_20_low20_0;
mov u_138_139 r_138_138;
mov v_138_139 s_138_138;

subs dc neg_g_118_low60_20_low20_1 neg_g_118_low60_20_low20_0 neg_f_118_low60_20_low20_0;
asr neg_g_118_low60_20_low20_1 neg_g_118_low60_20_low20_1 1;
subs dc r_138_139 r_138_138 u_138_138;
asr r_138_139 r_138_139 1;
subs dc s_138_139 s_138_138 v_138_138;
asr s_138_139 s_138_139 1;
assert
    true
&&
    neg_f_118_low60_20_low20_1 = neg_g_118_low60_20_low20_0,
    u_138_139 = r_138_138,
    v_138_139 = s_138_138,
    neg_g_118_low60_20_low20_1 * (const 64 2) = neg_g_118_low60_20_low20_0 - neg_f_118_low60_20_low20_0,
    r_138_139 * (const 64 2) = r_138_138 - u_138_138,
    s_138_139 * (const 64 2) = s_138_138 - v_138_138
;

assume
    neg_f_118_low60_20_low20_1 = neg_g_118_low60_20_low20_0,
    u_138_139 = r_138_138,
    v_138_139 = s_138_138,
    neg_g_118_low60_20_low20_1 * 2 = neg_g_118_low60_20_low20_0 - neg_f_118_low60_20_low20_0,
    r_138_139 * 2 = r_138_138 - u_138_138,
    s_138_139 * 2 = s_138_138 - v_138_138
&&
    true
;

{
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_1 + u_138_139 * (const 64 (2**21)) + v_138_139 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_1 + r_138_139 * (const 64 (2**21)) + s_138_139 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_1,
    neg_f_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_1,
    neg_g_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 139)) <=s delta, delta <=s (const 64 (1 + 2*139)),
    (const 64 (-(2**20))) <=s u_138_139, u_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_139, v_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_139, r_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_139, s_138_139 <=s (const 64 ((2**20))),
    u_138_139 + v_138_139 <=s (const 64 (2**20)),
    u_138_139 - v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 + v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 - v_138_139 <=s (const 64 (2**20)),
    r_138_139 + s_138_139 <=s (const 64 (2**20)),
    r_138_139 - s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 + s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 - s_138_139 <=s (const 64 (2**20)),
    u_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_138_139 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_139_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_1,
sint64 neg_g_118_low60_20_low20_1,
sint64 neg_f_118_low60_20_low20_2,
sint64 neg_g_118_low60_20_low20_2,
sint64 u_138_139,
sint64 v_138_139,
sint64 r_138_139,
sint64 s_138_139,
sint64 u_138_140,
sint64 v_138_140,
sint64 r_138_140,
sint64 s_138_140,
bit ne
)={
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (-(2**20)),
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (-(2**20))
&&
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (const 64 (-(2**20))),
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_1 + u_138_139 * (const 64 (2**21)) + v_138_139 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_1 + r_138_139 * (const 64 (2**21)) + s_138_139 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_1,
    neg_f_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_1,
    neg_g_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 139)) <=s delta, delta <=s (const 64 (1 + 2*139)),
    (const 64 (-(2**20))) <=s u_138_139, u_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_139, v_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_139, r_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_139, s_138_139 <=s (const 64 ((2**20))),
    u_138_139 + v_138_139 <=s (const 64 (2**20)),
    u_138_139 - v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 + v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 - v_138_139 <=s (const 64 (2**20)),
    r_138_139 + s_138_139 <=s (const 64 (2**20)),
    r_138_139 - s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 + s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 - s_138_139 <=s (const 64 (2**20)),
    u_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_138_139 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step139

// premise a
assume
neg_g_118_low60_20_low20_1 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_2 neg_f_118_low60_20_low20_1;
mov u_138_140 u_138_139;
mov v_138_140 v_138_139;

asr neg_g_118_low60_20_low20_2 neg_g_118_low60_20_low20_1 1;
asr r_138_140 r_138_139 1;
asr s_138_140 s_138_139 1;
assert
    true
&&
    neg_f_118_low60_20_low20_2 = neg_f_118_low60_20_low20_1,
    u_138_140 = u_138_139,
    v_138_140 = v_138_139,
    neg_g_118_low60_20_low20_2 * (const 64 2) = neg_g_118_low60_20_low20_1,
    r_138_140 * (const 64 2) = r_138_139,
    s_138_140 * (const 64 2) = s_138_139
;

assume
    neg_f_118_low60_20_low20_2 = neg_f_118_low60_20_low20_1,
    u_138_140 = u_138_139,
    v_138_140 = v_138_139,
    neg_g_118_low60_20_low20_2 * 2 = neg_g_118_low60_20_low20_1,
    r_138_140 * 2 = r_138_139,
    s_138_140 * 2 = s_138_139
&&
    true
;

{
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_2 + u_138_140 * (const 64 (2**21)) + v_138_140 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_2 + r_138_140 * (const 64 (2**21)) + s_138_140 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_2,
    neg_f_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_2,
    neg_g_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 140)) <=s delta, delta <=s (const 64 (1 + 2*140)),
    (const 64 (-(2**20))) <=s u_138_140, u_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_140, v_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_140, r_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_140, s_138_140 <=s (const 64 ((2**20))),
    u_138_140 + v_138_140 <=s (const 64 (2**20)),
    u_138_140 - v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 + v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 - v_138_140 <=s (const 64 (2**20)),
    r_138_140 + s_138_140 <=s (const 64 (2**20)),
    r_138_140 - s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 + s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 - s_138_140 <=s (const 64 (2**20)),
    u_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_138_140 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_139_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_1,
sint64 neg_g_118_low60_20_low20_1,
sint64 neg_f_118_low60_20_low20_2,
sint64 neg_g_118_low60_20_low20_2,
sint64 u_138_139,
sint64 v_138_139,
sint64 r_138_139,
sint64 s_138_139,
sint64 u_138_140,
sint64 v_138_140,
sint64 r_138_140,
sint64 s_138_140,
bit ne
)={
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (-(2**20)),
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (-(2**20))
&&
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (const 64 (-(2**20))),
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_1 + u_138_139 * (const 64 (2**21)) + v_138_139 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_1 + r_138_139 * (const 64 (2**21)) + s_138_139 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_1,
    neg_f_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_1,
    neg_g_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 139)) <=s delta, delta <=s (const 64 (1 + 2*139)),
    (const 64 (-(2**20))) <=s u_138_139, u_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_139, v_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_139, r_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_139, s_138_139 <=s (const 64 ((2**20))),
    u_138_139 + v_138_139 <=s (const 64 (2**20)),
    u_138_139 - v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 + v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 - v_138_139 <=s (const 64 (2**20)),
    r_138_139 + s_138_139 <=s (const 64 (2**20)),
    r_138_139 - s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 + s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 - s_138_139 <=s (const 64 (2**20)),
    u_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_138_139 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step139

// premise b
assume
neg_g_118_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_2 neg_f_118_low60_20_low20_1;
mov u_138_140 u_138_139;
mov v_138_140 v_138_139;

add neg_g_118_low60_20_low20_2 neg_g_118_low60_20_low20_1 neg_f_118_low60_20_low20_1;
asr neg_g_118_low60_20_low20_2 neg_g_118_low60_20_low20_2 1;
add r_138_140 r_138_139 u_138_139;
asr r_138_140 r_138_140 1;
add s_138_140 s_138_139 v_138_139;
asr s_138_140 s_138_140 1;
assert
    true
&&
    neg_f_118_low60_20_low20_2 = neg_f_118_low60_20_low20_1,
    u_138_140 = u_138_139,
    v_138_140 = v_138_139,
    neg_g_118_low60_20_low20_2 * (const 64 2) = neg_g_118_low60_20_low20_1 + neg_f_118_low60_20_low20_1,
    r_138_140 * (const 64 2) = r_138_139 + u_138_139,
    s_138_140 * (const 64 2) = s_138_139 + v_138_139
;

assume
    neg_f_118_low60_20_low20_2 = neg_f_118_low60_20_low20_1,
    u_138_140 = u_138_139,
    v_138_140 = v_138_139,
    neg_g_118_low60_20_low20_2 * 2 = neg_g_118_low60_20_low20_1 + neg_f_118_low60_20_low20_1,
    r_138_140 * 2 = r_138_139 + u_138_139,
    s_138_140 * 2 = s_138_139 + v_138_139
&&
    true
;

{
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_2 + u_138_140 * (const 64 (2**21)) + v_138_140 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_2 + r_138_140 * (const 64 (2**21)) + s_138_140 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_2,
    neg_f_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_2,
    neg_g_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 140)) <=s delta, delta <=s (const 64 (1 + 2*140)),
    (const 64 (-(2**20))) <=s u_138_140, u_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_140, v_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_140, r_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_140, s_138_140 <=s (const 64 ((2**20))),
    u_138_140 + v_138_140 <=s (const 64 (2**20)),
    u_138_140 - v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 + v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 - v_138_140 <=s (const 64 (2**20)),
    r_138_140 + s_138_140 <=s (const 64 (2**20)),
    r_138_140 - s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 + s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 - s_138_140 <=s (const 64 (2**20)),
    u_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_138_140 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_139_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_1,
sint64 neg_g_118_low60_20_low20_1,
sint64 neg_f_118_low60_20_low20_2,
sint64 neg_g_118_low60_20_low20_2,
sint64 u_138_139,
sint64 v_138_139,
sint64 r_138_139,
sint64 s_138_139,
sint64 u_138_140,
sint64 v_138_140,
sint64 r_138_140,
sint64 s_138_140,
bit ne
)={
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (-(2**20)),
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (-(2**20))
&&
    u_138_139 * neg_f_118_low60_20_low20_0 + v_138_139 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_1 * (const 64 (-(2**20))),
    r_138_139 * neg_f_118_low60_20_low20_0 + s_138_139 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_1 + u_138_139 * (const 64 (2**21)) + v_138_139 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_1 + r_138_139 * (const 64 (2**21)) + s_138_139 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_1,
    neg_f_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_1,
    neg_g_118_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 139)) <=s delta, delta <=s (const 64 (1 + 2*139)),
    (const 64 (-(2**20))) <=s u_138_139, u_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_139, v_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_139, r_138_139 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_139, s_138_139 <=s (const 64 ((2**20))),
    u_138_139 + v_138_139 <=s (const 64 (2**20)),
    u_138_139 - v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 + v_138_139 <=s (const 64 (2**20)),
    (const 64 0) - u_138_139 - v_138_139 <=s (const 64 (2**20)),
    r_138_139 + s_138_139 <=s (const 64 (2**20)),
    r_138_139 - s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 + s_138_139 <=s (const 64 (2**20)),
    (const 64 0) - r_138_139 - s_138_139 <=s (const 64 (2**20)),
    u_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_138_139 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_138_139 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step139

// premise c
assume
neg_g_118_low60_20_low20_1 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_2 neg_g_118_low60_20_low20_1;
mov u_138_140 r_138_139;
mov v_138_140 s_138_139;

subs dc neg_g_118_low60_20_low20_2 neg_g_118_low60_20_low20_1 neg_f_118_low60_20_low20_1;
asr neg_g_118_low60_20_low20_2 neg_g_118_low60_20_low20_2 1;
subs dc r_138_140 r_138_139 u_138_139;
asr r_138_140 r_138_140 1;
subs dc s_138_140 s_138_139 v_138_139;
asr s_138_140 s_138_140 1;
assert
    true
&&
    neg_f_118_low60_20_low20_2 = neg_g_118_low60_20_low20_1,
    u_138_140 = r_138_139,
    v_138_140 = s_138_139,
    neg_g_118_low60_20_low20_2 * (const 64 2) = neg_g_118_low60_20_low20_1 - neg_f_118_low60_20_low20_1,
    r_138_140 * (const 64 2) = r_138_139 - u_138_139,
    s_138_140 * (const 64 2) = s_138_139 - v_138_139
;

assume
    neg_f_118_low60_20_low20_2 = neg_g_118_low60_20_low20_1,
    u_138_140 = r_138_139,
    v_138_140 = s_138_139,
    neg_g_118_low60_20_low20_2 * 2 = neg_g_118_low60_20_low20_1 - neg_f_118_low60_20_low20_1,
    r_138_140 * 2 = r_138_139 - u_138_139,
    s_138_140 * 2 = s_138_139 - v_138_139
&&
    true
;

{
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_2 + u_138_140 * (const 64 (2**21)) + v_138_140 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_2 + r_138_140 * (const 64 (2**21)) + s_138_140 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_2,
    neg_f_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_2,
    neg_g_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 140)) <=s delta, delta <=s (const 64 (1 + 2*140)),
    (const 64 (-(2**20))) <=s u_138_140, u_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_140, v_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_140, r_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_140, s_138_140 <=s (const 64 ((2**20))),
    u_138_140 + v_138_140 <=s (const 64 (2**20)),
    u_138_140 - v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 + v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 - v_138_140 <=s (const 64 (2**20)),
    r_138_140 + s_138_140 <=s (const 64 (2**20)),
    r_138_140 - s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 + s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 - s_138_140 <=s (const 64 (2**20)),
    u_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_138_140 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_140_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_2,
sint64 neg_g_118_low60_20_low20_2,
sint64 neg_f_118_low60_20_low20_3,
sint64 neg_g_118_low60_20_low20_3,
sint64 u_138_140,
sint64 v_138_140,
sint64 r_138_140,
sint64 s_138_140,
sint64 u_138_141,
sint64 v_138_141,
sint64 r_138_141,
sint64 s_138_141,
bit ne
)={
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (-(2**20)),
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (-(2**20))
&&
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (const 64 (-(2**20))),
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_2 + u_138_140 * (const 64 (2**21)) + v_138_140 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_2 + r_138_140 * (const 64 (2**21)) + s_138_140 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_2,
    neg_f_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_2,
    neg_g_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 140)) <=s delta, delta <=s (const 64 (1 + 2*140)),
    (const 64 (-(2**20))) <=s u_138_140, u_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_140, v_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_140, r_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_140, s_138_140 <=s (const 64 ((2**20))),
    u_138_140 + v_138_140 <=s (const 64 (2**20)),
    u_138_140 - v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 + v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 - v_138_140 <=s (const 64 (2**20)),
    r_138_140 + s_138_140 <=s (const 64 (2**20)),
    r_138_140 - s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 + s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 - s_138_140 <=s (const 64 (2**20)),
    u_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_138_140 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step140

// premise a
assume
neg_g_118_low60_20_low20_2 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_3 neg_f_118_low60_20_low20_2;
mov u_138_141 u_138_140;
mov v_138_141 v_138_140;

asr neg_g_118_low60_20_low20_3 neg_g_118_low60_20_low20_2 1;
asr r_138_141 r_138_140 1;
asr s_138_141 s_138_140 1;
assert
    true
&&
    neg_f_118_low60_20_low20_3 = neg_f_118_low60_20_low20_2,
    u_138_141 = u_138_140,
    v_138_141 = v_138_140,
    neg_g_118_low60_20_low20_3 * (const 64 2) = neg_g_118_low60_20_low20_2,
    r_138_141 * (const 64 2) = r_138_140,
    s_138_141 * (const 64 2) = s_138_140
;

assume
    neg_f_118_low60_20_low20_3 = neg_f_118_low60_20_low20_2,
    u_138_141 = u_138_140,
    v_138_141 = v_138_140,
    neg_g_118_low60_20_low20_3 * 2 = neg_g_118_low60_20_low20_2,
    r_138_141 * 2 = r_138_140,
    s_138_141 * 2 = s_138_140
&&
    true
;

{
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_3 + u_138_141 * (const 64 (2**21)) + v_138_141 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_3 + r_138_141 * (const 64 (2**21)) + s_138_141 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_3,
    neg_f_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_3,
    neg_g_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 141)) <=s delta, delta <=s (const 64 (1 + 2*141)),
    (const 64 (-(2**20))) <=s u_138_141, u_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_141, v_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_141, r_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_141, s_138_141 <=s (const 64 ((2**20))),
    u_138_141 + v_138_141 <=s (const 64 (2**20)),
    u_138_141 - v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 + v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 - v_138_141 <=s (const 64 (2**20)),
    r_138_141 + s_138_141 <=s (const 64 (2**20)),
    r_138_141 - s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 + s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 - s_138_141 <=s (const 64 (2**20)),
    u_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_138_141 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_140_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_2,
sint64 neg_g_118_low60_20_low20_2,
sint64 neg_f_118_low60_20_low20_3,
sint64 neg_g_118_low60_20_low20_3,
sint64 u_138_140,
sint64 v_138_140,
sint64 r_138_140,
sint64 s_138_140,
sint64 u_138_141,
sint64 v_138_141,
sint64 r_138_141,
sint64 s_138_141,
bit ne
)={
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (-(2**20)),
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (-(2**20))
&&
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (const 64 (-(2**20))),
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_2 + u_138_140 * (const 64 (2**21)) + v_138_140 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_2 + r_138_140 * (const 64 (2**21)) + s_138_140 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_2,
    neg_f_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_2,
    neg_g_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 140)) <=s delta, delta <=s (const 64 (1 + 2*140)),
    (const 64 (-(2**20))) <=s u_138_140, u_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_140, v_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_140, r_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_140, s_138_140 <=s (const 64 ((2**20))),
    u_138_140 + v_138_140 <=s (const 64 (2**20)),
    u_138_140 - v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 + v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 - v_138_140 <=s (const 64 (2**20)),
    r_138_140 + s_138_140 <=s (const 64 (2**20)),
    r_138_140 - s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 + s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 - s_138_140 <=s (const 64 (2**20)),
    u_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_138_140 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step140

// premise b
assume
neg_g_118_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_3 neg_f_118_low60_20_low20_2;
mov u_138_141 u_138_140;
mov v_138_141 v_138_140;

add neg_g_118_low60_20_low20_3 neg_g_118_low60_20_low20_2 neg_f_118_low60_20_low20_2;
asr neg_g_118_low60_20_low20_3 neg_g_118_low60_20_low20_3 1;
add r_138_141 r_138_140 u_138_140;
asr r_138_141 r_138_141 1;
add s_138_141 s_138_140 v_138_140;
asr s_138_141 s_138_141 1;
assert
    true
&&
    neg_f_118_low60_20_low20_3 = neg_f_118_low60_20_low20_2,
    u_138_141 = u_138_140,
    v_138_141 = v_138_140,
    neg_g_118_low60_20_low20_3 * (const 64 2) = neg_g_118_low60_20_low20_2 + neg_f_118_low60_20_low20_2,
    r_138_141 * (const 64 2) = r_138_140 + u_138_140,
    s_138_141 * (const 64 2) = s_138_140 + v_138_140
;

assume
    neg_f_118_low60_20_low20_3 = neg_f_118_low60_20_low20_2,
    u_138_141 = u_138_140,
    v_138_141 = v_138_140,
    neg_g_118_low60_20_low20_3 * 2 = neg_g_118_low60_20_low20_2 + neg_f_118_low60_20_low20_2,
    r_138_141 * 2 = r_138_140 + u_138_140,
    s_138_141 * 2 = s_138_140 + v_138_140
&&
    true
;

{
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_3 + u_138_141 * (const 64 (2**21)) + v_138_141 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_3 + r_138_141 * (const 64 (2**21)) + s_138_141 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_3,
    neg_f_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_3,
    neg_g_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 141)) <=s delta, delta <=s (const 64 (1 + 2*141)),
    (const 64 (-(2**20))) <=s u_138_141, u_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_141, v_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_141, r_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_141, s_138_141 <=s (const 64 ((2**20))),
    u_138_141 + v_138_141 <=s (const 64 (2**20)),
    u_138_141 - v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 + v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 - v_138_141 <=s (const 64 (2**20)),
    r_138_141 + s_138_141 <=s (const 64 (2**20)),
    r_138_141 - s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 + s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 - s_138_141 <=s (const 64 (2**20)),
    u_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_138_141 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_140_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_2,
sint64 neg_g_118_low60_20_low20_2,
sint64 neg_f_118_low60_20_low20_3,
sint64 neg_g_118_low60_20_low20_3,
sint64 u_138_140,
sint64 v_138_140,
sint64 r_138_140,
sint64 s_138_140,
sint64 u_138_141,
sint64 v_138_141,
sint64 r_138_141,
sint64 s_138_141,
bit ne
)={
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (-(2**20)),
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (-(2**20))
&&
    u_138_140 * neg_f_118_low60_20_low20_0 + v_138_140 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_2 * (const 64 (-(2**20))),
    r_138_140 * neg_f_118_low60_20_low20_0 + s_138_140 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_2 + u_138_140 * (const 64 (2**21)) + v_138_140 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_2 + r_138_140 * (const 64 (2**21)) + s_138_140 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_2,
    neg_f_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_2,
    neg_g_118_low60_20_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 140)) <=s delta, delta <=s (const 64 (1 + 2*140)),
    (const 64 (-(2**20))) <=s u_138_140, u_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_140, v_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_140, r_138_140 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_140, s_138_140 <=s (const 64 ((2**20))),
    u_138_140 + v_138_140 <=s (const 64 (2**20)),
    u_138_140 - v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 + v_138_140 <=s (const 64 (2**20)),
    (const 64 0) - u_138_140 - v_138_140 <=s (const 64 (2**20)),
    r_138_140 + s_138_140 <=s (const 64 (2**20)),
    r_138_140 - s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 + s_138_140 <=s (const 64 (2**20)),
    (const 64 0) - r_138_140 - s_138_140 <=s (const 64 (2**20)),
    u_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_138_140 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_138_140 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step140

// premise c
assume
neg_g_118_low60_20_low20_2 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_3 neg_g_118_low60_20_low20_2;
mov u_138_141 r_138_140;
mov v_138_141 s_138_140;

subs dc neg_g_118_low60_20_low20_3 neg_g_118_low60_20_low20_2 neg_f_118_low60_20_low20_2;
asr neg_g_118_low60_20_low20_3 neg_g_118_low60_20_low20_3 1;
subs dc r_138_141 r_138_140 u_138_140;
asr r_138_141 r_138_141 1;
subs dc s_138_141 s_138_140 v_138_140;
asr s_138_141 s_138_141 1;
assert
    true
&&
    neg_f_118_low60_20_low20_3 = neg_g_118_low60_20_low20_2,
    u_138_141 = r_138_140,
    v_138_141 = s_138_140,
    neg_g_118_low60_20_low20_3 * (const 64 2) = neg_g_118_low60_20_low20_2 - neg_f_118_low60_20_low20_2,
    r_138_141 * (const 64 2) = r_138_140 - u_138_140,
    s_138_141 * (const 64 2) = s_138_140 - v_138_140
;

assume
    neg_f_118_low60_20_low20_3 = neg_g_118_low60_20_low20_2,
    u_138_141 = r_138_140,
    v_138_141 = s_138_140,
    neg_g_118_low60_20_low20_3 * 2 = neg_g_118_low60_20_low20_2 - neg_f_118_low60_20_low20_2,
    r_138_141 * 2 = r_138_140 - u_138_140,
    s_138_141 * 2 = s_138_140 - v_138_140
&&
    true
;

{
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_3 + u_138_141 * (const 64 (2**21)) + v_138_141 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_3 + r_138_141 * (const 64 (2**21)) + s_138_141 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_3,
    neg_f_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_3,
    neg_g_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 141)) <=s delta, delta <=s (const 64 (1 + 2*141)),
    (const 64 (-(2**20))) <=s u_138_141, u_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_141, v_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_141, r_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_141, s_138_141 <=s (const 64 ((2**20))),
    u_138_141 + v_138_141 <=s (const 64 (2**20)),
    u_138_141 - v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 + v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 - v_138_141 <=s (const 64 (2**20)),
    r_138_141 + s_138_141 <=s (const 64 (2**20)),
    r_138_141 - s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 + s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 - s_138_141 <=s (const 64 (2**20)),
    u_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_138_141 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_141_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_3,
sint64 neg_g_118_low60_20_low20_3,
sint64 neg_f_118_low60_20_low20_4,
sint64 neg_g_118_low60_20_low20_4,
sint64 u_138_141,
sint64 v_138_141,
sint64 r_138_141,
sint64 s_138_141,
sint64 u_138_142,
sint64 v_138_142,
sint64 r_138_142,
sint64 s_138_142,
bit ne
)={
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (-(2**20)),
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (-(2**20))
&&
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (const 64 (-(2**20))),
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_3 + u_138_141 * (const 64 (2**21)) + v_138_141 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_3 + r_138_141 * (const 64 (2**21)) + s_138_141 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_3,
    neg_f_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_3,
    neg_g_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 141)) <=s delta, delta <=s (const 64 (1 + 2*141)),
    (const 64 (-(2**20))) <=s u_138_141, u_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_141, v_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_141, r_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_141, s_138_141 <=s (const 64 ((2**20))),
    u_138_141 + v_138_141 <=s (const 64 (2**20)),
    u_138_141 - v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 + v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 - v_138_141 <=s (const 64 (2**20)),
    r_138_141 + s_138_141 <=s (const 64 (2**20)),
    r_138_141 - s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 + s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 - s_138_141 <=s (const 64 (2**20)),
    u_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_138_141 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step141

// premise a
assume
neg_g_118_low60_20_low20_3 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_4 neg_f_118_low60_20_low20_3;
mov u_138_142 u_138_141;
mov v_138_142 v_138_141;

asr neg_g_118_low60_20_low20_4 neg_g_118_low60_20_low20_3 1;
asr r_138_142 r_138_141 1;
asr s_138_142 s_138_141 1;
assert
    true
&&
    neg_f_118_low60_20_low20_4 = neg_f_118_low60_20_low20_3,
    u_138_142 = u_138_141,
    v_138_142 = v_138_141,
    neg_g_118_low60_20_low20_4 * (const 64 2) = neg_g_118_low60_20_low20_3,
    r_138_142 * (const 64 2) = r_138_141,
    s_138_142 * (const 64 2) = s_138_141
;

assume
    neg_f_118_low60_20_low20_4 = neg_f_118_low60_20_low20_3,
    u_138_142 = u_138_141,
    v_138_142 = v_138_141,
    neg_g_118_low60_20_low20_4 * 2 = neg_g_118_low60_20_low20_3,
    r_138_142 * 2 = r_138_141,
    s_138_142 * 2 = s_138_141
&&
    true
;

{
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_4 + u_138_142 * (const 64 (2**21)) + v_138_142 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_4 + r_138_142 * (const 64 (2**21)) + s_138_142 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_4,
    neg_f_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_4,
    neg_g_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 142)) <=s delta, delta <=s (const 64 (1 + 2*142)),
    (const 64 (-(2**20))) <=s u_138_142, u_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_142, v_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_142, r_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_142, s_138_142 <=s (const 64 ((2**20))),
    u_138_142 + v_138_142 <=s (const 64 (2**20)),
    u_138_142 - v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 + v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 - v_138_142 <=s (const 64 (2**20)),
    r_138_142 + s_138_142 <=s (const 64 (2**20)),
    r_138_142 - s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 + s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 - s_138_142 <=s (const 64 (2**20)),
    u_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_138_142 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_141_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_3,
sint64 neg_g_118_low60_20_low20_3,
sint64 neg_f_118_low60_20_low20_4,
sint64 neg_g_118_low60_20_low20_4,
sint64 u_138_141,
sint64 v_138_141,
sint64 r_138_141,
sint64 s_138_141,
sint64 u_138_142,
sint64 v_138_142,
sint64 r_138_142,
sint64 s_138_142,
bit ne
)={
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (-(2**20)),
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (-(2**20))
&&
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (const 64 (-(2**20))),
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_3 + u_138_141 * (const 64 (2**21)) + v_138_141 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_3 + r_138_141 * (const 64 (2**21)) + s_138_141 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_3,
    neg_f_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_3,
    neg_g_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 141)) <=s delta, delta <=s (const 64 (1 + 2*141)),
    (const 64 (-(2**20))) <=s u_138_141, u_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_141, v_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_141, r_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_141, s_138_141 <=s (const 64 ((2**20))),
    u_138_141 + v_138_141 <=s (const 64 (2**20)),
    u_138_141 - v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 + v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 - v_138_141 <=s (const 64 (2**20)),
    r_138_141 + s_138_141 <=s (const 64 (2**20)),
    r_138_141 - s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 + s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 - s_138_141 <=s (const 64 (2**20)),
    u_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_138_141 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step141

// premise b
assume
neg_g_118_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_4 neg_f_118_low60_20_low20_3;
mov u_138_142 u_138_141;
mov v_138_142 v_138_141;

add neg_g_118_low60_20_low20_4 neg_g_118_low60_20_low20_3 neg_f_118_low60_20_low20_3;
asr neg_g_118_low60_20_low20_4 neg_g_118_low60_20_low20_4 1;
add r_138_142 r_138_141 u_138_141;
asr r_138_142 r_138_142 1;
add s_138_142 s_138_141 v_138_141;
asr s_138_142 s_138_142 1;
assert
    true
&&
    neg_f_118_low60_20_low20_4 = neg_f_118_low60_20_low20_3,
    u_138_142 = u_138_141,
    v_138_142 = v_138_141,
    neg_g_118_low60_20_low20_4 * (const 64 2) = neg_g_118_low60_20_low20_3 + neg_f_118_low60_20_low20_3,
    r_138_142 * (const 64 2) = r_138_141 + u_138_141,
    s_138_142 * (const 64 2) = s_138_141 + v_138_141
;

assume
    neg_f_118_low60_20_low20_4 = neg_f_118_low60_20_low20_3,
    u_138_142 = u_138_141,
    v_138_142 = v_138_141,
    neg_g_118_low60_20_low20_4 * 2 = neg_g_118_low60_20_low20_3 + neg_f_118_low60_20_low20_3,
    r_138_142 * 2 = r_138_141 + u_138_141,
    s_138_142 * 2 = s_138_141 + v_138_141
&&
    true
;

{
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_4 + u_138_142 * (const 64 (2**21)) + v_138_142 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_4 + r_138_142 * (const 64 (2**21)) + s_138_142 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_4,
    neg_f_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_4,
    neg_g_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 142)) <=s delta, delta <=s (const 64 (1 + 2*142)),
    (const 64 (-(2**20))) <=s u_138_142, u_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_142, v_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_142, r_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_142, s_138_142 <=s (const 64 ((2**20))),
    u_138_142 + v_138_142 <=s (const 64 (2**20)),
    u_138_142 - v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 + v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 - v_138_142 <=s (const 64 (2**20)),
    r_138_142 + s_138_142 <=s (const 64 (2**20)),
    r_138_142 - s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 + s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 - s_138_142 <=s (const 64 (2**20)),
    u_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_138_142 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_141_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_3,
sint64 neg_g_118_low60_20_low20_3,
sint64 neg_f_118_low60_20_low20_4,
sint64 neg_g_118_low60_20_low20_4,
sint64 u_138_141,
sint64 v_138_141,
sint64 r_138_141,
sint64 s_138_141,
sint64 u_138_142,
sint64 v_138_142,
sint64 r_138_142,
sint64 s_138_142,
bit ne
)={
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (-(2**20)),
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (-(2**20))
&&
    u_138_141 * neg_f_118_low60_20_low20_0 + v_138_141 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_3 * (const 64 (-(2**20))),
    r_138_141 * neg_f_118_low60_20_low20_0 + s_138_141 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_3 + u_138_141 * (const 64 (2**21)) + v_138_141 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_3 + r_138_141 * (const 64 (2**21)) + s_138_141 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_3,
    neg_f_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_3,
    neg_g_118_low60_20_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 141)) <=s delta, delta <=s (const 64 (1 + 2*141)),
    (const 64 (-(2**20))) <=s u_138_141, u_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_141, v_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_141, r_138_141 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_141, s_138_141 <=s (const 64 ((2**20))),
    u_138_141 + v_138_141 <=s (const 64 (2**20)),
    u_138_141 - v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 + v_138_141 <=s (const 64 (2**20)),
    (const 64 0) - u_138_141 - v_138_141 <=s (const 64 (2**20)),
    r_138_141 + s_138_141 <=s (const 64 (2**20)),
    r_138_141 - s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 + s_138_141 <=s (const 64 (2**20)),
    (const 64 0) - r_138_141 - s_138_141 <=s (const 64 (2**20)),
    u_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_138_141 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_138_141 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step141

// premise c
assume
neg_g_118_low60_20_low20_3 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_4 neg_g_118_low60_20_low20_3;
mov u_138_142 r_138_141;
mov v_138_142 s_138_141;

subs dc neg_g_118_low60_20_low20_4 neg_g_118_low60_20_low20_3 neg_f_118_low60_20_low20_3;
asr neg_g_118_low60_20_low20_4 neg_g_118_low60_20_low20_4 1;
subs dc r_138_142 r_138_141 u_138_141;
asr r_138_142 r_138_142 1;
subs dc s_138_142 s_138_141 v_138_141;
asr s_138_142 s_138_142 1;
assert
    true
&&
    neg_f_118_low60_20_low20_4 = neg_g_118_low60_20_low20_3,
    u_138_142 = r_138_141,
    v_138_142 = s_138_141,
    neg_g_118_low60_20_low20_4 * (const 64 2) = neg_g_118_low60_20_low20_3 - neg_f_118_low60_20_low20_3,
    r_138_142 * (const 64 2) = r_138_141 - u_138_141,
    s_138_142 * (const 64 2) = s_138_141 - v_138_141
;

assume
    neg_f_118_low60_20_low20_4 = neg_g_118_low60_20_low20_3,
    u_138_142 = r_138_141,
    v_138_142 = s_138_141,
    neg_g_118_low60_20_low20_4 * 2 = neg_g_118_low60_20_low20_3 - neg_f_118_low60_20_low20_3,
    r_138_142 * 2 = r_138_141 - u_138_141,
    s_138_142 * 2 = s_138_141 - v_138_141
&&
    true
;

{
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_4 + u_138_142 * (const 64 (2**21)) + v_138_142 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_4 + r_138_142 * (const 64 (2**21)) + s_138_142 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_4,
    neg_f_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_4,
    neg_g_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 142)) <=s delta, delta <=s (const 64 (1 + 2*142)),
    (const 64 (-(2**20))) <=s u_138_142, u_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_142, v_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_142, r_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_142, s_138_142 <=s (const 64 ((2**20))),
    u_138_142 + v_138_142 <=s (const 64 (2**20)),
    u_138_142 - v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 + v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 - v_138_142 <=s (const 64 (2**20)),
    r_138_142 + s_138_142 <=s (const 64 (2**20)),
    r_138_142 - s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 + s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 - s_138_142 <=s (const 64 (2**20)),
    u_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_138_142 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_142_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_4,
sint64 neg_g_118_low60_20_low20_4,
sint64 neg_f_118_low60_20_low20_5,
sint64 neg_g_118_low60_20_low20_5,
sint64 u_138_142,
sint64 v_138_142,
sint64 r_138_142,
sint64 s_138_142,
sint64 u_138_143,
sint64 v_138_143,
sint64 r_138_143,
sint64 s_138_143,
bit ne
)={
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (-(2**20)),
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (-(2**20))
&&
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (const 64 (-(2**20))),
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_4 + u_138_142 * (const 64 (2**21)) + v_138_142 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_4 + r_138_142 * (const 64 (2**21)) + s_138_142 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_4,
    neg_f_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_4,
    neg_g_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 142)) <=s delta, delta <=s (const 64 (1 + 2*142)),
    (const 64 (-(2**20))) <=s u_138_142, u_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_142, v_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_142, r_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_142, s_138_142 <=s (const 64 ((2**20))),
    u_138_142 + v_138_142 <=s (const 64 (2**20)),
    u_138_142 - v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 + v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 - v_138_142 <=s (const 64 (2**20)),
    r_138_142 + s_138_142 <=s (const 64 (2**20)),
    r_138_142 - s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 + s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 - s_138_142 <=s (const 64 (2**20)),
    u_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_138_142 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step142

// premise a
assume
neg_g_118_low60_20_low20_4 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_5 neg_f_118_low60_20_low20_4;
mov u_138_143 u_138_142;
mov v_138_143 v_138_142;

asr neg_g_118_low60_20_low20_5 neg_g_118_low60_20_low20_4 1;
asr r_138_143 r_138_142 1;
asr s_138_143 s_138_142 1;
assert
    true
&&
    neg_f_118_low60_20_low20_5 = neg_f_118_low60_20_low20_4,
    u_138_143 = u_138_142,
    v_138_143 = v_138_142,
    neg_g_118_low60_20_low20_5 * (const 64 2) = neg_g_118_low60_20_low20_4,
    r_138_143 * (const 64 2) = r_138_142,
    s_138_143 * (const 64 2) = s_138_142
;

assume
    neg_f_118_low60_20_low20_5 = neg_f_118_low60_20_low20_4,
    u_138_143 = u_138_142,
    v_138_143 = v_138_142,
    neg_g_118_low60_20_low20_5 * 2 = neg_g_118_low60_20_low20_4,
    r_138_143 * 2 = r_138_142,
    s_138_143 * 2 = s_138_142
&&
    true
;

{
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_5 + u_138_143 * (const 64 (2**21)) + v_138_143 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_5 + r_138_143 * (const 64 (2**21)) + s_138_143 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_5,
    neg_f_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_5,
    neg_g_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 143)) <=s delta, delta <=s (const 64 (1 + 2*143)),
    (const 64 (-(2**20))) <=s u_138_143, u_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_143, v_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_143, r_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_143, s_138_143 <=s (const 64 ((2**20))),
    u_138_143 + v_138_143 <=s (const 64 (2**20)),
    u_138_143 - v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 + v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 - v_138_143 <=s (const 64 (2**20)),
    r_138_143 + s_138_143 <=s (const 64 (2**20)),
    r_138_143 - s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 + s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 - s_138_143 <=s (const 64 (2**20)),
    u_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_138_143 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_142_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_4,
sint64 neg_g_118_low60_20_low20_4,
sint64 neg_f_118_low60_20_low20_5,
sint64 neg_g_118_low60_20_low20_5,
sint64 u_138_142,
sint64 v_138_142,
sint64 r_138_142,
sint64 s_138_142,
sint64 u_138_143,
sint64 v_138_143,
sint64 r_138_143,
sint64 s_138_143,
bit ne
)={
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (-(2**20)),
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (-(2**20))
&&
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (const 64 (-(2**20))),
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_4 + u_138_142 * (const 64 (2**21)) + v_138_142 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_4 + r_138_142 * (const 64 (2**21)) + s_138_142 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_4,
    neg_f_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_4,
    neg_g_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 142)) <=s delta, delta <=s (const 64 (1 + 2*142)),
    (const 64 (-(2**20))) <=s u_138_142, u_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_142, v_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_142, r_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_142, s_138_142 <=s (const 64 ((2**20))),
    u_138_142 + v_138_142 <=s (const 64 (2**20)),
    u_138_142 - v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 + v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 - v_138_142 <=s (const 64 (2**20)),
    r_138_142 + s_138_142 <=s (const 64 (2**20)),
    r_138_142 - s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 + s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 - s_138_142 <=s (const 64 (2**20)),
    u_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_138_142 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step142

// premise b
assume
neg_g_118_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_5 neg_f_118_low60_20_low20_4;
mov u_138_143 u_138_142;
mov v_138_143 v_138_142;

add neg_g_118_low60_20_low20_5 neg_g_118_low60_20_low20_4 neg_f_118_low60_20_low20_4;
asr neg_g_118_low60_20_low20_5 neg_g_118_low60_20_low20_5 1;
add r_138_143 r_138_142 u_138_142;
asr r_138_143 r_138_143 1;
add s_138_143 s_138_142 v_138_142;
asr s_138_143 s_138_143 1;
assert
    true
&&
    neg_f_118_low60_20_low20_5 = neg_f_118_low60_20_low20_4,
    u_138_143 = u_138_142,
    v_138_143 = v_138_142,
    neg_g_118_low60_20_low20_5 * (const 64 2) = neg_g_118_low60_20_low20_4 + neg_f_118_low60_20_low20_4,
    r_138_143 * (const 64 2) = r_138_142 + u_138_142,
    s_138_143 * (const 64 2) = s_138_142 + v_138_142
;

assume
    neg_f_118_low60_20_low20_5 = neg_f_118_low60_20_low20_4,
    u_138_143 = u_138_142,
    v_138_143 = v_138_142,
    neg_g_118_low60_20_low20_5 * 2 = neg_g_118_low60_20_low20_4 + neg_f_118_low60_20_low20_4,
    r_138_143 * 2 = r_138_142 + u_138_142,
    s_138_143 * 2 = s_138_142 + v_138_142
&&
    true
;

{
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_5 + u_138_143 * (const 64 (2**21)) + v_138_143 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_5 + r_138_143 * (const 64 (2**21)) + s_138_143 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_5,
    neg_f_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_5,
    neg_g_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 143)) <=s delta, delta <=s (const 64 (1 + 2*143)),
    (const 64 (-(2**20))) <=s u_138_143, u_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_143, v_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_143, r_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_143, s_138_143 <=s (const 64 ((2**20))),
    u_138_143 + v_138_143 <=s (const 64 (2**20)),
    u_138_143 - v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 + v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 - v_138_143 <=s (const 64 (2**20)),
    r_138_143 + s_138_143 <=s (const 64 (2**20)),
    r_138_143 - s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 + s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 - s_138_143 <=s (const 64 (2**20)),
    u_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_138_143 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_142_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_4,
sint64 neg_g_118_low60_20_low20_4,
sint64 neg_f_118_low60_20_low20_5,
sint64 neg_g_118_low60_20_low20_5,
sint64 u_138_142,
sint64 v_138_142,
sint64 r_138_142,
sint64 s_138_142,
sint64 u_138_143,
sint64 v_138_143,
sint64 r_138_143,
sint64 s_138_143,
bit ne
)={
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (-(2**20)),
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (-(2**20))
&&
    u_138_142 * neg_f_118_low60_20_low20_0 + v_138_142 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_4 * (const 64 (-(2**20))),
    r_138_142 * neg_f_118_low60_20_low20_0 + s_138_142 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_4 + u_138_142 * (const 64 (2**21)) + v_138_142 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_4 + r_138_142 * (const 64 (2**21)) + s_138_142 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_4,
    neg_f_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_4,
    neg_g_118_low60_20_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 142)) <=s delta, delta <=s (const 64 (1 + 2*142)),
    (const 64 (-(2**20))) <=s u_138_142, u_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_142, v_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_142, r_138_142 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_142, s_138_142 <=s (const 64 ((2**20))),
    u_138_142 + v_138_142 <=s (const 64 (2**20)),
    u_138_142 - v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 + v_138_142 <=s (const 64 (2**20)),
    (const 64 0) - u_138_142 - v_138_142 <=s (const 64 (2**20)),
    r_138_142 + s_138_142 <=s (const 64 (2**20)),
    r_138_142 - s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 + s_138_142 <=s (const 64 (2**20)),
    (const 64 0) - r_138_142 - s_138_142 <=s (const 64 (2**20)),
    u_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_138_142 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_138_142 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step142

// premise c
assume
neg_g_118_low60_20_low20_4 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_5 neg_g_118_low60_20_low20_4;
mov u_138_143 r_138_142;
mov v_138_143 s_138_142;

subs dc neg_g_118_low60_20_low20_5 neg_g_118_low60_20_low20_4 neg_f_118_low60_20_low20_4;
asr neg_g_118_low60_20_low20_5 neg_g_118_low60_20_low20_5 1;
subs dc r_138_143 r_138_142 u_138_142;
asr r_138_143 r_138_143 1;
subs dc s_138_143 s_138_142 v_138_142;
asr s_138_143 s_138_143 1;
assert
    true
&&
    neg_f_118_low60_20_low20_5 = neg_g_118_low60_20_low20_4,
    u_138_143 = r_138_142,
    v_138_143 = s_138_142,
    neg_g_118_low60_20_low20_5 * (const 64 2) = neg_g_118_low60_20_low20_4 - neg_f_118_low60_20_low20_4,
    r_138_143 * (const 64 2) = r_138_142 - u_138_142,
    s_138_143 * (const 64 2) = s_138_142 - v_138_142
;

assume
    neg_f_118_low60_20_low20_5 = neg_g_118_low60_20_low20_4,
    u_138_143 = r_138_142,
    v_138_143 = s_138_142,
    neg_g_118_low60_20_low20_5 * 2 = neg_g_118_low60_20_low20_4 - neg_f_118_low60_20_low20_4,
    r_138_143 * 2 = r_138_142 - u_138_142,
    s_138_143 * 2 = s_138_142 - v_138_142
&&
    true
;

{
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_5 + u_138_143 * (const 64 (2**21)) + v_138_143 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_5 + r_138_143 * (const 64 (2**21)) + s_138_143 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_5,
    neg_f_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_5,
    neg_g_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 143)) <=s delta, delta <=s (const 64 (1 + 2*143)),
    (const 64 (-(2**20))) <=s u_138_143, u_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_143, v_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_143, r_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_143, s_138_143 <=s (const 64 ((2**20))),
    u_138_143 + v_138_143 <=s (const 64 (2**20)),
    u_138_143 - v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 + v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 - v_138_143 <=s (const 64 (2**20)),
    r_138_143 + s_138_143 <=s (const 64 (2**20)),
    r_138_143 - s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 + s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 - s_138_143 <=s (const 64 (2**20)),
    u_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_138_143 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_143_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_5,
sint64 neg_g_118_low60_20_low20_5,
sint64 neg_f_118_low60_20_low20_6,
sint64 neg_g_118_low60_20_low20_6,
sint64 u_138_143,
sint64 v_138_143,
sint64 r_138_143,
sint64 s_138_143,
sint64 u_138_144,
sint64 v_138_144,
sint64 r_138_144,
sint64 s_138_144,
bit ne
)={
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (-(2**20)),
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (-(2**20))
&&
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (const 64 (-(2**20))),
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_5 + u_138_143 * (const 64 (2**21)) + v_138_143 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_5 + r_138_143 * (const 64 (2**21)) + s_138_143 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_5,
    neg_f_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_5,
    neg_g_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 143)) <=s delta, delta <=s (const 64 (1 + 2*143)),
    (const 64 (-(2**20))) <=s u_138_143, u_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_143, v_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_143, r_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_143, s_138_143 <=s (const 64 ((2**20))),
    u_138_143 + v_138_143 <=s (const 64 (2**20)),
    u_138_143 - v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 + v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 - v_138_143 <=s (const 64 (2**20)),
    r_138_143 + s_138_143 <=s (const 64 (2**20)),
    r_138_143 - s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 + s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 - s_138_143 <=s (const 64 (2**20)),
    u_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_138_143 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step143

// premise a
assume
neg_g_118_low60_20_low20_5 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_6 neg_f_118_low60_20_low20_5;
mov u_138_144 u_138_143;
mov v_138_144 v_138_143;

asr neg_g_118_low60_20_low20_6 neg_g_118_low60_20_low20_5 1;
asr r_138_144 r_138_143 1;
asr s_138_144 s_138_143 1;
assert
    true
&&
    neg_f_118_low60_20_low20_6 = neg_f_118_low60_20_low20_5,
    u_138_144 = u_138_143,
    v_138_144 = v_138_143,
    neg_g_118_low60_20_low20_6 * (const 64 2) = neg_g_118_low60_20_low20_5,
    r_138_144 * (const 64 2) = r_138_143,
    s_138_144 * (const 64 2) = s_138_143
;

assume
    neg_f_118_low60_20_low20_6 = neg_f_118_low60_20_low20_5,
    u_138_144 = u_138_143,
    v_138_144 = v_138_143,
    neg_g_118_low60_20_low20_6 * 2 = neg_g_118_low60_20_low20_5,
    r_138_144 * 2 = r_138_143,
    s_138_144 * 2 = s_138_143
&&
    true
;

{
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_6 + u_138_144 * (const 64 (2**21)) + v_138_144 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_6 + r_138_144 * (const 64 (2**21)) + s_138_144 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_6,
    neg_f_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_6,
    neg_g_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 144)) <=s delta, delta <=s (const 64 (1 + 2*144)),
    (const 64 (-(2**20))) <=s u_138_144, u_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_144, v_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_144, r_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_144, s_138_144 <=s (const 64 ((2**20))),
    u_138_144 + v_138_144 <=s (const 64 (2**20)),
    u_138_144 - v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 + v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 - v_138_144 <=s (const 64 (2**20)),
    r_138_144 + s_138_144 <=s (const 64 (2**20)),
    r_138_144 - s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 + s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 - s_138_144 <=s (const 64 (2**20)),
    u_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_138_144 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_143_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_5,
sint64 neg_g_118_low60_20_low20_5,
sint64 neg_f_118_low60_20_low20_6,
sint64 neg_g_118_low60_20_low20_6,
sint64 u_138_143,
sint64 v_138_143,
sint64 r_138_143,
sint64 s_138_143,
sint64 u_138_144,
sint64 v_138_144,
sint64 r_138_144,
sint64 s_138_144,
bit ne
)={
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (-(2**20)),
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (-(2**20))
&&
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (const 64 (-(2**20))),
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_5 + u_138_143 * (const 64 (2**21)) + v_138_143 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_5 + r_138_143 * (const 64 (2**21)) + s_138_143 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_5,
    neg_f_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_5,
    neg_g_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 143)) <=s delta, delta <=s (const 64 (1 + 2*143)),
    (const 64 (-(2**20))) <=s u_138_143, u_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_143, v_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_143, r_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_143, s_138_143 <=s (const 64 ((2**20))),
    u_138_143 + v_138_143 <=s (const 64 (2**20)),
    u_138_143 - v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 + v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 - v_138_143 <=s (const 64 (2**20)),
    r_138_143 + s_138_143 <=s (const 64 (2**20)),
    r_138_143 - s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 + s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 - s_138_143 <=s (const 64 (2**20)),
    u_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_138_143 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step143

// premise b
assume
neg_g_118_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_6 neg_f_118_low60_20_low20_5;
mov u_138_144 u_138_143;
mov v_138_144 v_138_143;

add neg_g_118_low60_20_low20_6 neg_g_118_low60_20_low20_5 neg_f_118_low60_20_low20_5;
asr neg_g_118_low60_20_low20_6 neg_g_118_low60_20_low20_6 1;
add r_138_144 r_138_143 u_138_143;
asr r_138_144 r_138_144 1;
add s_138_144 s_138_143 v_138_143;
asr s_138_144 s_138_144 1;
assert
    true
&&
    neg_f_118_low60_20_low20_6 = neg_f_118_low60_20_low20_5,
    u_138_144 = u_138_143,
    v_138_144 = v_138_143,
    neg_g_118_low60_20_low20_6 * (const 64 2) = neg_g_118_low60_20_low20_5 + neg_f_118_low60_20_low20_5,
    r_138_144 * (const 64 2) = r_138_143 + u_138_143,
    s_138_144 * (const 64 2) = s_138_143 + v_138_143
;

assume
    neg_f_118_low60_20_low20_6 = neg_f_118_low60_20_low20_5,
    u_138_144 = u_138_143,
    v_138_144 = v_138_143,
    neg_g_118_low60_20_low20_6 * 2 = neg_g_118_low60_20_low20_5 + neg_f_118_low60_20_low20_5,
    r_138_144 * 2 = r_138_143 + u_138_143,
    s_138_144 * 2 = s_138_143 + v_138_143
&&
    true
;

{
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_6 + u_138_144 * (const 64 (2**21)) + v_138_144 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_6 + r_138_144 * (const 64 (2**21)) + s_138_144 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_6,
    neg_f_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_6,
    neg_g_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 144)) <=s delta, delta <=s (const 64 (1 + 2*144)),
    (const 64 (-(2**20))) <=s u_138_144, u_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_144, v_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_144, r_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_144, s_138_144 <=s (const 64 ((2**20))),
    u_138_144 + v_138_144 <=s (const 64 (2**20)),
    u_138_144 - v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 + v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 - v_138_144 <=s (const 64 (2**20)),
    r_138_144 + s_138_144 <=s (const 64 (2**20)),
    r_138_144 - s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 + s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 - s_138_144 <=s (const 64 (2**20)),
    u_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_138_144 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_143_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_5,
sint64 neg_g_118_low60_20_low20_5,
sint64 neg_f_118_low60_20_low20_6,
sint64 neg_g_118_low60_20_low20_6,
sint64 u_138_143,
sint64 v_138_143,
sint64 r_138_143,
sint64 s_138_143,
sint64 u_138_144,
sint64 v_138_144,
sint64 r_138_144,
sint64 s_138_144,
bit ne
)={
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (-(2**20)),
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (-(2**20))
&&
    u_138_143 * neg_f_118_low60_20_low20_0 + v_138_143 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_5 * (const 64 (-(2**20))),
    r_138_143 * neg_f_118_low60_20_low20_0 + s_138_143 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_5 + u_138_143 * (const 64 (2**21)) + v_138_143 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_5 + r_138_143 * (const 64 (2**21)) + s_138_143 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_5,
    neg_f_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_5,
    neg_g_118_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 143)) <=s delta, delta <=s (const 64 (1 + 2*143)),
    (const 64 (-(2**20))) <=s u_138_143, u_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_143, v_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_143, r_138_143 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_143, s_138_143 <=s (const 64 ((2**20))),
    u_138_143 + v_138_143 <=s (const 64 (2**20)),
    u_138_143 - v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 + v_138_143 <=s (const 64 (2**20)),
    (const 64 0) - u_138_143 - v_138_143 <=s (const 64 (2**20)),
    r_138_143 + s_138_143 <=s (const 64 (2**20)),
    r_138_143 - s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 + s_138_143 <=s (const 64 (2**20)),
    (const 64 0) - r_138_143 - s_138_143 <=s (const 64 (2**20)),
    u_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_138_143 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_138_143 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step143

// premise c
assume
neg_g_118_low60_20_low20_5 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_6 neg_g_118_low60_20_low20_5;
mov u_138_144 r_138_143;
mov v_138_144 s_138_143;

subs dc neg_g_118_low60_20_low20_6 neg_g_118_low60_20_low20_5 neg_f_118_low60_20_low20_5;
asr neg_g_118_low60_20_low20_6 neg_g_118_low60_20_low20_6 1;
subs dc r_138_144 r_138_143 u_138_143;
asr r_138_144 r_138_144 1;
subs dc s_138_144 s_138_143 v_138_143;
asr s_138_144 s_138_144 1;
assert
    true
&&
    neg_f_118_low60_20_low20_6 = neg_g_118_low60_20_low20_5,
    u_138_144 = r_138_143,
    v_138_144 = s_138_143,
    neg_g_118_low60_20_low20_6 * (const 64 2) = neg_g_118_low60_20_low20_5 - neg_f_118_low60_20_low20_5,
    r_138_144 * (const 64 2) = r_138_143 - u_138_143,
    s_138_144 * (const 64 2) = s_138_143 - v_138_143
;

assume
    neg_f_118_low60_20_low20_6 = neg_g_118_low60_20_low20_5,
    u_138_144 = r_138_143,
    v_138_144 = s_138_143,
    neg_g_118_low60_20_low20_6 * 2 = neg_g_118_low60_20_low20_5 - neg_f_118_low60_20_low20_5,
    r_138_144 * 2 = r_138_143 - u_138_143,
    s_138_144 * 2 = s_138_143 - v_138_143
&&
    true
;

{
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_6 + u_138_144 * (const 64 (2**21)) + v_138_144 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_6 + r_138_144 * (const 64 (2**21)) + s_138_144 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_6,
    neg_f_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_6,
    neg_g_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 144)) <=s delta, delta <=s (const 64 (1 + 2*144)),
    (const 64 (-(2**20))) <=s u_138_144, u_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_144, v_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_144, r_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_144, s_138_144 <=s (const 64 ((2**20))),
    u_138_144 + v_138_144 <=s (const 64 (2**20)),
    u_138_144 - v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 + v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 - v_138_144 <=s (const 64 (2**20)),
    r_138_144 + s_138_144 <=s (const 64 (2**20)),
    r_138_144 - s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 + s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 - s_138_144 <=s (const 64 (2**20)),
    u_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_138_144 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_144_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_6,
sint64 neg_g_118_low60_20_low20_6,
sint64 neg_f_118_low60_20_low20_7,
sint64 neg_g_118_low60_20_low20_7,
sint64 u_138_144,
sint64 v_138_144,
sint64 r_138_144,
sint64 s_138_144,
sint64 u_138_145,
sint64 v_138_145,
sint64 r_138_145,
sint64 s_138_145,
bit ne
)={
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (-(2**20)),
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (-(2**20))
&&
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (const 64 (-(2**20))),
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_6 + u_138_144 * (const 64 (2**21)) + v_138_144 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_6 + r_138_144 * (const 64 (2**21)) + s_138_144 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_6,
    neg_f_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_6,
    neg_g_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 144)) <=s delta, delta <=s (const 64 (1 + 2*144)),
    (const 64 (-(2**20))) <=s u_138_144, u_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_144, v_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_144, r_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_144, s_138_144 <=s (const 64 ((2**20))),
    u_138_144 + v_138_144 <=s (const 64 (2**20)),
    u_138_144 - v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 + v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 - v_138_144 <=s (const 64 (2**20)),
    r_138_144 + s_138_144 <=s (const 64 (2**20)),
    r_138_144 - s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 + s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 - s_138_144 <=s (const 64 (2**20)),
    u_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_138_144 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step144

// premise a
assume
neg_g_118_low60_20_low20_6 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_7 neg_f_118_low60_20_low20_6;
mov u_138_145 u_138_144;
mov v_138_145 v_138_144;

asr neg_g_118_low60_20_low20_7 neg_g_118_low60_20_low20_6 1;
asr r_138_145 r_138_144 1;
asr s_138_145 s_138_144 1;
assert
    true
&&
    neg_f_118_low60_20_low20_7 = neg_f_118_low60_20_low20_6,
    u_138_145 = u_138_144,
    v_138_145 = v_138_144,
    neg_g_118_low60_20_low20_7 * (const 64 2) = neg_g_118_low60_20_low20_6,
    r_138_145 * (const 64 2) = r_138_144,
    s_138_145 * (const 64 2) = s_138_144
;

assume
    neg_f_118_low60_20_low20_7 = neg_f_118_low60_20_low20_6,
    u_138_145 = u_138_144,
    v_138_145 = v_138_144,
    neg_g_118_low60_20_low20_7 * 2 = neg_g_118_low60_20_low20_6,
    r_138_145 * 2 = r_138_144,
    s_138_145 * 2 = s_138_144
&&
    true
;

{
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_7 + u_138_145 * (const 64 (2**21)) + v_138_145 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_7 + r_138_145 * (const 64 (2**21)) + s_138_145 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_7,
    neg_f_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_7,
    neg_g_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 145)) <=s delta, delta <=s (const 64 (1 + 2*145)),
    (const 64 (-(2**20))) <=s u_138_145, u_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_145, v_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_145, r_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_145, s_138_145 <=s (const 64 ((2**20))),
    u_138_145 + v_138_145 <=s (const 64 (2**20)),
    u_138_145 - v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 + v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 - v_138_145 <=s (const 64 (2**20)),
    r_138_145 + s_138_145 <=s (const 64 (2**20)),
    r_138_145 - s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 + s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 - s_138_145 <=s (const 64 (2**20)),
    u_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_138_145 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_144_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_6,
sint64 neg_g_118_low60_20_low20_6,
sint64 neg_f_118_low60_20_low20_7,
sint64 neg_g_118_low60_20_low20_7,
sint64 u_138_144,
sint64 v_138_144,
sint64 r_138_144,
sint64 s_138_144,
sint64 u_138_145,
sint64 v_138_145,
sint64 r_138_145,
sint64 s_138_145,
bit ne
)={
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (-(2**20)),
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (-(2**20))
&&
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (const 64 (-(2**20))),
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_6 + u_138_144 * (const 64 (2**21)) + v_138_144 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_6 + r_138_144 * (const 64 (2**21)) + s_138_144 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_6,
    neg_f_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_6,
    neg_g_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 144)) <=s delta, delta <=s (const 64 (1 + 2*144)),
    (const 64 (-(2**20))) <=s u_138_144, u_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_144, v_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_144, r_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_144, s_138_144 <=s (const 64 ((2**20))),
    u_138_144 + v_138_144 <=s (const 64 (2**20)),
    u_138_144 - v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 + v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 - v_138_144 <=s (const 64 (2**20)),
    r_138_144 + s_138_144 <=s (const 64 (2**20)),
    r_138_144 - s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 + s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 - s_138_144 <=s (const 64 (2**20)),
    u_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_138_144 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step144

// premise b
assume
neg_g_118_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_7 neg_f_118_low60_20_low20_6;
mov u_138_145 u_138_144;
mov v_138_145 v_138_144;

add neg_g_118_low60_20_low20_7 neg_g_118_low60_20_low20_6 neg_f_118_low60_20_low20_6;
asr neg_g_118_low60_20_low20_7 neg_g_118_low60_20_low20_7 1;
add r_138_145 r_138_144 u_138_144;
asr r_138_145 r_138_145 1;
add s_138_145 s_138_144 v_138_144;
asr s_138_145 s_138_145 1;
assert
    true
&&
    neg_f_118_low60_20_low20_7 = neg_f_118_low60_20_low20_6,
    u_138_145 = u_138_144,
    v_138_145 = v_138_144,
    neg_g_118_low60_20_low20_7 * (const 64 2) = neg_g_118_low60_20_low20_6 + neg_f_118_low60_20_low20_6,
    r_138_145 * (const 64 2) = r_138_144 + u_138_144,
    s_138_145 * (const 64 2) = s_138_144 + v_138_144
;

assume
    neg_f_118_low60_20_low20_7 = neg_f_118_low60_20_low20_6,
    u_138_145 = u_138_144,
    v_138_145 = v_138_144,
    neg_g_118_low60_20_low20_7 * 2 = neg_g_118_low60_20_low20_6 + neg_f_118_low60_20_low20_6,
    r_138_145 * 2 = r_138_144 + u_138_144,
    s_138_145 * 2 = s_138_144 + v_138_144
&&
    true
;

{
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_7 + u_138_145 * (const 64 (2**21)) + v_138_145 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_7 + r_138_145 * (const 64 (2**21)) + s_138_145 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_7,
    neg_f_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_7,
    neg_g_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 145)) <=s delta, delta <=s (const 64 (1 + 2*145)),
    (const 64 (-(2**20))) <=s u_138_145, u_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_145, v_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_145, r_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_145, s_138_145 <=s (const 64 ((2**20))),
    u_138_145 + v_138_145 <=s (const 64 (2**20)),
    u_138_145 - v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 + v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 - v_138_145 <=s (const 64 (2**20)),
    r_138_145 + s_138_145 <=s (const 64 (2**20)),
    r_138_145 - s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 + s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 - s_138_145 <=s (const 64 (2**20)),
    u_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_138_145 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_144_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_6,
sint64 neg_g_118_low60_20_low20_6,
sint64 neg_f_118_low60_20_low20_7,
sint64 neg_g_118_low60_20_low20_7,
sint64 u_138_144,
sint64 v_138_144,
sint64 r_138_144,
sint64 s_138_144,
sint64 u_138_145,
sint64 v_138_145,
sint64 r_138_145,
sint64 s_138_145,
bit ne
)={
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (-(2**20)),
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (-(2**20))
&&
    u_138_144 * neg_f_118_low60_20_low20_0 + v_138_144 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_6 * (const 64 (-(2**20))),
    r_138_144 * neg_f_118_low60_20_low20_0 + s_138_144 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_6 + u_138_144 * (const 64 (2**21)) + v_138_144 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_6 + r_138_144 * (const 64 (2**21)) + s_138_144 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_6,
    neg_f_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_6,
    neg_g_118_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 144)) <=s delta, delta <=s (const 64 (1 + 2*144)),
    (const 64 (-(2**20))) <=s u_138_144, u_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_144, v_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_144, r_138_144 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_144, s_138_144 <=s (const 64 ((2**20))),
    u_138_144 + v_138_144 <=s (const 64 (2**20)),
    u_138_144 - v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 + v_138_144 <=s (const 64 (2**20)),
    (const 64 0) - u_138_144 - v_138_144 <=s (const 64 (2**20)),
    r_138_144 + s_138_144 <=s (const 64 (2**20)),
    r_138_144 - s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 + s_138_144 <=s (const 64 (2**20)),
    (const 64 0) - r_138_144 - s_138_144 <=s (const 64 (2**20)),
    u_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_138_144 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_138_144 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step144

// premise c
assume
neg_g_118_low60_20_low20_6 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_7 neg_g_118_low60_20_low20_6;
mov u_138_145 r_138_144;
mov v_138_145 s_138_144;

subs dc neg_g_118_low60_20_low20_7 neg_g_118_low60_20_low20_6 neg_f_118_low60_20_low20_6;
asr neg_g_118_low60_20_low20_7 neg_g_118_low60_20_low20_7 1;
subs dc r_138_145 r_138_144 u_138_144;
asr r_138_145 r_138_145 1;
subs dc s_138_145 s_138_144 v_138_144;
asr s_138_145 s_138_145 1;
assert
    true
&&
    neg_f_118_low60_20_low20_7 = neg_g_118_low60_20_low20_6,
    u_138_145 = r_138_144,
    v_138_145 = s_138_144,
    neg_g_118_low60_20_low20_7 * (const 64 2) = neg_g_118_low60_20_low20_6 - neg_f_118_low60_20_low20_6,
    r_138_145 * (const 64 2) = r_138_144 - u_138_144,
    s_138_145 * (const 64 2) = s_138_144 - v_138_144
;

assume
    neg_f_118_low60_20_low20_7 = neg_g_118_low60_20_low20_6,
    u_138_145 = r_138_144,
    v_138_145 = s_138_144,
    neg_g_118_low60_20_low20_7 * 2 = neg_g_118_low60_20_low20_6 - neg_f_118_low60_20_low20_6,
    r_138_145 * 2 = r_138_144 - u_138_144,
    s_138_145 * 2 = s_138_144 - v_138_144
&&
    true
;

{
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_7 + u_138_145 * (const 64 (2**21)) + v_138_145 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_7 + r_138_145 * (const 64 (2**21)) + s_138_145 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_7,
    neg_f_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_7,
    neg_g_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 145)) <=s delta, delta <=s (const 64 (1 + 2*145)),
    (const 64 (-(2**20))) <=s u_138_145, u_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_145, v_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_145, r_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_145, s_138_145 <=s (const 64 ((2**20))),
    u_138_145 + v_138_145 <=s (const 64 (2**20)),
    u_138_145 - v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 + v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 - v_138_145 <=s (const 64 (2**20)),
    r_138_145 + s_138_145 <=s (const 64 (2**20)),
    r_138_145 - s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 + s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 - s_138_145 <=s (const 64 (2**20)),
    u_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_138_145 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_145_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_7,
sint64 neg_g_118_low60_20_low20_7,
sint64 neg_f_118_low60_20_low20_8,
sint64 neg_g_118_low60_20_low20_8,
sint64 u_138_145,
sint64 v_138_145,
sint64 r_138_145,
sint64 s_138_145,
sint64 u_138_146,
sint64 v_138_146,
sint64 r_138_146,
sint64 s_138_146,
bit ne
)={
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (-(2**20)),
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (-(2**20))
&&
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (const 64 (-(2**20))),
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_7 + u_138_145 * (const 64 (2**21)) + v_138_145 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_7 + r_138_145 * (const 64 (2**21)) + s_138_145 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_7,
    neg_f_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_7,
    neg_g_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 145)) <=s delta, delta <=s (const 64 (1 + 2*145)),
    (const 64 (-(2**20))) <=s u_138_145, u_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_145, v_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_145, r_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_145, s_138_145 <=s (const 64 ((2**20))),
    u_138_145 + v_138_145 <=s (const 64 (2**20)),
    u_138_145 - v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 + v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 - v_138_145 <=s (const 64 (2**20)),
    r_138_145 + s_138_145 <=s (const 64 (2**20)),
    r_138_145 - s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 + s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 - s_138_145 <=s (const 64 (2**20)),
    u_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_138_145 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step145

// premise a
assume
neg_g_118_low60_20_low20_7 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_8 neg_f_118_low60_20_low20_7;
mov u_138_146 u_138_145;
mov v_138_146 v_138_145;

asr neg_g_118_low60_20_low20_8 neg_g_118_low60_20_low20_7 1;
asr r_138_146 r_138_145 1;
asr s_138_146 s_138_145 1;
assert
    true
&&
    neg_f_118_low60_20_low20_8 = neg_f_118_low60_20_low20_7,
    u_138_146 = u_138_145,
    v_138_146 = v_138_145,
    neg_g_118_low60_20_low20_8 * (const 64 2) = neg_g_118_low60_20_low20_7,
    r_138_146 * (const 64 2) = r_138_145,
    s_138_146 * (const 64 2) = s_138_145
;

assume
    neg_f_118_low60_20_low20_8 = neg_f_118_low60_20_low20_7,
    u_138_146 = u_138_145,
    v_138_146 = v_138_145,
    neg_g_118_low60_20_low20_8 * 2 = neg_g_118_low60_20_low20_7,
    r_138_146 * 2 = r_138_145,
    s_138_146 * 2 = s_138_145
&&
    true
;

{
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_8 + u_138_146 * (const 64 (2**21)) + v_138_146 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_8 + r_138_146 * (const 64 (2**21)) + s_138_146 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_8,
    neg_f_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_8,
    neg_g_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 146)) <=s delta, delta <=s (const 64 (1 + 2*146)),
    (const 64 (-(2**20))) <=s u_138_146, u_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_146, v_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_146, r_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_146, s_138_146 <=s (const 64 ((2**20))),
    u_138_146 + v_138_146 <=s (const 64 (2**20)),
    u_138_146 - v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 + v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 - v_138_146 <=s (const 64 (2**20)),
    r_138_146 + s_138_146 <=s (const 64 (2**20)),
    r_138_146 - s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 + s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 - s_138_146 <=s (const 64 (2**20)),
    u_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_138_146 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_145_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_7,
sint64 neg_g_118_low60_20_low20_7,
sint64 neg_f_118_low60_20_low20_8,
sint64 neg_g_118_low60_20_low20_8,
sint64 u_138_145,
sint64 v_138_145,
sint64 r_138_145,
sint64 s_138_145,
sint64 u_138_146,
sint64 v_138_146,
sint64 r_138_146,
sint64 s_138_146,
bit ne
)={
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (-(2**20)),
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (-(2**20))
&&
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (const 64 (-(2**20))),
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_7 + u_138_145 * (const 64 (2**21)) + v_138_145 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_7 + r_138_145 * (const 64 (2**21)) + s_138_145 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_7,
    neg_f_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_7,
    neg_g_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 145)) <=s delta, delta <=s (const 64 (1 + 2*145)),
    (const 64 (-(2**20))) <=s u_138_145, u_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_145, v_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_145, r_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_145, s_138_145 <=s (const 64 ((2**20))),
    u_138_145 + v_138_145 <=s (const 64 (2**20)),
    u_138_145 - v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 + v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 - v_138_145 <=s (const 64 (2**20)),
    r_138_145 + s_138_145 <=s (const 64 (2**20)),
    r_138_145 - s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 + s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 - s_138_145 <=s (const 64 (2**20)),
    u_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_138_145 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step145

// premise b
assume
neg_g_118_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_8 neg_f_118_low60_20_low20_7;
mov u_138_146 u_138_145;
mov v_138_146 v_138_145;

add neg_g_118_low60_20_low20_8 neg_g_118_low60_20_low20_7 neg_f_118_low60_20_low20_7;
asr neg_g_118_low60_20_low20_8 neg_g_118_low60_20_low20_8 1;
add r_138_146 r_138_145 u_138_145;
asr r_138_146 r_138_146 1;
add s_138_146 s_138_145 v_138_145;
asr s_138_146 s_138_146 1;
assert
    true
&&
    neg_f_118_low60_20_low20_8 = neg_f_118_low60_20_low20_7,
    u_138_146 = u_138_145,
    v_138_146 = v_138_145,
    neg_g_118_low60_20_low20_8 * (const 64 2) = neg_g_118_low60_20_low20_7 + neg_f_118_low60_20_low20_7,
    r_138_146 * (const 64 2) = r_138_145 + u_138_145,
    s_138_146 * (const 64 2) = s_138_145 + v_138_145
;

assume
    neg_f_118_low60_20_low20_8 = neg_f_118_low60_20_low20_7,
    u_138_146 = u_138_145,
    v_138_146 = v_138_145,
    neg_g_118_low60_20_low20_8 * 2 = neg_g_118_low60_20_low20_7 + neg_f_118_low60_20_low20_7,
    r_138_146 * 2 = r_138_145 + u_138_145,
    s_138_146 * 2 = s_138_145 + v_138_145
&&
    true
;

{
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_8 + u_138_146 * (const 64 (2**21)) + v_138_146 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_8 + r_138_146 * (const 64 (2**21)) + s_138_146 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_8,
    neg_f_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_8,
    neg_g_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 146)) <=s delta, delta <=s (const 64 (1 + 2*146)),
    (const 64 (-(2**20))) <=s u_138_146, u_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_146, v_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_146, r_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_146, s_138_146 <=s (const 64 ((2**20))),
    u_138_146 + v_138_146 <=s (const 64 (2**20)),
    u_138_146 - v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 + v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 - v_138_146 <=s (const 64 (2**20)),
    r_138_146 + s_138_146 <=s (const 64 (2**20)),
    r_138_146 - s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 + s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 - s_138_146 <=s (const 64 (2**20)),
    u_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_138_146 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_145_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_7,
sint64 neg_g_118_low60_20_low20_7,
sint64 neg_f_118_low60_20_low20_8,
sint64 neg_g_118_low60_20_low20_8,
sint64 u_138_145,
sint64 v_138_145,
sint64 r_138_145,
sint64 s_138_145,
sint64 u_138_146,
sint64 v_138_146,
sint64 r_138_146,
sint64 s_138_146,
bit ne
)={
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (-(2**20)),
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (-(2**20))
&&
    u_138_145 * neg_f_118_low60_20_low20_0 + v_138_145 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_7 * (const 64 (-(2**20))),
    r_138_145 * neg_f_118_low60_20_low20_0 + s_138_145 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_7 + u_138_145 * (const 64 (2**21)) + v_138_145 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_7 + r_138_145 * (const 64 (2**21)) + s_138_145 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_7,
    neg_f_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_7,
    neg_g_118_low60_20_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 145)) <=s delta, delta <=s (const 64 (1 + 2*145)),
    (const 64 (-(2**20))) <=s u_138_145, u_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_145, v_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_145, r_138_145 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_145, s_138_145 <=s (const 64 ((2**20))),
    u_138_145 + v_138_145 <=s (const 64 (2**20)),
    u_138_145 - v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 + v_138_145 <=s (const 64 (2**20)),
    (const 64 0) - u_138_145 - v_138_145 <=s (const 64 (2**20)),
    r_138_145 + s_138_145 <=s (const 64 (2**20)),
    r_138_145 - s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 + s_138_145 <=s (const 64 (2**20)),
    (const 64 0) - r_138_145 - s_138_145 <=s (const 64 (2**20)),
    u_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_138_145 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_138_145 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step145

// premise c
assume
neg_g_118_low60_20_low20_7 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_8 neg_g_118_low60_20_low20_7;
mov u_138_146 r_138_145;
mov v_138_146 s_138_145;

subs dc neg_g_118_low60_20_low20_8 neg_g_118_low60_20_low20_7 neg_f_118_low60_20_low20_7;
asr neg_g_118_low60_20_low20_8 neg_g_118_low60_20_low20_8 1;
subs dc r_138_146 r_138_145 u_138_145;
asr r_138_146 r_138_146 1;
subs dc s_138_146 s_138_145 v_138_145;
asr s_138_146 s_138_146 1;
assert
    true
&&
    neg_f_118_low60_20_low20_8 = neg_g_118_low60_20_low20_7,
    u_138_146 = r_138_145,
    v_138_146 = s_138_145,
    neg_g_118_low60_20_low20_8 * (const 64 2) = neg_g_118_low60_20_low20_7 - neg_f_118_low60_20_low20_7,
    r_138_146 * (const 64 2) = r_138_145 - u_138_145,
    s_138_146 * (const 64 2) = s_138_145 - v_138_145
;

assume
    neg_f_118_low60_20_low20_8 = neg_g_118_low60_20_low20_7,
    u_138_146 = r_138_145,
    v_138_146 = s_138_145,
    neg_g_118_low60_20_low20_8 * 2 = neg_g_118_low60_20_low20_7 - neg_f_118_low60_20_low20_7,
    r_138_146 * 2 = r_138_145 - u_138_145,
    s_138_146 * 2 = s_138_145 - v_138_145
&&
    true
;

{
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_8 + u_138_146 * (const 64 (2**21)) + v_138_146 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_8 + r_138_146 * (const 64 (2**21)) + s_138_146 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_8,
    neg_f_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_8,
    neg_g_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 146)) <=s delta, delta <=s (const 64 (1 + 2*146)),
    (const 64 (-(2**20))) <=s u_138_146, u_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_146, v_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_146, r_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_146, s_138_146 <=s (const 64 ((2**20))),
    u_138_146 + v_138_146 <=s (const 64 (2**20)),
    u_138_146 - v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 + v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 - v_138_146 <=s (const 64 (2**20)),
    r_138_146 + s_138_146 <=s (const 64 (2**20)),
    r_138_146 - s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 + s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 - s_138_146 <=s (const 64 (2**20)),
    u_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_138_146 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_146_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_8,
sint64 neg_g_118_low60_20_low20_8,
sint64 neg_f_118_low60_20_low20_9,
sint64 neg_g_118_low60_20_low20_9,
sint64 u_138_146,
sint64 v_138_146,
sint64 r_138_146,
sint64 s_138_146,
sint64 u_138_147,
sint64 v_138_147,
sint64 r_138_147,
sint64 s_138_147,
bit ne
)={
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (-(2**20)),
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (-(2**20))
&&
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (const 64 (-(2**20))),
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_8 + u_138_146 * (const 64 (2**21)) + v_138_146 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_8 + r_138_146 * (const 64 (2**21)) + s_138_146 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_8,
    neg_f_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_8,
    neg_g_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 146)) <=s delta, delta <=s (const 64 (1 + 2*146)),
    (const 64 (-(2**20))) <=s u_138_146, u_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_146, v_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_146, r_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_146, s_138_146 <=s (const 64 ((2**20))),
    u_138_146 + v_138_146 <=s (const 64 (2**20)),
    u_138_146 - v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 + v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 - v_138_146 <=s (const 64 (2**20)),
    r_138_146 + s_138_146 <=s (const 64 (2**20)),
    r_138_146 - s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 + s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 - s_138_146 <=s (const 64 (2**20)),
    u_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_138_146 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step146

// premise a
assume
neg_g_118_low60_20_low20_8 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_9 neg_f_118_low60_20_low20_8;
mov u_138_147 u_138_146;
mov v_138_147 v_138_146;

asr neg_g_118_low60_20_low20_9 neg_g_118_low60_20_low20_8 1;
asr r_138_147 r_138_146 1;
asr s_138_147 s_138_146 1;
assert
    true
&&
    neg_f_118_low60_20_low20_9 = neg_f_118_low60_20_low20_8,
    u_138_147 = u_138_146,
    v_138_147 = v_138_146,
    neg_g_118_low60_20_low20_9 * (const 64 2) = neg_g_118_low60_20_low20_8,
    r_138_147 * (const 64 2) = r_138_146,
    s_138_147 * (const 64 2) = s_138_146
;

assume
    neg_f_118_low60_20_low20_9 = neg_f_118_low60_20_low20_8,
    u_138_147 = u_138_146,
    v_138_147 = v_138_146,
    neg_g_118_low60_20_low20_9 * 2 = neg_g_118_low60_20_low20_8,
    r_138_147 * 2 = r_138_146,
    s_138_147 * 2 = s_138_146
&&
    true
;

{
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_9 + u_138_147 * (const 64 (2**21)) + v_138_147 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_9 + r_138_147 * (const 64 (2**21)) + s_138_147 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_9,
    neg_f_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_9,
    neg_g_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 147)) <=s delta, delta <=s (const 64 (1 + 2*147)),
    (const 64 (-(2**20))) <=s u_138_147, u_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_147, v_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_147, r_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_147, s_138_147 <=s (const 64 ((2**20))),
    u_138_147 + v_138_147 <=s (const 64 (2**20)),
    u_138_147 - v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 + v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 - v_138_147 <=s (const 64 (2**20)),
    r_138_147 + s_138_147 <=s (const 64 (2**20)),
    r_138_147 - s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 + s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 - s_138_147 <=s (const 64 (2**20)),
    u_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_138_147 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_146_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_8,
sint64 neg_g_118_low60_20_low20_8,
sint64 neg_f_118_low60_20_low20_9,
sint64 neg_g_118_low60_20_low20_9,
sint64 u_138_146,
sint64 v_138_146,
sint64 r_138_146,
sint64 s_138_146,
sint64 u_138_147,
sint64 v_138_147,
sint64 r_138_147,
sint64 s_138_147,
bit ne
)={
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (-(2**20)),
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (-(2**20))
&&
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (const 64 (-(2**20))),
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_8 + u_138_146 * (const 64 (2**21)) + v_138_146 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_8 + r_138_146 * (const 64 (2**21)) + s_138_146 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_8,
    neg_f_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_8,
    neg_g_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 146)) <=s delta, delta <=s (const 64 (1 + 2*146)),
    (const 64 (-(2**20))) <=s u_138_146, u_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_146, v_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_146, r_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_146, s_138_146 <=s (const 64 ((2**20))),
    u_138_146 + v_138_146 <=s (const 64 (2**20)),
    u_138_146 - v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 + v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 - v_138_146 <=s (const 64 (2**20)),
    r_138_146 + s_138_146 <=s (const 64 (2**20)),
    r_138_146 - s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 + s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 - s_138_146 <=s (const 64 (2**20)),
    u_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_138_146 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step146

// premise b
assume
neg_g_118_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_9 neg_f_118_low60_20_low20_8;
mov u_138_147 u_138_146;
mov v_138_147 v_138_146;

add neg_g_118_low60_20_low20_9 neg_g_118_low60_20_low20_8 neg_f_118_low60_20_low20_8;
asr neg_g_118_low60_20_low20_9 neg_g_118_low60_20_low20_9 1;
add r_138_147 r_138_146 u_138_146;
asr r_138_147 r_138_147 1;
add s_138_147 s_138_146 v_138_146;
asr s_138_147 s_138_147 1;
assert
    true
&&
    neg_f_118_low60_20_low20_9 = neg_f_118_low60_20_low20_8,
    u_138_147 = u_138_146,
    v_138_147 = v_138_146,
    neg_g_118_low60_20_low20_9 * (const 64 2) = neg_g_118_low60_20_low20_8 + neg_f_118_low60_20_low20_8,
    r_138_147 * (const 64 2) = r_138_146 + u_138_146,
    s_138_147 * (const 64 2) = s_138_146 + v_138_146
;

assume
    neg_f_118_low60_20_low20_9 = neg_f_118_low60_20_low20_8,
    u_138_147 = u_138_146,
    v_138_147 = v_138_146,
    neg_g_118_low60_20_low20_9 * 2 = neg_g_118_low60_20_low20_8 + neg_f_118_low60_20_low20_8,
    r_138_147 * 2 = r_138_146 + u_138_146,
    s_138_147 * 2 = s_138_146 + v_138_146
&&
    true
;

{
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_9 + u_138_147 * (const 64 (2**21)) + v_138_147 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_9 + r_138_147 * (const 64 (2**21)) + s_138_147 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_9,
    neg_f_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_9,
    neg_g_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 147)) <=s delta, delta <=s (const 64 (1 + 2*147)),
    (const 64 (-(2**20))) <=s u_138_147, u_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_147, v_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_147, r_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_147, s_138_147 <=s (const 64 ((2**20))),
    u_138_147 + v_138_147 <=s (const 64 (2**20)),
    u_138_147 - v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 + v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 - v_138_147 <=s (const 64 (2**20)),
    r_138_147 + s_138_147 <=s (const 64 (2**20)),
    r_138_147 - s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 + s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 - s_138_147 <=s (const 64 (2**20)),
    u_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_138_147 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_146_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_8,
sint64 neg_g_118_low60_20_low20_8,
sint64 neg_f_118_low60_20_low20_9,
sint64 neg_g_118_low60_20_low20_9,
sint64 u_138_146,
sint64 v_138_146,
sint64 r_138_146,
sint64 s_138_146,
sint64 u_138_147,
sint64 v_138_147,
sint64 r_138_147,
sint64 s_138_147,
bit ne
)={
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (-(2**20)),
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (-(2**20))
&&
    u_138_146 * neg_f_118_low60_20_low20_0 + v_138_146 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_8 * (const 64 (-(2**20))),
    r_138_146 * neg_f_118_low60_20_low20_0 + s_138_146 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_8 + u_138_146 * (const 64 (2**21)) + v_138_146 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_8 + r_138_146 * (const 64 (2**21)) + s_138_146 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_8,
    neg_f_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_8,
    neg_g_118_low60_20_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 146)) <=s delta, delta <=s (const 64 (1 + 2*146)),
    (const 64 (-(2**20))) <=s u_138_146, u_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_146, v_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_146, r_138_146 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_146, s_138_146 <=s (const 64 ((2**20))),
    u_138_146 + v_138_146 <=s (const 64 (2**20)),
    u_138_146 - v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 + v_138_146 <=s (const 64 (2**20)),
    (const 64 0) - u_138_146 - v_138_146 <=s (const 64 (2**20)),
    r_138_146 + s_138_146 <=s (const 64 (2**20)),
    r_138_146 - s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 + s_138_146 <=s (const 64 (2**20)),
    (const 64 0) - r_138_146 - s_138_146 <=s (const 64 (2**20)),
    u_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_138_146 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_138_146 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step146

// premise c
assume
neg_g_118_low60_20_low20_8 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_9 neg_g_118_low60_20_low20_8;
mov u_138_147 r_138_146;
mov v_138_147 s_138_146;

subs dc neg_g_118_low60_20_low20_9 neg_g_118_low60_20_low20_8 neg_f_118_low60_20_low20_8;
asr neg_g_118_low60_20_low20_9 neg_g_118_low60_20_low20_9 1;
subs dc r_138_147 r_138_146 u_138_146;
asr r_138_147 r_138_147 1;
subs dc s_138_147 s_138_146 v_138_146;
asr s_138_147 s_138_147 1;
assert
    true
&&
    neg_f_118_low60_20_low20_9 = neg_g_118_low60_20_low20_8,
    u_138_147 = r_138_146,
    v_138_147 = s_138_146,
    neg_g_118_low60_20_low20_9 * (const 64 2) = neg_g_118_low60_20_low20_8 - neg_f_118_low60_20_low20_8,
    r_138_147 * (const 64 2) = r_138_146 - u_138_146,
    s_138_147 * (const 64 2) = s_138_146 - v_138_146
;

assume
    neg_f_118_low60_20_low20_9 = neg_g_118_low60_20_low20_8,
    u_138_147 = r_138_146,
    v_138_147 = s_138_146,
    neg_g_118_low60_20_low20_9 * 2 = neg_g_118_low60_20_low20_8 - neg_f_118_low60_20_low20_8,
    r_138_147 * 2 = r_138_146 - u_138_146,
    s_138_147 * 2 = s_138_146 - v_138_146
&&
    true
;

{
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_9 + u_138_147 * (const 64 (2**21)) + v_138_147 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_9 + r_138_147 * (const 64 (2**21)) + s_138_147 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_9,
    neg_f_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_9,
    neg_g_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 147)) <=s delta, delta <=s (const 64 (1 + 2*147)),
    (const 64 (-(2**20))) <=s u_138_147, u_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_147, v_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_147, r_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_147, s_138_147 <=s (const 64 ((2**20))),
    u_138_147 + v_138_147 <=s (const 64 (2**20)),
    u_138_147 - v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 + v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 - v_138_147 <=s (const 64 (2**20)),
    r_138_147 + s_138_147 <=s (const 64 (2**20)),
    r_138_147 - s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 + s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 - s_138_147 <=s (const 64 (2**20)),
    u_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_138_147 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_147_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_9,
sint64 neg_g_118_low60_20_low20_9,
sint64 neg_f_118_low60_20_low20_10,
sint64 neg_g_118_low60_20_low20_10,
sint64 u_138_147,
sint64 v_138_147,
sint64 r_138_147,
sint64 s_138_147,
sint64 u_138_148,
sint64 v_138_148,
sint64 r_138_148,
sint64 s_138_148,
bit ne
)={
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (-(2**20)),
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (-(2**20))
&&
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (const 64 (-(2**20))),
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_9 + u_138_147 * (const 64 (2**21)) + v_138_147 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_9 + r_138_147 * (const 64 (2**21)) + s_138_147 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_9,
    neg_f_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_9,
    neg_g_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 147)) <=s delta, delta <=s (const 64 (1 + 2*147)),
    (const 64 (-(2**20))) <=s u_138_147, u_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_147, v_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_147, r_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_147, s_138_147 <=s (const 64 ((2**20))),
    u_138_147 + v_138_147 <=s (const 64 (2**20)),
    u_138_147 - v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 + v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 - v_138_147 <=s (const 64 (2**20)),
    r_138_147 + s_138_147 <=s (const 64 (2**20)),
    r_138_147 - s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 + s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 - s_138_147 <=s (const 64 (2**20)),
    u_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_138_147 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step147

// premise a
assume
neg_g_118_low60_20_low20_9 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_10 neg_f_118_low60_20_low20_9;
mov u_138_148 u_138_147;
mov v_138_148 v_138_147;

asr neg_g_118_low60_20_low20_10 neg_g_118_low60_20_low20_9 1;
asr r_138_148 r_138_147 1;
asr s_138_148 s_138_147 1;
assert
    true
&&
    neg_f_118_low60_20_low20_10 = neg_f_118_low60_20_low20_9,
    u_138_148 = u_138_147,
    v_138_148 = v_138_147,
    neg_g_118_low60_20_low20_10 * (const 64 2) = neg_g_118_low60_20_low20_9,
    r_138_148 * (const 64 2) = r_138_147,
    s_138_148 * (const 64 2) = s_138_147
;

assume
    neg_f_118_low60_20_low20_10 = neg_f_118_low60_20_low20_9,
    u_138_148 = u_138_147,
    v_138_148 = v_138_147,
    neg_g_118_low60_20_low20_10 * 2 = neg_g_118_low60_20_low20_9,
    r_138_148 * 2 = r_138_147,
    s_138_148 * 2 = s_138_147
&&
    true
;

{
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_10 + u_138_148 * (const 64 (2**21)) + v_138_148 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_10 + r_138_148 * (const 64 (2**21)) + s_138_148 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_10,
    neg_f_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_10,
    neg_g_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 148)) <=s delta, delta <=s (const 64 (1 + 2*148)),
    (const 64 (-(2**20))) <=s u_138_148, u_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_148, v_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_148, r_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_148, s_138_148 <=s (const 64 ((2**20))),
    u_138_148 + v_138_148 <=s (const 64 (2**20)),
    u_138_148 - v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 + v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 - v_138_148 <=s (const 64 (2**20)),
    r_138_148 + s_138_148 <=s (const 64 (2**20)),
    r_138_148 - s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 + s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 - s_138_148 <=s (const 64 (2**20)),
    u_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_138_148 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_147_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_9,
sint64 neg_g_118_low60_20_low20_9,
sint64 neg_f_118_low60_20_low20_10,
sint64 neg_g_118_low60_20_low20_10,
sint64 u_138_147,
sint64 v_138_147,
sint64 r_138_147,
sint64 s_138_147,
sint64 u_138_148,
sint64 v_138_148,
sint64 r_138_148,
sint64 s_138_148,
bit ne
)={
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (-(2**20)),
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (-(2**20))
&&
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (const 64 (-(2**20))),
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_9 + u_138_147 * (const 64 (2**21)) + v_138_147 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_9 + r_138_147 * (const 64 (2**21)) + s_138_147 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_9,
    neg_f_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_9,
    neg_g_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 147)) <=s delta, delta <=s (const 64 (1 + 2*147)),
    (const 64 (-(2**20))) <=s u_138_147, u_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_147, v_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_147, r_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_147, s_138_147 <=s (const 64 ((2**20))),
    u_138_147 + v_138_147 <=s (const 64 (2**20)),
    u_138_147 - v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 + v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 - v_138_147 <=s (const 64 (2**20)),
    r_138_147 + s_138_147 <=s (const 64 (2**20)),
    r_138_147 - s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 + s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 - s_138_147 <=s (const 64 (2**20)),
    u_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_138_147 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step147

// premise b
assume
neg_g_118_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_10 neg_f_118_low60_20_low20_9;
mov u_138_148 u_138_147;
mov v_138_148 v_138_147;

add neg_g_118_low60_20_low20_10 neg_g_118_low60_20_low20_9 neg_f_118_low60_20_low20_9;
asr neg_g_118_low60_20_low20_10 neg_g_118_low60_20_low20_10 1;
add r_138_148 r_138_147 u_138_147;
asr r_138_148 r_138_148 1;
add s_138_148 s_138_147 v_138_147;
asr s_138_148 s_138_148 1;
assert
    true
&&
    neg_f_118_low60_20_low20_10 = neg_f_118_low60_20_low20_9,
    u_138_148 = u_138_147,
    v_138_148 = v_138_147,
    neg_g_118_low60_20_low20_10 * (const 64 2) = neg_g_118_low60_20_low20_9 + neg_f_118_low60_20_low20_9,
    r_138_148 * (const 64 2) = r_138_147 + u_138_147,
    s_138_148 * (const 64 2) = s_138_147 + v_138_147
;

assume
    neg_f_118_low60_20_low20_10 = neg_f_118_low60_20_low20_9,
    u_138_148 = u_138_147,
    v_138_148 = v_138_147,
    neg_g_118_low60_20_low20_10 * 2 = neg_g_118_low60_20_low20_9 + neg_f_118_low60_20_low20_9,
    r_138_148 * 2 = r_138_147 + u_138_147,
    s_138_148 * 2 = s_138_147 + v_138_147
&&
    true
;

{
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_10 + u_138_148 * (const 64 (2**21)) + v_138_148 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_10 + r_138_148 * (const 64 (2**21)) + s_138_148 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_10,
    neg_f_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_10,
    neg_g_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 148)) <=s delta, delta <=s (const 64 (1 + 2*148)),
    (const 64 (-(2**20))) <=s u_138_148, u_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_148, v_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_148, r_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_148, s_138_148 <=s (const 64 ((2**20))),
    u_138_148 + v_138_148 <=s (const 64 (2**20)),
    u_138_148 - v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 + v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 - v_138_148 <=s (const 64 (2**20)),
    r_138_148 + s_138_148 <=s (const 64 (2**20)),
    r_138_148 - s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 + s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 - s_138_148 <=s (const 64 (2**20)),
    u_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_138_148 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_147_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_9,
sint64 neg_g_118_low60_20_low20_9,
sint64 neg_f_118_low60_20_low20_10,
sint64 neg_g_118_low60_20_low20_10,
sint64 u_138_147,
sint64 v_138_147,
sint64 r_138_147,
sint64 s_138_147,
sint64 u_138_148,
sint64 v_138_148,
sint64 r_138_148,
sint64 s_138_148,
bit ne
)={
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (-(2**20)),
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (-(2**20))
&&
    u_138_147 * neg_f_118_low60_20_low20_0 + v_138_147 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_9 * (const 64 (-(2**20))),
    r_138_147 * neg_f_118_low60_20_low20_0 + s_138_147 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_9 + u_138_147 * (const 64 (2**21)) + v_138_147 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_9 + r_138_147 * (const 64 (2**21)) + s_138_147 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_9,
    neg_f_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_9,
    neg_g_118_low60_20_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 147)) <=s delta, delta <=s (const 64 (1 + 2*147)),
    (const 64 (-(2**20))) <=s u_138_147, u_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_147, v_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_147, r_138_147 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_147, s_138_147 <=s (const 64 ((2**20))),
    u_138_147 + v_138_147 <=s (const 64 (2**20)),
    u_138_147 - v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 + v_138_147 <=s (const 64 (2**20)),
    (const 64 0) - u_138_147 - v_138_147 <=s (const 64 (2**20)),
    r_138_147 + s_138_147 <=s (const 64 (2**20)),
    r_138_147 - s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 + s_138_147 <=s (const 64 (2**20)),
    (const 64 0) - r_138_147 - s_138_147 <=s (const 64 (2**20)),
    u_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_138_147 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_138_147 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step147

// premise c
assume
neg_g_118_low60_20_low20_9 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_10 neg_g_118_low60_20_low20_9;
mov u_138_148 r_138_147;
mov v_138_148 s_138_147;

subs dc neg_g_118_low60_20_low20_10 neg_g_118_low60_20_low20_9 neg_f_118_low60_20_low20_9;
asr neg_g_118_low60_20_low20_10 neg_g_118_low60_20_low20_10 1;
subs dc r_138_148 r_138_147 u_138_147;
asr r_138_148 r_138_148 1;
subs dc s_138_148 s_138_147 v_138_147;
asr s_138_148 s_138_148 1;
assert
    true
&&
    neg_f_118_low60_20_low20_10 = neg_g_118_low60_20_low20_9,
    u_138_148 = r_138_147,
    v_138_148 = s_138_147,
    neg_g_118_low60_20_low20_10 * (const 64 2) = neg_g_118_low60_20_low20_9 - neg_f_118_low60_20_low20_9,
    r_138_148 * (const 64 2) = r_138_147 - u_138_147,
    s_138_148 * (const 64 2) = s_138_147 - v_138_147
;

assume
    neg_f_118_low60_20_low20_10 = neg_g_118_low60_20_low20_9,
    u_138_148 = r_138_147,
    v_138_148 = s_138_147,
    neg_g_118_low60_20_low20_10 * 2 = neg_g_118_low60_20_low20_9 - neg_f_118_low60_20_low20_9,
    r_138_148 * 2 = r_138_147 - u_138_147,
    s_138_148 * 2 = s_138_147 - v_138_147
&&
    true
;

{
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_10 + u_138_148 * (const 64 (2**21)) + v_138_148 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_10 + r_138_148 * (const 64 (2**21)) + s_138_148 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_10,
    neg_f_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_10,
    neg_g_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 148)) <=s delta, delta <=s (const 64 (1 + 2*148)),
    (const 64 (-(2**20))) <=s u_138_148, u_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_148, v_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_148, r_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_148, s_138_148 <=s (const 64 ((2**20))),
    u_138_148 + v_138_148 <=s (const 64 (2**20)),
    u_138_148 - v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 + v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 - v_138_148 <=s (const 64 (2**20)),
    r_138_148 + s_138_148 <=s (const 64 (2**20)),
    r_138_148 - s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 + s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 - s_138_148 <=s (const 64 (2**20)),
    u_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_138_148 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_148_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_10,
sint64 neg_g_118_low60_20_low20_10,
sint64 neg_f_118_low60_20_low20_11,
sint64 neg_g_118_low60_20_low20_11,
sint64 u_138_148,
sint64 v_138_148,
sint64 r_138_148,
sint64 s_138_148,
sint64 u_138_149,
sint64 v_138_149,
sint64 r_138_149,
sint64 s_138_149,
bit ne
)={
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (-(2**20)),
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (-(2**20))
&&
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (const 64 (-(2**20))),
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_10 + u_138_148 * (const 64 (2**21)) + v_138_148 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_10 + r_138_148 * (const 64 (2**21)) + s_138_148 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_10,
    neg_f_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_10,
    neg_g_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 148)) <=s delta, delta <=s (const 64 (1 + 2*148)),
    (const 64 (-(2**20))) <=s u_138_148, u_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_148, v_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_148, r_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_148, s_138_148 <=s (const 64 ((2**20))),
    u_138_148 + v_138_148 <=s (const 64 (2**20)),
    u_138_148 - v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 + v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 - v_138_148 <=s (const 64 (2**20)),
    r_138_148 + s_138_148 <=s (const 64 (2**20)),
    r_138_148 - s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 + s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 - s_138_148 <=s (const 64 (2**20)),
    u_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_138_148 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step148

// premise a
assume
neg_g_118_low60_20_low20_10 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_11 neg_f_118_low60_20_low20_10;
mov u_138_149 u_138_148;
mov v_138_149 v_138_148;

asr neg_g_118_low60_20_low20_11 neg_g_118_low60_20_low20_10 1;
asr r_138_149 r_138_148 1;
asr s_138_149 s_138_148 1;
assert
    true
&&
    neg_f_118_low60_20_low20_11 = neg_f_118_low60_20_low20_10,
    u_138_149 = u_138_148,
    v_138_149 = v_138_148,
    neg_g_118_low60_20_low20_11 * (const 64 2) = neg_g_118_low60_20_low20_10,
    r_138_149 * (const 64 2) = r_138_148,
    s_138_149 * (const 64 2) = s_138_148
;

assume
    neg_f_118_low60_20_low20_11 = neg_f_118_low60_20_low20_10,
    u_138_149 = u_138_148,
    v_138_149 = v_138_148,
    neg_g_118_low60_20_low20_11 * 2 = neg_g_118_low60_20_low20_10,
    r_138_149 * 2 = r_138_148,
    s_138_149 * 2 = s_138_148
&&
    true
;

{
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_11 + u_138_149 * (const 64 (2**21)) + v_138_149 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_11 + r_138_149 * (const 64 (2**21)) + s_138_149 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_11,
    neg_f_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_11,
    neg_g_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 149)) <=s delta, delta <=s (const 64 (1 + 2*149)),
    (const 64 (-(2**20))) <=s u_138_149, u_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_149, v_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_149, r_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_149, s_138_149 <=s (const 64 ((2**20))),
    u_138_149 + v_138_149 <=s (const 64 (2**20)),
    u_138_149 - v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 + v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 - v_138_149 <=s (const 64 (2**20)),
    r_138_149 + s_138_149 <=s (const 64 (2**20)),
    r_138_149 - s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 + s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 - s_138_149 <=s (const 64 (2**20)),
    u_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_138_149 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_148_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_10,
sint64 neg_g_118_low60_20_low20_10,
sint64 neg_f_118_low60_20_low20_11,
sint64 neg_g_118_low60_20_low20_11,
sint64 u_138_148,
sint64 v_138_148,
sint64 r_138_148,
sint64 s_138_148,
sint64 u_138_149,
sint64 v_138_149,
sint64 r_138_149,
sint64 s_138_149,
bit ne
)={
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (-(2**20)),
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (-(2**20))
&&
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (const 64 (-(2**20))),
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_10 + u_138_148 * (const 64 (2**21)) + v_138_148 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_10 + r_138_148 * (const 64 (2**21)) + s_138_148 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_10,
    neg_f_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_10,
    neg_g_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 148)) <=s delta, delta <=s (const 64 (1 + 2*148)),
    (const 64 (-(2**20))) <=s u_138_148, u_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_148, v_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_148, r_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_148, s_138_148 <=s (const 64 ((2**20))),
    u_138_148 + v_138_148 <=s (const 64 (2**20)),
    u_138_148 - v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 + v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 - v_138_148 <=s (const 64 (2**20)),
    r_138_148 + s_138_148 <=s (const 64 (2**20)),
    r_138_148 - s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 + s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 - s_138_148 <=s (const 64 (2**20)),
    u_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_138_148 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step148

// premise b
assume
neg_g_118_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_11 neg_f_118_low60_20_low20_10;
mov u_138_149 u_138_148;
mov v_138_149 v_138_148;

add neg_g_118_low60_20_low20_11 neg_g_118_low60_20_low20_10 neg_f_118_low60_20_low20_10;
asr neg_g_118_low60_20_low20_11 neg_g_118_low60_20_low20_11 1;
add r_138_149 r_138_148 u_138_148;
asr r_138_149 r_138_149 1;
add s_138_149 s_138_148 v_138_148;
asr s_138_149 s_138_149 1;
assert
    true
&&
    neg_f_118_low60_20_low20_11 = neg_f_118_low60_20_low20_10,
    u_138_149 = u_138_148,
    v_138_149 = v_138_148,
    neg_g_118_low60_20_low20_11 * (const 64 2) = neg_g_118_low60_20_low20_10 + neg_f_118_low60_20_low20_10,
    r_138_149 * (const 64 2) = r_138_148 + u_138_148,
    s_138_149 * (const 64 2) = s_138_148 + v_138_148
;

assume
    neg_f_118_low60_20_low20_11 = neg_f_118_low60_20_low20_10,
    u_138_149 = u_138_148,
    v_138_149 = v_138_148,
    neg_g_118_low60_20_low20_11 * 2 = neg_g_118_low60_20_low20_10 + neg_f_118_low60_20_low20_10,
    r_138_149 * 2 = r_138_148 + u_138_148,
    s_138_149 * 2 = s_138_148 + v_138_148
&&
    true
;

{
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_11 + u_138_149 * (const 64 (2**21)) + v_138_149 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_11 + r_138_149 * (const 64 (2**21)) + s_138_149 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_11,
    neg_f_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_11,
    neg_g_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 149)) <=s delta, delta <=s (const 64 (1 + 2*149)),
    (const 64 (-(2**20))) <=s u_138_149, u_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_149, v_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_149, r_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_149, s_138_149 <=s (const 64 ((2**20))),
    u_138_149 + v_138_149 <=s (const 64 (2**20)),
    u_138_149 - v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 + v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 - v_138_149 <=s (const 64 (2**20)),
    r_138_149 + s_138_149 <=s (const 64 (2**20)),
    r_138_149 - s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 + s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 - s_138_149 <=s (const 64 (2**20)),
    u_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_138_149 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_148_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_10,
sint64 neg_g_118_low60_20_low20_10,
sint64 neg_f_118_low60_20_low20_11,
sint64 neg_g_118_low60_20_low20_11,
sint64 u_138_148,
sint64 v_138_148,
sint64 r_138_148,
sint64 s_138_148,
sint64 u_138_149,
sint64 v_138_149,
sint64 r_138_149,
sint64 s_138_149,
bit ne
)={
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (-(2**20)),
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (-(2**20))
&&
    u_138_148 * neg_f_118_low60_20_low20_0 + v_138_148 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_10 * (const 64 (-(2**20))),
    r_138_148 * neg_f_118_low60_20_low20_0 + s_138_148 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_10 + u_138_148 * (const 64 (2**21)) + v_138_148 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_10 + r_138_148 * (const 64 (2**21)) + s_138_148 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_10,
    neg_f_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_10,
    neg_g_118_low60_20_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 148)) <=s delta, delta <=s (const 64 (1 + 2*148)),
    (const 64 (-(2**20))) <=s u_138_148, u_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_148, v_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_148, r_138_148 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_148, s_138_148 <=s (const 64 ((2**20))),
    u_138_148 + v_138_148 <=s (const 64 (2**20)),
    u_138_148 - v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 + v_138_148 <=s (const 64 (2**20)),
    (const 64 0) - u_138_148 - v_138_148 <=s (const 64 (2**20)),
    r_138_148 + s_138_148 <=s (const 64 (2**20)),
    r_138_148 - s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 + s_138_148 <=s (const 64 (2**20)),
    (const 64 0) - r_138_148 - s_138_148 <=s (const 64 (2**20)),
    u_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_138_148 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_138_148 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step148

// premise c
assume
neg_g_118_low60_20_low20_10 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_11 neg_g_118_low60_20_low20_10;
mov u_138_149 r_138_148;
mov v_138_149 s_138_148;

subs dc neg_g_118_low60_20_low20_11 neg_g_118_low60_20_low20_10 neg_f_118_low60_20_low20_10;
asr neg_g_118_low60_20_low20_11 neg_g_118_low60_20_low20_11 1;
subs dc r_138_149 r_138_148 u_138_148;
asr r_138_149 r_138_149 1;
subs dc s_138_149 s_138_148 v_138_148;
asr s_138_149 s_138_149 1;
assert
    true
&&
    neg_f_118_low60_20_low20_11 = neg_g_118_low60_20_low20_10,
    u_138_149 = r_138_148,
    v_138_149 = s_138_148,
    neg_g_118_low60_20_low20_11 * (const 64 2) = neg_g_118_low60_20_low20_10 - neg_f_118_low60_20_low20_10,
    r_138_149 * (const 64 2) = r_138_148 - u_138_148,
    s_138_149 * (const 64 2) = s_138_148 - v_138_148
;

assume
    neg_f_118_low60_20_low20_11 = neg_g_118_low60_20_low20_10,
    u_138_149 = r_138_148,
    v_138_149 = s_138_148,
    neg_g_118_low60_20_low20_11 * 2 = neg_g_118_low60_20_low20_10 - neg_f_118_low60_20_low20_10,
    r_138_149 * 2 = r_138_148 - u_138_148,
    s_138_149 * 2 = s_138_148 - v_138_148
&&
    true
;

{
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_11 + u_138_149 * (const 64 (2**21)) + v_138_149 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_11 + r_138_149 * (const 64 (2**21)) + s_138_149 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_11,
    neg_f_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_11,
    neg_g_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 149)) <=s delta, delta <=s (const 64 (1 + 2*149)),
    (const 64 (-(2**20))) <=s u_138_149, u_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_149, v_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_149, r_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_149, s_138_149 <=s (const 64 ((2**20))),
    u_138_149 + v_138_149 <=s (const 64 (2**20)),
    u_138_149 - v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 + v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 - v_138_149 <=s (const 64 (2**20)),
    r_138_149 + s_138_149 <=s (const 64 (2**20)),
    r_138_149 - s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 + s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 - s_138_149 <=s (const 64 (2**20)),
    u_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_138_149 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_149_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_11,
sint64 neg_g_118_low60_20_low20_11,
sint64 neg_f_118_low60_20_low20_12,
sint64 neg_g_118_low60_20_low20_12,
sint64 u_138_149,
sint64 v_138_149,
sint64 r_138_149,
sint64 s_138_149,
sint64 u_138_150,
sint64 v_138_150,
sint64 r_138_150,
sint64 s_138_150,
bit ne
)={
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (-(2**20)),
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (-(2**20))
&&
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (const 64 (-(2**20))),
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_11 + u_138_149 * (const 64 (2**21)) + v_138_149 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_11 + r_138_149 * (const 64 (2**21)) + s_138_149 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_11,
    neg_f_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_11,
    neg_g_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 149)) <=s delta, delta <=s (const 64 (1 + 2*149)),
    (const 64 (-(2**20))) <=s u_138_149, u_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_149, v_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_149, r_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_149, s_138_149 <=s (const 64 ((2**20))),
    u_138_149 + v_138_149 <=s (const 64 (2**20)),
    u_138_149 - v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 + v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 - v_138_149 <=s (const 64 (2**20)),
    r_138_149 + s_138_149 <=s (const 64 (2**20)),
    r_138_149 - s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 + s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 - s_138_149 <=s (const 64 (2**20)),
    u_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_138_149 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step149

// premise a
assume
neg_g_118_low60_20_low20_11 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_12 neg_f_118_low60_20_low20_11;
mov u_138_150 u_138_149;
mov v_138_150 v_138_149;

asr neg_g_118_low60_20_low20_12 neg_g_118_low60_20_low20_11 1;
asr r_138_150 r_138_149 1;
asr s_138_150 s_138_149 1;
assert
    true
&&
    neg_f_118_low60_20_low20_12 = neg_f_118_low60_20_low20_11,
    u_138_150 = u_138_149,
    v_138_150 = v_138_149,
    neg_g_118_low60_20_low20_12 * (const 64 2) = neg_g_118_low60_20_low20_11,
    r_138_150 * (const 64 2) = r_138_149,
    s_138_150 * (const 64 2) = s_138_149
;

assume
    neg_f_118_low60_20_low20_12 = neg_f_118_low60_20_low20_11,
    u_138_150 = u_138_149,
    v_138_150 = v_138_149,
    neg_g_118_low60_20_low20_12 * 2 = neg_g_118_low60_20_low20_11,
    r_138_150 * 2 = r_138_149,
    s_138_150 * 2 = s_138_149
&&
    true
;

{
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_12 + u_138_150 * (const 64 (2**21)) + v_138_150 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_12 + r_138_150 * (const 64 (2**21)) + s_138_150 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_12,
    neg_f_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_12,
    neg_g_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 150)) <=s delta, delta <=s (const 64 (1 + 2*150)),
    (const 64 (-(2**20))) <=s u_138_150, u_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_150, v_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_150, r_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_150, s_138_150 <=s (const 64 ((2**20))),
    u_138_150 + v_138_150 <=s (const 64 (2**20)),
    u_138_150 - v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 + v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 - v_138_150 <=s (const 64 (2**20)),
    r_138_150 + s_138_150 <=s (const 64 (2**20)),
    r_138_150 - s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 + s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 - s_138_150 <=s (const 64 (2**20)),
    u_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_138_150 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_149_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_11,
sint64 neg_g_118_low60_20_low20_11,
sint64 neg_f_118_low60_20_low20_12,
sint64 neg_g_118_low60_20_low20_12,
sint64 u_138_149,
sint64 v_138_149,
sint64 r_138_149,
sint64 s_138_149,
sint64 u_138_150,
sint64 v_138_150,
sint64 r_138_150,
sint64 s_138_150,
bit ne
)={
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (-(2**20)),
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (-(2**20))
&&
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (const 64 (-(2**20))),
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_11 + u_138_149 * (const 64 (2**21)) + v_138_149 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_11 + r_138_149 * (const 64 (2**21)) + s_138_149 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_11,
    neg_f_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_11,
    neg_g_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 149)) <=s delta, delta <=s (const 64 (1 + 2*149)),
    (const 64 (-(2**20))) <=s u_138_149, u_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_149, v_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_149, r_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_149, s_138_149 <=s (const 64 ((2**20))),
    u_138_149 + v_138_149 <=s (const 64 (2**20)),
    u_138_149 - v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 + v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 - v_138_149 <=s (const 64 (2**20)),
    r_138_149 + s_138_149 <=s (const 64 (2**20)),
    r_138_149 - s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 + s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 - s_138_149 <=s (const 64 (2**20)),
    u_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_138_149 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step149

// premise b
assume
neg_g_118_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_12 neg_f_118_low60_20_low20_11;
mov u_138_150 u_138_149;
mov v_138_150 v_138_149;

add neg_g_118_low60_20_low20_12 neg_g_118_low60_20_low20_11 neg_f_118_low60_20_low20_11;
asr neg_g_118_low60_20_low20_12 neg_g_118_low60_20_low20_12 1;
add r_138_150 r_138_149 u_138_149;
asr r_138_150 r_138_150 1;
add s_138_150 s_138_149 v_138_149;
asr s_138_150 s_138_150 1;
assert
    true
&&
    neg_f_118_low60_20_low20_12 = neg_f_118_low60_20_low20_11,
    u_138_150 = u_138_149,
    v_138_150 = v_138_149,
    neg_g_118_low60_20_low20_12 * (const 64 2) = neg_g_118_low60_20_low20_11 + neg_f_118_low60_20_low20_11,
    r_138_150 * (const 64 2) = r_138_149 + u_138_149,
    s_138_150 * (const 64 2) = s_138_149 + v_138_149
;

assume
    neg_f_118_low60_20_low20_12 = neg_f_118_low60_20_low20_11,
    u_138_150 = u_138_149,
    v_138_150 = v_138_149,
    neg_g_118_low60_20_low20_12 * 2 = neg_g_118_low60_20_low20_11 + neg_f_118_low60_20_low20_11,
    r_138_150 * 2 = r_138_149 + u_138_149,
    s_138_150 * 2 = s_138_149 + v_138_149
&&
    true
;

{
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_12 + u_138_150 * (const 64 (2**21)) + v_138_150 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_12 + r_138_150 * (const 64 (2**21)) + s_138_150 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_12,
    neg_f_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_12,
    neg_g_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 150)) <=s delta, delta <=s (const 64 (1 + 2*150)),
    (const 64 (-(2**20))) <=s u_138_150, u_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_150, v_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_150, r_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_150, s_138_150 <=s (const 64 ((2**20))),
    u_138_150 + v_138_150 <=s (const 64 (2**20)),
    u_138_150 - v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 + v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 - v_138_150 <=s (const 64 (2**20)),
    r_138_150 + s_138_150 <=s (const 64 (2**20)),
    r_138_150 - s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 + s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 - s_138_150 <=s (const 64 (2**20)),
    u_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_138_150 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_149_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_11,
sint64 neg_g_118_low60_20_low20_11,
sint64 neg_f_118_low60_20_low20_12,
sint64 neg_g_118_low60_20_low20_12,
sint64 u_138_149,
sint64 v_138_149,
sint64 r_138_149,
sint64 s_138_149,
sint64 u_138_150,
sint64 v_138_150,
sint64 r_138_150,
sint64 s_138_150,
bit ne
)={
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (-(2**20)),
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (-(2**20))
&&
    u_138_149 * neg_f_118_low60_20_low20_0 + v_138_149 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_11 * (const 64 (-(2**20))),
    r_138_149 * neg_f_118_low60_20_low20_0 + s_138_149 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_11 + u_138_149 * (const 64 (2**21)) + v_138_149 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_11 + r_138_149 * (const 64 (2**21)) + s_138_149 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_11,
    neg_f_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_11,
    neg_g_118_low60_20_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 149)) <=s delta, delta <=s (const 64 (1 + 2*149)),
    (const 64 (-(2**20))) <=s u_138_149, u_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_149, v_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_149, r_138_149 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_149, s_138_149 <=s (const 64 ((2**20))),
    u_138_149 + v_138_149 <=s (const 64 (2**20)),
    u_138_149 - v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 + v_138_149 <=s (const 64 (2**20)),
    (const 64 0) - u_138_149 - v_138_149 <=s (const 64 (2**20)),
    r_138_149 + s_138_149 <=s (const 64 (2**20)),
    r_138_149 - s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 + s_138_149 <=s (const 64 (2**20)),
    (const 64 0) - r_138_149 - s_138_149 <=s (const 64 (2**20)),
    u_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_138_149 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_138_149 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step149

// premise c
assume
neg_g_118_low60_20_low20_11 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_12 neg_g_118_low60_20_low20_11;
mov u_138_150 r_138_149;
mov v_138_150 s_138_149;

subs dc neg_g_118_low60_20_low20_12 neg_g_118_low60_20_low20_11 neg_f_118_low60_20_low20_11;
asr neg_g_118_low60_20_low20_12 neg_g_118_low60_20_low20_12 1;
subs dc r_138_150 r_138_149 u_138_149;
asr r_138_150 r_138_150 1;
subs dc s_138_150 s_138_149 v_138_149;
asr s_138_150 s_138_150 1;
assert
    true
&&
    neg_f_118_low60_20_low20_12 = neg_g_118_low60_20_low20_11,
    u_138_150 = r_138_149,
    v_138_150 = s_138_149,
    neg_g_118_low60_20_low20_12 * (const 64 2) = neg_g_118_low60_20_low20_11 - neg_f_118_low60_20_low20_11,
    r_138_150 * (const 64 2) = r_138_149 - u_138_149,
    s_138_150 * (const 64 2) = s_138_149 - v_138_149
;

assume
    neg_f_118_low60_20_low20_12 = neg_g_118_low60_20_low20_11,
    u_138_150 = r_138_149,
    v_138_150 = s_138_149,
    neg_g_118_low60_20_low20_12 * 2 = neg_g_118_low60_20_low20_11 - neg_f_118_low60_20_low20_11,
    r_138_150 * 2 = r_138_149 - u_138_149,
    s_138_150 * 2 = s_138_149 - v_138_149
&&
    true
;

{
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_12 + u_138_150 * (const 64 (2**21)) + v_138_150 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_12 + r_138_150 * (const 64 (2**21)) + s_138_150 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_12,
    neg_f_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_12,
    neg_g_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 150)) <=s delta, delta <=s (const 64 (1 + 2*150)),
    (const 64 (-(2**20))) <=s u_138_150, u_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_150, v_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_150, r_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_150, s_138_150 <=s (const 64 ((2**20))),
    u_138_150 + v_138_150 <=s (const 64 (2**20)),
    u_138_150 - v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 + v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 - v_138_150 <=s (const 64 (2**20)),
    r_138_150 + s_138_150 <=s (const 64 (2**20)),
    r_138_150 - s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 + s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 - s_138_150 <=s (const 64 (2**20)),
    u_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_138_150 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_150_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_12,
sint64 neg_g_118_low60_20_low20_12,
sint64 neg_f_118_low60_20_low20_13,
sint64 neg_g_118_low60_20_low20_13,
sint64 u_138_150,
sint64 v_138_150,
sint64 r_138_150,
sint64 s_138_150,
sint64 u_138_151,
sint64 v_138_151,
sint64 r_138_151,
sint64 s_138_151,
bit ne
)={
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (-(2**20)),
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (-(2**20))
&&
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (const 64 (-(2**20))),
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_12 + u_138_150 * (const 64 (2**21)) + v_138_150 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_12 + r_138_150 * (const 64 (2**21)) + s_138_150 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_12,
    neg_f_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_12,
    neg_g_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 150)) <=s delta, delta <=s (const 64 (1 + 2*150)),
    (const 64 (-(2**20))) <=s u_138_150, u_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_150, v_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_150, r_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_150, s_138_150 <=s (const 64 ((2**20))),
    u_138_150 + v_138_150 <=s (const 64 (2**20)),
    u_138_150 - v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 + v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 - v_138_150 <=s (const 64 (2**20)),
    r_138_150 + s_138_150 <=s (const 64 (2**20)),
    r_138_150 - s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 + s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 - s_138_150 <=s (const 64 (2**20)),
    u_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_138_150 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step150

// premise a
assume
neg_g_118_low60_20_low20_12 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_13 neg_f_118_low60_20_low20_12;
mov u_138_151 u_138_150;
mov v_138_151 v_138_150;

asr neg_g_118_low60_20_low20_13 neg_g_118_low60_20_low20_12 1;
asr r_138_151 r_138_150 1;
asr s_138_151 s_138_150 1;
assert
    true
&&
    neg_f_118_low60_20_low20_13 = neg_f_118_low60_20_low20_12,
    u_138_151 = u_138_150,
    v_138_151 = v_138_150,
    neg_g_118_low60_20_low20_13 * (const 64 2) = neg_g_118_low60_20_low20_12,
    r_138_151 * (const 64 2) = r_138_150,
    s_138_151 * (const 64 2) = s_138_150
;

assume
    neg_f_118_low60_20_low20_13 = neg_f_118_low60_20_low20_12,
    u_138_151 = u_138_150,
    v_138_151 = v_138_150,
    neg_g_118_low60_20_low20_13 * 2 = neg_g_118_low60_20_low20_12,
    r_138_151 * 2 = r_138_150,
    s_138_151 * 2 = s_138_150
&&
    true
;

{
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_13 + u_138_151 * (const 64 (2**21)) + v_138_151 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_13 + r_138_151 * (const 64 (2**21)) + s_138_151 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_13,
    neg_f_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_13,
    neg_g_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 151)) <=s delta, delta <=s (const 64 (1 + 2*151)),
    (const 64 (-(2**20))) <=s u_138_151, u_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_151, v_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_151, r_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_151, s_138_151 <=s (const 64 ((2**20))),
    u_138_151 + v_138_151 <=s (const 64 (2**20)),
    u_138_151 - v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 + v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 - v_138_151 <=s (const 64 (2**20)),
    r_138_151 + s_138_151 <=s (const 64 (2**20)),
    r_138_151 - s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 + s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 - s_138_151 <=s (const 64 (2**20)),
    u_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_138_151 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_150_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_12,
sint64 neg_g_118_low60_20_low20_12,
sint64 neg_f_118_low60_20_low20_13,
sint64 neg_g_118_low60_20_low20_13,
sint64 u_138_150,
sint64 v_138_150,
sint64 r_138_150,
sint64 s_138_150,
sint64 u_138_151,
sint64 v_138_151,
sint64 r_138_151,
sint64 s_138_151,
bit ne
)={
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (-(2**20)),
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (-(2**20))
&&
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (const 64 (-(2**20))),
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_12 + u_138_150 * (const 64 (2**21)) + v_138_150 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_12 + r_138_150 * (const 64 (2**21)) + s_138_150 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_12,
    neg_f_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_12,
    neg_g_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 150)) <=s delta, delta <=s (const 64 (1 + 2*150)),
    (const 64 (-(2**20))) <=s u_138_150, u_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_150, v_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_150, r_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_150, s_138_150 <=s (const 64 ((2**20))),
    u_138_150 + v_138_150 <=s (const 64 (2**20)),
    u_138_150 - v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 + v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 - v_138_150 <=s (const 64 (2**20)),
    r_138_150 + s_138_150 <=s (const 64 (2**20)),
    r_138_150 - s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 + s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 - s_138_150 <=s (const 64 (2**20)),
    u_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_138_150 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step150

// premise b
assume
neg_g_118_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_13 neg_f_118_low60_20_low20_12;
mov u_138_151 u_138_150;
mov v_138_151 v_138_150;

add neg_g_118_low60_20_low20_13 neg_g_118_low60_20_low20_12 neg_f_118_low60_20_low20_12;
asr neg_g_118_low60_20_low20_13 neg_g_118_low60_20_low20_13 1;
add r_138_151 r_138_150 u_138_150;
asr r_138_151 r_138_151 1;
add s_138_151 s_138_150 v_138_150;
asr s_138_151 s_138_151 1;
assert
    true
&&
    neg_f_118_low60_20_low20_13 = neg_f_118_low60_20_low20_12,
    u_138_151 = u_138_150,
    v_138_151 = v_138_150,
    neg_g_118_low60_20_low20_13 * (const 64 2) = neg_g_118_low60_20_low20_12 + neg_f_118_low60_20_low20_12,
    r_138_151 * (const 64 2) = r_138_150 + u_138_150,
    s_138_151 * (const 64 2) = s_138_150 + v_138_150
;

assume
    neg_f_118_low60_20_low20_13 = neg_f_118_low60_20_low20_12,
    u_138_151 = u_138_150,
    v_138_151 = v_138_150,
    neg_g_118_low60_20_low20_13 * 2 = neg_g_118_low60_20_low20_12 + neg_f_118_low60_20_low20_12,
    r_138_151 * 2 = r_138_150 + u_138_150,
    s_138_151 * 2 = s_138_150 + v_138_150
&&
    true
;

{
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_13 + u_138_151 * (const 64 (2**21)) + v_138_151 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_13 + r_138_151 * (const 64 (2**21)) + s_138_151 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_13,
    neg_f_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_13,
    neg_g_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 151)) <=s delta, delta <=s (const 64 (1 + 2*151)),
    (const 64 (-(2**20))) <=s u_138_151, u_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_151, v_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_151, r_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_151, s_138_151 <=s (const 64 ((2**20))),
    u_138_151 + v_138_151 <=s (const 64 (2**20)),
    u_138_151 - v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 + v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 - v_138_151 <=s (const 64 (2**20)),
    r_138_151 + s_138_151 <=s (const 64 (2**20)),
    r_138_151 - s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 + s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 - s_138_151 <=s (const 64 (2**20)),
    u_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_138_151 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_150_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_12,
sint64 neg_g_118_low60_20_low20_12,
sint64 neg_f_118_low60_20_low20_13,
sint64 neg_g_118_low60_20_low20_13,
sint64 u_138_150,
sint64 v_138_150,
sint64 r_138_150,
sint64 s_138_150,
sint64 u_138_151,
sint64 v_138_151,
sint64 r_138_151,
sint64 s_138_151,
bit ne
)={
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (-(2**20)),
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (-(2**20))
&&
    u_138_150 * neg_f_118_low60_20_low20_0 + v_138_150 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_12 * (const 64 (-(2**20))),
    r_138_150 * neg_f_118_low60_20_low20_0 + s_138_150 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_12 + u_138_150 * (const 64 (2**21)) + v_138_150 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_12 + r_138_150 * (const 64 (2**21)) + s_138_150 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_12,
    neg_f_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_12,
    neg_g_118_low60_20_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 150)) <=s delta, delta <=s (const 64 (1 + 2*150)),
    (const 64 (-(2**20))) <=s u_138_150, u_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_150, v_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_150, r_138_150 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_150, s_138_150 <=s (const 64 ((2**20))),
    u_138_150 + v_138_150 <=s (const 64 (2**20)),
    u_138_150 - v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 + v_138_150 <=s (const 64 (2**20)),
    (const 64 0) - u_138_150 - v_138_150 <=s (const 64 (2**20)),
    r_138_150 + s_138_150 <=s (const 64 (2**20)),
    r_138_150 - s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 + s_138_150 <=s (const 64 (2**20)),
    (const 64 0) - r_138_150 - s_138_150 <=s (const 64 (2**20)),
    u_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_138_150 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_138_150 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step150

// premise c
assume
neg_g_118_low60_20_low20_12 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_13 neg_g_118_low60_20_low20_12;
mov u_138_151 r_138_150;
mov v_138_151 s_138_150;

subs dc neg_g_118_low60_20_low20_13 neg_g_118_low60_20_low20_12 neg_f_118_low60_20_low20_12;
asr neg_g_118_low60_20_low20_13 neg_g_118_low60_20_low20_13 1;
subs dc r_138_151 r_138_150 u_138_150;
asr r_138_151 r_138_151 1;
subs dc s_138_151 s_138_150 v_138_150;
asr s_138_151 s_138_151 1;
assert
    true
&&
    neg_f_118_low60_20_low20_13 = neg_g_118_low60_20_low20_12,
    u_138_151 = r_138_150,
    v_138_151 = s_138_150,
    neg_g_118_low60_20_low20_13 * (const 64 2) = neg_g_118_low60_20_low20_12 - neg_f_118_low60_20_low20_12,
    r_138_151 * (const 64 2) = r_138_150 - u_138_150,
    s_138_151 * (const 64 2) = s_138_150 - v_138_150
;

assume
    neg_f_118_low60_20_low20_13 = neg_g_118_low60_20_low20_12,
    u_138_151 = r_138_150,
    v_138_151 = s_138_150,
    neg_g_118_low60_20_low20_13 * 2 = neg_g_118_low60_20_low20_12 - neg_f_118_low60_20_low20_12,
    r_138_151 * 2 = r_138_150 - u_138_150,
    s_138_151 * 2 = s_138_150 - v_138_150
&&
    true
;

{
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_13 + u_138_151 * (const 64 (2**21)) + v_138_151 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_13 + r_138_151 * (const 64 (2**21)) + s_138_151 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_13,
    neg_f_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_13,
    neg_g_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 151)) <=s delta, delta <=s (const 64 (1 + 2*151)),
    (const 64 (-(2**20))) <=s u_138_151, u_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_151, v_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_151, r_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_151, s_138_151 <=s (const 64 ((2**20))),
    u_138_151 + v_138_151 <=s (const 64 (2**20)),
    u_138_151 - v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 + v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 - v_138_151 <=s (const 64 (2**20)),
    r_138_151 + s_138_151 <=s (const 64 (2**20)),
    r_138_151 - s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 + s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 - s_138_151 <=s (const 64 (2**20)),
    u_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_138_151 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_151_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_13,
sint64 neg_g_118_low60_20_low20_13,
sint64 neg_f_118_low60_20_low20_14,
sint64 neg_g_118_low60_20_low20_14,
sint64 u_138_151,
sint64 v_138_151,
sint64 r_138_151,
sint64 s_138_151,
sint64 u_138_152,
sint64 v_138_152,
sint64 r_138_152,
sint64 s_138_152,
bit ne
)={
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (-(2**20)),
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (-(2**20))
&&
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (const 64 (-(2**20))),
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_13 + u_138_151 * (const 64 (2**21)) + v_138_151 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_13 + r_138_151 * (const 64 (2**21)) + s_138_151 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_13,
    neg_f_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_13,
    neg_g_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 151)) <=s delta, delta <=s (const 64 (1 + 2*151)),
    (const 64 (-(2**20))) <=s u_138_151, u_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_151, v_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_151, r_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_151, s_138_151 <=s (const 64 ((2**20))),
    u_138_151 + v_138_151 <=s (const 64 (2**20)),
    u_138_151 - v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 + v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 - v_138_151 <=s (const 64 (2**20)),
    r_138_151 + s_138_151 <=s (const 64 (2**20)),
    r_138_151 - s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 + s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 - s_138_151 <=s (const 64 (2**20)),
    u_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_138_151 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step151

// premise a
assume
neg_g_118_low60_20_low20_13 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_14 neg_f_118_low60_20_low20_13;
mov u_138_152 u_138_151;
mov v_138_152 v_138_151;

asr neg_g_118_low60_20_low20_14 neg_g_118_low60_20_low20_13 1;
asr r_138_152 r_138_151 1;
asr s_138_152 s_138_151 1;
assert
    true
&&
    neg_f_118_low60_20_low20_14 = neg_f_118_low60_20_low20_13,
    u_138_152 = u_138_151,
    v_138_152 = v_138_151,
    neg_g_118_low60_20_low20_14 * (const 64 2) = neg_g_118_low60_20_low20_13,
    r_138_152 * (const 64 2) = r_138_151,
    s_138_152 * (const 64 2) = s_138_151
;

assume
    neg_f_118_low60_20_low20_14 = neg_f_118_low60_20_low20_13,
    u_138_152 = u_138_151,
    v_138_152 = v_138_151,
    neg_g_118_low60_20_low20_14 * 2 = neg_g_118_low60_20_low20_13,
    r_138_152 * 2 = r_138_151,
    s_138_152 * 2 = s_138_151
&&
    true
;

{
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_14 + u_138_152 * (const 64 (2**21)) + v_138_152 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_14 + r_138_152 * (const 64 (2**21)) + s_138_152 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_14,
    neg_f_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_14,
    neg_g_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 152)) <=s delta, delta <=s (const 64 (1 + 2*152)),
    (const 64 (-(2**20))) <=s u_138_152, u_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_152, v_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_152, r_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_152, s_138_152 <=s (const 64 ((2**20))),
    u_138_152 + v_138_152 <=s (const 64 (2**20)),
    u_138_152 - v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 + v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 - v_138_152 <=s (const 64 (2**20)),
    r_138_152 + s_138_152 <=s (const 64 (2**20)),
    r_138_152 - s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 + s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 - s_138_152 <=s (const 64 (2**20)),
    u_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_138_152 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_151_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_13,
sint64 neg_g_118_low60_20_low20_13,
sint64 neg_f_118_low60_20_low20_14,
sint64 neg_g_118_low60_20_low20_14,
sint64 u_138_151,
sint64 v_138_151,
sint64 r_138_151,
sint64 s_138_151,
sint64 u_138_152,
sint64 v_138_152,
sint64 r_138_152,
sint64 s_138_152,
bit ne
)={
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (-(2**20)),
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (-(2**20))
&&
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (const 64 (-(2**20))),
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_13 + u_138_151 * (const 64 (2**21)) + v_138_151 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_13 + r_138_151 * (const 64 (2**21)) + s_138_151 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_13,
    neg_f_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_13,
    neg_g_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 151)) <=s delta, delta <=s (const 64 (1 + 2*151)),
    (const 64 (-(2**20))) <=s u_138_151, u_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_151, v_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_151, r_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_151, s_138_151 <=s (const 64 ((2**20))),
    u_138_151 + v_138_151 <=s (const 64 (2**20)),
    u_138_151 - v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 + v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 - v_138_151 <=s (const 64 (2**20)),
    r_138_151 + s_138_151 <=s (const 64 (2**20)),
    r_138_151 - s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 + s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 - s_138_151 <=s (const 64 (2**20)),
    u_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_138_151 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step151

// premise b
assume
neg_g_118_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_14 neg_f_118_low60_20_low20_13;
mov u_138_152 u_138_151;
mov v_138_152 v_138_151;

add neg_g_118_low60_20_low20_14 neg_g_118_low60_20_low20_13 neg_f_118_low60_20_low20_13;
asr neg_g_118_low60_20_low20_14 neg_g_118_low60_20_low20_14 1;
add r_138_152 r_138_151 u_138_151;
asr r_138_152 r_138_152 1;
add s_138_152 s_138_151 v_138_151;
asr s_138_152 s_138_152 1;
assert
    true
&&
    neg_f_118_low60_20_low20_14 = neg_f_118_low60_20_low20_13,
    u_138_152 = u_138_151,
    v_138_152 = v_138_151,
    neg_g_118_low60_20_low20_14 * (const 64 2) = neg_g_118_low60_20_low20_13 + neg_f_118_low60_20_low20_13,
    r_138_152 * (const 64 2) = r_138_151 + u_138_151,
    s_138_152 * (const 64 2) = s_138_151 + v_138_151
;

assume
    neg_f_118_low60_20_low20_14 = neg_f_118_low60_20_low20_13,
    u_138_152 = u_138_151,
    v_138_152 = v_138_151,
    neg_g_118_low60_20_low20_14 * 2 = neg_g_118_low60_20_low20_13 + neg_f_118_low60_20_low20_13,
    r_138_152 * 2 = r_138_151 + u_138_151,
    s_138_152 * 2 = s_138_151 + v_138_151
&&
    true
;

{
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_14 + u_138_152 * (const 64 (2**21)) + v_138_152 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_14 + r_138_152 * (const 64 (2**21)) + s_138_152 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_14,
    neg_f_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_14,
    neg_g_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 152)) <=s delta, delta <=s (const 64 (1 + 2*152)),
    (const 64 (-(2**20))) <=s u_138_152, u_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_152, v_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_152, r_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_152, s_138_152 <=s (const 64 ((2**20))),
    u_138_152 + v_138_152 <=s (const 64 (2**20)),
    u_138_152 - v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 + v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 - v_138_152 <=s (const 64 (2**20)),
    r_138_152 + s_138_152 <=s (const 64 (2**20)),
    r_138_152 - s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 + s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 - s_138_152 <=s (const 64 (2**20)),
    u_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_138_152 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_151_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_13,
sint64 neg_g_118_low60_20_low20_13,
sint64 neg_f_118_low60_20_low20_14,
sint64 neg_g_118_low60_20_low20_14,
sint64 u_138_151,
sint64 v_138_151,
sint64 r_138_151,
sint64 s_138_151,
sint64 u_138_152,
sint64 v_138_152,
sint64 r_138_152,
sint64 s_138_152,
bit ne
)={
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (-(2**20)),
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (-(2**20))
&&
    u_138_151 * neg_f_118_low60_20_low20_0 + v_138_151 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_13 * (const 64 (-(2**20))),
    r_138_151 * neg_f_118_low60_20_low20_0 + s_138_151 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_13 + u_138_151 * (const 64 (2**21)) + v_138_151 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_13 + r_138_151 * (const 64 (2**21)) + s_138_151 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_13,
    neg_f_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_13,
    neg_g_118_low60_20_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 151)) <=s delta, delta <=s (const 64 (1 + 2*151)),
    (const 64 (-(2**20))) <=s u_138_151, u_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_151, v_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_151, r_138_151 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_151, s_138_151 <=s (const 64 ((2**20))),
    u_138_151 + v_138_151 <=s (const 64 (2**20)),
    u_138_151 - v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 + v_138_151 <=s (const 64 (2**20)),
    (const 64 0) - u_138_151 - v_138_151 <=s (const 64 (2**20)),
    r_138_151 + s_138_151 <=s (const 64 (2**20)),
    r_138_151 - s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 + s_138_151 <=s (const 64 (2**20)),
    (const 64 0) - r_138_151 - s_138_151 <=s (const 64 (2**20)),
    u_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_138_151 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_138_151 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step151

// premise c
assume
neg_g_118_low60_20_low20_13 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_14 neg_g_118_low60_20_low20_13;
mov u_138_152 r_138_151;
mov v_138_152 s_138_151;

subs dc neg_g_118_low60_20_low20_14 neg_g_118_low60_20_low20_13 neg_f_118_low60_20_low20_13;
asr neg_g_118_low60_20_low20_14 neg_g_118_low60_20_low20_14 1;
subs dc r_138_152 r_138_151 u_138_151;
asr r_138_152 r_138_152 1;
subs dc s_138_152 s_138_151 v_138_151;
asr s_138_152 s_138_152 1;
assert
    true
&&
    neg_f_118_low60_20_low20_14 = neg_g_118_low60_20_low20_13,
    u_138_152 = r_138_151,
    v_138_152 = s_138_151,
    neg_g_118_low60_20_low20_14 * (const 64 2) = neg_g_118_low60_20_low20_13 - neg_f_118_low60_20_low20_13,
    r_138_152 * (const 64 2) = r_138_151 - u_138_151,
    s_138_152 * (const 64 2) = s_138_151 - v_138_151
;

assume
    neg_f_118_low60_20_low20_14 = neg_g_118_low60_20_low20_13,
    u_138_152 = r_138_151,
    v_138_152 = s_138_151,
    neg_g_118_low60_20_low20_14 * 2 = neg_g_118_low60_20_low20_13 - neg_f_118_low60_20_low20_13,
    r_138_152 * 2 = r_138_151 - u_138_151,
    s_138_152 * 2 = s_138_151 - v_138_151
&&
    true
;

{
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_14 + u_138_152 * (const 64 (2**21)) + v_138_152 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_14 + r_138_152 * (const 64 (2**21)) + s_138_152 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_14,
    neg_f_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_14,
    neg_g_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 152)) <=s delta, delta <=s (const 64 (1 + 2*152)),
    (const 64 (-(2**20))) <=s u_138_152, u_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_152, v_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_152, r_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_152, s_138_152 <=s (const 64 ((2**20))),
    u_138_152 + v_138_152 <=s (const 64 (2**20)),
    u_138_152 - v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 + v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 - v_138_152 <=s (const 64 (2**20)),
    r_138_152 + s_138_152 <=s (const 64 (2**20)),
    r_138_152 - s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 + s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 - s_138_152 <=s (const 64 (2**20)),
    u_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_138_152 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_152_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_14,
sint64 neg_g_118_low60_20_low20_14,
sint64 neg_f_118_low60_20_low20_15,
sint64 neg_g_118_low60_20_low20_15,
sint64 u_138_152,
sint64 v_138_152,
sint64 r_138_152,
sint64 s_138_152,
sint64 u_138_153,
sint64 v_138_153,
sint64 r_138_153,
sint64 s_138_153,
bit ne
)={
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (-(2**20)),
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (-(2**20))
&&
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (const 64 (-(2**20))),
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_14 + u_138_152 * (const 64 (2**21)) + v_138_152 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_14 + r_138_152 * (const 64 (2**21)) + s_138_152 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_14,
    neg_f_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_14,
    neg_g_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 152)) <=s delta, delta <=s (const 64 (1 + 2*152)),
    (const 64 (-(2**20))) <=s u_138_152, u_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_152, v_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_152, r_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_152, s_138_152 <=s (const 64 ((2**20))),
    u_138_152 + v_138_152 <=s (const 64 (2**20)),
    u_138_152 - v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 + v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 - v_138_152 <=s (const 64 (2**20)),
    r_138_152 + s_138_152 <=s (const 64 (2**20)),
    r_138_152 - s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 + s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 - s_138_152 <=s (const 64 (2**20)),
    u_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_138_152 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step152

// premise a
assume
neg_g_118_low60_20_low20_14 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_15 neg_f_118_low60_20_low20_14;
mov u_138_153 u_138_152;
mov v_138_153 v_138_152;

asr neg_g_118_low60_20_low20_15 neg_g_118_low60_20_low20_14 1;
asr r_138_153 r_138_152 1;
asr s_138_153 s_138_152 1;
assert
    true
&&
    neg_f_118_low60_20_low20_15 = neg_f_118_low60_20_low20_14,
    u_138_153 = u_138_152,
    v_138_153 = v_138_152,
    neg_g_118_low60_20_low20_15 * (const 64 2) = neg_g_118_low60_20_low20_14,
    r_138_153 * (const 64 2) = r_138_152,
    s_138_153 * (const 64 2) = s_138_152
;

assume
    neg_f_118_low60_20_low20_15 = neg_f_118_low60_20_low20_14,
    u_138_153 = u_138_152,
    v_138_153 = v_138_152,
    neg_g_118_low60_20_low20_15 * 2 = neg_g_118_low60_20_low20_14,
    r_138_153 * 2 = r_138_152,
    s_138_153 * 2 = s_138_152
&&
    true
;

{
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_15 + u_138_153 * (const 64 (2**21)) + v_138_153 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_15 + r_138_153 * (const 64 (2**21)) + s_138_153 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_15,
    neg_f_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_15,
    neg_g_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 153)) <=s delta, delta <=s (const 64 (1 + 2*153)),
    (const 64 (-(2**20))) <=s u_138_153, u_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_153, v_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_153, r_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_153, s_138_153 <=s (const 64 ((2**20))),
    u_138_153 + v_138_153 <=s (const 64 (2**20)),
    u_138_153 - v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 + v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 - v_138_153 <=s (const 64 (2**20)),
    r_138_153 + s_138_153 <=s (const 64 (2**20)),
    r_138_153 - s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 + s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 - s_138_153 <=s (const 64 (2**20)),
    u_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_138_153 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_152_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_14,
sint64 neg_g_118_low60_20_low20_14,
sint64 neg_f_118_low60_20_low20_15,
sint64 neg_g_118_low60_20_low20_15,
sint64 u_138_152,
sint64 v_138_152,
sint64 r_138_152,
sint64 s_138_152,
sint64 u_138_153,
sint64 v_138_153,
sint64 r_138_153,
sint64 s_138_153,
bit ne
)={
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (-(2**20)),
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (-(2**20))
&&
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (const 64 (-(2**20))),
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_14 + u_138_152 * (const 64 (2**21)) + v_138_152 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_14 + r_138_152 * (const 64 (2**21)) + s_138_152 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_14,
    neg_f_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_14,
    neg_g_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 152)) <=s delta, delta <=s (const 64 (1 + 2*152)),
    (const 64 (-(2**20))) <=s u_138_152, u_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_152, v_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_152, r_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_152, s_138_152 <=s (const 64 ((2**20))),
    u_138_152 + v_138_152 <=s (const 64 (2**20)),
    u_138_152 - v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 + v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 - v_138_152 <=s (const 64 (2**20)),
    r_138_152 + s_138_152 <=s (const 64 (2**20)),
    r_138_152 - s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 + s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 - s_138_152 <=s (const 64 (2**20)),
    u_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_138_152 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step152

// premise b
assume
neg_g_118_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_15 neg_f_118_low60_20_low20_14;
mov u_138_153 u_138_152;
mov v_138_153 v_138_152;

add neg_g_118_low60_20_low20_15 neg_g_118_low60_20_low20_14 neg_f_118_low60_20_low20_14;
asr neg_g_118_low60_20_low20_15 neg_g_118_low60_20_low20_15 1;
add r_138_153 r_138_152 u_138_152;
asr r_138_153 r_138_153 1;
add s_138_153 s_138_152 v_138_152;
asr s_138_153 s_138_153 1;
assert
    true
&&
    neg_f_118_low60_20_low20_15 = neg_f_118_low60_20_low20_14,
    u_138_153 = u_138_152,
    v_138_153 = v_138_152,
    neg_g_118_low60_20_low20_15 * (const 64 2) = neg_g_118_low60_20_low20_14 + neg_f_118_low60_20_low20_14,
    r_138_153 * (const 64 2) = r_138_152 + u_138_152,
    s_138_153 * (const 64 2) = s_138_152 + v_138_152
;

assume
    neg_f_118_low60_20_low20_15 = neg_f_118_low60_20_low20_14,
    u_138_153 = u_138_152,
    v_138_153 = v_138_152,
    neg_g_118_low60_20_low20_15 * 2 = neg_g_118_low60_20_low20_14 + neg_f_118_low60_20_low20_14,
    r_138_153 * 2 = r_138_152 + u_138_152,
    s_138_153 * 2 = s_138_152 + v_138_152
&&
    true
;

{
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_15 + u_138_153 * (const 64 (2**21)) + v_138_153 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_15 + r_138_153 * (const 64 (2**21)) + s_138_153 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_15,
    neg_f_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_15,
    neg_g_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 153)) <=s delta, delta <=s (const 64 (1 + 2*153)),
    (const 64 (-(2**20))) <=s u_138_153, u_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_153, v_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_153, r_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_153, s_138_153 <=s (const 64 ((2**20))),
    u_138_153 + v_138_153 <=s (const 64 (2**20)),
    u_138_153 - v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 + v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 - v_138_153 <=s (const 64 (2**20)),
    r_138_153 + s_138_153 <=s (const 64 (2**20)),
    r_138_153 - s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 + s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 - s_138_153 <=s (const 64 (2**20)),
    u_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_138_153 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_152_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_14,
sint64 neg_g_118_low60_20_low20_14,
sint64 neg_f_118_low60_20_low20_15,
sint64 neg_g_118_low60_20_low20_15,
sint64 u_138_152,
sint64 v_138_152,
sint64 r_138_152,
sint64 s_138_152,
sint64 u_138_153,
sint64 v_138_153,
sint64 r_138_153,
sint64 s_138_153,
bit ne
)={
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (-(2**20)),
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (-(2**20))
&&
    u_138_152 * neg_f_118_low60_20_low20_0 + v_138_152 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_14 * (const 64 (-(2**20))),
    r_138_152 * neg_f_118_low60_20_low20_0 + s_138_152 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_14 + u_138_152 * (const 64 (2**21)) + v_138_152 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_14 + r_138_152 * (const 64 (2**21)) + s_138_152 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_14,
    neg_f_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_14,
    neg_g_118_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 152)) <=s delta, delta <=s (const 64 (1 + 2*152)),
    (const 64 (-(2**20))) <=s u_138_152, u_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_152, v_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_152, r_138_152 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_152, s_138_152 <=s (const 64 ((2**20))),
    u_138_152 + v_138_152 <=s (const 64 (2**20)),
    u_138_152 - v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 + v_138_152 <=s (const 64 (2**20)),
    (const 64 0) - u_138_152 - v_138_152 <=s (const 64 (2**20)),
    r_138_152 + s_138_152 <=s (const 64 (2**20)),
    r_138_152 - s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 + s_138_152 <=s (const 64 (2**20)),
    (const 64 0) - r_138_152 - s_138_152 <=s (const 64 (2**20)),
    u_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_138_152 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_138_152 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step152

// premise c
assume
neg_g_118_low60_20_low20_14 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_15 neg_g_118_low60_20_low20_14;
mov u_138_153 r_138_152;
mov v_138_153 s_138_152;

subs dc neg_g_118_low60_20_low20_15 neg_g_118_low60_20_low20_14 neg_f_118_low60_20_low20_14;
asr neg_g_118_low60_20_low20_15 neg_g_118_low60_20_low20_15 1;
subs dc r_138_153 r_138_152 u_138_152;
asr r_138_153 r_138_153 1;
subs dc s_138_153 s_138_152 v_138_152;
asr s_138_153 s_138_153 1;
assert
    true
&&
    neg_f_118_low60_20_low20_15 = neg_g_118_low60_20_low20_14,
    u_138_153 = r_138_152,
    v_138_153 = s_138_152,
    neg_g_118_low60_20_low20_15 * (const 64 2) = neg_g_118_low60_20_low20_14 - neg_f_118_low60_20_low20_14,
    r_138_153 * (const 64 2) = r_138_152 - u_138_152,
    s_138_153 * (const 64 2) = s_138_152 - v_138_152
;

assume
    neg_f_118_low60_20_low20_15 = neg_g_118_low60_20_low20_14,
    u_138_153 = r_138_152,
    v_138_153 = s_138_152,
    neg_g_118_low60_20_low20_15 * 2 = neg_g_118_low60_20_low20_14 - neg_f_118_low60_20_low20_14,
    r_138_153 * 2 = r_138_152 - u_138_152,
    s_138_153 * 2 = s_138_152 - v_138_152
&&
    true
;

{
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_15 + u_138_153 * (const 64 (2**21)) + v_138_153 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_15 + r_138_153 * (const 64 (2**21)) + s_138_153 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_15,
    neg_f_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_15,
    neg_g_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 153)) <=s delta, delta <=s (const 64 (1 + 2*153)),
    (const 64 (-(2**20))) <=s u_138_153, u_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_153, v_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_153, r_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_153, s_138_153 <=s (const 64 ((2**20))),
    u_138_153 + v_138_153 <=s (const 64 (2**20)),
    u_138_153 - v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 + v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 - v_138_153 <=s (const 64 (2**20)),
    r_138_153 + s_138_153 <=s (const 64 (2**20)),
    r_138_153 - s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 + s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 - s_138_153 <=s (const 64 (2**20)),
    u_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_138_153 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_153_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_15,
sint64 neg_g_118_low60_20_low20_15,
sint64 neg_f_118_low60_20_low20_16,
sint64 neg_g_118_low60_20_low20_16,
sint64 u_138_153,
sint64 v_138_153,
sint64 r_138_153,
sint64 s_138_153,
sint64 u_138_154,
sint64 v_138_154,
sint64 r_138_154,
sint64 s_138_154,
bit ne
)={
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (-(2**20)),
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (-(2**20))
&&
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (const 64 (-(2**20))),
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_15 + u_138_153 * (const 64 (2**21)) + v_138_153 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_15 + r_138_153 * (const 64 (2**21)) + s_138_153 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_15,
    neg_f_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_15,
    neg_g_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 153)) <=s delta, delta <=s (const 64 (1 + 2*153)),
    (const 64 (-(2**20))) <=s u_138_153, u_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_153, v_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_153, r_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_153, s_138_153 <=s (const 64 ((2**20))),
    u_138_153 + v_138_153 <=s (const 64 (2**20)),
    u_138_153 - v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 + v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 - v_138_153 <=s (const 64 (2**20)),
    r_138_153 + s_138_153 <=s (const 64 (2**20)),
    r_138_153 - s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 + s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 - s_138_153 <=s (const 64 (2**20)),
    u_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_138_153 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step153

// premise a
assume
neg_g_118_low60_20_low20_15 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_16 neg_f_118_low60_20_low20_15;
mov u_138_154 u_138_153;
mov v_138_154 v_138_153;

asr neg_g_118_low60_20_low20_16 neg_g_118_low60_20_low20_15 1;
asr r_138_154 r_138_153 1;
asr s_138_154 s_138_153 1;
assert
    true
&&
    neg_f_118_low60_20_low20_16 = neg_f_118_low60_20_low20_15,
    u_138_154 = u_138_153,
    v_138_154 = v_138_153,
    neg_g_118_low60_20_low20_16 * (const 64 2) = neg_g_118_low60_20_low20_15,
    r_138_154 * (const 64 2) = r_138_153,
    s_138_154 * (const 64 2) = s_138_153
;

assume
    neg_f_118_low60_20_low20_16 = neg_f_118_low60_20_low20_15,
    u_138_154 = u_138_153,
    v_138_154 = v_138_153,
    neg_g_118_low60_20_low20_16 * 2 = neg_g_118_low60_20_low20_15,
    r_138_154 * 2 = r_138_153,
    s_138_154 * 2 = s_138_153
&&
    true
;

{
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_16 + u_138_154 * (const 64 (2**21)) + v_138_154 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_16 + r_138_154 * (const 64 (2**21)) + s_138_154 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_16,
    neg_f_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_16,
    neg_g_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 154)) <=s delta, delta <=s (const 64 (1 + 2*154)),
    (const 64 (-(2**20))) <=s u_138_154, u_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_154, v_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_154, r_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_154, s_138_154 <=s (const 64 ((2**20))),
    u_138_154 + v_138_154 <=s (const 64 (2**20)),
    u_138_154 - v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 + v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 - v_138_154 <=s (const 64 (2**20)),
    r_138_154 + s_138_154 <=s (const 64 (2**20)),
    r_138_154 - s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 + s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 - s_138_154 <=s (const 64 (2**20)),
    u_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_138_154 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_153_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_15,
sint64 neg_g_118_low60_20_low20_15,
sint64 neg_f_118_low60_20_low20_16,
sint64 neg_g_118_low60_20_low20_16,
sint64 u_138_153,
sint64 v_138_153,
sint64 r_138_153,
sint64 s_138_153,
sint64 u_138_154,
sint64 v_138_154,
sint64 r_138_154,
sint64 s_138_154,
bit ne
)={
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (-(2**20)),
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (-(2**20))
&&
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (const 64 (-(2**20))),
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_15 + u_138_153 * (const 64 (2**21)) + v_138_153 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_15 + r_138_153 * (const 64 (2**21)) + s_138_153 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_15,
    neg_f_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_15,
    neg_g_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 153)) <=s delta, delta <=s (const 64 (1 + 2*153)),
    (const 64 (-(2**20))) <=s u_138_153, u_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_153, v_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_153, r_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_153, s_138_153 <=s (const 64 ((2**20))),
    u_138_153 + v_138_153 <=s (const 64 (2**20)),
    u_138_153 - v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 + v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 - v_138_153 <=s (const 64 (2**20)),
    r_138_153 + s_138_153 <=s (const 64 (2**20)),
    r_138_153 - s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 + s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 - s_138_153 <=s (const 64 (2**20)),
    u_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_138_153 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step153

// premise b
assume
neg_g_118_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_16 neg_f_118_low60_20_low20_15;
mov u_138_154 u_138_153;
mov v_138_154 v_138_153;

add neg_g_118_low60_20_low20_16 neg_g_118_low60_20_low20_15 neg_f_118_low60_20_low20_15;
asr neg_g_118_low60_20_low20_16 neg_g_118_low60_20_low20_16 1;
add r_138_154 r_138_153 u_138_153;
asr r_138_154 r_138_154 1;
add s_138_154 s_138_153 v_138_153;
asr s_138_154 s_138_154 1;
assert
    true
&&
    neg_f_118_low60_20_low20_16 = neg_f_118_low60_20_low20_15,
    u_138_154 = u_138_153,
    v_138_154 = v_138_153,
    neg_g_118_low60_20_low20_16 * (const 64 2) = neg_g_118_low60_20_low20_15 + neg_f_118_low60_20_low20_15,
    r_138_154 * (const 64 2) = r_138_153 + u_138_153,
    s_138_154 * (const 64 2) = s_138_153 + v_138_153
;

assume
    neg_f_118_low60_20_low20_16 = neg_f_118_low60_20_low20_15,
    u_138_154 = u_138_153,
    v_138_154 = v_138_153,
    neg_g_118_low60_20_low20_16 * 2 = neg_g_118_low60_20_low20_15 + neg_f_118_low60_20_low20_15,
    r_138_154 * 2 = r_138_153 + u_138_153,
    s_138_154 * 2 = s_138_153 + v_138_153
&&
    true
;

{
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_16 + u_138_154 * (const 64 (2**21)) + v_138_154 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_16 + r_138_154 * (const 64 (2**21)) + s_138_154 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_16,
    neg_f_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_16,
    neg_g_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 154)) <=s delta, delta <=s (const 64 (1 + 2*154)),
    (const 64 (-(2**20))) <=s u_138_154, u_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_154, v_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_154, r_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_154, s_138_154 <=s (const 64 ((2**20))),
    u_138_154 + v_138_154 <=s (const 64 (2**20)),
    u_138_154 - v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 + v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 - v_138_154 <=s (const 64 (2**20)),
    r_138_154 + s_138_154 <=s (const 64 (2**20)),
    r_138_154 - s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 + s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 - s_138_154 <=s (const 64 (2**20)),
    u_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_138_154 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_153_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_15,
sint64 neg_g_118_low60_20_low20_15,
sint64 neg_f_118_low60_20_low20_16,
sint64 neg_g_118_low60_20_low20_16,
sint64 u_138_153,
sint64 v_138_153,
sint64 r_138_153,
sint64 s_138_153,
sint64 u_138_154,
sint64 v_138_154,
sint64 r_138_154,
sint64 s_138_154,
bit ne
)={
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (-(2**20)),
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (-(2**20))
&&
    u_138_153 * neg_f_118_low60_20_low20_0 + v_138_153 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_15 * (const 64 (-(2**20))),
    r_138_153 * neg_f_118_low60_20_low20_0 + s_138_153 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_15 + u_138_153 * (const 64 (2**21)) + v_138_153 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_15 + r_138_153 * (const 64 (2**21)) + s_138_153 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_15,
    neg_f_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_15,
    neg_g_118_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 153)) <=s delta, delta <=s (const 64 (1 + 2*153)),
    (const 64 (-(2**20))) <=s u_138_153, u_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_153, v_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_153, r_138_153 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_153, s_138_153 <=s (const 64 ((2**20))),
    u_138_153 + v_138_153 <=s (const 64 (2**20)),
    u_138_153 - v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 + v_138_153 <=s (const 64 (2**20)),
    (const 64 0) - u_138_153 - v_138_153 <=s (const 64 (2**20)),
    r_138_153 + s_138_153 <=s (const 64 (2**20)),
    r_138_153 - s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 + s_138_153 <=s (const 64 (2**20)),
    (const 64 0) - r_138_153 - s_138_153 <=s (const 64 (2**20)),
    u_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_138_153 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_138_153 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step153

// premise c
assume
neg_g_118_low60_20_low20_15 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_16 neg_g_118_low60_20_low20_15;
mov u_138_154 r_138_153;
mov v_138_154 s_138_153;

subs dc neg_g_118_low60_20_low20_16 neg_g_118_low60_20_low20_15 neg_f_118_low60_20_low20_15;
asr neg_g_118_low60_20_low20_16 neg_g_118_low60_20_low20_16 1;
subs dc r_138_154 r_138_153 u_138_153;
asr r_138_154 r_138_154 1;
subs dc s_138_154 s_138_153 v_138_153;
asr s_138_154 s_138_154 1;
assert
    true
&&
    neg_f_118_low60_20_low20_16 = neg_g_118_low60_20_low20_15,
    u_138_154 = r_138_153,
    v_138_154 = s_138_153,
    neg_g_118_low60_20_low20_16 * (const 64 2) = neg_g_118_low60_20_low20_15 - neg_f_118_low60_20_low20_15,
    r_138_154 * (const 64 2) = r_138_153 - u_138_153,
    s_138_154 * (const 64 2) = s_138_153 - v_138_153
;

assume
    neg_f_118_low60_20_low20_16 = neg_g_118_low60_20_low20_15,
    u_138_154 = r_138_153,
    v_138_154 = s_138_153,
    neg_g_118_low60_20_low20_16 * 2 = neg_g_118_low60_20_low20_15 - neg_f_118_low60_20_low20_15,
    r_138_154 * 2 = r_138_153 - u_138_153,
    s_138_154 * 2 = s_138_153 - v_138_153
&&
    true
;

{
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_16 + u_138_154 * (const 64 (2**21)) + v_138_154 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_16 + r_138_154 * (const 64 (2**21)) + s_138_154 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_16,
    neg_f_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_16,
    neg_g_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 154)) <=s delta, delta <=s (const 64 (1 + 2*154)),
    (const 64 (-(2**20))) <=s u_138_154, u_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_154, v_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_154, r_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_154, s_138_154 <=s (const 64 ((2**20))),
    u_138_154 + v_138_154 <=s (const 64 (2**20)),
    u_138_154 - v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 + v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 - v_138_154 <=s (const 64 (2**20)),
    r_138_154 + s_138_154 <=s (const 64 (2**20)),
    r_138_154 - s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 + s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 - s_138_154 <=s (const 64 (2**20)),
    u_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_138_154 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_154_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_16,
sint64 neg_g_118_low60_20_low20_16,
sint64 neg_f_118_low60_20_low20_17,
sint64 neg_g_118_low60_20_low20_17,
sint64 u_138_154,
sint64 v_138_154,
sint64 r_138_154,
sint64 s_138_154,
sint64 u_138_155,
sint64 v_138_155,
sint64 r_138_155,
sint64 s_138_155,
bit ne
)={
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (-(2**20)),
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (-(2**20))
&&
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (const 64 (-(2**20))),
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_16 + u_138_154 * (const 64 (2**21)) + v_138_154 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_16 + r_138_154 * (const 64 (2**21)) + s_138_154 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_16,
    neg_f_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_16,
    neg_g_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 154)) <=s delta, delta <=s (const 64 (1 + 2*154)),
    (const 64 (-(2**20))) <=s u_138_154, u_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_154, v_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_154, r_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_154, s_138_154 <=s (const 64 ((2**20))),
    u_138_154 + v_138_154 <=s (const 64 (2**20)),
    u_138_154 - v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 + v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 - v_138_154 <=s (const 64 (2**20)),
    r_138_154 + s_138_154 <=s (const 64 (2**20)),
    r_138_154 - s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 + s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 - s_138_154 <=s (const 64 (2**20)),
    u_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_138_154 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step154

// premise a
assume
neg_g_118_low60_20_low20_16 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_17 neg_f_118_low60_20_low20_16;
mov u_138_155 u_138_154;
mov v_138_155 v_138_154;

asr neg_g_118_low60_20_low20_17 neg_g_118_low60_20_low20_16 1;
asr r_138_155 r_138_154 1;
asr s_138_155 s_138_154 1;
assert
    true
&&
    neg_f_118_low60_20_low20_17 = neg_f_118_low60_20_low20_16,
    u_138_155 = u_138_154,
    v_138_155 = v_138_154,
    neg_g_118_low60_20_low20_17 * (const 64 2) = neg_g_118_low60_20_low20_16,
    r_138_155 * (const 64 2) = r_138_154,
    s_138_155 * (const 64 2) = s_138_154
;

assume
    neg_f_118_low60_20_low20_17 = neg_f_118_low60_20_low20_16,
    u_138_155 = u_138_154,
    v_138_155 = v_138_154,
    neg_g_118_low60_20_low20_17 * 2 = neg_g_118_low60_20_low20_16,
    r_138_155 * 2 = r_138_154,
    s_138_155 * 2 = s_138_154
&&
    true
;

{
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_17 + u_138_155 * (const 64 (2**21)) + v_138_155 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_17 + r_138_155 * (const 64 (2**21)) + s_138_155 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_17,
    neg_f_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_17,
    neg_g_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 155)) <=s delta, delta <=s (const 64 (1 + 2*155)),
    (const 64 (-(2**20))) <=s u_138_155, u_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_155, v_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_155, r_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_155, s_138_155 <=s (const 64 ((2**20))),
    u_138_155 + v_138_155 <=s (const 64 (2**20)),
    u_138_155 - v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 + v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 - v_138_155 <=s (const 64 (2**20)),
    r_138_155 + s_138_155 <=s (const 64 (2**20)),
    r_138_155 - s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 + s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 - s_138_155 <=s (const 64 (2**20)),
    u_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_138_155 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_154_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_16,
sint64 neg_g_118_low60_20_low20_16,
sint64 neg_f_118_low60_20_low20_17,
sint64 neg_g_118_low60_20_low20_17,
sint64 u_138_154,
sint64 v_138_154,
sint64 r_138_154,
sint64 s_138_154,
sint64 u_138_155,
sint64 v_138_155,
sint64 r_138_155,
sint64 s_138_155,
bit ne
)={
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (-(2**20)),
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (-(2**20))
&&
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (const 64 (-(2**20))),
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_16 + u_138_154 * (const 64 (2**21)) + v_138_154 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_16 + r_138_154 * (const 64 (2**21)) + s_138_154 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_16,
    neg_f_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_16,
    neg_g_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 154)) <=s delta, delta <=s (const 64 (1 + 2*154)),
    (const 64 (-(2**20))) <=s u_138_154, u_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_154, v_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_154, r_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_154, s_138_154 <=s (const 64 ((2**20))),
    u_138_154 + v_138_154 <=s (const 64 (2**20)),
    u_138_154 - v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 + v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 - v_138_154 <=s (const 64 (2**20)),
    r_138_154 + s_138_154 <=s (const 64 (2**20)),
    r_138_154 - s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 + s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 - s_138_154 <=s (const 64 (2**20)),
    u_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_138_154 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step154

// premise b
assume
neg_g_118_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_17 neg_f_118_low60_20_low20_16;
mov u_138_155 u_138_154;
mov v_138_155 v_138_154;

add neg_g_118_low60_20_low20_17 neg_g_118_low60_20_low20_16 neg_f_118_low60_20_low20_16;
asr neg_g_118_low60_20_low20_17 neg_g_118_low60_20_low20_17 1;
add r_138_155 r_138_154 u_138_154;
asr r_138_155 r_138_155 1;
add s_138_155 s_138_154 v_138_154;
asr s_138_155 s_138_155 1;
assert
    true
&&
    neg_f_118_low60_20_low20_17 = neg_f_118_low60_20_low20_16,
    u_138_155 = u_138_154,
    v_138_155 = v_138_154,
    neg_g_118_low60_20_low20_17 * (const 64 2) = neg_g_118_low60_20_low20_16 + neg_f_118_low60_20_low20_16,
    r_138_155 * (const 64 2) = r_138_154 + u_138_154,
    s_138_155 * (const 64 2) = s_138_154 + v_138_154
;

assume
    neg_f_118_low60_20_low20_17 = neg_f_118_low60_20_low20_16,
    u_138_155 = u_138_154,
    v_138_155 = v_138_154,
    neg_g_118_low60_20_low20_17 * 2 = neg_g_118_low60_20_low20_16 + neg_f_118_low60_20_low20_16,
    r_138_155 * 2 = r_138_154 + u_138_154,
    s_138_155 * 2 = s_138_154 + v_138_154
&&
    true
;

{
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_17 + u_138_155 * (const 64 (2**21)) + v_138_155 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_17 + r_138_155 * (const 64 (2**21)) + s_138_155 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_17,
    neg_f_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_17,
    neg_g_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 155)) <=s delta, delta <=s (const 64 (1 + 2*155)),
    (const 64 (-(2**20))) <=s u_138_155, u_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_155, v_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_155, r_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_155, s_138_155 <=s (const 64 ((2**20))),
    u_138_155 + v_138_155 <=s (const 64 (2**20)),
    u_138_155 - v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 + v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 - v_138_155 <=s (const 64 (2**20)),
    r_138_155 + s_138_155 <=s (const 64 (2**20)),
    r_138_155 - s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 + s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 - s_138_155 <=s (const 64 (2**20)),
    u_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_138_155 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_154_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_16,
sint64 neg_g_118_low60_20_low20_16,
sint64 neg_f_118_low60_20_low20_17,
sint64 neg_g_118_low60_20_low20_17,
sint64 u_138_154,
sint64 v_138_154,
sint64 r_138_154,
sint64 s_138_154,
sint64 u_138_155,
sint64 v_138_155,
sint64 r_138_155,
sint64 s_138_155,
bit ne
)={
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (-(2**20)),
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (-(2**20))
&&
    u_138_154 * neg_f_118_low60_20_low20_0 + v_138_154 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_16 * (const 64 (-(2**20))),
    r_138_154 * neg_f_118_low60_20_low20_0 + s_138_154 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_16 + u_138_154 * (const 64 (2**21)) + v_138_154 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_16 + r_138_154 * (const 64 (2**21)) + s_138_154 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_16,
    neg_f_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_16,
    neg_g_118_low60_20_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 154)) <=s delta, delta <=s (const 64 (1 + 2*154)),
    (const 64 (-(2**20))) <=s u_138_154, u_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_154, v_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_154, r_138_154 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_154, s_138_154 <=s (const 64 ((2**20))),
    u_138_154 + v_138_154 <=s (const 64 (2**20)),
    u_138_154 - v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 + v_138_154 <=s (const 64 (2**20)),
    (const 64 0) - u_138_154 - v_138_154 <=s (const 64 (2**20)),
    r_138_154 + s_138_154 <=s (const 64 (2**20)),
    r_138_154 - s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 + s_138_154 <=s (const 64 (2**20)),
    (const 64 0) - r_138_154 - s_138_154 <=s (const 64 (2**20)),
    u_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_138_154 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_138_154 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step154

// premise c
assume
neg_g_118_low60_20_low20_16 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_17 neg_g_118_low60_20_low20_16;
mov u_138_155 r_138_154;
mov v_138_155 s_138_154;

subs dc neg_g_118_low60_20_low20_17 neg_g_118_low60_20_low20_16 neg_f_118_low60_20_low20_16;
asr neg_g_118_low60_20_low20_17 neg_g_118_low60_20_low20_17 1;
subs dc r_138_155 r_138_154 u_138_154;
asr r_138_155 r_138_155 1;
subs dc s_138_155 s_138_154 v_138_154;
asr s_138_155 s_138_155 1;
assert
    true
&&
    neg_f_118_low60_20_low20_17 = neg_g_118_low60_20_low20_16,
    u_138_155 = r_138_154,
    v_138_155 = s_138_154,
    neg_g_118_low60_20_low20_17 * (const 64 2) = neg_g_118_low60_20_low20_16 - neg_f_118_low60_20_low20_16,
    r_138_155 * (const 64 2) = r_138_154 - u_138_154,
    s_138_155 * (const 64 2) = s_138_154 - v_138_154
;

assume
    neg_f_118_low60_20_low20_17 = neg_g_118_low60_20_low20_16,
    u_138_155 = r_138_154,
    v_138_155 = s_138_154,
    neg_g_118_low60_20_low20_17 * 2 = neg_g_118_low60_20_low20_16 - neg_f_118_low60_20_low20_16,
    r_138_155 * 2 = r_138_154 - u_138_154,
    s_138_155 * 2 = s_138_154 - v_138_154
&&
    true
;

{
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_17 + u_138_155 * (const 64 (2**21)) + v_138_155 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_17 + r_138_155 * (const 64 (2**21)) + s_138_155 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_17,
    neg_f_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_17,
    neg_g_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 155)) <=s delta, delta <=s (const 64 (1 + 2*155)),
    (const 64 (-(2**20))) <=s u_138_155, u_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_155, v_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_155, r_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_155, s_138_155 <=s (const 64 ((2**20))),
    u_138_155 + v_138_155 <=s (const 64 (2**20)),
    u_138_155 - v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 + v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 - v_138_155 <=s (const 64 (2**20)),
    r_138_155 + s_138_155 <=s (const 64 (2**20)),
    r_138_155 - s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 + s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 - s_138_155 <=s (const 64 (2**20)),
    u_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_138_155 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_155_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_17,
sint64 neg_g_118_low60_20_low20_17,
sint64 neg_f_118_low60_20_low20_18,
sint64 neg_g_118_low60_20_low20_18,
sint64 u_138_155,
sint64 v_138_155,
sint64 r_138_155,
sint64 s_138_155,
sint64 u_138_156,
sint64 v_138_156,
sint64 r_138_156,
sint64 s_138_156,
bit ne
)={
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (-(2**20)),
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (-(2**20))
&&
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (const 64 (-(2**20))),
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_17 + u_138_155 * (const 64 (2**21)) + v_138_155 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_17 + r_138_155 * (const 64 (2**21)) + s_138_155 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_17,
    neg_f_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_17,
    neg_g_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 155)) <=s delta, delta <=s (const 64 (1 + 2*155)),
    (const 64 (-(2**20))) <=s u_138_155, u_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_155, v_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_155, r_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_155, s_138_155 <=s (const 64 ((2**20))),
    u_138_155 + v_138_155 <=s (const 64 (2**20)),
    u_138_155 - v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 + v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 - v_138_155 <=s (const 64 (2**20)),
    r_138_155 + s_138_155 <=s (const 64 (2**20)),
    r_138_155 - s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 + s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 - s_138_155 <=s (const 64 (2**20)),
    u_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_138_155 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step155

// premise a
assume
neg_g_118_low60_20_low20_17 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_18 neg_f_118_low60_20_low20_17;
mov u_138_156 u_138_155;
mov v_138_156 v_138_155;

asr neg_g_118_low60_20_low20_18 neg_g_118_low60_20_low20_17 1;
asr r_138_156 r_138_155 1;
asr s_138_156 s_138_155 1;
assert
    true
&&
    neg_f_118_low60_20_low20_18 = neg_f_118_low60_20_low20_17,
    u_138_156 = u_138_155,
    v_138_156 = v_138_155,
    neg_g_118_low60_20_low20_18 * (const 64 2) = neg_g_118_low60_20_low20_17,
    r_138_156 * (const 64 2) = r_138_155,
    s_138_156 * (const 64 2) = s_138_155
;

assume
    neg_f_118_low60_20_low20_18 = neg_f_118_low60_20_low20_17,
    u_138_156 = u_138_155,
    v_138_156 = v_138_155,
    neg_g_118_low60_20_low20_18 * 2 = neg_g_118_low60_20_low20_17,
    r_138_156 * 2 = r_138_155,
    s_138_156 * 2 = s_138_155
&&
    true
;

{
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_18 + u_138_156 * (const 64 (2**21)) + v_138_156 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_18 + r_138_156 * (const 64 (2**21)) + s_138_156 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_18,
    neg_f_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_18,
    neg_g_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 156)) <=s delta, delta <=s (const 64 (1 + 2*156)),
    (const 64 (-(2**20))) <=s u_138_156, u_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_156, v_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_156, r_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_156, s_138_156 <=s (const 64 ((2**20))),
    u_138_156 + v_138_156 <=s (const 64 (2**20)),
    u_138_156 - v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 + v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 - v_138_156 <=s (const 64 (2**20)),
    r_138_156 + s_138_156 <=s (const 64 (2**20)),
    r_138_156 - s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 + s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 - s_138_156 <=s (const 64 (2**20)),
    u_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_138_156 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_155_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_17,
sint64 neg_g_118_low60_20_low20_17,
sint64 neg_f_118_low60_20_low20_18,
sint64 neg_g_118_low60_20_low20_18,
sint64 u_138_155,
sint64 v_138_155,
sint64 r_138_155,
sint64 s_138_155,
sint64 u_138_156,
sint64 v_138_156,
sint64 r_138_156,
sint64 s_138_156,
bit ne
)={
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (-(2**20)),
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (-(2**20))
&&
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (const 64 (-(2**20))),
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_17 + u_138_155 * (const 64 (2**21)) + v_138_155 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_17 + r_138_155 * (const 64 (2**21)) + s_138_155 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_17,
    neg_f_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_17,
    neg_g_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 155)) <=s delta, delta <=s (const 64 (1 + 2*155)),
    (const 64 (-(2**20))) <=s u_138_155, u_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_155, v_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_155, r_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_155, s_138_155 <=s (const 64 ((2**20))),
    u_138_155 + v_138_155 <=s (const 64 (2**20)),
    u_138_155 - v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 + v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 - v_138_155 <=s (const 64 (2**20)),
    r_138_155 + s_138_155 <=s (const 64 (2**20)),
    r_138_155 - s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 + s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 - s_138_155 <=s (const 64 (2**20)),
    u_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_138_155 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step155

// premise b
assume
neg_g_118_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_18 neg_f_118_low60_20_low20_17;
mov u_138_156 u_138_155;
mov v_138_156 v_138_155;

add neg_g_118_low60_20_low20_18 neg_g_118_low60_20_low20_17 neg_f_118_low60_20_low20_17;
asr neg_g_118_low60_20_low20_18 neg_g_118_low60_20_low20_18 1;
add r_138_156 r_138_155 u_138_155;
asr r_138_156 r_138_156 1;
add s_138_156 s_138_155 v_138_155;
asr s_138_156 s_138_156 1;
assert
    true
&&
    neg_f_118_low60_20_low20_18 = neg_f_118_low60_20_low20_17,
    u_138_156 = u_138_155,
    v_138_156 = v_138_155,
    neg_g_118_low60_20_low20_18 * (const 64 2) = neg_g_118_low60_20_low20_17 + neg_f_118_low60_20_low20_17,
    r_138_156 * (const 64 2) = r_138_155 + u_138_155,
    s_138_156 * (const 64 2) = s_138_155 + v_138_155
;

assume
    neg_f_118_low60_20_low20_18 = neg_f_118_low60_20_low20_17,
    u_138_156 = u_138_155,
    v_138_156 = v_138_155,
    neg_g_118_low60_20_low20_18 * 2 = neg_g_118_low60_20_low20_17 + neg_f_118_low60_20_low20_17,
    r_138_156 * 2 = r_138_155 + u_138_155,
    s_138_156 * 2 = s_138_155 + v_138_155
&&
    true
;

{
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_18 + u_138_156 * (const 64 (2**21)) + v_138_156 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_18 + r_138_156 * (const 64 (2**21)) + s_138_156 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_18,
    neg_f_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_18,
    neg_g_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 156)) <=s delta, delta <=s (const 64 (1 + 2*156)),
    (const 64 (-(2**20))) <=s u_138_156, u_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_156, v_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_156, r_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_156, s_138_156 <=s (const 64 ((2**20))),
    u_138_156 + v_138_156 <=s (const 64 (2**20)),
    u_138_156 - v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 + v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 - v_138_156 <=s (const 64 (2**20)),
    r_138_156 + s_138_156 <=s (const 64 (2**20)),
    r_138_156 - s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 + s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 - s_138_156 <=s (const 64 (2**20)),
    u_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_138_156 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_155_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_17,
sint64 neg_g_118_low60_20_low20_17,
sint64 neg_f_118_low60_20_low20_18,
sint64 neg_g_118_low60_20_low20_18,
sint64 u_138_155,
sint64 v_138_155,
sint64 r_138_155,
sint64 s_138_155,
sint64 u_138_156,
sint64 v_138_156,
sint64 r_138_156,
sint64 s_138_156,
bit ne
)={
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (-(2**20)),
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (-(2**20))
&&
    u_138_155 * neg_f_118_low60_20_low20_0 + v_138_155 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_17 * (const 64 (-(2**20))),
    r_138_155 * neg_f_118_low60_20_low20_0 + s_138_155 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_17 + u_138_155 * (const 64 (2**21)) + v_138_155 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_17 + r_138_155 * (const 64 (2**21)) + s_138_155 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_17,
    neg_f_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_17,
    neg_g_118_low60_20_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 155)) <=s delta, delta <=s (const 64 (1 + 2*155)),
    (const 64 (-(2**20))) <=s u_138_155, u_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_155, v_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_155, r_138_155 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_155, s_138_155 <=s (const 64 ((2**20))),
    u_138_155 + v_138_155 <=s (const 64 (2**20)),
    u_138_155 - v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 + v_138_155 <=s (const 64 (2**20)),
    (const 64 0) - u_138_155 - v_138_155 <=s (const 64 (2**20)),
    r_138_155 + s_138_155 <=s (const 64 (2**20)),
    r_138_155 - s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 + s_138_155 <=s (const 64 (2**20)),
    (const 64 0) - r_138_155 - s_138_155 <=s (const 64 (2**20)),
    u_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_138_155 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_138_155 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step155

// premise c
assume
neg_g_118_low60_20_low20_17 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_18 neg_g_118_low60_20_low20_17;
mov u_138_156 r_138_155;
mov v_138_156 s_138_155;

subs dc neg_g_118_low60_20_low20_18 neg_g_118_low60_20_low20_17 neg_f_118_low60_20_low20_17;
asr neg_g_118_low60_20_low20_18 neg_g_118_low60_20_low20_18 1;
subs dc r_138_156 r_138_155 u_138_155;
asr r_138_156 r_138_156 1;
subs dc s_138_156 s_138_155 v_138_155;
asr s_138_156 s_138_156 1;
assert
    true
&&
    neg_f_118_low60_20_low20_18 = neg_g_118_low60_20_low20_17,
    u_138_156 = r_138_155,
    v_138_156 = s_138_155,
    neg_g_118_low60_20_low20_18 * (const 64 2) = neg_g_118_low60_20_low20_17 - neg_f_118_low60_20_low20_17,
    r_138_156 * (const 64 2) = r_138_155 - u_138_155,
    s_138_156 * (const 64 2) = s_138_155 - v_138_155
;

assume
    neg_f_118_low60_20_low20_18 = neg_g_118_low60_20_low20_17,
    u_138_156 = r_138_155,
    v_138_156 = s_138_155,
    neg_g_118_low60_20_low20_18 * 2 = neg_g_118_low60_20_low20_17 - neg_f_118_low60_20_low20_17,
    r_138_156 * 2 = r_138_155 - u_138_155,
    s_138_156 * 2 = s_138_155 - v_138_155
&&
    true
;

{
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_18 + u_138_156 * (const 64 (2**21)) + v_138_156 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_18 + r_138_156 * (const 64 (2**21)) + s_138_156 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_18,
    neg_f_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_18,
    neg_g_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 156)) <=s delta, delta <=s (const 64 (1 + 2*156)),
    (const 64 (-(2**20))) <=s u_138_156, u_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_156, v_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_156, r_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_156, s_138_156 <=s (const 64 ((2**20))),
    u_138_156 + v_138_156 <=s (const 64 (2**20)),
    u_138_156 - v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 + v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 - v_138_156 <=s (const 64 (2**20)),
    r_138_156 + s_138_156 <=s (const 64 (2**20)),
    r_138_156 - s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 + s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 - s_138_156 <=s (const 64 (2**20)),
    u_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_138_156 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_156_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_18,
sint64 neg_g_118_low60_20_low20_18,
sint64 neg_f_118_low60_20_low20_19,
sint64 neg_g_118_low60_20_low20_19,
sint64 u_138_156,
sint64 v_138_156,
sint64 r_138_156,
sint64 s_138_156,
sint64 u_138_157,
sint64 v_138_157,
sint64 r_138_157,
sint64 s_138_157,
bit ne
)={
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (-(2**20)),
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (-(2**20))
&&
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (const 64 (-(2**20))),
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_18 + u_138_156 * (const 64 (2**21)) + v_138_156 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_18 + r_138_156 * (const 64 (2**21)) + s_138_156 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_18,
    neg_f_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_18,
    neg_g_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 156)) <=s delta, delta <=s (const 64 (1 + 2*156)),
    (const 64 (-(2**20))) <=s u_138_156, u_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_156, v_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_156, r_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_156, s_138_156 <=s (const 64 ((2**20))),
    u_138_156 + v_138_156 <=s (const 64 (2**20)),
    u_138_156 - v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 + v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 - v_138_156 <=s (const 64 (2**20)),
    r_138_156 + s_138_156 <=s (const 64 (2**20)),
    r_138_156 - s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 + s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 - s_138_156 <=s (const 64 (2**20)),
    u_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_138_156 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step156

// premise a
assume
neg_g_118_low60_20_low20_18 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_19 neg_f_118_low60_20_low20_18;
mov u_138_157 u_138_156;
mov v_138_157 v_138_156;

asr neg_g_118_low60_20_low20_19 neg_g_118_low60_20_low20_18 1;
asr r_138_157 r_138_156 1;
asr s_138_157 s_138_156 1;
assert
    true
&&
    neg_f_118_low60_20_low20_19 = neg_f_118_low60_20_low20_18,
    u_138_157 = u_138_156,
    v_138_157 = v_138_156,
    neg_g_118_low60_20_low20_19 * (const 64 2) = neg_g_118_low60_20_low20_18,
    r_138_157 * (const 64 2) = r_138_156,
    s_138_157 * (const 64 2) = s_138_156
;

assume
    neg_f_118_low60_20_low20_19 = neg_f_118_low60_20_low20_18,
    u_138_157 = u_138_156,
    v_138_157 = v_138_156,
    neg_g_118_low60_20_low20_19 * 2 = neg_g_118_low60_20_low20_18,
    r_138_157 * 2 = r_138_156,
    s_138_157 * 2 = s_138_156
&&
    true
;

{
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_19 + u_138_157 * (const 64 (2**21)) + v_138_157 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_19 + r_138_157 * (const 64 (2**21)) + s_138_157 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_19,
    neg_f_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_19,
    neg_g_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 157)) <=s delta, delta <=s (const 64 (1 + 2*157)),
    (const 64 (-(2**20))) <=s u_138_157, u_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_157, v_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_157, r_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_157, s_138_157 <=s (const 64 ((2**20))),
    u_138_157 + v_138_157 <=s (const 64 (2**20)),
    u_138_157 - v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 + v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 - v_138_157 <=s (const 64 (2**20)),
    r_138_157 + s_138_157 <=s (const 64 (2**20)),
    r_138_157 - s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 + s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 - s_138_157 <=s (const 64 (2**20)),
    u_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_138_157 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_156_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_18,
sint64 neg_g_118_low60_20_low20_18,
sint64 neg_f_118_low60_20_low20_19,
sint64 neg_g_118_low60_20_low20_19,
sint64 u_138_156,
sint64 v_138_156,
sint64 r_138_156,
sint64 s_138_156,
sint64 u_138_157,
sint64 v_138_157,
sint64 r_138_157,
sint64 s_138_157,
bit ne
)={
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (-(2**20)),
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (-(2**20))
&&
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (const 64 (-(2**20))),
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_18 + u_138_156 * (const 64 (2**21)) + v_138_156 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_18 + r_138_156 * (const 64 (2**21)) + s_138_156 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_18,
    neg_f_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_18,
    neg_g_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 156)) <=s delta, delta <=s (const 64 (1 + 2*156)),
    (const 64 (-(2**20))) <=s u_138_156, u_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_156, v_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_156, r_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_156, s_138_156 <=s (const 64 ((2**20))),
    u_138_156 + v_138_156 <=s (const 64 (2**20)),
    u_138_156 - v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 + v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 - v_138_156 <=s (const 64 (2**20)),
    r_138_156 + s_138_156 <=s (const 64 (2**20)),
    r_138_156 - s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 + s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 - s_138_156 <=s (const 64 (2**20)),
    u_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_138_156 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step156

// premise b
assume
neg_g_118_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_19 neg_f_118_low60_20_low20_18;
mov u_138_157 u_138_156;
mov v_138_157 v_138_156;

add neg_g_118_low60_20_low20_19 neg_g_118_low60_20_low20_18 neg_f_118_low60_20_low20_18;
asr neg_g_118_low60_20_low20_19 neg_g_118_low60_20_low20_19 1;
add r_138_157 r_138_156 u_138_156;
asr r_138_157 r_138_157 1;
add s_138_157 s_138_156 v_138_156;
asr s_138_157 s_138_157 1;
assert
    true
&&
    neg_f_118_low60_20_low20_19 = neg_f_118_low60_20_low20_18,
    u_138_157 = u_138_156,
    v_138_157 = v_138_156,
    neg_g_118_low60_20_low20_19 * (const 64 2) = neg_g_118_low60_20_low20_18 + neg_f_118_low60_20_low20_18,
    r_138_157 * (const 64 2) = r_138_156 + u_138_156,
    s_138_157 * (const 64 2) = s_138_156 + v_138_156
;

assume
    neg_f_118_low60_20_low20_19 = neg_f_118_low60_20_low20_18,
    u_138_157 = u_138_156,
    v_138_157 = v_138_156,
    neg_g_118_low60_20_low20_19 * 2 = neg_g_118_low60_20_low20_18 + neg_f_118_low60_20_low20_18,
    r_138_157 * 2 = r_138_156 + u_138_156,
    s_138_157 * 2 = s_138_156 + v_138_156
&&
    true
;

{
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_19 + u_138_157 * (const 64 (2**21)) + v_138_157 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_19 + r_138_157 * (const 64 (2**21)) + s_138_157 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_19,
    neg_f_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_19,
    neg_g_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 157)) <=s delta, delta <=s (const 64 (1 + 2*157)),
    (const 64 (-(2**20))) <=s u_138_157, u_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_157, v_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_157, r_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_157, s_138_157 <=s (const 64 ((2**20))),
    u_138_157 + v_138_157 <=s (const 64 (2**20)),
    u_138_157 - v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 + v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 - v_138_157 <=s (const 64 (2**20)),
    r_138_157 + s_138_157 <=s (const 64 (2**20)),
    r_138_157 - s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 + s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 - s_138_157 <=s (const 64 (2**20)),
    u_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_138_157 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_156_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_18,
sint64 neg_g_118_low60_20_low20_18,
sint64 neg_f_118_low60_20_low20_19,
sint64 neg_g_118_low60_20_low20_19,
sint64 u_138_156,
sint64 v_138_156,
sint64 r_138_156,
sint64 s_138_156,
sint64 u_138_157,
sint64 v_138_157,
sint64 r_138_157,
sint64 s_138_157,
bit ne
)={
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (-(2**20)),
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (-(2**20))
&&
    u_138_156 * neg_f_118_low60_20_low20_0 + v_138_156 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_18 * (const 64 (-(2**20))),
    r_138_156 * neg_f_118_low60_20_low20_0 + s_138_156 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_18 + u_138_156 * (const 64 (2**21)) + v_138_156 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_18 + r_138_156 * (const 64 (2**21)) + s_138_156 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_18,
    neg_f_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_18,
    neg_g_118_low60_20_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 156)) <=s delta, delta <=s (const 64 (1 + 2*156)),
    (const 64 (-(2**20))) <=s u_138_156, u_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_156, v_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_156, r_138_156 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_156, s_138_156 <=s (const 64 ((2**20))),
    u_138_156 + v_138_156 <=s (const 64 (2**20)),
    u_138_156 - v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 + v_138_156 <=s (const 64 (2**20)),
    (const 64 0) - u_138_156 - v_138_156 <=s (const 64 (2**20)),
    r_138_156 + s_138_156 <=s (const 64 (2**20)),
    r_138_156 - s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 + s_138_156 <=s (const 64 (2**20)),
    (const 64 0) - r_138_156 - s_138_156 <=s (const 64 (2**20)),
    u_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_138_156 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_138_156 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step156

// premise c
assume
neg_g_118_low60_20_low20_18 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_19 neg_g_118_low60_20_low20_18;
mov u_138_157 r_138_156;
mov v_138_157 s_138_156;

subs dc neg_g_118_low60_20_low20_19 neg_g_118_low60_20_low20_18 neg_f_118_low60_20_low20_18;
asr neg_g_118_low60_20_low20_19 neg_g_118_low60_20_low20_19 1;
subs dc r_138_157 r_138_156 u_138_156;
asr r_138_157 r_138_157 1;
subs dc s_138_157 s_138_156 v_138_156;
asr s_138_157 s_138_157 1;
assert
    true
&&
    neg_f_118_low60_20_low20_19 = neg_g_118_low60_20_low20_18,
    u_138_157 = r_138_156,
    v_138_157 = s_138_156,
    neg_g_118_low60_20_low20_19 * (const 64 2) = neg_g_118_low60_20_low20_18 - neg_f_118_low60_20_low20_18,
    r_138_157 * (const 64 2) = r_138_156 - u_138_156,
    s_138_157 * (const 64 2) = s_138_156 - v_138_156
;

assume
    neg_f_118_low60_20_low20_19 = neg_g_118_low60_20_low20_18,
    u_138_157 = r_138_156,
    v_138_157 = s_138_156,
    neg_g_118_low60_20_low20_19 * 2 = neg_g_118_low60_20_low20_18 - neg_f_118_low60_20_low20_18,
    r_138_157 * 2 = r_138_156 - u_138_156,
    s_138_157 * 2 = s_138_156 - v_138_156
&&
    true
;

{
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_19 + u_138_157 * (const 64 (2**21)) + v_138_157 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_19 + r_138_157 * (const 64 (2**21)) + s_138_157 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_19,
    neg_f_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_19,
    neg_g_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 157)) <=s delta, delta <=s (const 64 (1 + 2*157)),
    (const 64 (-(2**20))) <=s u_138_157, u_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_157, v_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_157, r_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_157, s_138_157 <=s (const 64 ((2**20))),
    u_138_157 + v_138_157 <=s (const 64 (2**20)),
    u_138_157 - v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 + v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 - v_138_157 <=s (const 64 (2**20)),
    r_138_157 + s_138_157 <=s (const 64 (2**20)),
    r_138_157 - s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 + s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 - s_138_157 <=s (const 64 (2**20)),
    u_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_138_157 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_157_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_19,
sint64 neg_g_118_low60_20_low20_19,
sint64 neg_f_118_low60_20_low20_20,
sint64 neg_g_118_low60_20_low20_20,
sint64 u_138_157,
sint64 v_138_157,
sint64 r_138_157,
sint64 s_138_157,
sint64 u_138_158,
sint64 v_138_158,
sint64 r_138_158,
sint64 s_138_158,
bit ne
)={
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (-(2**20)),
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (-(2**20))
&&
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (const 64 (-(2**20))),
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_19 + u_138_157 * (const 64 (2**21)) + v_138_157 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_19 + r_138_157 * (const 64 (2**21)) + s_138_157 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_19,
    neg_f_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_19,
    neg_g_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 157)) <=s delta, delta <=s (const 64 (1 + 2*157)),
    (const 64 (-(2**20))) <=s u_138_157, u_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_157, v_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_157, r_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_157, s_138_157 <=s (const 64 ((2**20))),
    u_138_157 + v_138_157 <=s (const 64 (2**20)),
    u_138_157 - v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 + v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 - v_138_157 <=s (const 64 (2**20)),
    r_138_157 + s_138_157 <=s (const 64 (2**20)),
    r_138_157 - s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 + s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 - s_138_157 <=s (const 64 (2**20)),
    u_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_138_157 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step157

// premise a
assume
neg_g_118_low60_20_low20_19 = 0 (mod 2)
&&
neg_g_118_low60_20_low20_19 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_118_low60_20_low20_20 neg_f_118_low60_20_low20_19;
mov u_138_158 u_138_157;
mov v_138_158 v_138_157;

asr neg_g_118_low60_20_low20_20 neg_g_118_low60_20_low20_19 1;
asr r_138_158 r_138_157 1;
asr s_138_158 s_138_157 1;
assert
    true
&&
    neg_f_118_low60_20_low20_20 = neg_f_118_low60_20_low20_19,
    u_138_158 = u_138_157,
    v_138_158 = v_138_157,
    neg_g_118_low60_20_low20_20 * (const 64 2) = neg_g_118_low60_20_low20_19,
    r_138_158 * (const 64 2) = r_138_157,
    s_138_158 * (const 64 2) = s_138_157
;

assume
    neg_f_118_low60_20_low20_20 = neg_f_118_low60_20_low20_19,
    u_138_158 = u_138_157,
    v_138_158 = v_138_157,
    neg_g_118_low60_20_low20_20 * 2 = neg_g_118_low60_20_low20_19,
    r_138_158 * 2 = r_138_157,
    s_138_158 * 2 = s_138_157
&&
    true
;

{
    u_138_158 * neg_f_118_low60_20_low20_0 + v_138_158 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_158 * neg_f_118_low60_20_low20_0 + s_138_158 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_20 + u_138_158 * (const 64 (2**21)) + v_138_158 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_20 + r_138_158 * (const 64 (2**21)) + s_138_158 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_20,
    neg_f_118_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_20,
    neg_g_118_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 158)) <=s delta, delta <=s (const 64 (1 + 2*158)),
    (const 64 (-(2**20))) <=s u_138_158, u_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_158, v_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_158, r_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_158, s_138_158 <=s (const 64 ((2**20))),
    u_138_158 + v_138_158 <=s (const 64 (2**20)),
    u_138_158 - v_138_158 <=s (const 64 (2**20)),
    (const 64 0) - u_138_158 + v_138_158 <=s (const 64 (2**20)),
    (const 64 0) - u_138_158 - v_138_158 <=s (const 64 (2**20)),
    r_138_158 + s_138_158 <=s (const 64 (2**20)),
    r_138_158 - s_138_158 <=s (const 64 (2**20)),
    (const 64 0) - r_138_158 + s_138_158 <=s (const 64 (2**20)),
    (const 64 0) - r_138_158 - s_138_158 <=s (const 64 (2**20)),
    u_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_138_158 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_157_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_19,
sint64 neg_g_118_low60_20_low20_19,
sint64 neg_f_118_low60_20_low20_20,
sint64 neg_g_118_low60_20_low20_20,
sint64 u_138_157,
sint64 v_138_157,
sint64 r_138_157,
sint64 s_138_157,
sint64 u_138_158,
sint64 v_138_158,
sint64 r_138_158,
sint64 s_138_158,
bit ne
)={
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (-(2**20)),
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (-(2**20))
&&
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (const 64 (-(2**20))),
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_19 + u_138_157 * (const 64 (2**21)) + v_138_157 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_19 + r_138_157 * (const 64 (2**21)) + s_138_157 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_19,
    neg_f_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_19,
    neg_g_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 157)) <=s delta, delta <=s (const 64 (1 + 2*157)),
    (const 64 (-(2**20))) <=s u_138_157, u_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_157, v_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_157, r_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_157, s_138_157 <=s (const 64 ((2**20))),
    u_138_157 + v_138_157 <=s (const 64 (2**20)),
    u_138_157 - v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 + v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 - v_138_157 <=s (const 64 (2**20)),
    r_138_157 + s_138_157 <=s (const 64 (2**20)),
    r_138_157 - s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 + s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 - s_138_157 <=s (const 64 (2**20)),
    u_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_138_157 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step157

// premise b
assume
neg_g_118_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_20 neg_f_118_low60_20_low20_19;
mov u_138_158 u_138_157;
mov v_138_158 v_138_157;

add neg_g_118_low60_20_low20_20 neg_g_118_low60_20_low20_19 neg_f_118_low60_20_low20_19;
asr neg_g_118_low60_20_low20_20 neg_g_118_low60_20_low20_20 1;
add r_138_158 r_138_157 u_138_157;
asr r_138_158 r_138_158 1;
add s_138_158 s_138_157 v_138_157;
asr s_138_158 s_138_158 1;
assert
    true
&&
    neg_f_118_low60_20_low20_20 = neg_f_118_low60_20_low20_19,
    u_138_158 = u_138_157,
    v_138_158 = v_138_157,
    neg_g_118_low60_20_low20_20 * (const 64 2) = neg_g_118_low60_20_low20_19 + neg_f_118_low60_20_low20_19,
    r_138_158 * (const 64 2) = r_138_157 + u_138_157,
    s_138_158 * (const 64 2) = s_138_157 + v_138_157
;

assume
    neg_f_118_low60_20_low20_20 = neg_f_118_low60_20_low20_19,
    u_138_158 = u_138_157,
    v_138_158 = v_138_157,
    neg_g_118_low60_20_low20_20 * 2 = neg_g_118_low60_20_low20_19 + neg_f_118_low60_20_low20_19,
    r_138_158 * 2 = r_138_157 + u_138_157,
    s_138_158 * 2 = s_138_157 + v_138_157
&&
    true
;

{
    u_138_158 * neg_f_118_low60_20_low20_0 + v_138_158 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_158 * neg_f_118_low60_20_low20_0 + s_138_158 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_20 + u_138_158 * (const 64 (2**21)) + v_138_158 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_20 + r_138_158 * (const 64 (2**21)) + s_138_158 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_20,
    neg_f_118_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_20,
    neg_g_118_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 158)) <=s delta, delta <=s (const 64 (1 + 2*158)),
    (const 64 (-(2**20))) <=s u_138_158, u_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_158, v_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_158, r_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_158, s_138_158 <=s (const 64 ((2**20))),
    u_138_158 + v_138_158 <=s (const 64 (2**20)),
    u_138_158 - v_138_158 <=s (const 64 (2**20)),
    (const 64 0) - u_138_158 + v_138_158 <=s (const 64 (2**20)),
    (const 64 0) - u_138_158 - v_138_158 <=s (const 64 (2**20)),
    r_138_158 + s_138_158 <=s (const 64 (2**20)),
    r_138_158 - s_138_158 <=s (const 64 (2**20)),
    (const 64 0) - r_138_158 + s_138_158 <=s (const 64 (2**20)),
    (const 64 0) - r_138_158 - s_138_158 <=s (const 64 (2**20)),
    u_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_138_158 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_157_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_118_low60_20_low20_0,
sint64 neg_g_118_low60_20_low20_0,
sint64 neg_f_118_low60_20_low20_19,
sint64 neg_g_118_low60_20_low20_19,
sint64 neg_f_118_low60_20_low20_20,
sint64 neg_g_118_low60_20_low20_20,
sint64 u_138_157,
sint64 v_138_157,
sint64 r_138_157,
sint64 s_138_157,
sint64 u_138_158,
sint64 v_138_158,
sint64 r_138_158,
sint64 s_138_158,
bit ne
)={
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (-(2**20)),
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (-(2**20))
&&
    u_138_157 * neg_f_118_low60_20_low20_0 + v_138_157 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_19 * (const 64 (-(2**20))),
    r_138_157 * neg_f_118_low60_20_low20_0 + s_138_157 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_118_low60_20_low20_19 + u_138_157 * (const 64 (2**21)) + v_138_157 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_19 + r_138_157 * (const 64 (2**21)) + s_138_157 * (const 64 (2**42)),
    const 64 0 <=s neg_f_118_low60_20_low20_0,
    neg_f_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_0,
    neg_g_118_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_118_low60_20_low20_19,
    neg_f_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_118_low60_20_low20_19,
    neg_g_118_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 157)) <=s delta, delta <=s (const 64 (1 + 2*157)),
    (const 64 (-(2**20))) <=s u_138_157, u_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_157, v_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_157, r_138_157 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_157, s_138_157 <=s (const 64 ((2**20))),
    u_138_157 + v_138_157 <=s (const 64 (2**20)),
    u_138_157 - v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 + v_138_157 <=s (const 64 (2**20)),
    (const 64 0) - u_138_157 - v_138_157 <=s (const 64 (2**20)),
    r_138_157 + s_138_157 <=s (const 64 (2**20)),
    r_138_157 - s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 + s_138_157 <=s (const 64 (2**20)),
    (const 64 0) - r_138_157 - s_138_157 <=s (const 64 (2**20)),
    u_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_138_157 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_138_157 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step157

// premise c
assume
neg_g_118_low60_20_low20_19 = 1 (mod 2)
&&
neg_g_118_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_118_low60_20_low20_20 neg_g_118_low60_20_low20_19;
mov u_138_158 r_138_157;
mov v_138_158 s_138_157;

subs dc neg_g_118_low60_20_low20_20 neg_g_118_low60_20_low20_19 neg_f_118_low60_20_low20_19;
asr neg_g_118_low60_20_low20_20 neg_g_118_low60_20_low20_20 1;
subs dc r_138_158 r_138_157 u_138_157;
asr r_138_158 r_138_158 1;
subs dc s_138_158 s_138_157 v_138_157;
asr s_138_158 s_138_158 1;
assert
    true
&&
    neg_f_118_low60_20_low20_20 = neg_g_118_low60_20_low20_19,
    u_138_158 = r_138_157,
    v_138_158 = s_138_157,
    neg_g_118_low60_20_low20_20 * (const 64 2) = neg_g_118_low60_20_low20_19 - neg_f_118_low60_20_low20_19,
    r_138_158 * (const 64 2) = r_138_157 - u_138_157,
    s_138_158 * (const 64 2) = s_138_157 - v_138_157
;

assume
    neg_f_118_low60_20_low20_20 = neg_g_118_low60_20_low20_19,
    u_138_158 = r_138_157,
    v_138_158 = s_138_157,
    neg_g_118_low60_20_low20_20 * 2 = neg_g_118_low60_20_low20_19 - neg_f_118_low60_20_low20_19,
    r_138_158 * 2 = r_138_157 - u_138_157,
    s_138_158 * 2 = s_138_157 - v_138_157
&&
    true
;

{
    u_138_158 * neg_f_118_low60_20_low20_0 + v_138_158 * neg_g_118_low60_20_low20_0 = neg_f_118_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_138_158 * neg_f_118_low60_20_low20_0 + s_138_158 * neg_g_118_low60_20_low20_0 = neg_g_118_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_118_low60_20_low20_20 + u_138_158 * (const 64 (2**21)) + v_138_158 * (const 64 (2**42)),
    grs = neg_g_118_low60_20_low20_20 + r_138_158 * (const 64 (2**21)) + s_138_158 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_118_low60_20_low20_20,
    neg_f_118_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_118_low60_20_low20_20,
    neg_g_118_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 158)) <=s delta, delta <=s (const 64 (1 + 2*158)),
    (const 64 (-(2**20))) <=s u_138_158, u_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_138_158, v_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_138_158, r_138_158 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_138_158, s_138_158 <=s (const 64 ((2**20))),
    u_138_158 + v_138_158 <=s (const 64 (2**20)),
    u_138_158 - v_138_158 <=s (const 64 (2**20)),
    (const 64 0) - u_138_158 + v_138_158 <=s (const 64 (2**20)),
    (const 64 0) - u_138_158 - v_138_158 <=s (const 64 (2**20)),
    r_138_158 + s_138_158 <=s (const 64 (2**20)),
    r_138_158 - s_138_158 <=s (const 64 (2**20)),
    (const 64 0) - r_138_158 + s_138_158 <=s (const 64 (2**20)),
    (const 64 0) - r_138_158 - s_138_158 <=s (const 64 (2**20)),
    u_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_138_158 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_138_158 = (const 64 0) (mod (const 64 (2**(20-20))))
}

