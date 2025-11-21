proc divstep_394_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_1,
sint64 g_354_low60_40_low20_1,
sint64 u_394_394,
sint64 v_394_394,
sint64 r_394_394,
sint64 s_394_394,
sint64 u_394_395,
sint64 v_394_395,
sint64 r_394_395,
sint64 s_394_395,
bit ne
)={
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (-(2**20)),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (-(2**20))
&&
    u_394_394 * f_354_low60_40_low20_0 + v_394_394 * g_354_low60_40_low20_0 = f_354_low60_40_low20_0 * (const 64 (-(2**20))),
    r_394_394 * f_354_low60_40_low20_0 + s_394_394 * g_354_low60_40_low20_0 = g_354_low60_40_low20_0 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_0 + u_394_394 * (const 64 (2**21)) + v_394_394 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_0 + r_394_394 * (const 64 (2**21)) + s_394_394 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 394)) <=s delta, delta <=s (const 64 (1 + 2*394)),
    u_394_394 = (const 64 (-(2**20))),
    v_394_394 = (const 64 (0)),
    r_394_394 = (const 64 (0)),
    s_394_394 = (const 64 (-(2**20)))
}



// divsteps
// step394

// premise b
assume
g_354_low60_40_low20_0 = 1 (mod 2)
&&
g_354_low60_40_low20_0 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_1 f_354_low60_40_low20_0;
mov u_394_395 u_394_394;
mov v_394_395 v_394_394;

add g_354_low60_40_low20_1 g_354_low60_40_low20_0 f_354_low60_40_low20_0;
asr g_354_low60_40_low20_1 g_354_low60_40_low20_1 1;
add r_394_395 r_394_394 u_394_394;
asr r_394_395 r_394_395 1;
add s_394_395 s_394_394 v_394_394;
asr s_394_395 s_394_395 1;
assert
    true
&&
    f_354_low60_40_low20_1 = f_354_low60_40_low20_0,
    u_394_395 = u_394_394,
    v_394_395 = v_394_394,
    g_354_low60_40_low20_1 * (const 64 2) = g_354_low60_40_low20_0 + f_354_low60_40_low20_0,
    r_394_395 * (const 64 2) = r_394_394 + u_394_394,
    s_394_395 * (const 64 2) = s_394_394 + v_394_394
;

assume
    f_354_low60_40_low20_1 = f_354_low60_40_low20_0,
    u_394_395 = u_394_394,
    v_394_395 = v_394_394,
    g_354_low60_40_low20_1 * 2 = g_354_low60_40_low20_0 + f_354_low60_40_low20_0,
    r_394_395 * 2 = r_394_394 + u_394_394,
    s_394_395 * 2 = s_394_394 + v_394_394
&&
    true
;

{
    u_394_395 * f_354_low60_40_low20_0 + v_394_395 * g_354_low60_40_low20_0 = f_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_395 * f_354_low60_40_low20_0 + s_394_395 * g_354_low60_40_low20_0 = g_354_low60_40_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_1 + u_394_395 * (const 64 (2**21)) + v_394_395 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_1 + r_394_395 * (const 64 (2**21)) + s_394_395 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_1,
    f_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_1,
    g_354_low60_40_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 395)) <=s delta, delta <=s (const 64 (1 + 2*395)),
    (const 64 (-(2**20))) <=s u_394_395, u_394_395 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_394_395, v_394_395 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_394_395, r_394_395 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_394_395, s_394_395 <=s (const 64 ((2**20))),
    u_394_395 + v_394_395 <=s (const 64 (2**20)),
    u_394_395 - v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 + v_394_395 <=s (const 64 (2**20)),
    (const 64 0) - u_394_395 - v_394_395 <=s (const 64 (2**20)),
    r_394_395 + s_394_395 <=s (const 64 (2**20)),
    r_394_395 - s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 + s_394_395 <=s (const 64 (2**20)),
    (const 64 0) - r_394_395 - s_394_395 <=s (const 64 (2**20)),
    u_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_394_395 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_394_395 = (const 64 0) (mod (const 64 (2**(20-1))))
}

