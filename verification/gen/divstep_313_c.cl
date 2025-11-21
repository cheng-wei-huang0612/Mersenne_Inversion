proc divstep_313_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_295_low60_0_low20_0,
sint64 neg_g_295_low60_0_low20_0,
sint64 neg_f_295_low60_0_low20_18,
sint64 neg_g_295_low60_0_low20_18,
sint64 neg_f_295_low60_0_low20_19,
sint64 neg_g_295_low60_0_low20_19,
sint64 u_295_313,
sint64 v_295_313,
sint64 r_295_313,
sint64 s_295_313,
sint64 u_295_314,
sint64 v_295_314,
sint64 r_295_314,
sint64 s_295_314,
bit ne
)={
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (-(2**20)),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (-(2**20))
&&
    u_295_313 * neg_f_295_low60_0_low20_0 + v_295_313 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_18 * (const 64 (-(2**20))),
    r_295_313 * neg_f_295_low60_0_low20_0 + s_295_313 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_295_low60_0_low20_18 + u_295_313 * (const 64 (2**21)) + v_295_313 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_18 + r_295_313 * (const 64 (2**21)) + s_295_313 * (const 64 (2**42)),
    const 64 0 <=s neg_f_295_low60_0_low20_0,
    neg_f_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_0,
    neg_g_295_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_295_low60_0_low20_18,
    neg_f_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_295_low60_0_low20_18,
    neg_g_295_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 313)) <=s delta, delta <=s (const 64 (1 + 2*313)),
    (const 64 (-(2**20))) <=s u_295_313, u_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_313, v_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_313, r_295_313 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_313, s_295_313 <=s (const 64 ((2**20))),
    u_295_313 + v_295_313 <=s (const 64 (2**20)),
    u_295_313 - v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 + v_295_313 <=s (const 64 (2**20)),
    (const 64 0) - u_295_313 - v_295_313 <=s (const 64 (2**20)),
    r_295_313 + s_295_313 <=s (const 64 (2**20)),
    r_295_313 - s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 + s_295_313 <=s (const 64 (2**20)),
    (const 64 0) - r_295_313 - s_295_313 <=s (const 64 (2**20)),
    u_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_295_313 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_295_313 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step313

// premise c
assume
neg_g_295_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_295_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_295_low60_0_low20_19 neg_g_295_low60_0_low20_18;
mov u_295_314 r_295_313;
mov v_295_314 s_295_313;

subs dc neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_18 neg_f_295_low60_0_low20_18;
asr neg_g_295_low60_0_low20_19 neg_g_295_low60_0_low20_19 1;
subs dc r_295_314 r_295_313 u_295_313;
asr r_295_314 r_295_314 1;
subs dc s_295_314 s_295_313 v_295_313;
asr s_295_314 s_295_314 1;
assert
    true
&&
    neg_f_295_low60_0_low20_19 = neg_g_295_low60_0_low20_18,
    u_295_314 = r_295_313,
    v_295_314 = s_295_313,
    neg_g_295_low60_0_low20_19 * (const 64 2) = neg_g_295_low60_0_low20_18 - neg_f_295_low60_0_low20_18,
    r_295_314 * (const 64 2) = r_295_313 - u_295_313,
    s_295_314 * (const 64 2) = s_295_313 - v_295_313
;

assume
    neg_f_295_low60_0_low20_19 = neg_g_295_low60_0_low20_18,
    u_295_314 = r_295_313,
    v_295_314 = s_295_313,
    neg_g_295_low60_0_low20_19 * 2 = neg_g_295_low60_0_low20_18 - neg_f_295_low60_0_low20_18,
    r_295_314 * 2 = r_295_313 - u_295_313,
    s_295_314 * 2 = s_295_313 - v_295_313
&&
    true
;

{
    u_295_314 * neg_f_295_low60_0_low20_0 + v_295_314 * neg_g_295_low60_0_low20_0 = neg_f_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_295_314 * neg_f_295_low60_0_low20_0 + s_295_314 * neg_g_295_low60_0_low20_0 = neg_g_295_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_295_low60_0_low20_19 + u_295_314 * (const 64 (2**21)) + v_295_314 * (const 64 (2**42)),
    grs = neg_g_295_low60_0_low20_19 + r_295_314 * (const 64 (2**21)) + s_295_314 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_295_low60_0_low20_19,
    neg_f_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_295_low60_0_low20_19,
    neg_g_295_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 314)) <=s delta, delta <=s (const 64 (1 + 2*314)),
    (const 64 (-(2**20))) <=s u_295_314, u_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_295_314, v_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_295_314, r_295_314 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_295_314, s_295_314 <=s (const 64 ((2**20))),
    u_295_314 + v_295_314 <=s (const 64 (2**20)),
    u_295_314 - v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 + v_295_314 <=s (const 64 (2**20)),
    (const 64 0) - u_295_314 - v_295_314 <=s (const 64 (2**20)),
    r_295_314 + s_295_314 <=s (const 64 (2**20)),
    r_295_314 - s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 + s_295_314 <=s (const 64 (2**20)),
    (const 64 0) - r_295_314 - s_295_314 <=s (const 64 (2**20)),
    u_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_295_314 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_295_314 = (const 64 0) (mod (const 64 (2**(20-19))))
}

