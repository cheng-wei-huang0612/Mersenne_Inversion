proc divstep_252_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_16,
sint64 g_236_low60_0_low20_16,
sint64 f_236_low60_0_low20_17,
sint64 g_236_low60_0_low20_17,
sint64 u_236_252,
sint64 v_236_252,
sint64 r_236_252,
sint64 s_236_252,
sint64 u_236_253,
sint64 v_236_253,
sint64 r_236_253,
sint64 s_236_253,
bit ne
)={
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (-(2**20)),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (-(2**20))
&&
    u_236_252 * f_236_low60_0_low20_0 + v_236_252 * g_236_low60_0_low20_0 = f_236_low60_0_low20_16 * (const 64 (-(2**20))),
    r_236_252 * f_236_low60_0_low20_0 + s_236_252 * g_236_low60_0_low20_0 = g_236_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_16 + u_236_252 * (const 64 (2**21)) + v_236_252 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_16 + r_236_252 * (const 64 (2**21)) + s_236_252 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_16,
    f_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_16,
    g_236_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 252)) <=s delta, delta <=s (const 64 (1 + 2*252)),
    (const 64 (-(2**20))) <=s u_236_252, u_236_252 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_236_252, v_236_252 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_236_252, r_236_252 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_236_252, s_236_252 <=s (const 64 ((2**20)-1)),
    u_236_252 + v_236_252 <=s (const 64 (2**20)),
    u_236_252 - v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 + v_236_252 <=s (const 64 (2**20)),
    (const 64 0) - u_236_252 - v_236_252 <=s (const 64 (2**20)),
    r_236_252 + s_236_252 <=s (const 64 (2**20)),
    r_236_252 - s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 + s_236_252 <=s (const 64 (2**20)),
    (const 64 0) - r_236_252 - s_236_252 <=s (const 64 (2**20)),
    u_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_236_252 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_236_252 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step252

// premise c
assume
g_236_low60_0_low20_16 = 1 (mod 2)
&&
g_236_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov f_236_low60_0_low20_17 g_236_low60_0_low20_16;
mov u_236_253 r_236_252;
mov v_236_253 s_236_252;

subs dc g_236_low60_0_low20_17 g_236_low60_0_low20_16 f_236_low60_0_low20_16;
asr g_236_low60_0_low20_17 g_236_low60_0_low20_17 1;
subs dc r_236_253 r_236_252 u_236_252;
asr r_236_253 r_236_253 1;
subs dc s_236_253 s_236_252 v_236_252;
asr s_236_253 s_236_253 1;
assert
    true
&&
    f_236_low60_0_low20_17 = g_236_low60_0_low20_16,
    u_236_253 = r_236_252,
    v_236_253 = s_236_252,
    g_236_low60_0_low20_17 * (const 64 2) = g_236_low60_0_low20_16 - f_236_low60_0_low20_16,
    r_236_253 * (const 64 2) = r_236_252 - u_236_252,
    s_236_253 * (const 64 2) = s_236_252 - v_236_252
;

assume
    f_236_low60_0_low20_17 = g_236_low60_0_low20_16,
    u_236_253 = r_236_252,
    v_236_253 = s_236_252,
    g_236_low60_0_low20_17 * 2 = g_236_low60_0_low20_16 - f_236_low60_0_low20_16,
    r_236_253 * 2 = r_236_252 - u_236_252,
    s_236_253 * 2 = s_236_252 - v_236_252
&&
    true
;

{
    u_236_253 * f_236_low60_0_low20_0 + v_236_253 * g_236_low60_0_low20_0 = f_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_253 * f_236_low60_0_low20_0 + s_236_253 * g_236_low60_0_low20_0 = g_236_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_17 + u_236_253 * (const 64 (2**21)) + v_236_253 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_17 + r_236_253 * (const 64 (2**21)) + s_236_253 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_17,
    f_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_17,
    g_236_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 253)) <=s delta, delta <=s (const 64 (1 + 2*253)),
    (const 64 (-(2**20))) <=s u_236_253, u_236_253 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_236_253, v_236_253 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_236_253, r_236_253 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_236_253, s_236_253 <=s (const 64 ((2**20)-1)),
    u_236_253 + v_236_253 <=s (const 64 (2**20)),
    u_236_253 - v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 + v_236_253 <=s (const 64 (2**20)),
    (const 64 0) - u_236_253 - v_236_253 <=s (const 64 (2**20)),
    r_236_253 + s_236_253 <=s (const 64 (2**20)),
    r_236_253 - s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 + s_236_253 <=s (const 64 (2**20)),
    (const 64 0) - r_236_253 - s_236_253 <=s (const 64 (2**20)),
    u_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_236_253 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_236_253 = (const 64 0) (mod (const 64 (2**(20-17))))
}

