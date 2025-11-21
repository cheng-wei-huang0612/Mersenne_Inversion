proc divstep_581_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_531_low60_40_low20_0,
sint64 neg_g_531_low60_40_low20_0,
sint64 neg_f_531_low60_40_low20_10,
sint64 neg_g_531_low60_40_low20_10,
sint64 neg_f_531_low60_40_low20_11,
sint64 neg_g_531_low60_40_low20_11,
sint64 u_571_581,
sint64 v_571_581,
sint64 r_571_581,
sint64 s_571_581,
sint64 u_571_582,
sint64 v_571_582,
sint64 r_571_582,
sint64 s_571_582,
bit ne
)={
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (-(2**20)),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (-(2**20))
&&
    u_571_581 * neg_f_531_low60_40_low20_0 + v_571_581 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_10 * (const 64 (-(2**20))),
    r_571_581 * neg_f_531_low60_40_low20_0 + s_571_581 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_531_low60_40_low20_10 + u_571_581 * (const 64 (2**21)) + v_571_581 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_10 + r_571_581 * (const 64 (2**21)) + s_571_581 * (const 64 (2**42)),
    const 64 0 <=s neg_f_531_low60_40_low20_0,
    neg_f_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_0,
    neg_g_531_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_531_low60_40_low20_10,
    neg_f_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_531_low60_40_low20_10,
    neg_g_531_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 581)) <=s delta, delta <=s (const 64 (1 + 2*581)),
    (const 64 (-(2**20))) <=s u_571_581, u_571_581 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_571_581, v_571_581 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_571_581, r_571_581 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_571_581, s_571_581 <=s (const 64 ((2**20))),
    u_571_581 + v_571_581 <=s (const 64 (2**20)),
    u_571_581 - v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 + v_571_581 <=s (const 64 (2**20)),
    (const 64 0) - u_571_581 - v_571_581 <=s (const 64 (2**20)),
    r_571_581 + s_571_581 <=s (const 64 (2**20)),
    r_571_581 - s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 + s_571_581 <=s (const 64 (2**20)),
    (const 64 0) - r_571_581 - s_571_581 <=s (const 64 (2**20)),
    u_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_571_581 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_571_581 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step50

// premise b
assume
neg_g_531_low60_40_low20_10 = 1 (mod 2)
&&
neg_g_531_low60_40_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_531_low60_40_low20_11 neg_f_531_low60_40_low20_10;
mov u_571_582 u_571_581;
mov v_571_582 v_571_581;

add neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_10 neg_f_531_low60_40_low20_10;
asr neg_g_531_low60_40_low20_11 neg_g_531_low60_40_low20_11 1;
add r_571_582 r_571_581 u_571_581;
asr r_571_582 r_571_582 1;
add s_571_582 s_571_581 v_571_581;
asr s_571_582 s_571_582 1;
assert
    true
&&
    neg_f_531_low60_40_low20_11 = neg_f_531_low60_40_low20_10,
    u_571_582 = u_571_581,
    v_571_582 = v_571_581,
    neg_g_531_low60_40_low20_11 * (const 64 2) = neg_g_531_low60_40_low20_10 + neg_f_531_low60_40_low20_10,
    r_571_582 * (const 64 2) = r_571_581 + u_571_581,
    s_571_582 * (const 64 2) = s_571_581 + v_571_581
;

assume
    neg_f_531_low60_40_low20_11 = neg_f_531_low60_40_low20_10,
    u_571_582 = u_571_581,
    v_571_582 = v_571_581,
    neg_g_531_low60_40_low20_11 * 2 = neg_g_531_low60_40_low20_10 + neg_f_531_low60_40_low20_10,
    r_571_582 * 2 = r_571_581 + u_571_581,
    s_571_582 * 2 = s_571_581 + v_571_581
&&
    true
;

{
    u_571_582 * neg_f_531_low60_40_low20_0 + v_571_582 * neg_g_531_low60_40_low20_0 = neg_f_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_571_582 * neg_f_531_low60_40_low20_0 + s_571_582 * neg_g_531_low60_40_low20_0 = neg_g_531_low60_40_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_531_low60_40_low20_11 + u_571_582 * (const 64 (2**21)) + v_571_582 * (const 64 (2**42)),
    grs = neg_g_531_low60_40_low20_11 + r_571_582 * (const 64 (2**21)) + s_571_582 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_531_low60_40_low20_11,
    neg_f_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_531_low60_40_low20_11,
    neg_g_531_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 582)) <=s delta, delta <=s (const 64 (1 + 2*582)),
    (const 64 (-(2**20))) <=s u_571_582, u_571_582 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_571_582, v_571_582 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_571_582, r_571_582 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_571_582, s_571_582 <=s (const 64 ((2**20))),
    u_571_582 + v_571_582 <=s (const 64 (2**20)),
    u_571_582 - v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 + v_571_582 <=s (const 64 (2**20)),
    (const 64 0) - u_571_582 - v_571_582 <=s (const 64 (2**20)),
    r_571_582 + s_571_582 <=s (const 64 (2**20)),
    r_571_582 - s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 + s_571_582 <=s (const 64 (2**20)),
    (const 64 0) - r_571_582 - s_571_582 <=s (const 64 (2**20)),
    u_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_571_582 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_571_582 = (const 64 0) (mod (const 64 (2**(20-11))))
}

