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
    (const 64 (-(2**20))) <=s u_217_226, u_217_226 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_217_226, v_217_226 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_217_226, r_217_226 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_217_226, s_217_226 <=s (const 64 ((2**20)-1)),
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
// step226

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
    (const 64 (-(2**20))) <=s u_217_227, u_217_227 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_217_227, v_217_227 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_217_227, r_217_227 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_217_227, s_217_227 <=s (const 64 ((2**20)-1)),
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

