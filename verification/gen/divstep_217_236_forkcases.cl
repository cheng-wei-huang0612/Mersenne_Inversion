proc divstep_217_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_1,
sint64 neg_g_177_low60_40_low20_1,
sint64 u_217_217,
sint64 v_217_217,
sint64 r_217_217,
sint64 s_217_217,
sint64 u_217_218,
sint64 v_217_218,
sint64 r_217_218,
sint64 s_217_218,
bit ne
)={
    u_217_217 * neg_f_177_low60_40_low20_0 + v_217_217 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_0 * (-(2**20)),
    r_217_217 * neg_f_177_low60_40_low20_0 + s_217_217 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_0 * (-(2**20))
&&
    u_217_217 * neg_f_177_low60_40_low20_0 + v_217_217 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_0 * (const 64 (-(2**20))),
    r_217_217 * neg_f_177_low60_40_low20_0 + s_217_217 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_0 + u_217_217 * (const 64 (2**21)) + v_217_217 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_0 + r_217_217 * (const 64 (2**21)) + s_217_217 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 217)) <=s delta, delta <=s (const 64 (1 + 2*217)),
    u_217_217 = (const 64 (-(2**20))),
    v_217_217 = (const 64 (0)),
    r_217_217 = (const 64 (0)),
    s_217_217 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise a
assume
neg_g_177_low60_40_low20_0 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_40_low20_1 neg_f_177_low60_40_low20_0;
mov u_217_218 u_217_217;
mov v_217_218 v_217_217;

asr neg_g_177_low60_40_low20_1 neg_g_177_low60_40_low20_0 1;
asr r_217_218 r_217_217 1;
asr s_217_218 s_217_217 1;
assert
    true
&&
    neg_f_177_low60_40_low20_1 = neg_f_177_low60_40_low20_0,
    u_217_218 = u_217_217,
    v_217_218 = v_217_217,
    neg_g_177_low60_40_low20_1 * (const 64 2) = neg_g_177_low60_40_low20_0,
    r_217_218 * (const 64 2) = r_217_217,
    s_217_218 * (const 64 2) = s_217_217
;

assume
    neg_f_177_low60_40_low20_1 = neg_f_177_low60_40_low20_0,
    u_217_218 = u_217_217,
    v_217_218 = v_217_217,
    neg_g_177_low60_40_low20_1 * 2 = neg_g_177_low60_40_low20_0,
    r_217_218 * 2 = r_217_217,
    s_217_218 * 2 = s_217_217
&&
    true
;

{
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_1 + u_217_218 * (const 64 (2**21)) + v_217_218 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_1 + r_217_218 * (const 64 (2**21)) + s_217_218 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_1,
    neg_f_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_1,
    neg_g_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 218)) <=s delta, delta <=s (const 64 (1 + 2*218)),
    (const 64 (-(2**20))) <=s u_217_218, u_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_218, v_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_218, r_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_218, s_217_218 <=s (const 64 ((2**20))),
    u_217_218 + v_217_218 <=s (const 64 (2**20)),
    u_217_218 - v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 + v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 - v_217_218 <=s (const 64 (2**20)),
    r_217_218 + s_217_218 <=s (const 64 (2**20)),
    r_217_218 - s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 + s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 - s_217_218 <=s (const 64 (2**20)),
    u_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_217_218 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_217_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_1,
sint64 neg_g_177_low60_40_low20_1,
sint64 u_217_217,
sint64 v_217_217,
sint64 r_217_217,
sint64 s_217_217,
sint64 u_217_218,
sint64 v_217_218,
sint64 r_217_218,
sint64 s_217_218,
bit ne
)={
    u_217_217 * neg_f_177_low60_40_low20_0 + v_217_217 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_0 * (-(2**20)),
    r_217_217 * neg_f_177_low60_40_low20_0 + s_217_217 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_0 * (-(2**20))
&&
    u_217_217 * neg_f_177_low60_40_low20_0 + v_217_217 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_0 * (const 64 (-(2**20))),
    r_217_217 * neg_f_177_low60_40_low20_0 + s_217_217 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_0 + u_217_217 * (const 64 (2**21)) + v_217_217 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_0 + r_217_217 * (const 64 (2**21)) + s_217_217 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 217)) <=s delta, delta <=s (const 64 (1 + 2*217)),
    u_217_217 = (const 64 (-(2**20))),
    v_217_217 = (const 64 (0)),
    r_217_217 = (const 64 (0)),
    s_217_217 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise b
assume
neg_g_177_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_1 neg_f_177_low60_40_low20_0;
mov u_217_218 u_217_217;
mov v_217_218 v_217_217;

add neg_g_177_low60_40_low20_1 neg_g_177_low60_40_low20_0 neg_f_177_low60_40_low20_0;
asr neg_g_177_low60_40_low20_1 neg_g_177_low60_40_low20_1 1;
add r_217_218 r_217_217 u_217_217;
asr r_217_218 r_217_218 1;
add s_217_218 s_217_217 v_217_217;
asr s_217_218 s_217_218 1;
assert
    true
&&
    neg_f_177_low60_40_low20_1 = neg_f_177_low60_40_low20_0,
    u_217_218 = u_217_217,
    v_217_218 = v_217_217,
    neg_g_177_low60_40_low20_1 * (const 64 2) = neg_g_177_low60_40_low20_0 + neg_f_177_low60_40_low20_0,
    r_217_218 * (const 64 2) = r_217_217 + u_217_217,
    s_217_218 * (const 64 2) = s_217_217 + v_217_217
;

assume
    neg_f_177_low60_40_low20_1 = neg_f_177_low60_40_low20_0,
    u_217_218 = u_217_217,
    v_217_218 = v_217_217,
    neg_g_177_low60_40_low20_1 * 2 = neg_g_177_low60_40_low20_0 + neg_f_177_low60_40_low20_0,
    r_217_218 * 2 = r_217_217 + u_217_217,
    s_217_218 * 2 = s_217_217 + v_217_217
&&
    true
;

{
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_1 + u_217_218 * (const 64 (2**21)) + v_217_218 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_1 + r_217_218 * (const 64 (2**21)) + s_217_218 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_1,
    neg_f_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_1,
    neg_g_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 218)) <=s delta, delta <=s (const 64 (1 + 2*218)),
    (const 64 (-(2**20))) <=s u_217_218, u_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_218, v_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_218, r_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_218, s_217_218 <=s (const 64 ((2**20))),
    u_217_218 + v_217_218 <=s (const 64 (2**20)),
    u_217_218 - v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 + v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 - v_217_218 <=s (const 64 (2**20)),
    r_217_218 + s_217_218 <=s (const 64 (2**20)),
    r_217_218 - s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 + s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 - s_217_218 <=s (const 64 (2**20)),
    u_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_217_218 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_217_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_1,
sint64 neg_g_177_low60_40_low20_1,
sint64 u_217_217,
sint64 v_217_217,
sint64 r_217_217,
sint64 s_217_217,
sint64 u_217_218,
sint64 v_217_218,
sint64 r_217_218,
sint64 s_217_218,
bit ne
)={
    u_217_217 * neg_f_177_low60_40_low20_0 + v_217_217 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_0 * (-(2**20)),
    r_217_217 * neg_f_177_low60_40_low20_0 + s_217_217 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_0 * (-(2**20))
&&
    u_217_217 * neg_f_177_low60_40_low20_0 + v_217_217 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_0 * (const 64 (-(2**20))),
    r_217_217 * neg_f_177_low60_40_low20_0 + s_217_217 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_0 + u_217_217 * (const 64 (2**21)) + v_217_217 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_0 + r_217_217 * (const 64 (2**21)) + s_217_217 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 217)) <=s delta, delta <=s (const 64 (1 + 2*217)),
    u_217_217 = (const 64 (-(2**20))),
    v_217_217 = (const 64 (0)),
    r_217_217 = (const 64 (0)),
    s_217_217 = (const 64 (-(2**20)))
}



// divsteps
// step40

// premise c
assume
neg_g_177_low60_40_low20_0 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_1 neg_g_177_low60_40_low20_0;
mov u_217_218 r_217_217;
mov v_217_218 s_217_217;

subs dc neg_g_177_low60_40_low20_1 neg_g_177_low60_40_low20_0 neg_f_177_low60_40_low20_0;
asr neg_g_177_low60_40_low20_1 neg_g_177_low60_40_low20_1 1;
subs dc r_217_218 r_217_217 u_217_217;
asr r_217_218 r_217_218 1;
subs dc s_217_218 s_217_217 v_217_217;
asr s_217_218 s_217_218 1;
assert
    true
&&
    neg_f_177_low60_40_low20_1 = neg_g_177_low60_40_low20_0,
    u_217_218 = r_217_217,
    v_217_218 = s_217_217,
    neg_g_177_low60_40_low20_1 * (const 64 2) = neg_g_177_low60_40_low20_0 - neg_f_177_low60_40_low20_0,
    r_217_218 * (const 64 2) = r_217_217 - u_217_217,
    s_217_218 * (const 64 2) = s_217_217 - v_217_217
;

assume
    neg_f_177_low60_40_low20_1 = neg_g_177_low60_40_low20_0,
    u_217_218 = r_217_217,
    v_217_218 = s_217_217,
    neg_g_177_low60_40_low20_1 * 2 = neg_g_177_low60_40_low20_0 - neg_f_177_low60_40_low20_0,
    r_217_218 * 2 = r_217_217 - u_217_217,
    s_217_218 * 2 = s_217_217 - v_217_217
&&
    true
;

{
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_1 + u_217_218 * (const 64 (2**21)) + v_217_218 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_1 + r_217_218 * (const 64 (2**21)) + s_217_218 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_1,
    neg_f_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_1,
    neg_g_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 218)) <=s delta, delta <=s (const 64 (1 + 2*218)),
    (const 64 (-(2**20))) <=s u_217_218, u_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_218, v_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_218, r_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_218, s_217_218 <=s (const 64 ((2**20))),
    u_217_218 + v_217_218 <=s (const 64 (2**20)),
    u_217_218 - v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 + v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 - v_217_218 <=s (const 64 (2**20)),
    r_217_218 + s_217_218 <=s (const 64 (2**20)),
    r_217_218 - s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 + s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 - s_217_218 <=s (const 64 (2**20)),
    u_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_217_218 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_218_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_1,
sint64 neg_g_177_low60_40_low20_1,
sint64 neg_f_177_low60_40_low20_2,
sint64 neg_g_177_low60_40_low20_2,
sint64 u_217_218,
sint64 v_217_218,
sint64 r_217_218,
sint64 s_217_218,
sint64 u_217_219,
sint64 v_217_219,
sint64 r_217_219,
sint64 s_217_219,
bit ne
)={
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (-(2**20)),
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (-(2**20))
&&
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (const 64 (-(2**20))),
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_1 + u_217_218 * (const 64 (2**21)) + v_217_218 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_1 + r_217_218 * (const 64 (2**21)) + s_217_218 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_1,
    neg_f_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_1,
    neg_g_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 218)) <=s delta, delta <=s (const 64 (1 + 2*218)),
    (const 64 (-(2**20))) <=s u_217_218, u_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_218, v_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_218, r_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_218, s_217_218 <=s (const 64 ((2**20))),
    u_217_218 + v_217_218 <=s (const 64 (2**20)),
    u_217_218 - v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 + v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 - v_217_218 <=s (const 64 (2**20)),
    r_217_218 + s_217_218 <=s (const 64 (2**20)),
    r_217_218 - s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 + s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 - s_217_218 <=s (const 64 (2**20)),
    u_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_217_218 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise a
assume
neg_g_177_low60_40_low20_1 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_1 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_2 neg_f_177_low60_40_low20_1;
mov u_217_219 u_217_218;
mov v_217_219 v_217_218;

asr neg_g_177_low60_40_low20_2 neg_g_177_low60_40_low20_1 1;
asr r_217_219 r_217_218 1;
asr s_217_219 s_217_218 1;
assert
    true
&&
    neg_f_177_low60_40_low20_2 = neg_f_177_low60_40_low20_1,
    u_217_219 = u_217_218,
    v_217_219 = v_217_218,
    neg_g_177_low60_40_low20_2 * (const 64 2) = neg_g_177_low60_40_low20_1,
    r_217_219 * (const 64 2) = r_217_218,
    s_217_219 * (const 64 2) = s_217_218
;

assume
    neg_f_177_low60_40_low20_2 = neg_f_177_low60_40_low20_1,
    u_217_219 = u_217_218,
    v_217_219 = v_217_218,
    neg_g_177_low60_40_low20_2 * 2 = neg_g_177_low60_40_low20_1,
    r_217_219 * 2 = r_217_218,
    s_217_219 * 2 = s_217_218
&&
    true
;

{
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_2 + u_217_219 * (const 64 (2**21)) + v_217_219 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_2 + r_217_219 * (const 64 (2**21)) + s_217_219 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_2,
    neg_f_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_2,
    neg_g_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 219)) <=s delta, delta <=s (const 64 (1 + 2*219)),
    (const 64 (-(2**20))) <=s u_217_219, u_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_219, v_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_219, r_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_219, s_217_219 <=s (const 64 ((2**20))),
    u_217_219 + v_217_219 <=s (const 64 (2**20)),
    u_217_219 - v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 + v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 - v_217_219 <=s (const 64 (2**20)),
    r_217_219 + s_217_219 <=s (const 64 (2**20)),
    r_217_219 - s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 + s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 - s_217_219 <=s (const 64 (2**20)),
    u_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_217_219 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_218_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_1,
sint64 neg_g_177_low60_40_low20_1,
sint64 neg_f_177_low60_40_low20_2,
sint64 neg_g_177_low60_40_low20_2,
sint64 u_217_218,
sint64 v_217_218,
sint64 r_217_218,
sint64 s_217_218,
sint64 u_217_219,
sint64 v_217_219,
sint64 r_217_219,
sint64 s_217_219,
bit ne
)={
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (-(2**20)),
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (-(2**20))
&&
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (const 64 (-(2**20))),
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_1 + u_217_218 * (const 64 (2**21)) + v_217_218 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_1 + r_217_218 * (const 64 (2**21)) + s_217_218 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_1,
    neg_f_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_1,
    neg_g_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 218)) <=s delta, delta <=s (const 64 (1 + 2*218)),
    (const 64 (-(2**20))) <=s u_217_218, u_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_218, v_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_218, r_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_218, s_217_218 <=s (const 64 ((2**20))),
    u_217_218 + v_217_218 <=s (const 64 (2**20)),
    u_217_218 - v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 + v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 - v_217_218 <=s (const 64 (2**20)),
    r_217_218 + s_217_218 <=s (const 64 (2**20)),
    r_217_218 - s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 + s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 - s_217_218 <=s (const 64 (2**20)),
    u_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_217_218 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise b
assume
neg_g_177_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_2 neg_f_177_low60_40_low20_1;
mov u_217_219 u_217_218;
mov v_217_219 v_217_218;

add neg_g_177_low60_40_low20_2 neg_g_177_low60_40_low20_1 neg_f_177_low60_40_low20_1;
asr neg_g_177_low60_40_low20_2 neg_g_177_low60_40_low20_2 1;
add r_217_219 r_217_218 u_217_218;
asr r_217_219 r_217_219 1;
add s_217_219 s_217_218 v_217_218;
asr s_217_219 s_217_219 1;
assert
    true
&&
    neg_f_177_low60_40_low20_2 = neg_f_177_low60_40_low20_1,
    u_217_219 = u_217_218,
    v_217_219 = v_217_218,
    neg_g_177_low60_40_low20_2 * (const 64 2) = neg_g_177_low60_40_low20_1 + neg_f_177_low60_40_low20_1,
    r_217_219 * (const 64 2) = r_217_218 + u_217_218,
    s_217_219 * (const 64 2) = s_217_218 + v_217_218
;

assume
    neg_f_177_low60_40_low20_2 = neg_f_177_low60_40_low20_1,
    u_217_219 = u_217_218,
    v_217_219 = v_217_218,
    neg_g_177_low60_40_low20_2 * 2 = neg_g_177_low60_40_low20_1 + neg_f_177_low60_40_low20_1,
    r_217_219 * 2 = r_217_218 + u_217_218,
    s_217_219 * 2 = s_217_218 + v_217_218
&&
    true
;

{
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_2 + u_217_219 * (const 64 (2**21)) + v_217_219 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_2 + r_217_219 * (const 64 (2**21)) + s_217_219 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_2,
    neg_f_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_2,
    neg_g_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 219)) <=s delta, delta <=s (const 64 (1 + 2*219)),
    (const 64 (-(2**20))) <=s u_217_219, u_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_219, v_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_219, r_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_219, s_217_219 <=s (const 64 ((2**20))),
    u_217_219 + v_217_219 <=s (const 64 (2**20)),
    u_217_219 - v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 + v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 - v_217_219 <=s (const 64 (2**20)),
    r_217_219 + s_217_219 <=s (const 64 (2**20)),
    r_217_219 - s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 + s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 - s_217_219 <=s (const 64 (2**20)),
    u_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_217_219 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_218_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_1,
sint64 neg_g_177_low60_40_low20_1,
sint64 neg_f_177_low60_40_low20_2,
sint64 neg_g_177_low60_40_low20_2,
sint64 u_217_218,
sint64 v_217_218,
sint64 r_217_218,
sint64 s_217_218,
sint64 u_217_219,
sint64 v_217_219,
sint64 r_217_219,
sint64 s_217_219,
bit ne
)={
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (-(2**20)),
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (-(2**20))
&&
    u_217_218 * neg_f_177_low60_40_low20_0 + v_217_218 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_1 * (const 64 (-(2**20))),
    r_217_218 * neg_f_177_low60_40_low20_0 + s_217_218 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_1 + u_217_218 * (const 64 (2**21)) + v_217_218 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_1 + r_217_218 * (const 64 (2**21)) + s_217_218 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_1,
    neg_f_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_1,
    neg_g_177_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 218)) <=s delta, delta <=s (const 64 (1 + 2*218)),
    (const 64 (-(2**20))) <=s u_217_218, u_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_218, v_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_218, r_217_218 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_218, s_217_218 <=s (const 64 ((2**20))),
    u_217_218 + v_217_218 <=s (const 64 (2**20)),
    u_217_218 - v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 + v_217_218 <=s (const 64 (2**20)),
    (const 64 0) - u_217_218 - v_217_218 <=s (const 64 (2**20)),
    r_217_218 + s_217_218 <=s (const 64 (2**20)),
    r_217_218 - s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 + s_217_218 <=s (const 64 (2**20)),
    (const 64 0) - r_217_218 - s_217_218 <=s (const 64 (2**20)),
    u_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_217_218 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_217_218 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step41

// premise c
assume
neg_g_177_low60_40_low20_1 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_2 neg_g_177_low60_40_low20_1;
mov u_217_219 r_217_218;
mov v_217_219 s_217_218;

subs dc neg_g_177_low60_40_low20_2 neg_g_177_low60_40_low20_1 neg_f_177_low60_40_low20_1;
asr neg_g_177_low60_40_low20_2 neg_g_177_low60_40_low20_2 1;
subs dc r_217_219 r_217_218 u_217_218;
asr r_217_219 r_217_219 1;
subs dc s_217_219 s_217_218 v_217_218;
asr s_217_219 s_217_219 1;
assert
    true
&&
    neg_f_177_low60_40_low20_2 = neg_g_177_low60_40_low20_1,
    u_217_219 = r_217_218,
    v_217_219 = s_217_218,
    neg_g_177_low60_40_low20_2 * (const 64 2) = neg_g_177_low60_40_low20_1 - neg_f_177_low60_40_low20_1,
    r_217_219 * (const 64 2) = r_217_218 - u_217_218,
    s_217_219 * (const 64 2) = s_217_218 - v_217_218
;

assume
    neg_f_177_low60_40_low20_2 = neg_g_177_low60_40_low20_1,
    u_217_219 = r_217_218,
    v_217_219 = s_217_218,
    neg_g_177_low60_40_low20_2 * 2 = neg_g_177_low60_40_low20_1 - neg_f_177_low60_40_low20_1,
    r_217_219 * 2 = r_217_218 - u_217_218,
    s_217_219 * 2 = s_217_218 - v_217_218
&&
    true
;

{
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_2 + u_217_219 * (const 64 (2**21)) + v_217_219 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_2 + r_217_219 * (const 64 (2**21)) + s_217_219 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_2,
    neg_f_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_2,
    neg_g_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 219)) <=s delta, delta <=s (const 64 (1 + 2*219)),
    (const 64 (-(2**20))) <=s u_217_219, u_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_219, v_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_219, r_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_219, s_217_219 <=s (const 64 ((2**20))),
    u_217_219 + v_217_219 <=s (const 64 (2**20)),
    u_217_219 - v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 + v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 - v_217_219 <=s (const 64 (2**20)),
    r_217_219 + s_217_219 <=s (const 64 (2**20)),
    r_217_219 - s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 + s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 - s_217_219 <=s (const 64 (2**20)),
    u_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_217_219 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_219_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_2,
sint64 neg_g_177_low60_40_low20_2,
sint64 neg_f_177_low60_40_low20_3,
sint64 neg_g_177_low60_40_low20_3,
sint64 u_217_219,
sint64 v_217_219,
sint64 r_217_219,
sint64 s_217_219,
sint64 u_217_220,
sint64 v_217_220,
sint64 r_217_220,
sint64 s_217_220,
bit ne
)={
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (-(2**20)),
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (-(2**20))
&&
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (const 64 (-(2**20))),
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_2 + u_217_219 * (const 64 (2**21)) + v_217_219 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_2 + r_217_219 * (const 64 (2**21)) + s_217_219 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_2,
    neg_f_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_2,
    neg_g_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 219)) <=s delta, delta <=s (const 64 (1 + 2*219)),
    (const 64 (-(2**20))) <=s u_217_219, u_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_219, v_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_219, r_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_219, s_217_219 <=s (const 64 ((2**20))),
    u_217_219 + v_217_219 <=s (const 64 (2**20)),
    u_217_219 - v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 + v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 - v_217_219 <=s (const 64 (2**20)),
    r_217_219 + s_217_219 <=s (const 64 (2**20)),
    r_217_219 - s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 + s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 - s_217_219 <=s (const 64 (2**20)),
    u_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_217_219 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise a
assume
neg_g_177_low60_40_low20_2 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_2 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_3 neg_f_177_low60_40_low20_2;
mov u_217_220 u_217_219;
mov v_217_220 v_217_219;

asr neg_g_177_low60_40_low20_3 neg_g_177_low60_40_low20_2 1;
asr r_217_220 r_217_219 1;
asr s_217_220 s_217_219 1;
assert
    true
&&
    neg_f_177_low60_40_low20_3 = neg_f_177_low60_40_low20_2,
    u_217_220 = u_217_219,
    v_217_220 = v_217_219,
    neg_g_177_low60_40_low20_3 * (const 64 2) = neg_g_177_low60_40_low20_2,
    r_217_220 * (const 64 2) = r_217_219,
    s_217_220 * (const 64 2) = s_217_219
;

assume
    neg_f_177_low60_40_low20_3 = neg_f_177_low60_40_low20_2,
    u_217_220 = u_217_219,
    v_217_220 = v_217_219,
    neg_g_177_low60_40_low20_3 * 2 = neg_g_177_low60_40_low20_2,
    r_217_220 * 2 = r_217_219,
    s_217_220 * 2 = s_217_219
&&
    true
;

{
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_3 + u_217_220 * (const 64 (2**21)) + v_217_220 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_3 + r_217_220 * (const 64 (2**21)) + s_217_220 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_3,
    neg_f_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_3,
    neg_g_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 220)) <=s delta, delta <=s (const 64 (1 + 2*220)),
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20))),
    u_217_220 + v_217_220 <=s (const 64 (2**20)),
    u_217_220 - v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 + v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 - v_217_220 <=s (const 64 (2**20)),
    r_217_220 + s_217_220 <=s (const 64 (2**20)),
    r_217_220 - s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 + s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 - s_217_220 <=s (const 64 (2**20)),
    u_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_217_220 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_219_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_2,
sint64 neg_g_177_low60_40_low20_2,
sint64 neg_f_177_low60_40_low20_3,
sint64 neg_g_177_low60_40_low20_3,
sint64 u_217_219,
sint64 v_217_219,
sint64 r_217_219,
sint64 s_217_219,
sint64 u_217_220,
sint64 v_217_220,
sint64 r_217_220,
sint64 s_217_220,
bit ne
)={
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (-(2**20)),
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (-(2**20))
&&
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (const 64 (-(2**20))),
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_2 + u_217_219 * (const 64 (2**21)) + v_217_219 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_2 + r_217_219 * (const 64 (2**21)) + s_217_219 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_2,
    neg_f_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_2,
    neg_g_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 219)) <=s delta, delta <=s (const 64 (1 + 2*219)),
    (const 64 (-(2**20))) <=s u_217_219, u_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_219, v_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_219, r_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_219, s_217_219 <=s (const 64 ((2**20))),
    u_217_219 + v_217_219 <=s (const 64 (2**20)),
    u_217_219 - v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 + v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 - v_217_219 <=s (const 64 (2**20)),
    r_217_219 + s_217_219 <=s (const 64 (2**20)),
    r_217_219 - s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 + s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 - s_217_219 <=s (const 64 (2**20)),
    u_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_217_219 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise b
assume
neg_g_177_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_3 neg_f_177_low60_40_low20_2;
mov u_217_220 u_217_219;
mov v_217_220 v_217_219;

add neg_g_177_low60_40_low20_3 neg_g_177_low60_40_low20_2 neg_f_177_low60_40_low20_2;
asr neg_g_177_low60_40_low20_3 neg_g_177_low60_40_low20_3 1;
add r_217_220 r_217_219 u_217_219;
asr r_217_220 r_217_220 1;
add s_217_220 s_217_219 v_217_219;
asr s_217_220 s_217_220 1;
assert
    true
&&
    neg_f_177_low60_40_low20_3 = neg_f_177_low60_40_low20_2,
    u_217_220 = u_217_219,
    v_217_220 = v_217_219,
    neg_g_177_low60_40_low20_3 * (const 64 2) = neg_g_177_low60_40_low20_2 + neg_f_177_low60_40_low20_2,
    r_217_220 * (const 64 2) = r_217_219 + u_217_219,
    s_217_220 * (const 64 2) = s_217_219 + v_217_219
;

assume
    neg_f_177_low60_40_low20_3 = neg_f_177_low60_40_low20_2,
    u_217_220 = u_217_219,
    v_217_220 = v_217_219,
    neg_g_177_low60_40_low20_3 * 2 = neg_g_177_low60_40_low20_2 + neg_f_177_low60_40_low20_2,
    r_217_220 * 2 = r_217_219 + u_217_219,
    s_217_220 * 2 = s_217_219 + v_217_219
&&
    true
;

{
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_3 + u_217_220 * (const 64 (2**21)) + v_217_220 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_3 + r_217_220 * (const 64 (2**21)) + s_217_220 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_3,
    neg_f_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_3,
    neg_g_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 220)) <=s delta, delta <=s (const 64 (1 + 2*220)),
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20))),
    u_217_220 + v_217_220 <=s (const 64 (2**20)),
    u_217_220 - v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 + v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 - v_217_220 <=s (const 64 (2**20)),
    r_217_220 + s_217_220 <=s (const 64 (2**20)),
    r_217_220 - s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 + s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 - s_217_220 <=s (const 64 (2**20)),
    u_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_217_220 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_219_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_2,
sint64 neg_g_177_low60_40_low20_2,
sint64 neg_f_177_low60_40_low20_3,
sint64 neg_g_177_low60_40_low20_3,
sint64 u_217_219,
sint64 v_217_219,
sint64 r_217_219,
sint64 s_217_219,
sint64 u_217_220,
sint64 v_217_220,
sint64 r_217_220,
sint64 s_217_220,
bit ne
)={
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (-(2**20)),
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (-(2**20))
&&
    u_217_219 * neg_f_177_low60_40_low20_0 + v_217_219 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_2 * (const 64 (-(2**20))),
    r_217_219 * neg_f_177_low60_40_low20_0 + s_217_219 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_2 + u_217_219 * (const 64 (2**21)) + v_217_219 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_2 + r_217_219 * (const 64 (2**21)) + s_217_219 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_2,
    neg_f_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_2,
    neg_g_177_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 219)) <=s delta, delta <=s (const 64 (1 + 2*219)),
    (const 64 (-(2**20))) <=s u_217_219, u_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_219, v_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_219, r_217_219 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_219, s_217_219 <=s (const 64 ((2**20))),
    u_217_219 + v_217_219 <=s (const 64 (2**20)),
    u_217_219 - v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 + v_217_219 <=s (const 64 (2**20)),
    (const 64 0) - u_217_219 - v_217_219 <=s (const 64 (2**20)),
    r_217_219 + s_217_219 <=s (const 64 (2**20)),
    r_217_219 - s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 + s_217_219 <=s (const 64 (2**20)),
    (const 64 0) - r_217_219 - s_217_219 <=s (const 64 (2**20)),
    u_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_217_219 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_217_219 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step42

// premise c
assume
neg_g_177_low60_40_low20_2 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_3 neg_g_177_low60_40_low20_2;
mov u_217_220 r_217_219;
mov v_217_220 s_217_219;

subs dc neg_g_177_low60_40_low20_3 neg_g_177_low60_40_low20_2 neg_f_177_low60_40_low20_2;
asr neg_g_177_low60_40_low20_3 neg_g_177_low60_40_low20_3 1;
subs dc r_217_220 r_217_219 u_217_219;
asr r_217_220 r_217_220 1;
subs dc s_217_220 s_217_219 v_217_219;
asr s_217_220 s_217_220 1;
assert
    true
&&
    neg_f_177_low60_40_low20_3 = neg_g_177_low60_40_low20_2,
    u_217_220 = r_217_219,
    v_217_220 = s_217_219,
    neg_g_177_low60_40_low20_3 * (const 64 2) = neg_g_177_low60_40_low20_2 - neg_f_177_low60_40_low20_2,
    r_217_220 * (const 64 2) = r_217_219 - u_217_219,
    s_217_220 * (const 64 2) = s_217_219 - v_217_219
;

assume
    neg_f_177_low60_40_low20_3 = neg_g_177_low60_40_low20_2,
    u_217_220 = r_217_219,
    v_217_220 = s_217_219,
    neg_g_177_low60_40_low20_3 * 2 = neg_g_177_low60_40_low20_2 - neg_f_177_low60_40_low20_2,
    r_217_220 * 2 = r_217_219 - u_217_219,
    s_217_220 * 2 = s_217_219 - v_217_219
&&
    true
;

{
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_3 + u_217_220 * (const 64 (2**21)) + v_217_220 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_3 + r_217_220 * (const 64 (2**21)) + s_217_220 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_3,
    neg_f_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_3,
    neg_g_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 220)) <=s delta, delta <=s (const 64 (1 + 2*220)),
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20))),
    u_217_220 + v_217_220 <=s (const 64 (2**20)),
    u_217_220 - v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 + v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 - v_217_220 <=s (const 64 (2**20)),
    r_217_220 + s_217_220 <=s (const 64 (2**20)),
    r_217_220 - s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 + s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 - s_217_220 <=s (const 64 (2**20)),
    u_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_217_220 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_220_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_3,
sint64 neg_g_177_low60_40_low20_3,
sint64 neg_f_177_low60_40_low20_4,
sint64 neg_g_177_low60_40_low20_4,
sint64 u_217_220,
sint64 v_217_220,
sint64 r_217_220,
sint64 s_217_220,
sint64 u_217_221,
sint64 v_217_221,
sint64 r_217_221,
sint64 s_217_221,
bit ne
)={
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (-(2**20)),
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (-(2**20))
&&
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (const 64 (-(2**20))),
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_3 + u_217_220 * (const 64 (2**21)) + v_217_220 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_3 + r_217_220 * (const 64 (2**21)) + s_217_220 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_3,
    neg_f_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_3,
    neg_g_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 220)) <=s delta, delta <=s (const 64 (1 + 2*220)),
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20))),
    u_217_220 + v_217_220 <=s (const 64 (2**20)),
    u_217_220 - v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 + v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 - v_217_220 <=s (const 64 (2**20)),
    r_217_220 + s_217_220 <=s (const 64 (2**20)),
    r_217_220 - s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 + s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 - s_217_220 <=s (const 64 (2**20)),
    u_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_217_220 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise a
assume
neg_g_177_low60_40_low20_3 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_3 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_4 neg_f_177_low60_40_low20_3;
mov u_217_221 u_217_220;
mov v_217_221 v_217_220;

asr neg_g_177_low60_40_low20_4 neg_g_177_low60_40_low20_3 1;
asr r_217_221 r_217_220 1;
asr s_217_221 s_217_220 1;
assert
    true
&&
    neg_f_177_low60_40_low20_4 = neg_f_177_low60_40_low20_3,
    u_217_221 = u_217_220,
    v_217_221 = v_217_220,
    neg_g_177_low60_40_low20_4 * (const 64 2) = neg_g_177_low60_40_low20_3,
    r_217_221 * (const 64 2) = r_217_220,
    s_217_221 * (const 64 2) = s_217_220
;

assume
    neg_f_177_low60_40_low20_4 = neg_f_177_low60_40_low20_3,
    u_217_221 = u_217_220,
    v_217_221 = v_217_220,
    neg_g_177_low60_40_low20_4 * 2 = neg_g_177_low60_40_low20_3,
    r_217_221 * 2 = r_217_220,
    s_217_221 * 2 = s_217_220
&&
    true
;

{
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_4 + u_217_221 * (const 64 (2**21)) + v_217_221 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_4 + r_217_221 * (const 64 (2**21)) + s_217_221 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_4,
    neg_f_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_4,
    neg_g_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 221)) <=s delta, delta <=s (const 64 (1 + 2*221)),
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20))),
    u_217_221 + v_217_221 <=s (const 64 (2**20)),
    u_217_221 - v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 + v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 - v_217_221 <=s (const 64 (2**20)),
    r_217_221 + s_217_221 <=s (const 64 (2**20)),
    r_217_221 - s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 + s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 - s_217_221 <=s (const 64 (2**20)),
    u_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_217_221 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_220_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_3,
sint64 neg_g_177_low60_40_low20_3,
sint64 neg_f_177_low60_40_low20_4,
sint64 neg_g_177_low60_40_low20_4,
sint64 u_217_220,
sint64 v_217_220,
sint64 r_217_220,
sint64 s_217_220,
sint64 u_217_221,
sint64 v_217_221,
sint64 r_217_221,
sint64 s_217_221,
bit ne
)={
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (-(2**20)),
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (-(2**20))
&&
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (const 64 (-(2**20))),
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_3 + u_217_220 * (const 64 (2**21)) + v_217_220 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_3 + r_217_220 * (const 64 (2**21)) + s_217_220 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_3,
    neg_f_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_3,
    neg_g_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 220)) <=s delta, delta <=s (const 64 (1 + 2*220)),
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20))),
    u_217_220 + v_217_220 <=s (const 64 (2**20)),
    u_217_220 - v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 + v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 - v_217_220 <=s (const 64 (2**20)),
    r_217_220 + s_217_220 <=s (const 64 (2**20)),
    r_217_220 - s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 + s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 - s_217_220 <=s (const 64 (2**20)),
    u_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_217_220 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise b
assume
neg_g_177_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_4 neg_f_177_low60_40_low20_3;
mov u_217_221 u_217_220;
mov v_217_221 v_217_220;

add neg_g_177_low60_40_low20_4 neg_g_177_low60_40_low20_3 neg_f_177_low60_40_low20_3;
asr neg_g_177_low60_40_low20_4 neg_g_177_low60_40_low20_4 1;
add r_217_221 r_217_220 u_217_220;
asr r_217_221 r_217_221 1;
add s_217_221 s_217_220 v_217_220;
asr s_217_221 s_217_221 1;
assert
    true
&&
    neg_f_177_low60_40_low20_4 = neg_f_177_low60_40_low20_3,
    u_217_221 = u_217_220,
    v_217_221 = v_217_220,
    neg_g_177_low60_40_low20_4 * (const 64 2) = neg_g_177_low60_40_low20_3 + neg_f_177_low60_40_low20_3,
    r_217_221 * (const 64 2) = r_217_220 + u_217_220,
    s_217_221 * (const 64 2) = s_217_220 + v_217_220
;

assume
    neg_f_177_low60_40_low20_4 = neg_f_177_low60_40_low20_3,
    u_217_221 = u_217_220,
    v_217_221 = v_217_220,
    neg_g_177_low60_40_low20_4 * 2 = neg_g_177_low60_40_low20_3 + neg_f_177_low60_40_low20_3,
    r_217_221 * 2 = r_217_220 + u_217_220,
    s_217_221 * 2 = s_217_220 + v_217_220
&&
    true
;

{
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_4 + u_217_221 * (const 64 (2**21)) + v_217_221 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_4 + r_217_221 * (const 64 (2**21)) + s_217_221 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_4,
    neg_f_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_4,
    neg_g_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 221)) <=s delta, delta <=s (const 64 (1 + 2*221)),
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20))),
    u_217_221 + v_217_221 <=s (const 64 (2**20)),
    u_217_221 - v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 + v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 - v_217_221 <=s (const 64 (2**20)),
    r_217_221 + s_217_221 <=s (const 64 (2**20)),
    r_217_221 - s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 + s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 - s_217_221 <=s (const 64 (2**20)),
    u_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_217_221 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_220_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_3,
sint64 neg_g_177_low60_40_low20_3,
sint64 neg_f_177_low60_40_low20_4,
sint64 neg_g_177_low60_40_low20_4,
sint64 u_217_220,
sint64 v_217_220,
sint64 r_217_220,
sint64 s_217_220,
sint64 u_217_221,
sint64 v_217_221,
sint64 r_217_221,
sint64 s_217_221,
bit ne
)={
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (-(2**20)),
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (-(2**20))
&&
    u_217_220 * neg_f_177_low60_40_low20_0 + v_217_220 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_3 * (const 64 (-(2**20))),
    r_217_220 * neg_f_177_low60_40_low20_0 + s_217_220 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_3 + u_217_220 * (const 64 (2**21)) + v_217_220 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_3 + r_217_220 * (const 64 (2**21)) + s_217_220 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_3,
    neg_f_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_3,
    neg_g_177_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 220)) <=s delta, delta <=s (const 64 (1 + 2*220)),
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20))),
    u_217_220 + v_217_220 <=s (const 64 (2**20)),
    u_217_220 - v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 + v_217_220 <=s (const 64 (2**20)),
    (const 64 0) - u_217_220 - v_217_220 <=s (const 64 (2**20)),
    r_217_220 + s_217_220 <=s (const 64 (2**20)),
    r_217_220 - s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 + s_217_220 <=s (const 64 (2**20)),
    (const 64 0) - r_217_220 - s_217_220 <=s (const 64 (2**20)),
    u_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_217_220 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_217_220 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step43

// premise c
assume
neg_g_177_low60_40_low20_3 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_4 neg_g_177_low60_40_low20_3;
mov u_217_221 r_217_220;
mov v_217_221 s_217_220;

subs dc neg_g_177_low60_40_low20_4 neg_g_177_low60_40_low20_3 neg_f_177_low60_40_low20_3;
asr neg_g_177_low60_40_low20_4 neg_g_177_low60_40_low20_4 1;
subs dc r_217_221 r_217_220 u_217_220;
asr r_217_221 r_217_221 1;
subs dc s_217_221 s_217_220 v_217_220;
asr s_217_221 s_217_221 1;
assert
    true
&&
    neg_f_177_low60_40_low20_4 = neg_g_177_low60_40_low20_3,
    u_217_221 = r_217_220,
    v_217_221 = s_217_220,
    neg_g_177_low60_40_low20_4 * (const 64 2) = neg_g_177_low60_40_low20_3 - neg_f_177_low60_40_low20_3,
    r_217_221 * (const 64 2) = r_217_220 - u_217_220,
    s_217_221 * (const 64 2) = s_217_220 - v_217_220
;

assume
    neg_f_177_low60_40_low20_4 = neg_g_177_low60_40_low20_3,
    u_217_221 = r_217_220,
    v_217_221 = s_217_220,
    neg_g_177_low60_40_low20_4 * 2 = neg_g_177_low60_40_low20_3 - neg_f_177_low60_40_low20_3,
    r_217_221 * 2 = r_217_220 - u_217_220,
    s_217_221 * 2 = s_217_220 - v_217_220
&&
    true
;

{
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_4 + u_217_221 * (const 64 (2**21)) + v_217_221 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_4 + r_217_221 * (const 64 (2**21)) + s_217_221 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_4,
    neg_f_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_4,
    neg_g_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 221)) <=s delta, delta <=s (const 64 (1 + 2*221)),
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20))),
    u_217_221 + v_217_221 <=s (const 64 (2**20)),
    u_217_221 - v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 + v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 - v_217_221 <=s (const 64 (2**20)),
    r_217_221 + s_217_221 <=s (const 64 (2**20)),
    r_217_221 - s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 + s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 - s_217_221 <=s (const 64 (2**20)),
    u_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_217_221 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_221_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_4,
sint64 neg_g_177_low60_40_low20_4,
sint64 neg_f_177_low60_40_low20_5,
sint64 neg_g_177_low60_40_low20_5,
sint64 u_217_221,
sint64 v_217_221,
sint64 r_217_221,
sint64 s_217_221,
sint64 u_217_222,
sint64 v_217_222,
sint64 r_217_222,
sint64 s_217_222,
bit ne
)={
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (-(2**20)),
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (-(2**20))
&&
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (const 64 (-(2**20))),
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_4 + u_217_221 * (const 64 (2**21)) + v_217_221 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_4 + r_217_221 * (const 64 (2**21)) + s_217_221 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_4,
    neg_f_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_4,
    neg_g_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 221)) <=s delta, delta <=s (const 64 (1 + 2*221)),
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20))),
    u_217_221 + v_217_221 <=s (const 64 (2**20)),
    u_217_221 - v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 + v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 - v_217_221 <=s (const 64 (2**20)),
    r_217_221 + s_217_221 <=s (const 64 (2**20)),
    r_217_221 - s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 + s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 - s_217_221 <=s (const 64 (2**20)),
    u_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_217_221 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise a
assume
neg_g_177_low60_40_low20_4 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_4 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_5 neg_f_177_low60_40_low20_4;
mov u_217_222 u_217_221;
mov v_217_222 v_217_221;

asr neg_g_177_low60_40_low20_5 neg_g_177_low60_40_low20_4 1;
asr r_217_222 r_217_221 1;
asr s_217_222 s_217_221 1;
assert
    true
&&
    neg_f_177_low60_40_low20_5 = neg_f_177_low60_40_low20_4,
    u_217_222 = u_217_221,
    v_217_222 = v_217_221,
    neg_g_177_low60_40_low20_5 * (const 64 2) = neg_g_177_low60_40_low20_4,
    r_217_222 * (const 64 2) = r_217_221,
    s_217_222 * (const 64 2) = s_217_221
;

assume
    neg_f_177_low60_40_low20_5 = neg_f_177_low60_40_low20_4,
    u_217_222 = u_217_221,
    v_217_222 = v_217_221,
    neg_g_177_low60_40_low20_5 * 2 = neg_g_177_low60_40_low20_4,
    r_217_222 * 2 = r_217_221,
    s_217_222 * 2 = s_217_221
&&
    true
;

{
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_5 + u_217_222 * (const 64 (2**21)) + v_217_222 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_5 + r_217_222 * (const 64 (2**21)) + s_217_222 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_5,
    neg_f_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_5,
    neg_g_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 222)) <=s delta, delta <=s (const 64 (1 + 2*222)),
    (const 64 (-(2**20))) <=s u_217_222, u_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_222, v_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_222, r_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_222, s_217_222 <=s (const 64 ((2**20))),
    u_217_222 + v_217_222 <=s (const 64 (2**20)),
    u_217_222 - v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 + v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 - v_217_222 <=s (const 64 (2**20)),
    r_217_222 + s_217_222 <=s (const 64 (2**20)),
    r_217_222 - s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 + s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 - s_217_222 <=s (const 64 (2**20)),
    u_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_217_222 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_221_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_4,
sint64 neg_g_177_low60_40_low20_4,
sint64 neg_f_177_low60_40_low20_5,
sint64 neg_g_177_low60_40_low20_5,
sint64 u_217_221,
sint64 v_217_221,
sint64 r_217_221,
sint64 s_217_221,
sint64 u_217_222,
sint64 v_217_222,
sint64 r_217_222,
sint64 s_217_222,
bit ne
)={
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (-(2**20)),
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (-(2**20))
&&
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (const 64 (-(2**20))),
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_4 + u_217_221 * (const 64 (2**21)) + v_217_221 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_4 + r_217_221 * (const 64 (2**21)) + s_217_221 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_4,
    neg_f_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_4,
    neg_g_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 221)) <=s delta, delta <=s (const 64 (1 + 2*221)),
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20))),
    u_217_221 + v_217_221 <=s (const 64 (2**20)),
    u_217_221 - v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 + v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 - v_217_221 <=s (const 64 (2**20)),
    r_217_221 + s_217_221 <=s (const 64 (2**20)),
    r_217_221 - s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 + s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 - s_217_221 <=s (const 64 (2**20)),
    u_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_217_221 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise b
assume
neg_g_177_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_5 neg_f_177_low60_40_low20_4;
mov u_217_222 u_217_221;
mov v_217_222 v_217_221;

add neg_g_177_low60_40_low20_5 neg_g_177_low60_40_low20_4 neg_f_177_low60_40_low20_4;
asr neg_g_177_low60_40_low20_5 neg_g_177_low60_40_low20_5 1;
add r_217_222 r_217_221 u_217_221;
asr r_217_222 r_217_222 1;
add s_217_222 s_217_221 v_217_221;
asr s_217_222 s_217_222 1;
assert
    true
&&
    neg_f_177_low60_40_low20_5 = neg_f_177_low60_40_low20_4,
    u_217_222 = u_217_221,
    v_217_222 = v_217_221,
    neg_g_177_low60_40_low20_5 * (const 64 2) = neg_g_177_low60_40_low20_4 + neg_f_177_low60_40_low20_4,
    r_217_222 * (const 64 2) = r_217_221 + u_217_221,
    s_217_222 * (const 64 2) = s_217_221 + v_217_221
;

assume
    neg_f_177_low60_40_low20_5 = neg_f_177_low60_40_low20_4,
    u_217_222 = u_217_221,
    v_217_222 = v_217_221,
    neg_g_177_low60_40_low20_5 * 2 = neg_g_177_low60_40_low20_4 + neg_f_177_low60_40_low20_4,
    r_217_222 * 2 = r_217_221 + u_217_221,
    s_217_222 * 2 = s_217_221 + v_217_221
&&
    true
;

{
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_5 + u_217_222 * (const 64 (2**21)) + v_217_222 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_5 + r_217_222 * (const 64 (2**21)) + s_217_222 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_5,
    neg_f_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_5,
    neg_g_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 222)) <=s delta, delta <=s (const 64 (1 + 2*222)),
    (const 64 (-(2**20))) <=s u_217_222, u_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_222, v_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_222, r_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_222, s_217_222 <=s (const 64 ((2**20))),
    u_217_222 + v_217_222 <=s (const 64 (2**20)),
    u_217_222 - v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 + v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 - v_217_222 <=s (const 64 (2**20)),
    r_217_222 + s_217_222 <=s (const 64 (2**20)),
    r_217_222 - s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 + s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 - s_217_222 <=s (const 64 (2**20)),
    u_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_217_222 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_221_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_4,
sint64 neg_g_177_low60_40_low20_4,
sint64 neg_f_177_low60_40_low20_5,
sint64 neg_g_177_low60_40_low20_5,
sint64 u_217_221,
sint64 v_217_221,
sint64 r_217_221,
sint64 s_217_221,
sint64 u_217_222,
sint64 v_217_222,
sint64 r_217_222,
sint64 s_217_222,
bit ne
)={
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (-(2**20)),
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (-(2**20))
&&
    u_217_221 * neg_f_177_low60_40_low20_0 + v_217_221 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_4 * (const 64 (-(2**20))),
    r_217_221 * neg_f_177_low60_40_low20_0 + s_217_221 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_4 + u_217_221 * (const 64 (2**21)) + v_217_221 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_4 + r_217_221 * (const 64 (2**21)) + s_217_221 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_4,
    neg_f_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_4,
    neg_g_177_low60_40_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 221)) <=s delta, delta <=s (const 64 (1 + 2*221)),
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20))),
    u_217_221 + v_217_221 <=s (const 64 (2**20)),
    u_217_221 - v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 + v_217_221 <=s (const 64 (2**20)),
    (const 64 0) - u_217_221 - v_217_221 <=s (const 64 (2**20)),
    r_217_221 + s_217_221 <=s (const 64 (2**20)),
    r_217_221 - s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 + s_217_221 <=s (const 64 (2**20)),
    (const 64 0) - r_217_221 - s_217_221 <=s (const 64 (2**20)),
    u_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_217_221 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_217_221 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step44

// premise c
assume
neg_g_177_low60_40_low20_4 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_5 neg_g_177_low60_40_low20_4;
mov u_217_222 r_217_221;
mov v_217_222 s_217_221;

subs dc neg_g_177_low60_40_low20_5 neg_g_177_low60_40_low20_4 neg_f_177_low60_40_low20_4;
asr neg_g_177_low60_40_low20_5 neg_g_177_low60_40_low20_5 1;
subs dc r_217_222 r_217_221 u_217_221;
asr r_217_222 r_217_222 1;
subs dc s_217_222 s_217_221 v_217_221;
asr s_217_222 s_217_222 1;
assert
    true
&&
    neg_f_177_low60_40_low20_5 = neg_g_177_low60_40_low20_4,
    u_217_222 = r_217_221,
    v_217_222 = s_217_221,
    neg_g_177_low60_40_low20_5 * (const 64 2) = neg_g_177_low60_40_low20_4 - neg_f_177_low60_40_low20_4,
    r_217_222 * (const 64 2) = r_217_221 - u_217_221,
    s_217_222 * (const 64 2) = s_217_221 - v_217_221
;

assume
    neg_f_177_low60_40_low20_5 = neg_g_177_low60_40_low20_4,
    u_217_222 = r_217_221,
    v_217_222 = s_217_221,
    neg_g_177_low60_40_low20_5 * 2 = neg_g_177_low60_40_low20_4 - neg_f_177_low60_40_low20_4,
    r_217_222 * 2 = r_217_221 - u_217_221,
    s_217_222 * 2 = s_217_221 - v_217_221
&&
    true
;

{
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_5 + u_217_222 * (const 64 (2**21)) + v_217_222 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_5 + r_217_222 * (const 64 (2**21)) + s_217_222 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_5,
    neg_f_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_5,
    neg_g_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 222)) <=s delta, delta <=s (const 64 (1 + 2*222)),
    (const 64 (-(2**20))) <=s u_217_222, u_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_222, v_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_222, r_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_222, s_217_222 <=s (const 64 ((2**20))),
    u_217_222 + v_217_222 <=s (const 64 (2**20)),
    u_217_222 - v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 + v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 - v_217_222 <=s (const 64 (2**20)),
    r_217_222 + s_217_222 <=s (const 64 (2**20)),
    r_217_222 - s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 + s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 - s_217_222 <=s (const 64 (2**20)),
    u_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_217_222 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_222_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_5,
sint64 neg_g_177_low60_40_low20_5,
sint64 neg_f_177_low60_40_low20_6,
sint64 neg_g_177_low60_40_low20_6,
sint64 u_217_222,
sint64 v_217_222,
sint64 r_217_222,
sint64 s_217_222,
sint64 u_217_223,
sint64 v_217_223,
sint64 r_217_223,
sint64 s_217_223,
bit ne
)={
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (-(2**20)),
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (-(2**20))
&&
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (const 64 (-(2**20))),
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_5 + u_217_222 * (const 64 (2**21)) + v_217_222 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_5 + r_217_222 * (const 64 (2**21)) + s_217_222 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_5,
    neg_f_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_5,
    neg_g_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 222)) <=s delta, delta <=s (const 64 (1 + 2*222)),
    (const 64 (-(2**20))) <=s u_217_222, u_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_222, v_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_222, r_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_222, s_217_222 <=s (const 64 ((2**20))),
    u_217_222 + v_217_222 <=s (const 64 (2**20)),
    u_217_222 - v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 + v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 - v_217_222 <=s (const 64 (2**20)),
    r_217_222 + s_217_222 <=s (const 64 (2**20)),
    r_217_222 - s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 + s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 - s_217_222 <=s (const 64 (2**20)),
    u_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_217_222 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise a
assume
neg_g_177_low60_40_low20_5 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_5 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_6 neg_f_177_low60_40_low20_5;
mov u_217_223 u_217_222;
mov v_217_223 v_217_222;

asr neg_g_177_low60_40_low20_6 neg_g_177_low60_40_low20_5 1;
asr r_217_223 r_217_222 1;
asr s_217_223 s_217_222 1;
assert
    true
&&
    neg_f_177_low60_40_low20_6 = neg_f_177_low60_40_low20_5,
    u_217_223 = u_217_222,
    v_217_223 = v_217_222,
    neg_g_177_low60_40_low20_6 * (const 64 2) = neg_g_177_low60_40_low20_5,
    r_217_223 * (const 64 2) = r_217_222,
    s_217_223 * (const 64 2) = s_217_222
;

assume
    neg_f_177_low60_40_low20_6 = neg_f_177_low60_40_low20_5,
    u_217_223 = u_217_222,
    v_217_223 = v_217_222,
    neg_g_177_low60_40_low20_6 * 2 = neg_g_177_low60_40_low20_5,
    r_217_223 * 2 = r_217_222,
    s_217_223 * 2 = s_217_222
&&
    true
;

{
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_6 + u_217_223 * (const 64 (2**21)) + v_217_223 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_6 + r_217_223 * (const 64 (2**21)) + s_217_223 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_6,
    neg_f_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_6,
    neg_g_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 223)) <=s delta, delta <=s (const 64 (1 + 2*223)),
    (const 64 (-(2**20))) <=s u_217_223, u_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_223, v_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_223, r_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_223, s_217_223 <=s (const 64 ((2**20))),
    u_217_223 + v_217_223 <=s (const 64 (2**20)),
    u_217_223 - v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 + v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 - v_217_223 <=s (const 64 (2**20)),
    r_217_223 + s_217_223 <=s (const 64 (2**20)),
    r_217_223 - s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 + s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 - s_217_223 <=s (const 64 (2**20)),
    u_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_217_223 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_222_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_5,
sint64 neg_g_177_low60_40_low20_5,
sint64 neg_f_177_low60_40_low20_6,
sint64 neg_g_177_low60_40_low20_6,
sint64 u_217_222,
sint64 v_217_222,
sint64 r_217_222,
sint64 s_217_222,
sint64 u_217_223,
sint64 v_217_223,
sint64 r_217_223,
sint64 s_217_223,
bit ne
)={
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (-(2**20)),
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (-(2**20))
&&
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (const 64 (-(2**20))),
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_5 + u_217_222 * (const 64 (2**21)) + v_217_222 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_5 + r_217_222 * (const 64 (2**21)) + s_217_222 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_5,
    neg_f_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_5,
    neg_g_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 222)) <=s delta, delta <=s (const 64 (1 + 2*222)),
    (const 64 (-(2**20))) <=s u_217_222, u_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_222, v_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_222, r_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_222, s_217_222 <=s (const 64 ((2**20))),
    u_217_222 + v_217_222 <=s (const 64 (2**20)),
    u_217_222 - v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 + v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 - v_217_222 <=s (const 64 (2**20)),
    r_217_222 + s_217_222 <=s (const 64 (2**20)),
    r_217_222 - s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 + s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 - s_217_222 <=s (const 64 (2**20)),
    u_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_217_222 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise b
assume
neg_g_177_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_6 neg_f_177_low60_40_low20_5;
mov u_217_223 u_217_222;
mov v_217_223 v_217_222;

add neg_g_177_low60_40_low20_6 neg_g_177_low60_40_low20_5 neg_f_177_low60_40_low20_5;
asr neg_g_177_low60_40_low20_6 neg_g_177_low60_40_low20_6 1;
add r_217_223 r_217_222 u_217_222;
asr r_217_223 r_217_223 1;
add s_217_223 s_217_222 v_217_222;
asr s_217_223 s_217_223 1;
assert
    true
&&
    neg_f_177_low60_40_low20_6 = neg_f_177_low60_40_low20_5,
    u_217_223 = u_217_222,
    v_217_223 = v_217_222,
    neg_g_177_low60_40_low20_6 * (const 64 2) = neg_g_177_low60_40_low20_5 + neg_f_177_low60_40_low20_5,
    r_217_223 * (const 64 2) = r_217_222 + u_217_222,
    s_217_223 * (const 64 2) = s_217_222 + v_217_222
;

assume
    neg_f_177_low60_40_low20_6 = neg_f_177_low60_40_low20_5,
    u_217_223 = u_217_222,
    v_217_223 = v_217_222,
    neg_g_177_low60_40_low20_6 * 2 = neg_g_177_low60_40_low20_5 + neg_f_177_low60_40_low20_5,
    r_217_223 * 2 = r_217_222 + u_217_222,
    s_217_223 * 2 = s_217_222 + v_217_222
&&
    true
;

{
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_6 + u_217_223 * (const 64 (2**21)) + v_217_223 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_6 + r_217_223 * (const 64 (2**21)) + s_217_223 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_6,
    neg_f_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_6,
    neg_g_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 223)) <=s delta, delta <=s (const 64 (1 + 2*223)),
    (const 64 (-(2**20))) <=s u_217_223, u_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_223, v_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_223, r_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_223, s_217_223 <=s (const 64 ((2**20))),
    u_217_223 + v_217_223 <=s (const 64 (2**20)),
    u_217_223 - v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 + v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 - v_217_223 <=s (const 64 (2**20)),
    r_217_223 + s_217_223 <=s (const 64 (2**20)),
    r_217_223 - s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 + s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 - s_217_223 <=s (const 64 (2**20)),
    u_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_217_223 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_222_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_5,
sint64 neg_g_177_low60_40_low20_5,
sint64 neg_f_177_low60_40_low20_6,
sint64 neg_g_177_low60_40_low20_6,
sint64 u_217_222,
sint64 v_217_222,
sint64 r_217_222,
sint64 s_217_222,
sint64 u_217_223,
sint64 v_217_223,
sint64 r_217_223,
sint64 s_217_223,
bit ne
)={
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (-(2**20)),
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (-(2**20))
&&
    u_217_222 * neg_f_177_low60_40_low20_0 + v_217_222 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_5 * (const 64 (-(2**20))),
    r_217_222 * neg_f_177_low60_40_low20_0 + s_217_222 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_5 + u_217_222 * (const 64 (2**21)) + v_217_222 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_5 + r_217_222 * (const 64 (2**21)) + s_217_222 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_5,
    neg_f_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_5,
    neg_g_177_low60_40_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 222)) <=s delta, delta <=s (const 64 (1 + 2*222)),
    (const 64 (-(2**20))) <=s u_217_222, u_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_222, v_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_222, r_217_222 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_222, s_217_222 <=s (const 64 ((2**20))),
    u_217_222 + v_217_222 <=s (const 64 (2**20)),
    u_217_222 - v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 + v_217_222 <=s (const 64 (2**20)),
    (const 64 0) - u_217_222 - v_217_222 <=s (const 64 (2**20)),
    r_217_222 + s_217_222 <=s (const 64 (2**20)),
    r_217_222 - s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 + s_217_222 <=s (const 64 (2**20)),
    (const 64 0) - r_217_222 - s_217_222 <=s (const 64 (2**20)),
    u_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_217_222 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_217_222 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step45

// premise c
assume
neg_g_177_low60_40_low20_5 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_6 neg_g_177_low60_40_low20_5;
mov u_217_223 r_217_222;
mov v_217_223 s_217_222;

subs dc neg_g_177_low60_40_low20_6 neg_g_177_low60_40_low20_5 neg_f_177_low60_40_low20_5;
asr neg_g_177_low60_40_low20_6 neg_g_177_low60_40_low20_6 1;
subs dc r_217_223 r_217_222 u_217_222;
asr r_217_223 r_217_223 1;
subs dc s_217_223 s_217_222 v_217_222;
asr s_217_223 s_217_223 1;
assert
    true
&&
    neg_f_177_low60_40_low20_6 = neg_g_177_low60_40_low20_5,
    u_217_223 = r_217_222,
    v_217_223 = s_217_222,
    neg_g_177_low60_40_low20_6 * (const 64 2) = neg_g_177_low60_40_low20_5 - neg_f_177_low60_40_low20_5,
    r_217_223 * (const 64 2) = r_217_222 - u_217_222,
    s_217_223 * (const 64 2) = s_217_222 - v_217_222
;

assume
    neg_f_177_low60_40_low20_6 = neg_g_177_low60_40_low20_5,
    u_217_223 = r_217_222,
    v_217_223 = s_217_222,
    neg_g_177_low60_40_low20_6 * 2 = neg_g_177_low60_40_low20_5 - neg_f_177_low60_40_low20_5,
    r_217_223 * 2 = r_217_222 - u_217_222,
    s_217_223 * 2 = s_217_222 - v_217_222
&&
    true
;

{
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_6 + u_217_223 * (const 64 (2**21)) + v_217_223 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_6 + r_217_223 * (const 64 (2**21)) + s_217_223 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_6,
    neg_f_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_6,
    neg_g_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 223)) <=s delta, delta <=s (const 64 (1 + 2*223)),
    (const 64 (-(2**20))) <=s u_217_223, u_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_223, v_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_223, r_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_223, s_217_223 <=s (const 64 ((2**20))),
    u_217_223 + v_217_223 <=s (const 64 (2**20)),
    u_217_223 - v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 + v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 - v_217_223 <=s (const 64 (2**20)),
    r_217_223 + s_217_223 <=s (const 64 (2**20)),
    r_217_223 - s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 + s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 - s_217_223 <=s (const 64 (2**20)),
    u_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_217_223 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_223_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_6,
sint64 neg_g_177_low60_40_low20_6,
sint64 neg_f_177_low60_40_low20_7,
sint64 neg_g_177_low60_40_low20_7,
sint64 u_217_223,
sint64 v_217_223,
sint64 r_217_223,
sint64 s_217_223,
sint64 u_217_224,
sint64 v_217_224,
sint64 r_217_224,
sint64 s_217_224,
bit ne
)={
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (-(2**20)),
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (-(2**20))
&&
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (const 64 (-(2**20))),
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_6 + u_217_223 * (const 64 (2**21)) + v_217_223 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_6 + r_217_223 * (const 64 (2**21)) + s_217_223 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_6,
    neg_f_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_6,
    neg_g_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 223)) <=s delta, delta <=s (const 64 (1 + 2*223)),
    (const 64 (-(2**20))) <=s u_217_223, u_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_223, v_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_223, r_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_223, s_217_223 <=s (const 64 ((2**20))),
    u_217_223 + v_217_223 <=s (const 64 (2**20)),
    u_217_223 - v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 + v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 - v_217_223 <=s (const 64 (2**20)),
    r_217_223 + s_217_223 <=s (const 64 (2**20)),
    r_217_223 - s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 + s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 - s_217_223 <=s (const 64 (2**20)),
    u_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_217_223 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise a
assume
neg_g_177_low60_40_low20_6 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_6 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_7 neg_f_177_low60_40_low20_6;
mov u_217_224 u_217_223;
mov v_217_224 v_217_223;

asr neg_g_177_low60_40_low20_7 neg_g_177_low60_40_low20_6 1;
asr r_217_224 r_217_223 1;
asr s_217_224 s_217_223 1;
assert
    true
&&
    neg_f_177_low60_40_low20_7 = neg_f_177_low60_40_low20_6,
    u_217_224 = u_217_223,
    v_217_224 = v_217_223,
    neg_g_177_low60_40_low20_7 * (const 64 2) = neg_g_177_low60_40_low20_6,
    r_217_224 * (const 64 2) = r_217_223,
    s_217_224 * (const 64 2) = s_217_223
;

assume
    neg_f_177_low60_40_low20_7 = neg_f_177_low60_40_low20_6,
    u_217_224 = u_217_223,
    v_217_224 = v_217_223,
    neg_g_177_low60_40_low20_7 * 2 = neg_g_177_low60_40_low20_6,
    r_217_224 * 2 = r_217_223,
    s_217_224 * 2 = s_217_223
&&
    true
;

{
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_7 + u_217_224 * (const 64 (2**21)) + v_217_224 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_7 + r_217_224 * (const 64 (2**21)) + s_217_224 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_7,
    neg_f_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_7,
    neg_g_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 224)) <=s delta, delta <=s (const 64 (1 + 2*224)),
    (const 64 (-(2**20))) <=s u_217_224, u_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_224, v_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_224, r_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_224, s_217_224 <=s (const 64 ((2**20))),
    u_217_224 + v_217_224 <=s (const 64 (2**20)),
    u_217_224 - v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 + v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 - v_217_224 <=s (const 64 (2**20)),
    r_217_224 + s_217_224 <=s (const 64 (2**20)),
    r_217_224 - s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 + s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 - s_217_224 <=s (const 64 (2**20)),
    u_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_217_224 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_223_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_6,
sint64 neg_g_177_low60_40_low20_6,
sint64 neg_f_177_low60_40_low20_7,
sint64 neg_g_177_low60_40_low20_7,
sint64 u_217_223,
sint64 v_217_223,
sint64 r_217_223,
sint64 s_217_223,
sint64 u_217_224,
sint64 v_217_224,
sint64 r_217_224,
sint64 s_217_224,
bit ne
)={
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (-(2**20)),
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (-(2**20))
&&
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (const 64 (-(2**20))),
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_6 + u_217_223 * (const 64 (2**21)) + v_217_223 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_6 + r_217_223 * (const 64 (2**21)) + s_217_223 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_6,
    neg_f_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_6,
    neg_g_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 223)) <=s delta, delta <=s (const 64 (1 + 2*223)),
    (const 64 (-(2**20))) <=s u_217_223, u_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_223, v_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_223, r_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_223, s_217_223 <=s (const 64 ((2**20))),
    u_217_223 + v_217_223 <=s (const 64 (2**20)),
    u_217_223 - v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 + v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 - v_217_223 <=s (const 64 (2**20)),
    r_217_223 + s_217_223 <=s (const 64 (2**20)),
    r_217_223 - s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 + s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 - s_217_223 <=s (const 64 (2**20)),
    u_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_217_223 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise b
assume
neg_g_177_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_7 neg_f_177_low60_40_low20_6;
mov u_217_224 u_217_223;
mov v_217_224 v_217_223;

add neg_g_177_low60_40_low20_7 neg_g_177_low60_40_low20_6 neg_f_177_low60_40_low20_6;
asr neg_g_177_low60_40_low20_7 neg_g_177_low60_40_low20_7 1;
add r_217_224 r_217_223 u_217_223;
asr r_217_224 r_217_224 1;
add s_217_224 s_217_223 v_217_223;
asr s_217_224 s_217_224 1;
assert
    true
&&
    neg_f_177_low60_40_low20_7 = neg_f_177_low60_40_low20_6,
    u_217_224 = u_217_223,
    v_217_224 = v_217_223,
    neg_g_177_low60_40_low20_7 * (const 64 2) = neg_g_177_low60_40_low20_6 + neg_f_177_low60_40_low20_6,
    r_217_224 * (const 64 2) = r_217_223 + u_217_223,
    s_217_224 * (const 64 2) = s_217_223 + v_217_223
;

assume
    neg_f_177_low60_40_low20_7 = neg_f_177_low60_40_low20_6,
    u_217_224 = u_217_223,
    v_217_224 = v_217_223,
    neg_g_177_low60_40_low20_7 * 2 = neg_g_177_low60_40_low20_6 + neg_f_177_low60_40_low20_6,
    r_217_224 * 2 = r_217_223 + u_217_223,
    s_217_224 * 2 = s_217_223 + v_217_223
&&
    true
;

{
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_7 + u_217_224 * (const 64 (2**21)) + v_217_224 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_7 + r_217_224 * (const 64 (2**21)) + s_217_224 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_7,
    neg_f_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_7,
    neg_g_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 224)) <=s delta, delta <=s (const 64 (1 + 2*224)),
    (const 64 (-(2**20))) <=s u_217_224, u_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_224, v_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_224, r_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_224, s_217_224 <=s (const 64 ((2**20))),
    u_217_224 + v_217_224 <=s (const 64 (2**20)),
    u_217_224 - v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 + v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 - v_217_224 <=s (const 64 (2**20)),
    r_217_224 + s_217_224 <=s (const 64 (2**20)),
    r_217_224 - s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 + s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 - s_217_224 <=s (const 64 (2**20)),
    u_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_217_224 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_223_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_6,
sint64 neg_g_177_low60_40_low20_6,
sint64 neg_f_177_low60_40_low20_7,
sint64 neg_g_177_low60_40_low20_7,
sint64 u_217_223,
sint64 v_217_223,
sint64 r_217_223,
sint64 s_217_223,
sint64 u_217_224,
sint64 v_217_224,
sint64 r_217_224,
sint64 s_217_224,
bit ne
)={
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (-(2**20)),
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (-(2**20))
&&
    u_217_223 * neg_f_177_low60_40_low20_0 + v_217_223 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_6 * (const 64 (-(2**20))),
    r_217_223 * neg_f_177_low60_40_low20_0 + s_217_223 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_6 + u_217_223 * (const 64 (2**21)) + v_217_223 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_6 + r_217_223 * (const 64 (2**21)) + s_217_223 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_6,
    neg_f_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_6,
    neg_g_177_low60_40_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 223)) <=s delta, delta <=s (const 64 (1 + 2*223)),
    (const 64 (-(2**20))) <=s u_217_223, u_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_223, v_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_223, r_217_223 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_223, s_217_223 <=s (const 64 ((2**20))),
    u_217_223 + v_217_223 <=s (const 64 (2**20)),
    u_217_223 - v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 + v_217_223 <=s (const 64 (2**20)),
    (const 64 0) - u_217_223 - v_217_223 <=s (const 64 (2**20)),
    r_217_223 + s_217_223 <=s (const 64 (2**20)),
    r_217_223 - s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 + s_217_223 <=s (const 64 (2**20)),
    (const 64 0) - r_217_223 - s_217_223 <=s (const 64 (2**20)),
    u_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_217_223 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_217_223 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step46

// premise c
assume
neg_g_177_low60_40_low20_6 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_7 neg_g_177_low60_40_low20_6;
mov u_217_224 r_217_223;
mov v_217_224 s_217_223;

subs dc neg_g_177_low60_40_low20_7 neg_g_177_low60_40_low20_6 neg_f_177_low60_40_low20_6;
asr neg_g_177_low60_40_low20_7 neg_g_177_low60_40_low20_7 1;
subs dc r_217_224 r_217_223 u_217_223;
asr r_217_224 r_217_224 1;
subs dc s_217_224 s_217_223 v_217_223;
asr s_217_224 s_217_224 1;
assert
    true
&&
    neg_f_177_low60_40_low20_7 = neg_g_177_low60_40_low20_6,
    u_217_224 = r_217_223,
    v_217_224 = s_217_223,
    neg_g_177_low60_40_low20_7 * (const 64 2) = neg_g_177_low60_40_low20_6 - neg_f_177_low60_40_low20_6,
    r_217_224 * (const 64 2) = r_217_223 - u_217_223,
    s_217_224 * (const 64 2) = s_217_223 - v_217_223
;

assume
    neg_f_177_low60_40_low20_7 = neg_g_177_low60_40_low20_6,
    u_217_224 = r_217_223,
    v_217_224 = s_217_223,
    neg_g_177_low60_40_low20_7 * 2 = neg_g_177_low60_40_low20_6 - neg_f_177_low60_40_low20_6,
    r_217_224 * 2 = r_217_223 - u_217_223,
    s_217_224 * 2 = s_217_223 - v_217_223
&&
    true
;

{
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_7 + u_217_224 * (const 64 (2**21)) + v_217_224 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_7 + r_217_224 * (const 64 (2**21)) + s_217_224 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_7,
    neg_f_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_7,
    neg_g_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 224)) <=s delta, delta <=s (const 64 (1 + 2*224)),
    (const 64 (-(2**20))) <=s u_217_224, u_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_224, v_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_224, r_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_224, s_217_224 <=s (const 64 ((2**20))),
    u_217_224 + v_217_224 <=s (const 64 (2**20)),
    u_217_224 - v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 + v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 - v_217_224 <=s (const 64 (2**20)),
    r_217_224 + s_217_224 <=s (const 64 (2**20)),
    r_217_224 - s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 + s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 - s_217_224 <=s (const 64 (2**20)),
    u_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_217_224 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_224_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_7,
sint64 neg_g_177_low60_40_low20_7,
sint64 neg_f_177_low60_40_low20_8,
sint64 neg_g_177_low60_40_low20_8,
sint64 u_217_224,
sint64 v_217_224,
sint64 r_217_224,
sint64 s_217_224,
sint64 u_217_225,
sint64 v_217_225,
sint64 r_217_225,
sint64 s_217_225,
bit ne
)={
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (-(2**20)),
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (-(2**20))
&&
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (const 64 (-(2**20))),
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_7 + u_217_224 * (const 64 (2**21)) + v_217_224 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_7 + r_217_224 * (const 64 (2**21)) + s_217_224 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_7,
    neg_f_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_7,
    neg_g_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 224)) <=s delta, delta <=s (const 64 (1 + 2*224)),
    (const 64 (-(2**20))) <=s u_217_224, u_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_224, v_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_224, r_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_224, s_217_224 <=s (const 64 ((2**20))),
    u_217_224 + v_217_224 <=s (const 64 (2**20)),
    u_217_224 - v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 + v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 - v_217_224 <=s (const 64 (2**20)),
    r_217_224 + s_217_224 <=s (const 64 (2**20)),
    r_217_224 - s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 + s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 - s_217_224 <=s (const 64 (2**20)),
    u_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_217_224 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise a
assume
neg_g_177_low60_40_low20_7 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_7 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_8 neg_f_177_low60_40_low20_7;
mov u_217_225 u_217_224;
mov v_217_225 v_217_224;

asr neg_g_177_low60_40_low20_8 neg_g_177_low60_40_low20_7 1;
asr r_217_225 r_217_224 1;
asr s_217_225 s_217_224 1;
assert
    true
&&
    neg_f_177_low60_40_low20_8 = neg_f_177_low60_40_low20_7,
    u_217_225 = u_217_224,
    v_217_225 = v_217_224,
    neg_g_177_low60_40_low20_8 * (const 64 2) = neg_g_177_low60_40_low20_7,
    r_217_225 * (const 64 2) = r_217_224,
    s_217_225 * (const 64 2) = s_217_224
;

assume
    neg_f_177_low60_40_low20_8 = neg_f_177_low60_40_low20_7,
    u_217_225 = u_217_224,
    v_217_225 = v_217_224,
    neg_g_177_low60_40_low20_8 * 2 = neg_g_177_low60_40_low20_7,
    r_217_225 * 2 = r_217_224,
    s_217_225 * 2 = s_217_224
&&
    true
;

{
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_8 + u_217_225 * (const 64 (2**21)) + v_217_225 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_8 + r_217_225 * (const 64 (2**21)) + s_217_225 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_8,
    neg_f_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_8,
    neg_g_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 225)) <=s delta, delta <=s (const 64 (1 + 2*225)),
    (const 64 (-(2**20))) <=s u_217_225, u_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_225, v_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_225, r_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_225, s_217_225 <=s (const 64 ((2**20))),
    u_217_225 + v_217_225 <=s (const 64 (2**20)),
    u_217_225 - v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 + v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 - v_217_225 <=s (const 64 (2**20)),
    r_217_225 + s_217_225 <=s (const 64 (2**20)),
    r_217_225 - s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 + s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 - s_217_225 <=s (const 64 (2**20)),
    u_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_217_225 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_224_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_7,
sint64 neg_g_177_low60_40_low20_7,
sint64 neg_f_177_low60_40_low20_8,
sint64 neg_g_177_low60_40_low20_8,
sint64 u_217_224,
sint64 v_217_224,
sint64 r_217_224,
sint64 s_217_224,
sint64 u_217_225,
sint64 v_217_225,
sint64 r_217_225,
sint64 s_217_225,
bit ne
)={
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (-(2**20)),
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (-(2**20))
&&
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (const 64 (-(2**20))),
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_7 + u_217_224 * (const 64 (2**21)) + v_217_224 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_7 + r_217_224 * (const 64 (2**21)) + s_217_224 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_7,
    neg_f_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_7,
    neg_g_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 224)) <=s delta, delta <=s (const 64 (1 + 2*224)),
    (const 64 (-(2**20))) <=s u_217_224, u_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_224, v_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_224, r_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_224, s_217_224 <=s (const 64 ((2**20))),
    u_217_224 + v_217_224 <=s (const 64 (2**20)),
    u_217_224 - v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 + v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 - v_217_224 <=s (const 64 (2**20)),
    r_217_224 + s_217_224 <=s (const 64 (2**20)),
    r_217_224 - s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 + s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 - s_217_224 <=s (const 64 (2**20)),
    u_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_217_224 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise b
assume
neg_g_177_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_8 neg_f_177_low60_40_low20_7;
mov u_217_225 u_217_224;
mov v_217_225 v_217_224;

add neg_g_177_low60_40_low20_8 neg_g_177_low60_40_low20_7 neg_f_177_low60_40_low20_7;
asr neg_g_177_low60_40_low20_8 neg_g_177_low60_40_low20_8 1;
add r_217_225 r_217_224 u_217_224;
asr r_217_225 r_217_225 1;
add s_217_225 s_217_224 v_217_224;
asr s_217_225 s_217_225 1;
assert
    true
&&
    neg_f_177_low60_40_low20_8 = neg_f_177_low60_40_low20_7,
    u_217_225 = u_217_224,
    v_217_225 = v_217_224,
    neg_g_177_low60_40_low20_8 * (const 64 2) = neg_g_177_low60_40_low20_7 + neg_f_177_low60_40_low20_7,
    r_217_225 * (const 64 2) = r_217_224 + u_217_224,
    s_217_225 * (const 64 2) = s_217_224 + v_217_224
;

assume
    neg_f_177_low60_40_low20_8 = neg_f_177_low60_40_low20_7,
    u_217_225 = u_217_224,
    v_217_225 = v_217_224,
    neg_g_177_low60_40_low20_8 * 2 = neg_g_177_low60_40_low20_7 + neg_f_177_low60_40_low20_7,
    r_217_225 * 2 = r_217_224 + u_217_224,
    s_217_225 * 2 = s_217_224 + v_217_224
&&
    true
;

{
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_8 + u_217_225 * (const 64 (2**21)) + v_217_225 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_8 + r_217_225 * (const 64 (2**21)) + s_217_225 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_8,
    neg_f_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_8,
    neg_g_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 225)) <=s delta, delta <=s (const 64 (1 + 2*225)),
    (const 64 (-(2**20))) <=s u_217_225, u_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_225, v_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_225, r_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_225, s_217_225 <=s (const 64 ((2**20))),
    u_217_225 + v_217_225 <=s (const 64 (2**20)),
    u_217_225 - v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 + v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 - v_217_225 <=s (const 64 (2**20)),
    r_217_225 + s_217_225 <=s (const 64 (2**20)),
    r_217_225 - s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 + s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 - s_217_225 <=s (const 64 (2**20)),
    u_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_217_225 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_224_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_7,
sint64 neg_g_177_low60_40_low20_7,
sint64 neg_f_177_low60_40_low20_8,
sint64 neg_g_177_low60_40_low20_8,
sint64 u_217_224,
sint64 v_217_224,
sint64 r_217_224,
sint64 s_217_224,
sint64 u_217_225,
sint64 v_217_225,
sint64 r_217_225,
sint64 s_217_225,
bit ne
)={
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (-(2**20)),
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (-(2**20))
&&
    u_217_224 * neg_f_177_low60_40_low20_0 + v_217_224 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_7 * (const 64 (-(2**20))),
    r_217_224 * neg_f_177_low60_40_low20_0 + s_217_224 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_7 + u_217_224 * (const 64 (2**21)) + v_217_224 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_7 + r_217_224 * (const 64 (2**21)) + s_217_224 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_7,
    neg_f_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_7,
    neg_g_177_low60_40_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 224)) <=s delta, delta <=s (const 64 (1 + 2*224)),
    (const 64 (-(2**20))) <=s u_217_224, u_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_224, v_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_224, r_217_224 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_224, s_217_224 <=s (const 64 ((2**20))),
    u_217_224 + v_217_224 <=s (const 64 (2**20)),
    u_217_224 - v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 + v_217_224 <=s (const 64 (2**20)),
    (const 64 0) - u_217_224 - v_217_224 <=s (const 64 (2**20)),
    r_217_224 + s_217_224 <=s (const 64 (2**20)),
    r_217_224 - s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 + s_217_224 <=s (const 64 (2**20)),
    (const 64 0) - r_217_224 - s_217_224 <=s (const 64 (2**20)),
    u_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_217_224 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_217_224 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step47

// premise c
assume
neg_g_177_low60_40_low20_7 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_8 neg_g_177_low60_40_low20_7;
mov u_217_225 r_217_224;
mov v_217_225 s_217_224;

subs dc neg_g_177_low60_40_low20_8 neg_g_177_low60_40_low20_7 neg_f_177_low60_40_low20_7;
asr neg_g_177_low60_40_low20_8 neg_g_177_low60_40_low20_8 1;
subs dc r_217_225 r_217_224 u_217_224;
asr r_217_225 r_217_225 1;
subs dc s_217_225 s_217_224 v_217_224;
asr s_217_225 s_217_225 1;
assert
    true
&&
    neg_f_177_low60_40_low20_8 = neg_g_177_low60_40_low20_7,
    u_217_225 = r_217_224,
    v_217_225 = s_217_224,
    neg_g_177_low60_40_low20_8 * (const 64 2) = neg_g_177_low60_40_low20_7 - neg_f_177_low60_40_low20_7,
    r_217_225 * (const 64 2) = r_217_224 - u_217_224,
    s_217_225 * (const 64 2) = s_217_224 - v_217_224
;

assume
    neg_f_177_low60_40_low20_8 = neg_g_177_low60_40_low20_7,
    u_217_225 = r_217_224,
    v_217_225 = s_217_224,
    neg_g_177_low60_40_low20_8 * 2 = neg_g_177_low60_40_low20_7 - neg_f_177_low60_40_low20_7,
    r_217_225 * 2 = r_217_224 - u_217_224,
    s_217_225 * 2 = s_217_224 - v_217_224
&&
    true
;

{
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_8 + u_217_225 * (const 64 (2**21)) + v_217_225 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_8 + r_217_225 * (const 64 (2**21)) + s_217_225 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_8,
    neg_f_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_8,
    neg_g_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 225)) <=s delta, delta <=s (const 64 (1 + 2*225)),
    (const 64 (-(2**20))) <=s u_217_225, u_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_225, v_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_225, r_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_225, s_217_225 <=s (const 64 ((2**20))),
    u_217_225 + v_217_225 <=s (const 64 (2**20)),
    u_217_225 - v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 + v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 - v_217_225 <=s (const 64 (2**20)),
    r_217_225 + s_217_225 <=s (const 64 (2**20)),
    r_217_225 - s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 + s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 - s_217_225 <=s (const 64 (2**20)),
    u_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_217_225 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_225_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_8,
sint64 neg_g_177_low60_40_low20_8,
sint64 neg_f_177_low60_40_low20_9,
sint64 neg_g_177_low60_40_low20_9,
sint64 u_217_225,
sint64 v_217_225,
sint64 r_217_225,
sint64 s_217_225,
sint64 u_217_226,
sint64 v_217_226,
sint64 r_217_226,
sint64 s_217_226,
bit ne
)={
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (-(2**20)),
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (-(2**20))
&&
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (const 64 (-(2**20))),
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_8 + u_217_225 * (const 64 (2**21)) + v_217_225 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_8 + r_217_225 * (const 64 (2**21)) + s_217_225 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_8,
    neg_f_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_8,
    neg_g_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 225)) <=s delta, delta <=s (const 64 (1 + 2*225)),
    (const 64 (-(2**20))) <=s u_217_225, u_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_225, v_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_225, r_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_225, s_217_225 <=s (const 64 ((2**20))),
    u_217_225 + v_217_225 <=s (const 64 (2**20)),
    u_217_225 - v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 + v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 - v_217_225 <=s (const 64 (2**20)),
    r_217_225 + s_217_225 <=s (const 64 (2**20)),
    r_217_225 - s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 + s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 - s_217_225 <=s (const 64 (2**20)),
    u_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_217_225 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise a
assume
neg_g_177_low60_40_low20_8 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_8 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_9 neg_f_177_low60_40_low20_8;
mov u_217_226 u_217_225;
mov v_217_226 v_217_225;

asr neg_g_177_low60_40_low20_9 neg_g_177_low60_40_low20_8 1;
asr r_217_226 r_217_225 1;
asr s_217_226 s_217_225 1;
assert
    true
&&
    neg_f_177_low60_40_low20_9 = neg_f_177_low60_40_low20_8,
    u_217_226 = u_217_225,
    v_217_226 = v_217_225,
    neg_g_177_low60_40_low20_9 * (const 64 2) = neg_g_177_low60_40_low20_8,
    r_217_226 * (const 64 2) = r_217_225,
    s_217_226 * (const 64 2) = s_217_225
;

assume
    neg_f_177_low60_40_low20_9 = neg_f_177_low60_40_low20_8,
    u_217_226 = u_217_225,
    v_217_226 = v_217_225,
    neg_g_177_low60_40_low20_9 * 2 = neg_g_177_low60_40_low20_8,
    r_217_226 * 2 = r_217_225,
    s_217_226 * 2 = s_217_225
&&
    true
;

{
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_9 + u_217_226 * (const 64 (2**21)) + v_217_226 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_9 + r_217_226 * (const 64 (2**21)) + s_217_226 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_9,
    neg_f_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_9,
    neg_g_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 226)) <=s delta, delta <=s (const 64 (1 + 2*226)),
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20))),
    u_217_226 + v_217_226 <=s (const 64 (2**20)),
    u_217_226 - v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 + v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 - v_217_226 <=s (const 64 (2**20)),
    r_217_226 + s_217_226 <=s (const 64 (2**20)),
    r_217_226 - s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 + s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 - s_217_226 <=s (const 64 (2**20)),
    u_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_217_226 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_225_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_8,
sint64 neg_g_177_low60_40_low20_8,
sint64 neg_f_177_low60_40_low20_9,
sint64 neg_g_177_low60_40_low20_9,
sint64 u_217_225,
sint64 v_217_225,
sint64 r_217_225,
sint64 s_217_225,
sint64 u_217_226,
sint64 v_217_226,
sint64 r_217_226,
sint64 s_217_226,
bit ne
)={
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (-(2**20)),
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (-(2**20))
&&
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (const 64 (-(2**20))),
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_8 + u_217_225 * (const 64 (2**21)) + v_217_225 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_8 + r_217_225 * (const 64 (2**21)) + s_217_225 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_8,
    neg_f_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_8,
    neg_g_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 225)) <=s delta, delta <=s (const 64 (1 + 2*225)),
    (const 64 (-(2**20))) <=s u_217_225, u_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_225, v_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_225, r_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_225, s_217_225 <=s (const 64 ((2**20))),
    u_217_225 + v_217_225 <=s (const 64 (2**20)),
    u_217_225 - v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 + v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 - v_217_225 <=s (const 64 (2**20)),
    r_217_225 + s_217_225 <=s (const 64 (2**20)),
    r_217_225 - s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 + s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 - s_217_225 <=s (const 64 (2**20)),
    u_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_217_225 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise b
assume
neg_g_177_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_9 neg_f_177_low60_40_low20_8;
mov u_217_226 u_217_225;
mov v_217_226 v_217_225;

add neg_g_177_low60_40_low20_9 neg_g_177_low60_40_low20_8 neg_f_177_low60_40_low20_8;
asr neg_g_177_low60_40_low20_9 neg_g_177_low60_40_low20_9 1;
add r_217_226 r_217_225 u_217_225;
asr r_217_226 r_217_226 1;
add s_217_226 s_217_225 v_217_225;
asr s_217_226 s_217_226 1;
assert
    true
&&
    neg_f_177_low60_40_low20_9 = neg_f_177_low60_40_low20_8,
    u_217_226 = u_217_225,
    v_217_226 = v_217_225,
    neg_g_177_low60_40_low20_9 * (const 64 2) = neg_g_177_low60_40_low20_8 + neg_f_177_low60_40_low20_8,
    r_217_226 * (const 64 2) = r_217_225 + u_217_225,
    s_217_226 * (const 64 2) = s_217_225 + v_217_225
;

assume
    neg_f_177_low60_40_low20_9 = neg_f_177_low60_40_low20_8,
    u_217_226 = u_217_225,
    v_217_226 = v_217_225,
    neg_g_177_low60_40_low20_9 * 2 = neg_g_177_low60_40_low20_8 + neg_f_177_low60_40_low20_8,
    r_217_226 * 2 = r_217_225 + u_217_225,
    s_217_226 * 2 = s_217_225 + v_217_225
&&
    true
;

{
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_9 + u_217_226 * (const 64 (2**21)) + v_217_226 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_9 + r_217_226 * (const 64 (2**21)) + s_217_226 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_9,
    neg_f_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_9,
    neg_g_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 226)) <=s delta, delta <=s (const 64 (1 + 2*226)),
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20))),
    u_217_226 + v_217_226 <=s (const 64 (2**20)),
    u_217_226 - v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 + v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 - v_217_226 <=s (const 64 (2**20)),
    r_217_226 + s_217_226 <=s (const 64 (2**20)),
    r_217_226 - s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 + s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 - s_217_226 <=s (const 64 (2**20)),
    u_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_217_226 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_225_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_8,
sint64 neg_g_177_low60_40_low20_8,
sint64 neg_f_177_low60_40_low20_9,
sint64 neg_g_177_low60_40_low20_9,
sint64 u_217_225,
sint64 v_217_225,
sint64 r_217_225,
sint64 s_217_225,
sint64 u_217_226,
sint64 v_217_226,
sint64 r_217_226,
sint64 s_217_226,
bit ne
)={
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (-(2**20)),
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (-(2**20))
&&
    u_217_225 * neg_f_177_low60_40_low20_0 + v_217_225 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_8 * (const 64 (-(2**20))),
    r_217_225 * neg_f_177_low60_40_low20_0 + s_217_225 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_8 + u_217_225 * (const 64 (2**21)) + v_217_225 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_8 + r_217_225 * (const 64 (2**21)) + s_217_225 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_8,
    neg_f_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_8,
    neg_g_177_low60_40_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 225)) <=s delta, delta <=s (const 64 (1 + 2*225)),
    (const 64 (-(2**20))) <=s u_217_225, u_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_225, v_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_225, r_217_225 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_225, s_217_225 <=s (const 64 ((2**20))),
    u_217_225 + v_217_225 <=s (const 64 (2**20)),
    u_217_225 - v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 + v_217_225 <=s (const 64 (2**20)),
    (const 64 0) - u_217_225 - v_217_225 <=s (const 64 (2**20)),
    r_217_225 + s_217_225 <=s (const 64 (2**20)),
    r_217_225 - s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 + s_217_225 <=s (const 64 (2**20)),
    (const 64 0) - r_217_225 - s_217_225 <=s (const 64 (2**20)),
    u_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_217_225 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_217_225 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step48

// premise c
assume
neg_g_177_low60_40_low20_8 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_9 neg_g_177_low60_40_low20_8;
mov u_217_226 r_217_225;
mov v_217_226 s_217_225;

subs dc neg_g_177_low60_40_low20_9 neg_g_177_low60_40_low20_8 neg_f_177_low60_40_low20_8;
asr neg_g_177_low60_40_low20_9 neg_g_177_low60_40_low20_9 1;
subs dc r_217_226 r_217_225 u_217_225;
asr r_217_226 r_217_226 1;
subs dc s_217_226 s_217_225 v_217_225;
asr s_217_226 s_217_226 1;
assert
    true
&&
    neg_f_177_low60_40_low20_9 = neg_g_177_low60_40_low20_8,
    u_217_226 = r_217_225,
    v_217_226 = s_217_225,
    neg_g_177_low60_40_low20_9 * (const 64 2) = neg_g_177_low60_40_low20_8 - neg_f_177_low60_40_low20_8,
    r_217_226 * (const 64 2) = r_217_225 - u_217_225,
    s_217_226 * (const 64 2) = s_217_225 - v_217_225
;

assume
    neg_f_177_low60_40_low20_9 = neg_g_177_low60_40_low20_8,
    u_217_226 = r_217_225,
    v_217_226 = s_217_225,
    neg_g_177_low60_40_low20_9 * 2 = neg_g_177_low60_40_low20_8 - neg_f_177_low60_40_low20_8,
    r_217_226 * 2 = r_217_225 - u_217_225,
    s_217_226 * 2 = s_217_225 - v_217_225
&&
    true
;

{
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_9 + u_217_226 * (const 64 (2**21)) + v_217_226 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_9 + r_217_226 * (const 64 (2**21)) + s_217_226 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_9,
    neg_f_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_9,
    neg_g_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 226)) <=s delta, delta <=s (const 64 (1 + 2*226)),
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20))),
    u_217_226 + v_217_226 <=s (const 64 (2**20)),
    u_217_226 - v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 + v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 - v_217_226 <=s (const 64 (2**20)),
    r_217_226 + s_217_226 <=s (const 64 (2**20)),
    r_217_226 - s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 + s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 - s_217_226 <=s (const 64 (2**20)),
    u_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_217_226 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_226_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_9,
sint64 neg_g_177_low60_40_low20_9,
sint64 neg_f_177_low60_40_low20_10,
sint64 neg_g_177_low60_40_low20_10,
sint64 u_217_226,
sint64 v_217_226,
sint64 r_217_226,
sint64 s_217_226,
sint64 u_217_227,
sint64 v_217_227,
sint64 r_217_227,
sint64 s_217_227,
bit ne
)={
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (-(2**20)),
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (-(2**20))
&&
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (const 64 (-(2**20))),
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_9 + u_217_226 * (const 64 (2**21)) + v_217_226 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_9 + r_217_226 * (const 64 (2**21)) + s_217_226 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_9,
    neg_f_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_9,
    neg_g_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 226)) <=s delta, delta <=s (const 64 (1 + 2*226)),
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20))),
    u_217_226 + v_217_226 <=s (const 64 (2**20)),
    u_217_226 - v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 + v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 - v_217_226 <=s (const 64 (2**20)),
    r_217_226 + s_217_226 <=s (const 64 (2**20)),
    r_217_226 - s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 + s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 - s_217_226 <=s (const 64 (2**20)),
    u_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_217_226 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise a
assume
neg_g_177_low60_40_low20_9 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_9 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_10 neg_f_177_low60_40_low20_9;
mov u_217_227 u_217_226;
mov v_217_227 v_217_226;

asr neg_g_177_low60_40_low20_10 neg_g_177_low60_40_low20_9 1;
asr r_217_227 r_217_226 1;
asr s_217_227 s_217_226 1;
assert
    true
&&
    neg_f_177_low60_40_low20_10 = neg_f_177_low60_40_low20_9,
    u_217_227 = u_217_226,
    v_217_227 = v_217_226,
    neg_g_177_low60_40_low20_10 * (const 64 2) = neg_g_177_low60_40_low20_9,
    r_217_227 * (const 64 2) = r_217_226,
    s_217_227 * (const 64 2) = s_217_226
;

assume
    neg_f_177_low60_40_low20_10 = neg_f_177_low60_40_low20_9,
    u_217_227 = u_217_226,
    v_217_227 = v_217_226,
    neg_g_177_low60_40_low20_10 * 2 = neg_g_177_low60_40_low20_9,
    r_217_227 * 2 = r_217_226,
    s_217_227 * 2 = s_217_226
&&
    true
;

{
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_10 + u_217_227 * (const 64 (2**21)) + v_217_227 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_10 + r_217_227 * (const 64 (2**21)) + s_217_227 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_10,
    neg_f_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_10,
    neg_g_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 227)) <=s delta, delta <=s (const 64 (1 + 2*227)),
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20))),
    u_217_227 + v_217_227 <=s (const 64 (2**20)),
    u_217_227 - v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 + v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 - v_217_227 <=s (const 64 (2**20)),
    r_217_227 + s_217_227 <=s (const 64 (2**20)),
    r_217_227 - s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 + s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 - s_217_227 <=s (const 64 (2**20)),
    u_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_217_227 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_226_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_9,
sint64 neg_g_177_low60_40_low20_9,
sint64 neg_f_177_low60_40_low20_10,
sint64 neg_g_177_low60_40_low20_10,
sint64 u_217_226,
sint64 v_217_226,
sint64 r_217_226,
sint64 s_217_226,
sint64 u_217_227,
sint64 v_217_227,
sint64 r_217_227,
sint64 s_217_227,
bit ne
)={
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (-(2**20)),
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (-(2**20))
&&
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (const 64 (-(2**20))),
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_9 + u_217_226 * (const 64 (2**21)) + v_217_226 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_9 + r_217_226 * (const 64 (2**21)) + s_217_226 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_9,
    neg_f_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_9,
    neg_g_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 226)) <=s delta, delta <=s (const 64 (1 + 2*226)),
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20))),
    u_217_226 + v_217_226 <=s (const 64 (2**20)),
    u_217_226 - v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 + v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 - v_217_226 <=s (const 64 (2**20)),
    r_217_226 + s_217_226 <=s (const 64 (2**20)),
    r_217_226 - s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 + s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 - s_217_226 <=s (const 64 (2**20)),
    u_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_217_226 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise b
assume
neg_g_177_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_10 neg_f_177_low60_40_low20_9;
mov u_217_227 u_217_226;
mov v_217_227 v_217_226;

add neg_g_177_low60_40_low20_10 neg_g_177_low60_40_low20_9 neg_f_177_low60_40_low20_9;
asr neg_g_177_low60_40_low20_10 neg_g_177_low60_40_low20_10 1;
add r_217_227 r_217_226 u_217_226;
asr r_217_227 r_217_227 1;
add s_217_227 s_217_226 v_217_226;
asr s_217_227 s_217_227 1;
assert
    true
&&
    neg_f_177_low60_40_low20_10 = neg_f_177_low60_40_low20_9,
    u_217_227 = u_217_226,
    v_217_227 = v_217_226,
    neg_g_177_low60_40_low20_10 * (const 64 2) = neg_g_177_low60_40_low20_9 + neg_f_177_low60_40_low20_9,
    r_217_227 * (const 64 2) = r_217_226 + u_217_226,
    s_217_227 * (const 64 2) = s_217_226 + v_217_226
;

assume
    neg_f_177_low60_40_low20_10 = neg_f_177_low60_40_low20_9,
    u_217_227 = u_217_226,
    v_217_227 = v_217_226,
    neg_g_177_low60_40_low20_10 * 2 = neg_g_177_low60_40_low20_9 + neg_f_177_low60_40_low20_9,
    r_217_227 * 2 = r_217_226 + u_217_226,
    s_217_227 * 2 = s_217_226 + v_217_226
&&
    true
;

{
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_10 + u_217_227 * (const 64 (2**21)) + v_217_227 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_10 + r_217_227 * (const 64 (2**21)) + s_217_227 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_10,
    neg_f_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_10,
    neg_g_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 227)) <=s delta, delta <=s (const 64 (1 + 2*227)),
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20))),
    u_217_227 + v_217_227 <=s (const 64 (2**20)),
    u_217_227 - v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 + v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 - v_217_227 <=s (const 64 (2**20)),
    r_217_227 + s_217_227 <=s (const 64 (2**20)),
    r_217_227 - s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 + s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 - s_217_227 <=s (const 64 (2**20)),
    u_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_217_227 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_226_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_9,
sint64 neg_g_177_low60_40_low20_9,
sint64 neg_f_177_low60_40_low20_10,
sint64 neg_g_177_low60_40_low20_10,
sint64 u_217_226,
sint64 v_217_226,
sint64 r_217_226,
sint64 s_217_226,
sint64 u_217_227,
sint64 v_217_227,
sint64 r_217_227,
sint64 s_217_227,
bit ne
)={
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (-(2**20)),
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (-(2**20))
&&
    u_217_226 * neg_f_177_low60_40_low20_0 + v_217_226 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_9 * (const 64 (-(2**20))),
    r_217_226 * neg_f_177_low60_40_low20_0 + s_217_226 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_9 + u_217_226 * (const 64 (2**21)) + v_217_226 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_9 + r_217_226 * (const 64 (2**21)) + s_217_226 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_9,
    neg_f_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_9,
    neg_g_177_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 226)) <=s delta, delta <=s (const 64 (1 + 2*226)),
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20))),
    u_217_226 + v_217_226 <=s (const 64 (2**20)),
    u_217_226 - v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 + v_217_226 <=s (const 64 (2**20)),
    (const 64 0) - u_217_226 - v_217_226 <=s (const 64 (2**20)),
    r_217_226 + s_217_226 <=s (const 64 (2**20)),
    r_217_226 - s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 + s_217_226 <=s (const 64 (2**20)),
    (const 64 0) - r_217_226 - s_217_226 <=s (const 64 (2**20)),
    u_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_217_226 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_217_226 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step49

// premise c
assume
neg_g_177_low60_40_low20_9 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_10 neg_g_177_low60_40_low20_9;
mov u_217_227 r_217_226;
mov v_217_227 s_217_226;

subs dc neg_g_177_low60_40_low20_10 neg_g_177_low60_40_low20_9 neg_f_177_low60_40_low20_9;
asr neg_g_177_low60_40_low20_10 neg_g_177_low60_40_low20_10 1;
subs dc r_217_227 r_217_226 u_217_226;
asr r_217_227 r_217_227 1;
subs dc s_217_227 s_217_226 v_217_226;
asr s_217_227 s_217_227 1;
assert
    true
&&
    neg_f_177_low60_40_low20_10 = neg_g_177_low60_40_low20_9,
    u_217_227 = r_217_226,
    v_217_227 = s_217_226,
    neg_g_177_low60_40_low20_10 * (const 64 2) = neg_g_177_low60_40_low20_9 - neg_f_177_low60_40_low20_9,
    r_217_227 * (const 64 2) = r_217_226 - u_217_226,
    s_217_227 * (const 64 2) = s_217_226 - v_217_226
;

assume
    neg_f_177_low60_40_low20_10 = neg_g_177_low60_40_low20_9,
    u_217_227 = r_217_226,
    v_217_227 = s_217_226,
    neg_g_177_low60_40_low20_10 * 2 = neg_g_177_low60_40_low20_9 - neg_f_177_low60_40_low20_9,
    r_217_227 * 2 = r_217_226 - u_217_226,
    s_217_227 * 2 = s_217_226 - v_217_226
&&
    true
;

{
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_10 + u_217_227 * (const 64 (2**21)) + v_217_227 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_10 + r_217_227 * (const 64 (2**21)) + s_217_227 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_10,
    neg_f_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_10,
    neg_g_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 227)) <=s delta, delta <=s (const 64 (1 + 2*227)),
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20))),
    u_217_227 + v_217_227 <=s (const 64 (2**20)),
    u_217_227 - v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 + v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 - v_217_227 <=s (const 64 (2**20)),
    r_217_227 + s_217_227 <=s (const 64 (2**20)),
    r_217_227 - s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 + s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 - s_217_227 <=s (const 64 (2**20)),
    u_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_217_227 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_227_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_10,
sint64 neg_g_177_low60_40_low20_10,
sint64 neg_f_177_low60_40_low20_11,
sint64 neg_g_177_low60_40_low20_11,
sint64 u_217_227,
sint64 v_217_227,
sint64 r_217_227,
sint64 s_217_227,
sint64 u_217_228,
sint64 v_217_228,
sint64 r_217_228,
sint64 s_217_228,
bit ne
)={
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (-(2**20)),
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (-(2**20))
&&
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (const 64 (-(2**20))),
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_10 + u_217_227 * (const 64 (2**21)) + v_217_227 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_10 + r_217_227 * (const 64 (2**21)) + s_217_227 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_10,
    neg_f_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_10,
    neg_g_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 227)) <=s delta, delta <=s (const 64 (1 + 2*227)),
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20))),
    u_217_227 + v_217_227 <=s (const 64 (2**20)),
    u_217_227 - v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 + v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 - v_217_227 <=s (const 64 (2**20)),
    r_217_227 + s_217_227 <=s (const 64 (2**20)),
    r_217_227 - s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 + s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 - s_217_227 <=s (const 64 (2**20)),
    u_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_217_227 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise a
assume
neg_g_177_low60_40_low20_10 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_10 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_11 neg_f_177_low60_40_low20_10;
mov u_217_228 u_217_227;
mov v_217_228 v_217_227;

asr neg_g_177_low60_40_low20_11 neg_g_177_low60_40_low20_10 1;
asr r_217_228 r_217_227 1;
asr s_217_228 s_217_227 1;
assert
    true
&&
    neg_f_177_low60_40_low20_11 = neg_f_177_low60_40_low20_10,
    u_217_228 = u_217_227,
    v_217_228 = v_217_227,
    neg_g_177_low60_40_low20_11 * (const 64 2) = neg_g_177_low60_40_low20_10,
    r_217_228 * (const 64 2) = r_217_227,
    s_217_228 * (const 64 2) = s_217_227
;

assume
    neg_f_177_low60_40_low20_11 = neg_f_177_low60_40_low20_10,
    u_217_228 = u_217_227,
    v_217_228 = v_217_227,
    neg_g_177_low60_40_low20_11 * 2 = neg_g_177_low60_40_low20_10,
    r_217_228 * 2 = r_217_227,
    s_217_228 * 2 = s_217_227
&&
    true
;

{
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_11 + u_217_228 * (const 64 (2**21)) + v_217_228 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_11 + r_217_228 * (const 64 (2**21)) + s_217_228 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_11,
    neg_f_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_11,
    neg_g_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 228)) <=s delta, delta <=s (const 64 (1 + 2*228)),
    (const 64 (-(2**20))) <=s u_217_228, u_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_228, v_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_228, r_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_228, s_217_228 <=s (const 64 ((2**20))),
    u_217_228 + v_217_228 <=s (const 64 (2**20)),
    u_217_228 - v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 + v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 - v_217_228 <=s (const 64 (2**20)),
    r_217_228 + s_217_228 <=s (const 64 (2**20)),
    r_217_228 - s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 + s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 - s_217_228 <=s (const 64 (2**20)),
    u_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_217_228 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_227_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_10,
sint64 neg_g_177_low60_40_low20_10,
sint64 neg_f_177_low60_40_low20_11,
sint64 neg_g_177_low60_40_low20_11,
sint64 u_217_227,
sint64 v_217_227,
sint64 r_217_227,
sint64 s_217_227,
sint64 u_217_228,
sint64 v_217_228,
sint64 r_217_228,
sint64 s_217_228,
bit ne
)={
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (-(2**20)),
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (-(2**20))
&&
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (const 64 (-(2**20))),
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_10 + u_217_227 * (const 64 (2**21)) + v_217_227 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_10 + r_217_227 * (const 64 (2**21)) + s_217_227 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_10,
    neg_f_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_10,
    neg_g_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 227)) <=s delta, delta <=s (const 64 (1 + 2*227)),
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20))),
    u_217_227 + v_217_227 <=s (const 64 (2**20)),
    u_217_227 - v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 + v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 - v_217_227 <=s (const 64 (2**20)),
    r_217_227 + s_217_227 <=s (const 64 (2**20)),
    r_217_227 - s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 + s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 - s_217_227 <=s (const 64 (2**20)),
    u_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_217_227 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise b
assume
neg_g_177_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_11 neg_f_177_low60_40_low20_10;
mov u_217_228 u_217_227;
mov v_217_228 v_217_227;

add neg_g_177_low60_40_low20_11 neg_g_177_low60_40_low20_10 neg_f_177_low60_40_low20_10;
asr neg_g_177_low60_40_low20_11 neg_g_177_low60_40_low20_11 1;
add r_217_228 r_217_227 u_217_227;
asr r_217_228 r_217_228 1;
add s_217_228 s_217_227 v_217_227;
asr s_217_228 s_217_228 1;
assert
    true
&&
    neg_f_177_low60_40_low20_11 = neg_f_177_low60_40_low20_10,
    u_217_228 = u_217_227,
    v_217_228 = v_217_227,
    neg_g_177_low60_40_low20_11 * (const 64 2) = neg_g_177_low60_40_low20_10 + neg_f_177_low60_40_low20_10,
    r_217_228 * (const 64 2) = r_217_227 + u_217_227,
    s_217_228 * (const 64 2) = s_217_227 + v_217_227
;

assume
    neg_f_177_low60_40_low20_11 = neg_f_177_low60_40_low20_10,
    u_217_228 = u_217_227,
    v_217_228 = v_217_227,
    neg_g_177_low60_40_low20_11 * 2 = neg_g_177_low60_40_low20_10 + neg_f_177_low60_40_low20_10,
    r_217_228 * 2 = r_217_227 + u_217_227,
    s_217_228 * 2 = s_217_227 + v_217_227
&&
    true
;

{
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_11 + u_217_228 * (const 64 (2**21)) + v_217_228 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_11 + r_217_228 * (const 64 (2**21)) + s_217_228 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_11,
    neg_f_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_11,
    neg_g_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 228)) <=s delta, delta <=s (const 64 (1 + 2*228)),
    (const 64 (-(2**20))) <=s u_217_228, u_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_228, v_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_228, r_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_228, s_217_228 <=s (const 64 ((2**20))),
    u_217_228 + v_217_228 <=s (const 64 (2**20)),
    u_217_228 - v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 + v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 - v_217_228 <=s (const 64 (2**20)),
    r_217_228 + s_217_228 <=s (const 64 (2**20)),
    r_217_228 - s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 + s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 - s_217_228 <=s (const 64 (2**20)),
    u_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_217_228 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_227_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_10,
sint64 neg_g_177_low60_40_low20_10,
sint64 neg_f_177_low60_40_low20_11,
sint64 neg_g_177_low60_40_low20_11,
sint64 u_217_227,
sint64 v_217_227,
sint64 r_217_227,
sint64 s_217_227,
sint64 u_217_228,
sint64 v_217_228,
sint64 r_217_228,
sint64 s_217_228,
bit ne
)={
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (-(2**20)),
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (-(2**20))
&&
    u_217_227 * neg_f_177_low60_40_low20_0 + v_217_227 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_10 * (const 64 (-(2**20))),
    r_217_227 * neg_f_177_low60_40_low20_0 + s_217_227 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_10 + u_217_227 * (const 64 (2**21)) + v_217_227 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_10 + r_217_227 * (const 64 (2**21)) + s_217_227 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_10,
    neg_f_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_10,
    neg_g_177_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 227)) <=s delta, delta <=s (const 64 (1 + 2*227)),
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20))),
    u_217_227 + v_217_227 <=s (const 64 (2**20)),
    u_217_227 - v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 + v_217_227 <=s (const 64 (2**20)),
    (const 64 0) - u_217_227 - v_217_227 <=s (const 64 (2**20)),
    r_217_227 + s_217_227 <=s (const 64 (2**20)),
    r_217_227 - s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 + s_217_227 <=s (const 64 (2**20)),
    (const 64 0) - r_217_227 - s_217_227 <=s (const 64 (2**20)),
    u_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_217_227 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_217_227 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise c
assume
neg_g_177_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_11 neg_g_177_low60_40_low20_10;
mov u_217_228 r_217_227;
mov v_217_228 s_217_227;

subs dc neg_g_177_low60_40_low20_11 neg_g_177_low60_40_low20_10 neg_f_177_low60_40_low20_10;
asr neg_g_177_low60_40_low20_11 neg_g_177_low60_40_low20_11 1;
subs dc r_217_228 r_217_227 u_217_227;
asr r_217_228 r_217_228 1;
subs dc s_217_228 s_217_227 v_217_227;
asr s_217_228 s_217_228 1;
assert
    true
&&
    neg_f_177_low60_40_low20_11 = neg_g_177_low60_40_low20_10,
    u_217_228 = r_217_227,
    v_217_228 = s_217_227,
    neg_g_177_low60_40_low20_11 * (const 64 2) = neg_g_177_low60_40_low20_10 - neg_f_177_low60_40_low20_10,
    r_217_228 * (const 64 2) = r_217_227 - u_217_227,
    s_217_228 * (const 64 2) = s_217_227 - v_217_227
;

assume
    neg_f_177_low60_40_low20_11 = neg_g_177_low60_40_low20_10,
    u_217_228 = r_217_227,
    v_217_228 = s_217_227,
    neg_g_177_low60_40_low20_11 * 2 = neg_g_177_low60_40_low20_10 - neg_f_177_low60_40_low20_10,
    r_217_228 * 2 = r_217_227 - u_217_227,
    s_217_228 * 2 = s_217_227 - v_217_227
&&
    true
;

{
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_11 + u_217_228 * (const 64 (2**21)) + v_217_228 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_11 + r_217_228 * (const 64 (2**21)) + s_217_228 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_11,
    neg_f_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_11,
    neg_g_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 228)) <=s delta, delta <=s (const 64 (1 + 2*228)),
    (const 64 (-(2**20))) <=s u_217_228, u_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_228, v_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_228, r_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_228, s_217_228 <=s (const 64 ((2**20))),
    u_217_228 + v_217_228 <=s (const 64 (2**20)),
    u_217_228 - v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 + v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 - v_217_228 <=s (const 64 (2**20)),
    r_217_228 + s_217_228 <=s (const 64 (2**20)),
    r_217_228 - s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 + s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 - s_217_228 <=s (const 64 (2**20)),
    u_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_217_228 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_228_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_11,
sint64 neg_g_177_low60_40_low20_11,
sint64 neg_f_177_low60_40_low20_12,
sint64 neg_g_177_low60_40_low20_12,
sint64 u_217_228,
sint64 v_217_228,
sint64 r_217_228,
sint64 s_217_228,
sint64 u_217_229,
sint64 v_217_229,
sint64 r_217_229,
sint64 s_217_229,
bit ne
)={
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (-(2**20)),
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (-(2**20))
&&
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (const 64 (-(2**20))),
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_11 + u_217_228 * (const 64 (2**21)) + v_217_228 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_11 + r_217_228 * (const 64 (2**21)) + s_217_228 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_11,
    neg_f_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_11,
    neg_g_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 228)) <=s delta, delta <=s (const 64 (1 + 2*228)),
    (const 64 (-(2**20))) <=s u_217_228, u_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_228, v_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_228, r_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_228, s_217_228 <=s (const 64 ((2**20))),
    u_217_228 + v_217_228 <=s (const 64 (2**20)),
    u_217_228 - v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 + v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 - v_217_228 <=s (const 64 (2**20)),
    r_217_228 + s_217_228 <=s (const 64 (2**20)),
    r_217_228 - s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 + s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 - s_217_228 <=s (const 64 (2**20)),
    u_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_217_228 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise a
assume
neg_g_177_low60_40_low20_11 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_11 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_12 neg_f_177_low60_40_low20_11;
mov u_217_229 u_217_228;
mov v_217_229 v_217_228;

asr neg_g_177_low60_40_low20_12 neg_g_177_low60_40_low20_11 1;
asr r_217_229 r_217_228 1;
asr s_217_229 s_217_228 1;
assert
    true
&&
    neg_f_177_low60_40_low20_12 = neg_f_177_low60_40_low20_11,
    u_217_229 = u_217_228,
    v_217_229 = v_217_228,
    neg_g_177_low60_40_low20_12 * (const 64 2) = neg_g_177_low60_40_low20_11,
    r_217_229 * (const 64 2) = r_217_228,
    s_217_229 * (const 64 2) = s_217_228
;

assume
    neg_f_177_low60_40_low20_12 = neg_f_177_low60_40_low20_11,
    u_217_229 = u_217_228,
    v_217_229 = v_217_228,
    neg_g_177_low60_40_low20_12 * 2 = neg_g_177_low60_40_low20_11,
    r_217_229 * 2 = r_217_228,
    s_217_229 * 2 = s_217_228
&&
    true
;

{
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_12 + u_217_229 * (const 64 (2**21)) + v_217_229 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_12 + r_217_229 * (const 64 (2**21)) + s_217_229 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_12,
    neg_f_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_12,
    neg_g_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 229)) <=s delta, delta <=s (const 64 (1 + 2*229)),
    (const 64 (-(2**20))) <=s u_217_229, u_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_229, v_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_229, r_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_229, s_217_229 <=s (const 64 ((2**20))),
    u_217_229 + v_217_229 <=s (const 64 (2**20)),
    u_217_229 - v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 + v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 - v_217_229 <=s (const 64 (2**20)),
    r_217_229 + s_217_229 <=s (const 64 (2**20)),
    r_217_229 - s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 + s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 - s_217_229 <=s (const 64 (2**20)),
    u_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_217_229 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_228_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_11,
sint64 neg_g_177_low60_40_low20_11,
sint64 neg_f_177_low60_40_low20_12,
sint64 neg_g_177_low60_40_low20_12,
sint64 u_217_228,
sint64 v_217_228,
sint64 r_217_228,
sint64 s_217_228,
sint64 u_217_229,
sint64 v_217_229,
sint64 r_217_229,
sint64 s_217_229,
bit ne
)={
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (-(2**20)),
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (-(2**20))
&&
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (const 64 (-(2**20))),
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_11 + u_217_228 * (const 64 (2**21)) + v_217_228 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_11 + r_217_228 * (const 64 (2**21)) + s_217_228 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_11,
    neg_f_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_11,
    neg_g_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 228)) <=s delta, delta <=s (const 64 (1 + 2*228)),
    (const 64 (-(2**20))) <=s u_217_228, u_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_228, v_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_228, r_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_228, s_217_228 <=s (const 64 ((2**20))),
    u_217_228 + v_217_228 <=s (const 64 (2**20)),
    u_217_228 - v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 + v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 - v_217_228 <=s (const 64 (2**20)),
    r_217_228 + s_217_228 <=s (const 64 (2**20)),
    r_217_228 - s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 + s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 - s_217_228 <=s (const 64 (2**20)),
    u_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_217_228 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise b
assume
neg_g_177_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_12 neg_f_177_low60_40_low20_11;
mov u_217_229 u_217_228;
mov v_217_229 v_217_228;

add neg_g_177_low60_40_low20_12 neg_g_177_low60_40_low20_11 neg_f_177_low60_40_low20_11;
asr neg_g_177_low60_40_low20_12 neg_g_177_low60_40_low20_12 1;
add r_217_229 r_217_228 u_217_228;
asr r_217_229 r_217_229 1;
add s_217_229 s_217_228 v_217_228;
asr s_217_229 s_217_229 1;
assert
    true
&&
    neg_f_177_low60_40_low20_12 = neg_f_177_low60_40_low20_11,
    u_217_229 = u_217_228,
    v_217_229 = v_217_228,
    neg_g_177_low60_40_low20_12 * (const 64 2) = neg_g_177_low60_40_low20_11 + neg_f_177_low60_40_low20_11,
    r_217_229 * (const 64 2) = r_217_228 + u_217_228,
    s_217_229 * (const 64 2) = s_217_228 + v_217_228
;

assume
    neg_f_177_low60_40_low20_12 = neg_f_177_low60_40_low20_11,
    u_217_229 = u_217_228,
    v_217_229 = v_217_228,
    neg_g_177_low60_40_low20_12 * 2 = neg_g_177_low60_40_low20_11 + neg_f_177_low60_40_low20_11,
    r_217_229 * 2 = r_217_228 + u_217_228,
    s_217_229 * 2 = s_217_228 + v_217_228
&&
    true
;

{
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_12 + u_217_229 * (const 64 (2**21)) + v_217_229 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_12 + r_217_229 * (const 64 (2**21)) + s_217_229 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_12,
    neg_f_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_12,
    neg_g_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 229)) <=s delta, delta <=s (const 64 (1 + 2*229)),
    (const 64 (-(2**20))) <=s u_217_229, u_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_229, v_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_229, r_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_229, s_217_229 <=s (const 64 ((2**20))),
    u_217_229 + v_217_229 <=s (const 64 (2**20)),
    u_217_229 - v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 + v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 - v_217_229 <=s (const 64 (2**20)),
    r_217_229 + s_217_229 <=s (const 64 (2**20)),
    r_217_229 - s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 + s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 - s_217_229 <=s (const 64 (2**20)),
    u_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_217_229 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_228_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_11,
sint64 neg_g_177_low60_40_low20_11,
sint64 neg_f_177_low60_40_low20_12,
sint64 neg_g_177_low60_40_low20_12,
sint64 u_217_228,
sint64 v_217_228,
sint64 r_217_228,
sint64 s_217_228,
sint64 u_217_229,
sint64 v_217_229,
sint64 r_217_229,
sint64 s_217_229,
bit ne
)={
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (-(2**20)),
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (-(2**20))
&&
    u_217_228 * neg_f_177_low60_40_low20_0 + v_217_228 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_11 * (const 64 (-(2**20))),
    r_217_228 * neg_f_177_low60_40_low20_0 + s_217_228 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_11 + u_217_228 * (const 64 (2**21)) + v_217_228 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_11 + r_217_228 * (const 64 (2**21)) + s_217_228 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_11,
    neg_f_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_11,
    neg_g_177_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 228)) <=s delta, delta <=s (const 64 (1 + 2*228)),
    (const 64 (-(2**20))) <=s u_217_228, u_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_228, v_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_228, r_217_228 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_228, s_217_228 <=s (const 64 ((2**20))),
    u_217_228 + v_217_228 <=s (const 64 (2**20)),
    u_217_228 - v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 + v_217_228 <=s (const 64 (2**20)),
    (const 64 0) - u_217_228 - v_217_228 <=s (const 64 (2**20)),
    r_217_228 + s_217_228 <=s (const 64 (2**20)),
    r_217_228 - s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 + s_217_228 <=s (const 64 (2**20)),
    (const 64 0) - r_217_228 - s_217_228 <=s (const 64 (2**20)),
    u_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_217_228 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_217_228 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise c
assume
neg_g_177_low60_40_low20_11 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_12 neg_g_177_low60_40_low20_11;
mov u_217_229 r_217_228;
mov v_217_229 s_217_228;

subs dc neg_g_177_low60_40_low20_12 neg_g_177_low60_40_low20_11 neg_f_177_low60_40_low20_11;
asr neg_g_177_low60_40_low20_12 neg_g_177_low60_40_low20_12 1;
subs dc r_217_229 r_217_228 u_217_228;
asr r_217_229 r_217_229 1;
subs dc s_217_229 s_217_228 v_217_228;
asr s_217_229 s_217_229 1;
assert
    true
&&
    neg_f_177_low60_40_low20_12 = neg_g_177_low60_40_low20_11,
    u_217_229 = r_217_228,
    v_217_229 = s_217_228,
    neg_g_177_low60_40_low20_12 * (const 64 2) = neg_g_177_low60_40_low20_11 - neg_f_177_low60_40_low20_11,
    r_217_229 * (const 64 2) = r_217_228 - u_217_228,
    s_217_229 * (const 64 2) = s_217_228 - v_217_228
;

assume
    neg_f_177_low60_40_low20_12 = neg_g_177_low60_40_low20_11,
    u_217_229 = r_217_228,
    v_217_229 = s_217_228,
    neg_g_177_low60_40_low20_12 * 2 = neg_g_177_low60_40_low20_11 - neg_f_177_low60_40_low20_11,
    r_217_229 * 2 = r_217_228 - u_217_228,
    s_217_229 * 2 = s_217_228 - v_217_228
&&
    true
;

{
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_12 + u_217_229 * (const 64 (2**21)) + v_217_229 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_12 + r_217_229 * (const 64 (2**21)) + s_217_229 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_12,
    neg_f_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_12,
    neg_g_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 229)) <=s delta, delta <=s (const 64 (1 + 2*229)),
    (const 64 (-(2**20))) <=s u_217_229, u_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_229, v_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_229, r_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_229, s_217_229 <=s (const 64 ((2**20))),
    u_217_229 + v_217_229 <=s (const 64 (2**20)),
    u_217_229 - v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 + v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 - v_217_229 <=s (const 64 (2**20)),
    r_217_229 + s_217_229 <=s (const 64 (2**20)),
    r_217_229 - s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 + s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 - s_217_229 <=s (const 64 (2**20)),
    u_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_217_229 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_229_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_12,
sint64 neg_g_177_low60_40_low20_12,
sint64 neg_f_177_low60_40_low20_13,
sint64 neg_g_177_low60_40_low20_13,
sint64 u_217_229,
sint64 v_217_229,
sint64 r_217_229,
sint64 s_217_229,
sint64 u_217_230,
sint64 v_217_230,
sint64 r_217_230,
sint64 s_217_230,
bit ne
)={
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (-(2**20)),
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (-(2**20))
&&
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (const 64 (-(2**20))),
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_12 + u_217_229 * (const 64 (2**21)) + v_217_229 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_12 + r_217_229 * (const 64 (2**21)) + s_217_229 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_12,
    neg_f_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_12,
    neg_g_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 229)) <=s delta, delta <=s (const 64 (1 + 2*229)),
    (const 64 (-(2**20))) <=s u_217_229, u_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_229, v_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_229, r_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_229, s_217_229 <=s (const 64 ((2**20))),
    u_217_229 + v_217_229 <=s (const 64 (2**20)),
    u_217_229 - v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 + v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 - v_217_229 <=s (const 64 (2**20)),
    r_217_229 + s_217_229 <=s (const 64 (2**20)),
    r_217_229 - s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 + s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 - s_217_229 <=s (const 64 (2**20)),
    u_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_217_229 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise a
assume
neg_g_177_low60_40_low20_12 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_12 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_13 neg_f_177_low60_40_low20_12;
mov u_217_230 u_217_229;
mov v_217_230 v_217_229;

asr neg_g_177_low60_40_low20_13 neg_g_177_low60_40_low20_12 1;
asr r_217_230 r_217_229 1;
asr s_217_230 s_217_229 1;
assert
    true
&&
    neg_f_177_low60_40_low20_13 = neg_f_177_low60_40_low20_12,
    u_217_230 = u_217_229,
    v_217_230 = v_217_229,
    neg_g_177_low60_40_low20_13 * (const 64 2) = neg_g_177_low60_40_low20_12,
    r_217_230 * (const 64 2) = r_217_229,
    s_217_230 * (const 64 2) = s_217_229
;

assume
    neg_f_177_low60_40_low20_13 = neg_f_177_low60_40_low20_12,
    u_217_230 = u_217_229,
    v_217_230 = v_217_229,
    neg_g_177_low60_40_low20_13 * 2 = neg_g_177_low60_40_low20_12,
    r_217_230 * 2 = r_217_229,
    s_217_230 * 2 = s_217_229
&&
    true
;

{
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_13 + u_217_230 * (const 64 (2**21)) + v_217_230 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_13 + r_217_230 * (const 64 (2**21)) + s_217_230 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_13,
    neg_f_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_13,
    neg_g_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 230)) <=s delta, delta <=s (const 64 (1 + 2*230)),
    (const 64 (-(2**20))) <=s u_217_230, u_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_230, v_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_230, r_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_230, s_217_230 <=s (const 64 ((2**20))),
    u_217_230 + v_217_230 <=s (const 64 (2**20)),
    u_217_230 - v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 + v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 - v_217_230 <=s (const 64 (2**20)),
    r_217_230 + s_217_230 <=s (const 64 (2**20)),
    r_217_230 - s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 + s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 - s_217_230 <=s (const 64 (2**20)),
    u_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_217_230 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_229_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_12,
sint64 neg_g_177_low60_40_low20_12,
sint64 neg_f_177_low60_40_low20_13,
sint64 neg_g_177_low60_40_low20_13,
sint64 u_217_229,
sint64 v_217_229,
sint64 r_217_229,
sint64 s_217_229,
sint64 u_217_230,
sint64 v_217_230,
sint64 r_217_230,
sint64 s_217_230,
bit ne
)={
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (-(2**20)),
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (-(2**20))
&&
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (const 64 (-(2**20))),
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_12 + u_217_229 * (const 64 (2**21)) + v_217_229 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_12 + r_217_229 * (const 64 (2**21)) + s_217_229 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_12,
    neg_f_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_12,
    neg_g_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 229)) <=s delta, delta <=s (const 64 (1 + 2*229)),
    (const 64 (-(2**20))) <=s u_217_229, u_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_229, v_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_229, r_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_229, s_217_229 <=s (const 64 ((2**20))),
    u_217_229 + v_217_229 <=s (const 64 (2**20)),
    u_217_229 - v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 + v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 - v_217_229 <=s (const 64 (2**20)),
    r_217_229 + s_217_229 <=s (const 64 (2**20)),
    r_217_229 - s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 + s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 - s_217_229 <=s (const 64 (2**20)),
    u_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_217_229 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise b
assume
neg_g_177_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_13 neg_f_177_low60_40_low20_12;
mov u_217_230 u_217_229;
mov v_217_230 v_217_229;

add neg_g_177_low60_40_low20_13 neg_g_177_low60_40_low20_12 neg_f_177_low60_40_low20_12;
asr neg_g_177_low60_40_low20_13 neg_g_177_low60_40_low20_13 1;
add r_217_230 r_217_229 u_217_229;
asr r_217_230 r_217_230 1;
add s_217_230 s_217_229 v_217_229;
asr s_217_230 s_217_230 1;
assert
    true
&&
    neg_f_177_low60_40_low20_13 = neg_f_177_low60_40_low20_12,
    u_217_230 = u_217_229,
    v_217_230 = v_217_229,
    neg_g_177_low60_40_low20_13 * (const 64 2) = neg_g_177_low60_40_low20_12 + neg_f_177_low60_40_low20_12,
    r_217_230 * (const 64 2) = r_217_229 + u_217_229,
    s_217_230 * (const 64 2) = s_217_229 + v_217_229
;

assume
    neg_f_177_low60_40_low20_13 = neg_f_177_low60_40_low20_12,
    u_217_230 = u_217_229,
    v_217_230 = v_217_229,
    neg_g_177_low60_40_low20_13 * 2 = neg_g_177_low60_40_low20_12 + neg_f_177_low60_40_low20_12,
    r_217_230 * 2 = r_217_229 + u_217_229,
    s_217_230 * 2 = s_217_229 + v_217_229
&&
    true
;

{
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_13 + u_217_230 * (const 64 (2**21)) + v_217_230 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_13 + r_217_230 * (const 64 (2**21)) + s_217_230 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_13,
    neg_f_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_13,
    neg_g_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 230)) <=s delta, delta <=s (const 64 (1 + 2*230)),
    (const 64 (-(2**20))) <=s u_217_230, u_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_230, v_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_230, r_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_230, s_217_230 <=s (const 64 ((2**20))),
    u_217_230 + v_217_230 <=s (const 64 (2**20)),
    u_217_230 - v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 + v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 - v_217_230 <=s (const 64 (2**20)),
    r_217_230 + s_217_230 <=s (const 64 (2**20)),
    r_217_230 - s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 + s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 - s_217_230 <=s (const 64 (2**20)),
    u_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_217_230 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_229_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_12,
sint64 neg_g_177_low60_40_low20_12,
sint64 neg_f_177_low60_40_low20_13,
sint64 neg_g_177_low60_40_low20_13,
sint64 u_217_229,
sint64 v_217_229,
sint64 r_217_229,
sint64 s_217_229,
sint64 u_217_230,
sint64 v_217_230,
sint64 r_217_230,
sint64 s_217_230,
bit ne
)={
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (-(2**20)),
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (-(2**20))
&&
    u_217_229 * neg_f_177_low60_40_low20_0 + v_217_229 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_12 * (const 64 (-(2**20))),
    r_217_229 * neg_f_177_low60_40_low20_0 + s_217_229 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_12 + u_217_229 * (const 64 (2**21)) + v_217_229 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_12 + r_217_229 * (const 64 (2**21)) + s_217_229 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_12,
    neg_f_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_12,
    neg_g_177_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 229)) <=s delta, delta <=s (const 64 (1 + 2*229)),
    (const 64 (-(2**20))) <=s u_217_229, u_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_229, v_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_229, r_217_229 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_229, s_217_229 <=s (const 64 ((2**20))),
    u_217_229 + v_217_229 <=s (const 64 (2**20)),
    u_217_229 - v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 + v_217_229 <=s (const 64 (2**20)),
    (const 64 0) - u_217_229 - v_217_229 <=s (const 64 (2**20)),
    r_217_229 + s_217_229 <=s (const 64 (2**20)),
    r_217_229 - s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 + s_217_229 <=s (const 64 (2**20)),
    (const 64 0) - r_217_229 - s_217_229 <=s (const 64 (2**20)),
    u_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_217_229 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_217_229 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step52

// premise c
assume
neg_g_177_low60_40_low20_12 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_13 neg_g_177_low60_40_low20_12;
mov u_217_230 r_217_229;
mov v_217_230 s_217_229;

subs dc neg_g_177_low60_40_low20_13 neg_g_177_low60_40_low20_12 neg_f_177_low60_40_low20_12;
asr neg_g_177_low60_40_low20_13 neg_g_177_low60_40_low20_13 1;
subs dc r_217_230 r_217_229 u_217_229;
asr r_217_230 r_217_230 1;
subs dc s_217_230 s_217_229 v_217_229;
asr s_217_230 s_217_230 1;
assert
    true
&&
    neg_f_177_low60_40_low20_13 = neg_g_177_low60_40_low20_12,
    u_217_230 = r_217_229,
    v_217_230 = s_217_229,
    neg_g_177_low60_40_low20_13 * (const 64 2) = neg_g_177_low60_40_low20_12 - neg_f_177_low60_40_low20_12,
    r_217_230 * (const 64 2) = r_217_229 - u_217_229,
    s_217_230 * (const 64 2) = s_217_229 - v_217_229
;

assume
    neg_f_177_low60_40_low20_13 = neg_g_177_low60_40_low20_12,
    u_217_230 = r_217_229,
    v_217_230 = s_217_229,
    neg_g_177_low60_40_low20_13 * 2 = neg_g_177_low60_40_low20_12 - neg_f_177_low60_40_low20_12,
    r_217_230 * 2 = r_217_229 - u_217_229,
    s_217_230 * 2 = s_217_229 - v_217_229
&&
    true
;

{
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_13 + u_217_230 * (const 64 (2**21)) + v_217_230 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_13 + r_217_230 * (const 64 (2**21)) + s_217_230 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_13,
    neg_f_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_13,
    neg_g_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 230)) <=s delta, delta <=s (const 64 (1 + 2*230)),
    (const 64 (-(2**20))) <=s u_217_230, u_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_230, v_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_230, r_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_230, s_217_230 <=s (const 64 ((2**20))),
    u_217_230 + v_217_230 <=s (const 64 (2**20)),
    u_217_230 - v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 + v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 - v_217_230 <=s (const 64 (2**20)),
    r_217_230 + s_217_230 <=s (const 64 (2**20)),
    r_217_230 - s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 + s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 - s_217_230 <=s (const 64 (2**20)),
    u_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_217_230 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_230_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_13,
sint64 neg_g_177_low60_40_low20_13,
sint64 neg_f_177_low60_40_low20_14,
sint64 neg_g_177_low60_40_low20_14,
sint64 u_217_230,
sint64 v_217_230,
sint64 r_217_230,
sint64 s_217_230,
sint64 u_217_231,
sint64 v_217_231,
sint64 r_217_231,
sint64 s_217_231,
bit ne
)={
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (-(2**20)),
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (-(2**20))
&&
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (const 64 (-(2**20))),
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_13 + u_217_230 * (const 64 (2**21)) + v_217_230 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_13 + r_217_230 * (const 64 (2**21)) + s_217_230 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_13,
    neg_f_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_13,
    neg_g_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 230)) <=s delta, delta <=s (const 64 (1 + 2*230)),
    (const 64 (-(2**20))) <=s u_217_230, u_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_230, v_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_230, r_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_230, s_217_230 <=s (const 64 ((2**20))),
    u_217_230 + v_217_230 <=s (const 64 (2**20)),
    u_217_230 - v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 + v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 - v_217_230 <=s (const 64 (2**20)),
    r_217_230 + s_217_230 <=s (const 64 (2**20)),
    r_217_230 - s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 + s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 - s_217_230 <=s (const 64 (2**20)),
    u_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_217_230 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise a
assume
neg_g_177_low60_40_low20_13 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_13 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_14 neg_f_177_low60_40_low20_13;
mov u_217_231 u_217_230;
mov v_217_231 v_217_230;

asr neg_g_177_low60_40_low20_14 neg_g_177_low60_40_low20_13 1;
asr r_217_231 r_217_230 1;
asr s_217_231 s_217_230 1;
assert
    true
&&
    neg_f_177_low60_40_low20_14 = neg_f_177_low60_40_low20_13,
    u_217_231 = u_217_230,
    v_217_231 = v_217_230,
    neg_g_177_low60_40_low20_14 * (const 64 2) = neg_g_177_low60_40_low20_13,
    r_217_231 * (const 64 2) = r_217_230,
    s_217_231 * (const 64 2) = s_217_230
;

assume
    neg_f_177_low60_40_low20_14 = neg_f_177_low60_40_low20_13,
    u_217_231 = u_217_230,
    v_217_231 = v_217_230,
    neg_g_177_low60_40_low20_14 * 2 = neg_g_177_low60_40_low20_13,
    r_217_231 * 2 = r_217_230,
    s_217_231 * 2 = s_217_230
&&
    true
;

{
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_14 + u_217_231 * (const 64 (2**21)) + v_217_231 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_14 + r_217_231 * (const 64 (2**21)) + s_217_231 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_14,
    neg_f_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_14,
    neg_g_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 231)) <=s delta, delta <=s (const 64 (1 + 2*231)),
    (const 64 (-(2**20))) <=s u_217_231, u_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_231, v_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_231, r_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_231, s_217_231 <=s (const 64 ((2**20))),
    u_217_231 + v_217_231 <=s (const 64 (2**20)),
    u_217_231 - v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 + v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 - v_217_231 <=s (const 64 (2**20)),
    r_217_231 + s_217_231 <=s (const 64 (2**20)),
    r_217_231 - s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 + s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 - s_217_231 <=s (const 64 (2**20)),
    u_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_217_231 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_230_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_13,
sint64 neg_g_177_low60_40_low20_13,
sint64 neg_f_177_low60_40_low20_14,
sint64 neg_g_177_low60_40_low20_14,
sint64 u_217_230,
sint64 v_217_230,
sint64 r_217_230,
sint64 s_217_230,
sint64 u_217_231,
sint64 v_217_231,
sint64 r_217_231,
sint64 s_217_231,
bit ne
)={
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (-(2**20)),
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (-(2**20))
&&
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (const 64 (-(2**20))),
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_13 + u_217_230 * (const 64 (2**21)) + v_217_230 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_13 + r_217_230 * (const 64 (2**21)) + s_217_230 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_13,
    neg_f_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_13,
    neg_g_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 230)) <=s delta, delta <=s (const 64 (1 + 2*230)),
    (const 64 (-(2**20))) <=s u_217_230, u_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_230, v_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_230, r_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_230, s_217_230 <=s (const 64 ((2**20))),
    u_217_230 + v_217_230 <=s (const 64 (2**20)),
    u_217_230 - v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 + v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 - v_217_230 <=s (const 64 (2**20)),
    r_217_230 + s_217_230 <=s (const 64 (2**20)),
    r_217_230 - s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 + s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 - s_217_230 <=s (const 64 (2**20)),
    u_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_217_230 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise b
assume
neg_g_177_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_14 neg_f_177_low60_40_low20_13;
mov u_217_231 u_217_230;
mov v_217_231 v_217_230;

add neg_g_177_low60_40_low20_14 neg_g_177_low60_40_low20_13 neg_f_177_low60_40_low20_13;
asr neg_g_177_low60_40_low20_14 neg_g_177_low60_40_low20_14 1;
add r_217_231 r_217_230 u_217_230;
asr r_217_231 r_217_231 1;
add s_217_231 s_217_230 v_217_230;
asr s_217_231 s_217_231 1;
assert
    true
&&
    neg_f_177_low60_40_low20_14 = neg_f_177_low60_40_low20_13,
    u_217_231 = u_217_230,
    v_217_231 = v_217_230,
    neg_g_177_low60_40_low20_14 * (const 64 2) = neg_g_177_low60_40_low20_13 + neg_f_177_low60_40_low20_13,
    r_217_231 * (const 64 2) = r_217_230 + u_217_230,
    s_217_231 * (const 64 2) = s_217_230 + v_217_230
;

assume
    neg_f_177_low60_40_low20_14 = neg_f_177_low60_40_low20_13,
    u_217_231 = u_217_230,
    v_217_231 = v_217_230,
    neg_g_177_low60_40_low20_14 * 2 = neg_g_177_low60_40_low20_13 + neg_f_177_low60_40_low20_13,
    r_217_231 * 2 = r_217_230 + u_217_230,
    s_217_231 * 2 = s_217_230 + v_217_230
&&
    true
;

{
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_14 + u_217_231 * (const 64 (2**21)) + v_217_231 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_14 + r_217_231 * (const 64 (2**21)) + s_217_231 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_14,
    neg_f_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_14,
    neg_g_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 231)) <=s delta, delta <=s (const 64 (1 + 2*231)),
    (const 64 (-(2**20))) <=s u_217_231, u_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_231, v_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_231, r_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_231, s_217_231 <=s (const 64 ((2**20))),
    u_217_231 + v_217_231 <=s (const 64 (2**20)),
    u_217_231 - v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 + v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 - v_217_231 <=s (const 64 (2**20)),
    r_217_231 + s_217_231 <=s (const 64 (2**20)),
    r_217_231 - s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 + s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 - s_217_231 <=s (const 64 (2**20)),
    u_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_217_231 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_230_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_13,
sint64 neg_g_177_low60_40_low20_13,
sint64 neg_f_177_low60_40_low20_14,
sint64 neg_g_177_low60_40_low20_14,
sint64 u_217_230,
sint64 v_217_230,
sint64 r_217_230,
sint64 s_217_230,
sint64 u_217_231,
sint64 v_217_231,
sint64 r_217_231,
sint64 s_217_231,
bit ne
)={
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (-(2**20)),
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (-(2**20))
&&
    u_217_230 * neg_f_177_low60_40_low20_0 + v_217_230 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_13 * (const 64 (-(2**20))),
    r_217_230 * neg_f_177_low60_40_low20_0 + s_217_230 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_13 + u_217_230 * (const 64 (2**21)) + v_217_230 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_13 + r_217_230 * (const 64 (2**21)) + s_217_230 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_13,
    neg_f_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_13,
    neg_g_177_low60_40_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 230)) <=s delta, delta <=s (const 64 (1 + 2*230)),
    (const 64 (-(2**20))) <=s u_217_230, u_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_230, v_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_230, r_217_230 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_230, s_217_230 <=s (const 64 ((2**20))),
    u_217_230 + v_217_230 <=s (const 64 (2**20)),
    u_217_230 - v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 + v_217_230 <=s (const 64 (2**20)),
    (const 64 0) - u_217_230 - v_217_230 <=s (const 64 (2**20)),
    r_217_230 + s_217_230 <=s (const 64 (2**20)),
    r_217_230 - s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 + s_217_230 <=s (const 64 (2**20)),
    (const 64 0) - r_217_230 - s_217_230 <=s (const 64 (2**20)),
    u_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_217_230 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_217_230 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step53

// premise c
assume
neg_g_177_low60_40_low20_13 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_14 neg_g_177_low60_40_low20_13;
mov u_217_231 r_217_230;
mov v_217_231 s_217_230;

subs dc neg_g_177_low60_40_low20_14 neg_g_177_low60_40_low20_13 neg_f_177_low60_40_low20_13;
asr neg_g_177_low60_40_low20_14 neg_g_177_low60_40_low20_14 1;
subs dc r_217_231 r_217_230 u_217_230;
asr r_217_231 r_217_231 1;
subs dc s_217_231 s_217_230 v_217_230;
asr s_217_231 s_217_231 1;
assert
    true
&&
    neg_f_177_low60_40_low20_14 = neg_g_177_low60_40_low20_13,
    u_217_231 = r_217_230,
    v_217_231 = s_217_230,
    neg_g_177_low60_40_low20_14 * (const 64 2) = neg_g_177_low60_40_low20_13 - neg_f_177_low60_40_low20_13,
    r_217_231 * (const 64 2) = r_217_230 - u_217_230,
    s_217_231 * (const 64 2) = s_217_230 - v_217_230
;

assume
    neg_f_177_low60_40_low20_14 = neg_g_177_low60_40_low20_13,
    u_217_231 = r_217_230,
    v_217_231 = s_217_230,
    neg_g_177_low60_40_low20_14 * 2 = neg_g_177_low60_40_low20_13 - neg_f_177_low60_40_low20_13,
    r_217_231 * 2 = r_217_230 - u_217_230,
    s_217_231 * 2 = s_217_230 - v_217_230
&&
    true
;

{
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_14 + u_217_231 * (const 64 (2**21)) + v_217_231 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_14 + r_217_231 * (const 64 (2**21)) + s_217_231 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_14,
    neg_f_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_14,
    neg_g_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 231)) <=s delta, delta <=s (const 64 (1 + 2*231)),
    (const 64 (-(2**20))) <=s u_217_231, u_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_231, v_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_231, r_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_231, s_217_231 <=s (const 64 ((2**20))),
    u_217_231 + v_217_231 <=s (const 64 (2**20)),
    u_217_231 - v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 + v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 - v_217_231 <=s (const 64 (2**20)),
    r_217_231 + s_217_231 <=s (const 64 (2**20)),
    r_217_231 - s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 + s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 - s_217_231 <=s (const 64 (2**20)),
    u_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_217_231 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_231_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_14,
sint64 neg_g_177_low60_40_low20_14,
sint64 neg_f_177_low60_40_low20_15,
sint64 neg_g_177_low60_40_low20_15,
sint64 u_217_231,
sint64 v_217_231,
sint64 r_217_231,
sint64 s_217_231,
sint64 u_217_232,
sint64 v_217_232,
sint64 r_217_232,
sint64 s_217_232,
bit ne
)={
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (-(2**20)),
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (-(2**20))
&&
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (const 64 (-(2**20))),
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_14 + u_217_231 * (const 64 (2**21)) + v_217_231 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_14 + r_217_231 * (const 64 (2**21)) + s_217_231 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_14,
    neg_f_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_14,
    neg_g_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 231)) <=s delta, delta <=s (const 64 (1 + 2*231)),
    (const 64 (-(2**20))) <=s u_217_231, u_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_231, v_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_231, r_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_231, s_217_231 <=s (const 64 ((2**20))),
    u_217_231 + v_217_231 <=s (const 64 (2**20)),
    u_217_231 - v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 + v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 - v_217_231 <=s (const 64 (2**20)),
    r_217_231 + s_217_231 <=s (const 64 (2**20)),
    r_217_231 - s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 + s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 - s_217_231 <=s (const 64 (2**20)),
    u_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_217_231 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise a
assume
neg_g_177_low60_40_low20_14 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_14 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_15 neg_f_177_low60_40_low20_14;
mov u_217_232 u_217_231;
mov v_217_232 v_217_231;

asr neg_g_177_low60_40_low20_15 neg_g_177_low60_40_low20_14 1;
asr r_217_232 r_217_231 1;
asr s_217_232 s_217_231 1;
assert
    true
&&
    neg_f_177_low60_40_low20_15 = neg_f_177_low60_40_low20_14,
    u_217_232 = u_217_231,
    v_217_232 = v_217_231,
    neg_g_177_low60_40_low20_15 * (const 64 2) = neg_g_177_low60_40_low20_14,
    r_217_232 * (const 64 2) = r_217_231,
    s_217_232 * (const 64 2) = s_217_231
;

assume
    neg_f_177_low60_40_low20_15 = neg_f_177_low60_40_low20_14,
    u_217_232 = u_217_231,
    v_217_232 = v_217_231,
    neg_g_177_low60_40_low20_15 * 2 = neg_g_177_low60_40_low20_14,
    r_217_232 * 2 = r_217_231,
    s_217_232 * 2 = s_217_231
&&
    true
;

{
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_15 + u_217_232 * (const 64 (2**21)) + v_217_232 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_15 + r_217_232 * (const 64 (2**21)) + s_217_232 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_15,
    neg_f_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_15,
    neg_g_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 232)) <=s delta, delta <=s (const 64 (1 + 2*232)),
    (const 64 (-(2**20))) <=s u_217_232, u_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_232, v_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_232, r_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_232, s_217_232 <=s (const 64 ((2**20))),
    u_217_232 + v_217_232 <=s (const 64 (2**20)),
    u_217_232 - v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 + v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 - v_217_232 <=s (const 64 (2**20)),
    r_217_232 + s_217_232 <=s (const 64 (2**20)),
    r_217_232 - s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 + s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 - s_217_232 <=s (const 64 (2**20)),
    u_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_217_232 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_231_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_14,
sint64 neg_g_177_low60_40_low20_14,
sint64 neg_f_177_low60_40_low20_15,
sint64 neg_g_177_low60_40_low20_15,
sint64 u_217_231,
sint64 v_217_231,
sint64 r_217_231,
sint64 s_217_231,
sint64 u_217_232,
sint64 v_217_232,
sint64 r_217_232,
sint64 s_217_232,
bit ne
)={
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (-(2**20)),
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (-(2**20))
&&
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (const 64 (-(2**20))),
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_14 + u_217_231 * (const 64 (2**21)) + v_217_231 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_14 + r_217_231 * (const 64 (2**21)) + s_217_231 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_14,
    neg_f_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_14,
    neg_g_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 231)) <=s delta, delta <=s (const 64 (1 + 2*231)),
    (const 64 (-(2**20))) <=s u_217_231, u_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_231, v_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_231, r_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_231, s_217_231 <=s (const 64 ((2**20))),
    u_217_231 + v_217_231 <=s (const 64 (2**20)),
    u_217_231 - v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 + v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 - v_217_231 <=s (const 64 (2**20)),
    r_217_231 + s_217_231 <=s (const 64 (2**20)),
    r_217_231 - s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 + s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 - s_217_231 <=s (const 64 (2**20)),
    u_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_217_231 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise b
assume
neg_g_177_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_15 neg_f_177_low60_40_low20_14;
mov u_217_232 u_217_231;
mov v_217_232 v_217_231;

add neg_g_177_low60_40_low20_15 neg_g_177_low60_40_low20_14 neg_f_177_low60_40_low20_14;
asr neg_g_177_low60_40_low20_15 neg_g_177_low60_40_low20_15 1;
add r_217_232 r_217_231 u_217_231;
asr r_217_232 r_217_232 1;
add s_217_232 s_217_231 v_217_231;
asr s_217_232 s_217_232 1;
assert
    true
&&
    neg_f_177_low60_40_low20_15 = neg_f_177_low60_40_low20_14,
    u_217_232 = u_217_231,
    v_217_232 = v_217_231,
    neg_g_177_low60_40_low20_15 * (const 64 2) = neg_g_177_low60_40_low20_14 + neg_f_177_low60_40_low20_14,
    r_217_232 * (const 64 2) = r_217_231 + u_217_231,
    s_217_232 * (const 64 2) = s_217_231 + v_217_231
;

assume
    neg_f_177_low60_40_low20_15 = neg_f_177_low60_40_low20_14,
    u_217_232 = u_217_231,
    v_217_232 = v_217_231,
    neg_g_177_low60_40_low20_15 * 2 = neg_g_177_low60_40_low20_14 + neg_f_177_low60_40_low20_14,
    r_217_232 * 2 = r_217_231 + u_217_231,
    s_217_232 * 2 = s_217_231 + v_217_231
&&
    true
;

{
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_15 + u_217_232 * (const 64 (2**21)) + v_217_232 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_15 + r_217_232 * (const 64 (2**21)) + s_217_232 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_15,
    neg_f_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_15,
    neg_g_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 232)) <=s delta, delta <=s (const 64 (1 + 2*232)),
    (const 64 (-(2**20))) <=s u_217_232, u_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_232, v_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_232, r_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_232, s_217_232 <=s (const 64 ((2**20))),
    u_217_232 + v_217_232 <=s (const 64 (2**20)),
    u_217_232 - v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 + v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 - v_217_232 <=s (const 64 (2**20)),
    r_217_232 + s_217_232 <=s (const 64 (2**20)),
    r_217_232 - s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 + s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 - s_217_232 <=s (const 64 (2**20)),
    u_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_217_232 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_231_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_14,
sint64 neg_g_177_low60_40_low20_14,
sint64 neg_f_177_low60_40_low20_15,
sint64 neg_g_177_low60_40_low20_15,
sint64 u_217_231,
sint64 v_217_231,
sint64 r_217_231,
sint64 s_217_231,
sint64 u_217_232,
sint64 v_217_232,
sint64 r_217_232,
sint64 s_217_232,
bit ne
)={
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (-(2**20)),
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (-(2**20))
&&
    u_217_231 * neg_f_177_low60_40_low20_0 + v_217_231 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_14 * (const 64 (-(2**20))),
    r_217_231 * neg_f_177_low60_40_low20_0 + s_217_231 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_14 + u_217_231 * (const 64 (2**21)) + v_217_231 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_14 + r_217_231 * (const 64 (2**21)) + s_217_231 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_14,
    neg_f_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_14,
    neg_g_177_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 231)) <=s delta, delta <=s (const 64 (1 + 2*231)),
    (const 64 (-(2**20))) <=s u_217_231, u_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_231, v_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_231, r_217_231 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_231, s_217_231 <=s (const 64 ((2**20))),
    u_217_231 + v_217_231 <=s (const 64 (2**20)),
    u_217_231 - v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 + v_217_231 <=s (const 64 (2**20)),
    (const 64 0) - u_217_231 - v_217_231 <=s (const 64 (2**20)),
    r_217_231 + s_217_231 <=s (const 64 (2**20)),
    r_217_231 - s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 + s_217_231 <=s (const 64 (2**20)),
    (const 64 0) - r_217_231 - s_217_231 <=s (const 64 (2**20)),
    u_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_217_231 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_217_231 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise c
assume
neg_g_177_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_15 neg_g_177_low60_40_low20_14;
mov u_217_232 r_217_231;
mov v_217_232 s_217_231;

subs dc neg_g_177_low60_40_low20_15 neg_g_177_low60_40_low20_14 neg_f_177_low60_40_low20_14;
asr neg_g_177_low60_40_low20_15 neg_g_177_low60_40_low20_15 1;
subs dc r_217_232 r_217_231 u_217_231;
asr r_217_232 r_217_232 1;
subs dc s_217_232 s_217_231 v_217_231;
asr s_217_232 s_217_232 1;
assert
    true
&&
    neg_f_177_low60_40_low20_15 = neg_g_177_low60_40_low20_14,
    u_217_232 = r_217_231,
    v_217_232 = s_217_231,
    neg_g_177_low60_40_low20_15 * (const 64 2) = neg_g_177_low60_40_low20_14 - neg_f_177_low60_40_low20_14,
    r_217_232 * (const 64 2) = r_217_231 - u_217_231,
    s_217_232 * (const 64 2) = s_217_231 - v_217_231
;

assume
    neg_f_177_low60_40_low20_15 = neg_g_177_low60_40_low20_14,
    u_217_232 = r_217_231,
    v_217_232 = s_217_231,
    neg_g_177_low60_40_low20_15 * 2 = neg_g_177_low60_40_low20_14 - neg_f_177_low60_40_low20_14,
    r_217_232 * 2 = r_217_231 - u_217_231,
    s_217_232 * 2 = s_217_231 - v_217_231
&&
    true
;

{
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_15 + u_217_232 * (const 64 (2**21)) + v_217_232 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_15 + r_217_232 * (const 64 (2**21)) + s_217_232 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_15,
    neg_f_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_15,
    neg_g_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 232)) <=s delta, delta <=s (const 64 (1 + 2*232)),
    (const 64 (-(2**20))) <=s u_217_232, u_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_232, v_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_232, r_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_232, s_217_232 <=s (const 64 ((2**20))),
    u_217_232 + v_217_232 <=s (const 64 (2**20)),
    u_217_232 - v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 + v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 - v_217_232 <=s (const 64 (2**20)),
    r_217_232 + s_217_232 <=s (const 64 (2**20)),
    r_217_232 - s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 + s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 - s_217_232 <=s (const 64 (2**20)),
    u_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_217_232 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_232_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_15,
sint64 neg_g_177_low60_40_low20_15,
sint64 neg_f_177_low60_40_low20_16,
sint64 neg_g_177_low60_40_low20_16,
sint64 u_217_232,
sint64 v_217_232,
sint64 r_217_232,
sint64 s_217_232,
sint64 u_217_233,
sint64 v_217_233,
sint64 r_217_233,
sint64 s_217_233,
bit ne
)={
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (-(2**20)),
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (-(2**20))
&&
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (const 64 (-(2**20))),
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_15 + u_217_232 * (const 64 (2**21)) + v_217_232 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_15 + r_217_232 * (const 64 (2**21)) + s_217_232 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_15,
    neg_f_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_15,
    neg_g_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 232)) <=s delta, delta <=s (const 64 (1 + 2*232)),
    (const 64 (-(2**20))) <=s u_217_232, u_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_232, v_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_232, r_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_232, s_217_232 <=s (const 64 ((2**20))),
    u_217_232 + v_217_232 <=s (const 64 (2**20)),
    u_217_232 - v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 + v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 - v_217_232 <=s (const 64 (2**20)),
    r_217_232 + s_217_232 <=s (const 64 (2**20)),
    r_217_232 - s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 + s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 - s_217_232 <=s (const 64 (2**20)),
    u_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_217_232 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise a
assume
neg_g_177_low60_40_low20_15 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_15 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_16 neg_f_177_low60_40_low20_15;
mov u_217_233 u_217_232;
mov v_217_233 v_217_232;

asr neg_g_177_low60_40_low20_16 neg_g_177_low60_40_low20_15 1;
asr r_217_233 r_217_232 1;
asr s_217_233 s_217_232 1;
assert
    true
&&
    neg_f_177_low60_40_low20_16 = neg_f_177_low60_40_low20_15,
    u_217_233 = u_217_232,
    v_217_233 = v_217_232,
    neg_g_177_low60_40_low20_16 * (const 64 2) = neg_g_177_low60_40_low20_15,
    r_217_233 * (const 64 2) = r_217_232,
    s_217_233 * (const 64 2) = s_217_232
;

assume
    neg_f_177_low60_40_low20_16 = neg_f_177_low60_40_low20_15,
    u_217_233 = u_217_232,
    v_217_233 = v_217_232,
    neg_g_177_low60_40_low20_16 * 2 = neg_g_177_low60_40_low20_15,
    r_217_233 * 2 = r_217_232,
    s_217_233 * 2 = s_217_232
&&
    true
;

{
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_16 + u_217_233 * (const 64 (2**21)) + v_217_233 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_16 + r_217_233 * (const 64 (2**21)) + s_217_233 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_16,
    neg_f_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_16,
    neg_g_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 233)) <=s delta, delta <=s (const 64 (1 + 2*233)),
    (const 64 (-(2**20))) <=s u_217_233, u_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_233, v_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_233, r_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_233, s_217_233 <=s (const 64 ((2**20))),
    u_217_233 + v_217_233 <=s (const 64 (2**20)),
    u_217_233 - v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 + v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 - v_217_233 <=s (const 64 (2**20)),
    r_217_233 + s_217_233 <=s (const 64 (2**20)),
    r_217_233 - s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 + s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 - s_217_233 <=s (const 64 (2**20)),
    u_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_217_233 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_232_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_15,
sint64 neg_g_177_low60_40_low20_15,
sint64 neg_f_177_low60_40_low20_16,
sint64 neg_g_177_low60_40_low20_16,
sint64 u_217_232,
sint64 v_217_232,
sint64 r_217_232,
sint64 s_217_232,
sint64 u_217_233,
sint64 v_217_233,
sint64 r_217_233,
sint64 s_217_233,
bit ne
)={
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (-(2**20)),
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (-(2**20))
&&
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (const 64 (-(2**20))),
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_15 + u_217_232 * (const 64 (2**21)) + v_217_232 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_15 + r_217_232 * (const 64 (2**21)) + s_217_232 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_15,
    neg_f_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_15,
    neg_g_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 232)) <=s delta, delta <=s (const 64 (1 + 2*232)),
    (const 64 (-(2**20))) <=s u_217_232, u_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_232, v_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_232, r_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_232, s_217_232 <=s (const 64 ((2**20))),
    u_217_232 + v_217_232 <=s (const 64 (2**20)),
    u_217_232 - v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 + v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 - v_217_232 <=s (const 64 (2**20)),
    r_217_232 + s_217_232 <=s (const 64 (2**20)),
    r_217_232 - s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 + s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 - s_217_232 <=s (const 64 (2**20)),
    u_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_217_232 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise b
assume
neg_g_177_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_16 neg_f_177_low60_40_low20_15;
mov u_217_233 u_217_232;
mov v_217_233 v_217_232;

add neg_g_177_low60_40_low20_16 neg_g_177_low60_40_low20_15 neg_f_177_low60_40_low20_15;
asr neg_g_177_low60_40_low20_16 neg_g_177_low60_40_low20_16 1;
add r_217_233 r_217_232 u_217_232;
asr r_217_233 r_217_233 1;
add s_217_233 s_217_232 v_217_232;
asr s_217_233 s_217_233 1;
assert
    true
&&
    neg_f_177_low60_40_low20_16 = neg_f_177_low60_40_low20_15,
    u_217_233 = u_217_232,
    v_217_233 = v_217_232,
    neg_g_177_low60_40_low20_16 * (const 64 2) = neg_g_177_low60_40_low20_15 + neg_f_177_low60_40_low20_15,
    r_217_233 * (const 64 2) = r_217_232 + u_217_232,
    s_217_233 * (const 64 2) = s_217_232 + v_217_232
;

assume
    neg_f_177_low60_40_low20_16 = neg_f_177_low60_40_low20_15,
    u_217_233 = u_217_232,
    v_217_233 = v_217_232,
    neg_g_177_low60_40_low20_16 * 2 = neg_g_177_low60_40_low20_15 + neg_f_177_low60_40_low20_15,
    r_217_233 * 2 = r_217_232 + u_217_232,
    s_217_233 * 2 = s_217_232 + v_217_232
&&
    true
;

{
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_16 + u_217_233 * (const 64 (2**21)) + v_217_233 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_16 + r_217_233 * (const 64 (2**21)) + s_217_233 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_16,
    neg_f_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_16,
    neg_g_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 233)) <=s delta, delta <=s (const 64 (1 + 2*233)),
    (const 64 (-(2**20))) <=s u_217_233, u_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_233, v_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_233, r_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_233, s_217_233 <=s (const 64 ((2**20))),
    u_217_233 + v_217_233 <=s (const 64 (2**20)),
    u_217_233 - v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 + v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 - v_217_233 <=s (const 64 (2**20)),
    r_217_233 + s_217_233 <=s (const 64 (2**20)),
    r_217_233 - s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 + s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 - s_217_233 <=s (const 64 (2**20)),
    u_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_217_233 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_232_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_15,
sint64 neg_g_177_low60_40_low20_15,
sint64 neg_f_177_low60_40_low20_16,
sint64 neg_g_177_low60_40_low20_16,
sint64 u_217_232,
sint64 v_217_232,
sint64 r_217_232,
sint64 s_217_232,
sint64 u_217_233,
sint64 v_217_233,
sint64 r_217_233,
sint64 s_217_233,
bit ne
)={
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (-(2**20)),
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (-(2**20))
&&
    u_217_232 * neg_f_177_low60_40_low20_0 + v_217_232 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_15 * (const 64 (-(2**20))),
    r_217_232 * neg_f_177_low60_40_low20_0 + s_217_232 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_15 + u_217_232 * (const 64 (2**21)) + v_217_232 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_15 + r_217_232 * (const 64 (2**21)) + s_217_232 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_15,
    neg_f_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_15,
    neg_g_177_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 232)) <=s delta, delta <=s (const 64 (1 + 2*232)),
    (const 64 (-(2**20))) <=s u_217_232, u_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_232, v_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_232, r_217_232 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_232, s_217_232 <=s (const 64 ((2**20))),
    u_217_232 + v_217_232 <=s (const 64 (2**20)),
    u_217_232 - v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 + v_217_232 <=s (const 64 (2**20)),
    (const 64 0) - u_217_232 - v_217_232 <=s (const 64 (2**20)),
    r_217_232 + s_217_232 <=s (const 64 (2**20)),
    r_217_232 - s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 + s_217_232 <=s (const 64 (2**20)),
    (const 64 0) - r_217_232 - s_217_232 <=s (const 64 (2**20)),
    u_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_217_232 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_217_232 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step55

// premise c
assume
neg_g_177_low60_40_low20_15 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_16 neg_g_177_low60_40_low20_15;
mov u_217_233 r_217_232;
mov v_217_233 s_217_232;

subs dc neg_g_177_low60_40_low20_16 neg_g_177_low60_40_low20_15 neg_f_177_low60_40_low20_15;
asr neg_g_177_low60_40_low20_16 neg_g_177_low60_40_low20_16 1;
subs dc r_217_233 r_217_232 u_217_232;
asr r_217_233 r_217_233 1;
subs dc s_217_233 s_217_232 v_217_232;
asr s_217_233 s_217_233 1;
assert
    true
&&
    neg_f_177_low60_40_low20_16 = neg_g_177_low60_40_low20_15,
    u_217_233 = r_217_232,
    v_217_233 = s_217_232,
    neg_g_177_low60_40_low20_16 * (const 64 2) = neg_g_177_low60_40_low20_15 - neg_f_177_low60_40_low20_15,
    r_217_233 * (const 64 2) = r_217_232 - u_217_232,
    s_217_233 * (const 64 2) = s_217_232 - v_217_232
;

assume
    neg_f_177_low60_40_low20_16 = neg_g_177_low60_40_low20_15,
    u_217_233 = r_217_232,
    v_217_233 = s_217_232,
    neg_g_177_low60_40_low20_16 * 2 = neg_g_177_low60_40_low20_15 - neg_f_177_low60_40_low20_15,
    r_217_233 * 2 = r_217_232 - u_217_232,
    s_217_233 * 2 = s_217_232 - v_217_232
&&
    true
;

{
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_16 + u_217_233 * (const 64 (2**21)) + v_217_233 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_16 + r_217_233 * (const 64 (2**21)) + s_217_233 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_16,
    neg_f_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_16,
    neg_g_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 233)) <=s delta, delta <=s (const 64 (1 + 2*233)),
    (const 64 (-(2**20))) <=s u_217_233, u_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_233, v_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_233, r_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_233, s_217_233 <=s (const 64 ((2**20))),
    u_217_233 + v_217_233 <=s (const 64 (2**20)),
    u_217_233 - v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 + v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 - v_217_233 <=s (const 64 (2**20)),
    r_217_233 + s_217_233 <=s (const 64 (2**20)),
    r_217_233 - s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 + s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 - s_217_233 <=s (const 64 (2**20)),
    u_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_217_233 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_233_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_16,
sint64 neg_g_177_low60_40_low20_16,
sint64 neg_f_177_low60_40_low20_17,
sint64 neg_g_177_low60_40_low20_17,
sint64 u_217_233,
sint64 v_217_233,
sint64 r_217_233,
sint64 s_217_233,
sint64 u_217_234,
sint64 v_217_234,
sint64 r_217_234,
sint64 s_217_234,
bit ne
)={
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (-(2**20)),
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (-(2**20))
&&
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (const 64 (-(2**20))),
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_16 + u_217_233 * (const 64 (2**21)) + v_217_233 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_16 + r_217_233 * (const 64 (2**21)) + s_217_233 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_16,
    neg_f_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_16,
    neg_g_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 233)) <=s delta, delta <=s (const 64 (1 + 2*233)),
    (const 64 (-(2**20))) <=s u_217_233, u_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_233, v_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_233, r_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_233, s_217_233 <=s (const 64 ((2**20))),
    u_217_233 + v_217_233 <=s (const 64 (2**20)),
    u_217_233 - v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 + v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 - v_217_233 <=s (const 64 (2**20)),
    r_217_233 + s_217_233 <=s (const 64 (2**20)),
    r_217_233 - s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 + s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 - s_217_233 <=s (const 64 (2**20)),
    u_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_217_233 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise a
assume
neg_g_177_low60_40_low20_16 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_16 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_17 neg_f_177_low60_40_low20_16;
mov u_217_234 u_217_233;
mov v_217_234 v_217_233;

asr neg_g_177_low60_40_low20_17 neg_g_177_low60_40_low20_16 1;
asr r_217_234 r_217_233 1;
asr s_217_234 s_217_233 1;
assert
    true
&&
    neg_f_177_low60_40_low20_17 = neg_f_177_low60_40_low20_16,
    u_217_234 = u_217_233,
    v_217_234 = v_217_233,
    neg_g_177_low60_40_low20_17 * (const 64 2) = neg_g_177_low60_40_low20_16,
    r_217_234 * (const 64 2) = r_217_233,
    s_217_234 * (const 64 2) = s_217_233
;

assume
    neg_f_177_low60_40_low20_17 = neg_f_177_low60_40_low20_16,
    u_217_234 = u_217_233,
    v_217_234 = v_217_233,
    neg_g_177_low60_40_low20_17 * 2 = neg_g_177_low60_40_low20_16,
    r_217_234 * 2 = r_217_233,
    s_217_234 * 2 = s_217_233
&&
    true
;

{
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_17 + u_217_234 * (const 64 (2**21)) + v_217_234 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_17 + r_217_234 * (const 64 (2**21)) + s_217_234 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_17,
    neg_f_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_17,
    neg_g_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 234)) <=s delta, delta <=s (const 64 (1 + 2*234)),
    (const 64 (-(2**20))) <=s u_217_234, u_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_234, v_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_234, r_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_234, s_217_234 <=s (const 64 ((2**20))),
    u_217_234 + v_217_234 <=s (const 64 (2**20)),
    u_217_234 - v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 + v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 - v_217_234 <=s (const 64 (2**20)),
    r_217_234 + s_217_234 <=s (const 64 (2**20)),
    r_217_234 - s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 + s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 - s_217_234 <=s (const 64 (2**20)),
    u_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_217_234 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_233_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_16,
sint64 neg_g_177_low60_40_low20_16,
sint64 neg_f_177_low60_40_low20_17,
sint64 neg_g_177_low60_40_low20_17,
sint64 u_217_233,
sint64 v_217_233,
sint64 r_217_233,
sint64 s_217_233,
sint64 u_217_234,
sint64 v_217_234,
sint64 r_217_234,
sint64 s_217_234,
bit ne
)={
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (-(2**20)),
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (-(2**20))
&&
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (const 64 (-(2**20))),
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_16 + u_217_233 * (const 64 (2**21)) + v_217_233 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_16 + r_217_233 * (const 64 (2**21)) + s_217_233 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_16,
    neg_f_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_16,
    neg_g_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 233)) <=s delta, delta <=s (const 64 (1 + 2*233)),
    (const 64 (-(2**20))) <=s u_217_233, u_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_233, v_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_233, r_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_233, s_217_233 <=s (const 64 ((2**20))),
    u_217_233 + v_217_233 <=s (const 64 (2**20)),
    u_217_233 - v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 + v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 - v_217_233 <=s (const 64 (2**20)),
    r_217_233 + s_217_233 <=s (const 64 (2**20)),
    r_217_233 - s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 + s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 - s_217_233 <=s (const 64 (2**20)),
    u_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_217_233 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise b
assume
neg_g_177_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_17 neg_f_177_low60_40_low20_16;
mov u_217_234 u_217_233;
mov v_217_234 v_217_233;

add neg_g_177_low60_40_low20_17 neg_g_177_low60_40_low20_16 neg_f_177_low60_40_low20_16;
asr neg_g_177_low60_40_low20_17 neg_g_177_low60_40_low20_17 1;
add r_217_234 r_217_233 u_217_233;
asr r_217_234 r_217_234 1;
add s_217_234 s_217_233 v_217_233;
asr s_217_234 s_217_234 1;
assert
    true
&&
    neg_f_177_low60_40_low20_17 = neg_f_177_low60_40_low20_16,
    u_217_234 = u_217_233,
    v_217_234 = v_217_233,
    neg_g_177_low60_40_low20_17 * (const 64 2) = neg_g_177_low60_40_low20_16 + neg_f_177_low60_40_low20_16,
    r_217_234 * (const 64 2) = r_217_233 + u_217_233,
    s_217_234 * (const 64 2) = s_217_233 + v_217_233
;

assume
    neg_f_177_low60_40_low20_17 = neg_f_177_low60_40_low20_16,
    u_217_234 = u_217_233,
    v_217_234 = v_217_233,
    neg_g_177_low60_40_low20_17 * 2 = neg_g_177_low60_40_low20_16 + neg_f_177_low60_40_low20_16,
    r_217_234 * 2 = r_217_233 + u_217_233,
    s_217_234 * 2 = s_217_233 + v_217_233
&&
    true
;

{
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_17 + u_217_234 * (const 64 (2**21)) + v_217_234 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_17 + r_217_234 * (const 64 (2**21)) + s_217_234 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_17,
    neg_f_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_17,
    neg_g_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 234)) <=s delta, delta <=s (const 64 (1 + 2*234)),
    (const 64 (-(2**20))) <=s u_217_234, u_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_234, v_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_234, r_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_234, s_217_234 <=s (const 64 ((2**20))),
    u_217_234 + v_217_234 <=s (const 64 (2**20)),
    u_217_234 - v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 + v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 - v_217_234 <=s (const 64 (2**20)),
    r_217_234 + s_217_234 <=s (const 64 (2**20)),
    r_217_234 - s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 + s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 - s_217_234 <=s (const 64 (2**20)),
    u_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_217_234 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_233_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_16,
sint64 neg_g_177_low60_40_low20_16,
sint64 neg_f_177_low60_40_low20_17,
sint64 neg_g_177_low60_40_low20_17,
sint64 u_217_233,
sint64 v_217_233,
sint64 r_217_233,
sint64 s_217_233,
sint64 u_217_234,
sint64 v_217_234,
sint64 r_217_234,
sint64 s_217_234,
bit ne
)={
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (-(2**20)),
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (-(2**20))
&&
    u_217_233 * neg_f_177_low60_40_low20_0 + v_217_233 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_16 * (const 64 (-(2**20))),
    r_217_233 * neg_f_177_low60_40_low20_0 + s_217_233 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_16 + u_217_233 * (const 64 (2**21)) + v_217_233 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_16 + r_217_233 * (const 64 (2**21)) + s_217_233 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_16,
    neg_f_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_16,
    neg_g_177_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 233)) <=s delta, delta <=s (const 64 (1 + 2*233)),
    (const 64 (-(2**20))) <=s u_217_233, u_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_233, v_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_233, r_217_233 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_233, s_217_233 <=s (const 64 ((2**20))),
    u_217_233 + v_217_233 <=s (const 64 (2**20)),
    u_217_233 - v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 + v_217_233 <=s (const 64 (2**20)),
    (const 64 0) - u_217_233 - v_217_233 <=s (const 64 (2**20)),
    r_217_233 + s_217_233 <=s (const 64 (2**20)),
    r_217_233 - s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 + s_217_233 <=s (const 64 (2**20)),
    (const 64 0) - r_217_233 - s_217_233 <=s (const 64 (2**20)),
    u_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_217_233 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_217_233 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step56

// premise c
assume
neg_g_177_low60_40_low20_16 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_17 neg_g_177_low60_40_low20_16;
mov u_217_234 r_217_233;
mov v_217_234 s_217_233;

subs dc neg_g_177_low60_40_low20_17 neg_g_177_low60_40_low20_16 neg_f_177_low60_40_low20_16;
asr neg_g_177_low60_40_low20_17 neg_g_177_low60_40_low20_17 1;
subs dc r_217_234 r_217_233 u_217_233;
asr r_217_234 r_217_234 1;
subs dc s_217_234 s_217_233 v_217_233;
asr s_217_234 s_217_234 1;
assert
    true
&&
    neg_f_177_low60_40_low20_17 = neg_g_177_low60_40_low20_16,
    u_217_234 = r_217_233,
    v_217_234 = s_217_233,
    neg_g_177_low60_40_low20_17 * (const 64 2) = neg_g_177_low60_40_low20_16 - neg_f_177_low60_40_low20_16,
    r_217_234 * (const 64 2) = r_217_233 - u_217_233,
    s_217_234 * (const 64 2) = s_217_233 - v_217_233
;

assume
    neg_f_177_low60_40_low20_17 = neg_g_177_low60_40_low20_16,
    u_217_234 = r_217_233,
    v_217_234 = s_217_233,
    neg_g_177_low60_40_low20_17 * 2 = neg_g_177_low60_40_low20_16 - neg_f_177_low60_40_low20_16,
    r_217_234 * 2 = r_217_233 - u_217_233,
    s_217_234 * 2 = s_217_233 - v_217_233
&&
    true
;

{
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_17 + u_217_234 * (const 64 (2**21)) + v_217_234 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_17 + r_217_234 * (const 64 (2**21)) + s_217_234 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_17,
    neg_f_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_17,
    neg_g_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 234)) <=s delta, delta <=s (const 64 (1 + 2*234)),
    (const 64 (-(2**20))) <=s u_217_234, u_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_234, v_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_234, r_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_234, s_217_234 <=s (const 64 ((2**20))),
    u_217_234 + v_217_234 <=s (const 64 (2**20)),
    u_217_234 - v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 + v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 - v_217_234 <=s (const 64 (2**20)),
    r_217_234 + s_217_234 <=s (const 64 (2**20)),
    r_217_234 - s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 + s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 - s_217_234 <=s (const 64 (2**20)),
    u_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_217_234 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_234_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_17,
sint64 neg_g_177_low60_40_low20_17,
sint64 neg_f_177_low60_40_low20_18,
sint64 neg_g_177_low60_40_low20_18,
sint64 u_217_234,
sint64 v_217_234,
sint64 r_217_234,
sint64 s_217_234,
sint64 u_217_235,
sint64 v_217_235,
sint64 r_217_235,
sint64 s_217_235,
bit ne
)={
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (-(2**20)),
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (-(2**20))
&&
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (const 64 (-(2**20))),
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_17 + u_217_234 * (const 64 (2**21)) + v_217_234 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_17 + r_217_234 * (const 64 (2**21)) + s_217_234 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_17,
    neg_f_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_17,
    neg_g_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 234)) <=s delta, delta <=s (const 64 (1 + 2*234)),
    (const 64 (-(2**20))) <=s u_217_234, u_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_234, v_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_234, r_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_234, s_217_234 <=s (const 64 ((2**20))),
    u_217_234 + v_217_234 <=s (const 64 (2**20)),
    u_217_234 - v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 + v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 - v_217_234 <=s (const 64 (2**20)),
    r_217_234 + s_217_234 <=s (const 64 (2**20)),
    r_217_234 - s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 + s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 - s_217_234 <=s (const 64 (2**20)),
    u_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_217_234 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise a
assume
neg_g_177_low60_40_low20_17 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_17 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_18 neg_f_177_low60_40_low20_17;
mov u_217_235 u_217_234;
mov v_217_235 v_217_234;

asr neg_g_177_low60_40_low20_18 neg_g_177_low60_40_low20_17 1;
asr r_217_235 r_217_234 1;
asr s_217_235 s_217_234 1;
assert
    true
&&
    neg_f_177_low60_40_low20_18 = neg_f_177_low60_40_low20_17,
    u_217_235 = u_217_234,
    v_217_235 = v_217_234,
    neg_g_177_low60_40_low20_18 * (const 64 2) = neg_g_177_low60_40_low20_17,
    r_217_235 * (const 64 2) = r_217_234,
    s_217_235 * (const 64 2) = s_217_234
;

assume
    neg_f_177_low60_40_low20_18 = neg_f_177_low60_40_low20_17,
    u_217_235 = u_217_234,
    v_217_235 = v_217_234,
    neg_g_177_low60_40_low20_18 * 2 = neg_g_177_low60_40_low20_17,
    r_217_235 * 2 = r_217_234,
    s_217_235 * 2 = s_217_234
&&
    true
;

{
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_18 + u_217_235 * (const 64 (2**21)) + v_217_235 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_18 + r_217_235 * (const 64 (2**21)) + s_217_235 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_18,
    neg_f_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_18,
    neg_g_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 235)) <=s delta, delta <=s (const 64 (1 + 2*235)),
    (const 64 (-(2**20))) <=s u_217_235, u_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_235, v_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_235, r_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_235, s_217_235 <=s (const 64 ((2**20))),
    u_217_235 + v_217_235 <=s (const 64 (2**20)),
    u_217_235 - v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 + v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 - v_217_235 <=s (const 64 (2**20)),
    r_217_235 + s_217_235 <=s (const 64 (2**20)),
    r_217_235 - s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 + s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 - s_217_235 <=s (const 64 (2**20)),
    u_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_217_235 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_234_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_17,
sint64 neg_g_177_low60_40_low20_17,
sint64 neg_f_177_low60_40_low20_18,
sint64 neg_g_177_low60_40_low20_18,
sint64 u_217_234,
sint64 v_217_234,
sint64 r_217_234,
sint64 s_217_234,
sint64 u_217_235,
sint64 v_217_235,
sint64 r_217_235,
sint64 s_217_235,
bit ne
)={
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (-(2**20)),
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (-(2**20))
&&
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (const 64 (-(2**20))),
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_17 + u_217_234 * (const 64 (2**21)) + v_217_234 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_17 + r_217_234 * (const 64 (2**21)) + s_217_234 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_17,
    neg_f_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_17,
    neg_g_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 234)) <=s delta, delta <=s (const 64 (1 + 2*234)),
    (const 64 (-(2**20))) <=s u_217_234, u_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_234, v_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_234, r_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_234, s_217_234 <=s (const 64 ((2**20))),
    u_217_234 + v_217_234 <=s (const 64 (2**20)),
    u_217_234 - v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 + v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 - v_217_234 <=s (const 64 (2**20)),
    r_217_234 + s_217_234 <=s (const 64 (2**20)),
    r_217_234 - s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 + s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 - s_217_234 <=s (const 64 (2**20)),
    u_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_217_234 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise b
assume
neg_g_177_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_18 neg_f_177_low60_40_low20_17;
mov u_217_235 u_217_234;
mov v_217_235 v_217_234;

add neg_g_177_low60_40_low20_18 neg_g_177_low60_40_low20_17 neg_f_177_low60_40_low20_17;
asr neg_g_177_low60_40_low20_18 neg_g_177_low60_40_low20_18 1;
add r_217_235 r_217_234 u_217_234;
asr r_217_235 r_217_235 1;
add s_217_235 s_217_234 v_217_234;
asr s_217_235 s_217_235 1;
assert
    true
&&
    neg_f_177_low60_40_low20_18 = neg_f_177_low60_40_low20_17,
    u_217_235 = u_217_234,
    v_217_235 = v_217_234,
    neg_g_177_low60_40_low20_18 * (const 64 2) = neg_g_177_low60_40_low20_17 + neg_f_177_low60_40_low20_17,
    r_217_235 * (const 64 2) = r_217_234 + u_217_234,
    s_217_235 * (const 64 2) = s_217_234 + v_217_234
;

assume
    neg_f_177_low60_40_low20_18 = neg_f_177_low60_40_low20_17,
    u_217_235 = u_217_234,
    v_217_235 = v_217_234,
    neg_g_177_low60_40_low20_18 * 2 = neg_g_177_low60_40_low20_17 + neg_f_177_low60_40_low20_17,
    r_217_235 * 2 = r_217_234 + u_217_234,
    s_217_235 * 2 = s_217_234 + v_217_234
&&
    true
;

{
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_18 + u_217_235 * (const 64 (2**21)) + v_217_235 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_18 + r_217_235 * (const 64 (2**21)) + s_217_235 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_18,
    neg_f_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_18,
    neg_g_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 235)) <=s delta, delta <=s (const 64 (1 + 2*235)),
    (const 64 (-(2**20))) <=s u_217_235, u_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_235, v_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_235, r_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_235, s_217_235 <=s (const 64 ((2**20))),
    u_217_235 + v_217_235 <=s (const 64 (2**20)),
    u_217_235 - v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 + v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 - v_217_235 <=s (const 64 (2**20)),
    r_217_235 + s_217_235 <=s (const 64 (2**20)),
    r_217_235 - s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 + s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 - s_217_235 <=s (const 64 (2**20)),
    u_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_217_235 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_234_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_17,
sint64 neg_g_177_low60_40_low20_17,
sint64 neg_f_177_low60_40_low20_18,
sint64 neg_g_177_low60_40_low20_18,
sint64 u_217_234,
sint64 v_217_234,
sint64 r_217_234,
sint64 s_217_234,
sint64 u_217_235,
sint64 v_217_235,
sint64 r_217_235,
sint64 s_217_235,
bit ne
)={
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (-(2**20)),
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (-(2**20))
&&
    u_217_234 * neg_f_177_low60_40_low20_0 + v_217_234 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_17 * (const 64 (-(2**20))),
    r_217_234 * neg_f_177_low60_40_low20_0 + s_217_234 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_17 + u_217_234 * (const 64 (2**21)) + v_217_234 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_17 + r_217_234 * (const 64 (2**21)) + s_217_234 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_17,
    neg_f_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_17,
    neg_g_177_low60_40_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 234)) <=s delta, delta <=s (const 64 (1 + 2*234)),
    (const 64 (-(2**20))) <=s u_217_234, u_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_234, v_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_234, r_217_234 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_234, s_217_234 <=s (const 64 ((2**20))),
    u_217_234 + v_217_234 <=s (const 64 (2**20)),
    u_217_234 - v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 + v_217_234 <=s (const 64 (2**20)),
    (const 64 0) - u_217_234 - v_217_234 <=s (const 64 (2**20)),
    r_217_234 + s_217_234 <=s (const 64 (2**20)),
    r_217_234 - s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 + s_217_234 <=s (const 64 (2**20)),
    (const 64 0) - r_217_234 - s_217_234 <=s (const 64 (2**20)),
    u_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_217_234 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_217_234 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step57

// premise c
assume
neg_g_177_low60_40_low20_17 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_18 neg_g_177_low60_40_low20_17;
mov u_217_235 r_217_234;
mov v_217_235 s_217_234;

subs dc neg_g_177_low60_40_low20_18 neg_g_177_low60_40_low20_17 neg_f_177_low60_40_low20_17;
asr neg_g_177_low60_40_low20_18 neg_g_177_low60_40_low20_18 1;
subs dc r_217_235 r_217_234 u_217_234;
asr r_217_235 r_217_235 1;
subs dc s_217_235 s_217_234 v_217_234;
asr s_217_235 s_217_235 1;
assert
    true
&&
    neg_f_177_low60_40_low20_18 = neg_g_177_low60_40_low20_17,
    u_217_235 = r_217_234,
    v_217_235 = s_217_234,
    neg_g_177_low60_40_low20_18 * (const 64 2) = neg_g_177_low60_40_low20_17 - neg_f_177_low60_40_low20_17,
    r_217_235 * (const 64 2) = r_217_234 - u_217_234,
    s_217_235 * (const 64 2) = s_217_234 - v_217_234
;

assume
    neg_f_177_low60_40_low20_18 = neg_g_177_low60_40_low20_17,
    u_217_235 = r_217_234,
    v_217_235 = s_217_234,
    neg_g_177_low60_40_low20_18 * 2 = neg_g_177_low60_40_low20_17 - neg_f_177_low60_40_low20_17,
    r_217_235 * 2 = r_217_234 - u_217_234,
    s_217_235 * 2 = s_217_234 - v_217_234
&&
    true
;

{
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_18 + u_217_235 * (const 64 (2**21)) + v_217_235 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_18 + r_217_235 * (const 64 (2**21)) + s_217_235 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_18,
    neg_f_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_18,
    neg_g_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 235)) <=s delta, delta <=s (const 64 (1 + 2*235)),
    (const 64 (-(2**20))) <=s u_217_235, u_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_235, v_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_235, r_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_235, s_217_235 <=s (const 64 ((2**20))),
    u_217_235 + v_217_235 <=s (const 64 (2**20)),
    u_217_235 - v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 + v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 - v_217_235 <=s (const 64 (2**20)),
    r_217_235 + s_217_235 <=s (const 64 (2**20)),
    r_217_235 - s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 + s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 - s_217_235 <=s (const 64 (2**20)),
    u_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_217_235 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_235_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_18,
sint64 neg_g_177_low60_40_low20_18,
sint64 neg_f_177_low60_40_low20_19,
sint64 neg_g_177_low60_40_low20_19,
sint64 u_217_235,
sint64 v_217_235,
sint64 r_217_235,
sint64 s_217_235,
sint64 u_217_236,
sint64 v_217_236,
sint64 r_217_236,
sint64 s_217_236,
bit ne
)={
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (-(2**20)),
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (-(2**20))
&&
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (const 64 (-(2**20))),
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_18 + u_217_235 * (const 64 (2**21)) + v_217_235 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_18 + r_217_235 * (const 64 (2**21)) + s_217_235 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_18,
    neg_f_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_18,
    neg_g_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 235)) <=s delta, delta <=s (const 64 (1 + 2*235)),
    (const 64 (-(2**20))) <=s u_217_235, u_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_235, v_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_235, r_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_235, s_217_235 <=s (const 64 ((2**20))),
    u_217_235 + v_217_235 <=s (const 64 (2**20)),
    u_217_235 - v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 + v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 - v_217_235 <=s (const 64 (2**20)),
    r_217_235 + s_217_235 <=s (const 64 (2**20)),
    r_217_235 - s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 + s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 - s_217_235 <=s (const 64 (2**20)),
    u_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_217_235 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise a
assume
neg_g_177_low60_40_low20_18 = 0 (mod 2)
&&
neg_g_177_low60_40_low20_18 = const 64 0 (mod (const 64 2))
;


mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
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

mov neg_f_177_low60_40_low20_19 neg_f_177_low60_40_low20_18;
mov u_217_236 u_217_235;
mov v_217_236 v_217_235;

asr neg_g_177_low60_40_low20_19 neg_g_177_low60_40_low20_18 1;
asr r_217_236 r_217_235 1;
asr s_217_236 s_217_235 1;
assert
    true
&&
    neg_f_177_low60_40_low20_19 = neg_f_177_low60_40_low20_18,
    u_217_236 = u_217_235,
    v_217_236 = v_217_235,
    neg_g_177_low60_40_low20_19 * (const 64 2) = neg_g_177_low60_40_low20_18,
    r_217_236 * (const 64 2) = r_217_235,
    s_217_236 * (const 64 2) = s_217_235
;

assume
    neg_f_177_low60_40_low20_19 = neg_f_177_low60_40_low20_18,
    u_217_236 = u_217_235,
    v_217_236 = v_217_235,
    neg_g_177_low60_40_low20_19 * 2 = neg_g_177_low60_40_low20_18,
    r_217_236 * 2 = r_217_235,
    s_217_236 * 2 = s_217_235
&&
    true
;

{
    u_217_236 * neg_f_177_low60_40_low20_0 + v_217_236 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_236 * neg_f_177_low60_40_low20_0 + s_217_236 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_19 + u_217_236 * (const 64 (2**21)) + v_217_236 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_19 + r_217_236 * (const 64 (2**21)) + s_217_236 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_19,
    neg_f_177_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_19,
    neg_g_177_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 236)) <=s delta, delta <=s (const 64 (1 + 2*236)),
    (const 64 (-(2**20))) <=s u_217_236, u_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_236, v_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_236, r_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_236, s_217_236 <=s (const 64 ((2**20))),
    u_217_236 + v_217_236 <=s (const 64 (2**20)),
    u_217_236 - v_217_236 <=s (const 64 (2**20)),
    (const 64 0) - u_217_236 + v_217_236 <=s (const 64 (2**20)),
    (const 64 0) - u_217_236 - v_217_236 <=s (const 64 (2**20)),
    r_217_236 + s_217_236 <=s (const 64 (2**20)),
    r_217_236 - s_217_236 <=s (const 64 (2**20)),
    (const 64 0) - r_217_236 + s_217_236 <=s (const 64 (2**20)),
    (const 64 0) - r_217_236 - s_217_236 <=s (const 64 (2**20)),
    u_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_217_236 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_235_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_18,
sint64 neg_g_177_low60_40_low20_18,
sint64 neg_f_177_low60_40_low20_19,
sint64 neg_g_177_low60_40_low20_19,
sint64 u_217_235,
sint64 v_217_235,
sint64 r_217_235,
sint64 s_217_235,
sint64 u_217_236,
sint64 v_217_236,
sint64 r_217_236,
sint64 s_217_236,
bit ne
)={
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (-(2**20)),
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (-(2**20))
&&
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (const 64 (-(2**20))),
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_18 + u_217_235 * (const 64 (2**21)) + v_217_235 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_18 + r_217_235 * (const 64 (2**21)) + s_217_235 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_18,
    neg_f_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_18,
    neg_g_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 235)) <=s delta, delta <=s (const 64 (1 + 2*235)),
    (const 64 (-(2**20))) <=s u_217_235, u_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_235, v_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_235, r_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_235, s_217_235 <=s (const 64 ((2**20))),
    u_217_235 + v_217_235 <=s (const 64 (2**20)),
    u_217_235 - v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 + v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 - v_217_235 <=s (const 64 (2**20)),
    r_217_235 + s_217_235 <=s (const 64 (2**20)),
    r_217_235 - s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 + s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 - s_217_235 <=s (const 64 (2**20)),
    u_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_217_235 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise b
assume
neg_g_177_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_19 neg_f_177_low60_40_low20_18;
mov u_217_236 u_217_235;
mov v_217_236 v_217_235;

add neg_g_177_low60_40_low20_19 neg_g_177_low60_40_low20_18 neg_f_177_low60_40_low20_18;
asr neg_g_177_low60_40_low20_19 neg_g_177_low60_40_low20_19 1;
add r_217_236 r_217_235 u_217_235;
asr r_217_236 r_217_236 1;
add s_217_236 s_217_235 v_217_235;
asr s_217_236 s_217_236 1;
assert
    true
&&
    neg_f_177_low60_40_low20_19 = neg_f_177_low60_40_low20_18,
    u_217_236 = u_217_235,
    v_217_236 = v_217_235,
    neg_g_177_low60_40_low20_19 * (const 64 2) = neg_g_177_low60_40_low20_18 + neg_f_177_low60_40_low20_18,
    r_217_236 * (const 64 2) = r_217_235 + u_217_235,
    s_217_236 * (const 64 2) = s_217_235 + v_217_235
;

assume
    neg_f_177_low60_40_low20_19 = neg_f_177_low60_40_low20_18,
    u_217_236 = u_217_235,
    v_217_236 = v_217_235,
    neg_g_177_low60_40_low20_19 * 2 = neg_g_177_low60_40_low20_18 + neg_f_177_low60_40_low20_18,
    r_217_236 * 2 = r_217_235 + u_217_235,
    s_217_236 * 2 = s_217_235 + v_217_235
&&
    true
;

{
    u_217_236 * neg_f_177_low60_40_low20_0 + v_217_236 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_236 * neg_f_177_low60_40_low20_0 + s_217_236 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_19 + u_217_236 * (const 64 (2**21)) + v_217_236 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_19 + r_217_236 * (const 64 (2**21)) + s_217_236 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_19,
    neg_f_177_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_19,
    neg_g_177_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 236)) <=s delta, delta <=s (const 64 (1 + 2*236)),
    (const 64 (-(2**20))) <=s u_217_236, u_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_236, v_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_236, r_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_236, s_217_236 <=s (const 64 ((2**20))),
    u_217_236 + v_217_236 <=s (const 64 (2**20)),
    u_217_236 - v_217_236 <=s (const 64 (2**20)),
    (const 64 0) - u_217_236 + v_217_236 <=s (const 64 (2**20)),
    (const 64 0) - u_217_236 - v_217_236 <=s (const 64 (2**20)),
    r_217_236 + s_217_236 <=s (const 64 (2**20)),
    r_217_236 - s_217_236 <=s (const 64 (2**20)),
    (const 64 0) - r_217_236 + s_217_236 <=s (const 64 (2**20)),
    (const 64 0) - r_217_236 - s_217_236 <=s (const 64 (2**20)),
    u_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_217_236 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_235_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_40_low20_0,
sint64 neg_g_177_low60_40_low20_0,
sint64 neg_f_177_low60_40_low20_18,
sint64 neg_g_177_low60_40_low20_18,
sint64 neg_f_177_low60_40_low20_19,
sint64 neg_g_177_low60_40_low20_19,
sint64 u_217_235,
sint64 v_217_235,
sint64 r_217_235,
sint64 s_217_235,
sint64 u_217_236,
sint64 v_217_236,
sint64 r_217_236,
sint64 s_217_236,
bit ne
)={
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (-(2**20)),
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (-(2**20))
&&
    u_217_235 * neg_f_177_low60_40_low20_0 + v_217_235 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_18 * (const 64 (-(2**20))),
    r_217_235 * neg_f_177_low60_40_low20_0 + s_217_235 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_40_low20_18 + u_217_235 * (const 64 (2**21)) + v_217_235 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_18 + r_217_235 * (const 64 (2**21)) + s_217_235 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_40_low20_0,
    neg_f_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_0,
    neg_g_177_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_40_low20_18,
    neg_f_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_40_low20_18,
    neg_g_177_low60_40_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 235)) <=s delta, delta <=s (const 64 (1 + 2*235)),
    (const 64 (-(2**20))) <=s u_217_235, u_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_235, v_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_235, r_217_235 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_235, s_217_235 <=s (const 64 ((2**20))),
    u_217_235 + v_217_235 <=s (const 64 (2**20)),
    u_217_235 - v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 + v_217_235 <=s (const 64 (2**20)),
    (const 64 0) - u_217_235 - v_217_235 <=s (const 64 (2**20)),
    r_217_235 + s_217_235 <=s (const 64 (2**20)),
    r_217_235 - s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 + s_217_235 <=s (const 64 (2**20)),
    (const 64 0) - r_217_235 - s_217_235 <=s (const 64 (2**20)),
    u_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_217_235 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_217_235 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step58

// premise c
assume
neg_g_177_low60_40_low20_18 = 1 (mod 2)
&&
neg_g_177_low60_40_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_40_low20_19 neg_g_177_low60_40_low20_18;
mov u_217_236 r_217_235;
mov v_217_236 s_217_235;

subs dc neg_g_177_low60_40_low20_19 neg_g_177_low60_40_low20_18 neg_f_177_low60_40_low20_18;
asr neg_g_177_low60_40_low20_19 neg_g_177_low60_40_low20_19 1;
subs dc r_217_236 r_217_235 u_217_235;
asr r_217_236 r_217_236 1;
subs dc s_217_236 s_217_235 v_217_235;
asr s_217_236 s_217_236 1;
assert
    true
&&
    neg_f_177_low60_40_low20_19 = neg_g_177_low60_40_low20_18,
    u_217_236 = r_217_235,
    v_217_236 = s_217_235,
    neg_g_177_low60_40_low20_19 * (const 64 2) = neg_g_177_low60_40_low20_18 - neg_f_177_low60_40_low20_18,
    r_217_236 * (const 64 2) = r_217_235 - u_217_235,
    s_217_236 * (const 64 2) = s_217_235 - v_217_235
;

assume
    neg_f_177_low60_40_low20_19 = neg_g_177_low60_40_low20_18,
    u_217_236 = r_217_235,
    v_217_236 = s_217_235,
    neg_g_177_low60_40_low20_19 * 2 = neg_g_177_low60_40_low20_18 - neg_f_177_low60_40_low20_18,
    r_217_236 * 2 = r_217_235 - u_217_235,
    s_217_236 * 2 = s_217_235 - v_217_235
&&
    true
;

{
    u_217_236 * neg_f_177_low60_40_low20_0 + v_217_236 * neg_g_177_low60_40_low20_0 = neg_f_177_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_217_236 * neg_f_177_low60_40_low20_0 + s_217_236 * neg_g_177_low60_40_low20_0 = neg_g_177_low60_40_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_40_low20_19 + u_217_236 * (const 64 (2**21)) + v_217_236 * (const 64 (2**42)),
    grs = neg_g_177_low60_40_low20_19 + r_217_236 * (const 64 (2**21)) + s_217_236 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_40_low20_19,
    neg_f_177_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_40_low20_19,
    neg_g_177_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 236)) <=s delta, delta <=s (const 64 (1 + 2*236)),
    (const 64 (-(2**20))) <=s u_217_236, u_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_217_236, v_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_217_236, r_217_236 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_217_236, s_217_236 <=s (const 64 ((2**20))),
    u_217_236 + v_217_236 <=s (const 64 (2**20)),
    u_217_236 - v_217_236 <=s (const 64 (2**20)),
    (const 64 0) - u_217_236 + v_217_236 <=s (const 64 (2**20)),
    (const 64 0) - u_217_236 - v_217_236 <=s (const 64 (2**20)),
    r_217_236 + s_217_236 <=s (const 64 (2**20)),
    r_217_236 - s_217_236 <=s (const 64 (2**20)),
    (const 64 0) - r_217_236 + s_217_236 <=s (const 64 (2**20)),
    (const 64 0) - r_217_236 - s_217_236 <=s (const 64 (2**20)),
    u_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_217_236 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_217_236 = (const 64 0) (mod (const 64 (2**(20-19))))
}

