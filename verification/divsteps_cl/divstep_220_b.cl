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
    (const 64 (-(2**20))) <=s u_217_220, u_217_220 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_217_220, v_217_220 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_217_220, r_217_220 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_217_220, s_217_220 <=s (const 64 ((2**20)-1)),
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
// step220

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
    (const 64 (-(2**20))) <=s u_217_221, u_217_221 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_217_221, v_217_221 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_217_221, r_217_221 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_217_221, s_217_221 <=s (const 64 ((2**20)-1)),
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

