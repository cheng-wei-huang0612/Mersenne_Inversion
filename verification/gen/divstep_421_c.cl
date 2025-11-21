proc divstep_421_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_413_low60_0_low20_0,
sint64 neg_g_413_low60_0_low20_0,
sint64 neg_f_413_low60_0_low20_8,
sint64 neg_g_413_low60_0_low20_8,
sint64 neg_f_413_low60_0_low20_9,
sint64 neg_g_413_low60_0_low20_9,
sint64 u_413_421,
sint64 v_413_421,
sint64 r_413_421,
sint64 s_413_421,
sint64 u_413_422,
sint64 v_413_422,
sint64 r_413_422,
sint64 s_413_422,
bit ne
)={
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (-(2**20)),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (-(2**20))
&&
    u_413_421 * neg_f_413_low60_0_low20_0 + v_413_421 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_8 * (const 64 (-(2**20))),
    r_413_421 * neg_f_413_low60_0_low20_0 + s_413_421 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_413_low60_0_low20_8 + u_413_421 * (const 64 (2**21)) + v_413_421 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_8 + r_413_421 * (const 64 (2**21)) + s_413_421 * (const 64 (2**42)),
    const 64 0 <=s neg_f_413_low60_0_low20_0,
    neg_f_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_0,
    neg_g_413_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_413_low60_0_low20_8,
    neg_f_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_413_low60_0_low20_8,
    neg_g_413_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 421)) <=s delta, delta <=s (const 64 (1 + 2*421)),
    (const 64 (-(2**20))) <=s u_413_421, u_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_421, v_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_421, r_413_421 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_421, s_413_421 <=s (const 64 ((2**20))),
    u_413_421 + v_413_421 <=s (const 64 (2**20)),
    u_413_421 - v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 + v_413_421 <=s (const 64 (2**20)),
    (const 64 0) - u_413_421 - v_413_421 <=s (const 64 (2**20)),
    r_413_421 + s_413_421 <=s (const 64 (2**20)),
    r_413_421 - s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 + s_413_421 <=s (const 64 (2**20)),
    (const 64 0) - r_413_421 - s_413_421 <=s (const 64 (2**20)),
    u_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_413_421 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_413_421 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step421

// premise c
assume
neg_g_413_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_413_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_413_low60_0_low20_9 neg_g_413_low60_0_low20_8;
mov u_413_422 r_413_421;
mov v_413_422 s_413_421;

subs dc neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_8 neg_f_413_low60_0_low20_8;
asr neg_g_413_low60_0_low20_9 neg_g_413_low60_0_low20_9 1;
subs dc r_413_422 r_413_421 u_413_421;
asr r_413_422 r_413_422 1;
subs dc s_413_422 s_413_421 v_413_421;
asr s_413_422 s_413_422 1;
assert
    true
&&
    neg_f_413_low60_0_low20_9 = neg_g_413_low60_0_low20_8,
    u_413_422 = r_413_421,
    v_413_422 = s_413_421,
    neg_g_413_low60_0_low20_9 * (const 64 2) = neg_g_413_low60_0_low20_8 - neg_f_413_low60_0_low20_8,
    r_413_422 * (const 64 2) = r_413_421 - u_413_421,
    s_413_422 * (const 64 2) = s_413_421 - v_413_421
;

assume
    neg_f_413_low60_0_low20_9 = neg_g_413_low60_0_low20_8,
    u_413_422 = r_413_421,
    v_413_422 = s_413_421,
    neg_g_413_low60_0_low20_9 * 2 = neg_g_413_low60_0_low20_8 - neg_f_413_low60_0_low20_8,
    r_413_422 * 2 = r_413_421 - u_413_421,
    s_413_422 * 2 = s_413_421 - v_413_421
&&
    true
;

{
    u_413_422 * neg_f_413_low60_0_low20_0 + v_413_422 * neg_g_413_low60_0_low20_0 = neg_f_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_413_422 * neg_f_413_low60_0_low20_0 + s_413_422 * neg_g_413_low60_0_low20_0 = neg_g_413_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_413_low60_0_low20_9 + u_413_422 * (const 64 (2**21)) + v_413_422 * (const 64 (2**42)),
    grs = neg_g_413_low60_0_low20_9 + r_413_422 * (const 64 (2**21)) + s_413_422 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_413_low60_0_low20_9,
    neg_f_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_413_low60_0_low20_9,
    neg_g_413_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 422)) <=s delta, delta <=s (const 64 (1 + 2*422)),
    (const 64 (-(2**20))) <=s u_413_422, u_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_413_422, v_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_413_422, r_413_422 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_413_422, s_413_422 <=s (const 64 ((2**20))),
    u_413_422 + v_413_422 <=s (const 64 (2**20)),
    u_413_422 - v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 + v_413_422 <=s (const 64 (2**20)),
    (const 64 0) - u_413_422 - v_413_422 <=s (const 64 (2**20)),
    r_413_422 + s_413_422 <=s (const 64 (2**20)),
    r_413_422 - s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 + s_413_422 <=s (const 64 (2**20)),
    (const 64 0) - r_413_422 - s_413_422 <=s (const 64 (2**20)),
    u_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_413_422 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_413_422 = (const 64 0) (mod (const 64 (2**(20-9))))
}

