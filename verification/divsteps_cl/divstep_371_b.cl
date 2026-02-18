proc divstep_371_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_17,
sint64 g_354_low60_0_low20_17,
sint64 f_354_low60_0_low20_18,
sint64 g_354_low60_0_low20_18,
sint64 u_354_371,
sint64 v_354_371,
sint64 r_354_371,
sint64 s_354_371,
sint64 u_354_372,
sint64 v_354_372,
sint64 r_354_372,
sint64 s_354_372,
bit ne
)={
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (-(2**20)),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (-(2**20))
&&
    u_354_371 * f_354_low60_0_low20_0 + v_354_371 * g_354_low60_0_low20_0 = f_354_low60_0_low20_17 * (const 64 (-(2**20))),
    r_354_371 * f_354_low60_0_low20_0 + s_354_371 * g_354_low60_0_low20_0 = g_354_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_17 + u_354_371 * (const 64 (2**21)) + v_354_371 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_17 + r_354_371 * (const 64 (2**21)) + s_354_371 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_17,
    f_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_17,
    g_354_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 371)) <=s delta, delta <=s (const 64 (1 + 2*371)),
    (const 64 (-(2**20))) <=s u_354_371, u_354_371 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_354_371, v_354_371 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_354_371, r_354_371 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_354_371, s_354_371 <=s (const 64 ((2**20)-1)),
    u_354_371 + v_354_371 <=s (const 64 (2**20)),
    u_354_371 - v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 + v_354_371 <=s (const 64 (2**20)),
    (const 64 0) - u_354_371 - v_354_371 <=s (const 64 (2**20)),
    r_354_371 + s_354_371 <=s (const 64 (2**20)),
    r_354_371 - s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 + s_354_371 <=s (const 64 (2**20)),
    (const 64 0) - r_354_371 - s_354_371 <=s (const 64 (2**20)),
    u_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_354_371 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_354_371 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step371

// premise b
assume
g_354_low60_0_low20_17 = 1 (mod 2)
&&
g_354_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_0_low20_18 f_354_low60_0_low20_17;
mov u_354_372 u_354_371;
mov v_354_372 v_354_371;

add g_354_low60_0_low20_18 g_354_low60_0_low20_17 f_354_low60_0_low20_17;
asr g_354_low60_0_low20_18 g_354_low60_0_low20_18 1;
add r_354_372 r_354_371 u_354_371;
asr r_354_372 r_354_372 1;
add s_354_372 s_354_371 v_354_371;
asr s_354_372 s_354_372 1;
assert
    true
&&
    f_354_low60_0_low20_18 = f_354_low60_0_low20_17,
    u_354_372 = u_354_371,
    v_354_372 = v_354_371,
    g_354_low60_0_low20_18 * (const 64 2) = g_354_low60_0_low20_17 + f_354_low60_0_low20_17,
    r_354_372 * (const 64 2) = r_354_371 + u_354_371,
    s_354_372 * (const 64 2) = s_354_371 + v_354_371
;

assume
    f_354_low60_0_low20_18 = f_354_low60_0_low20_17,
    u_354_372 = u_354_371,
    v_354_372 = v_354_371,
    g_354_low60_0_low20_18 * 2 = g_354_low60_0_low20_17 + f_354_low60_0_low20_17,
    r_354_372 * 2 = r_354_371 + u_354_371,
    s_354_372 * 2 = s_354_371 + v_354_371
&&
    true
;

{
    u_354_372 * f_354_low60_0_low20_0 + v_354_372 * g_354_low60_0_low20_0 = f_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_372 * f_354_low60_0_low20_0 + s_354_372 * g_354_low60_0_low20_0 = g_354_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_18 + u_354_372 * (const 64 (2**21)) + v_354_372 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_18 + r_354_372 * (const 64 (2**21)) + s_354_372 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_18,
    f_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_18,
    g_354_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 372)) <=s delta, delta <=s (const 64 (1 + 2*372)),
    (const 64 (-(2**20))) <=s u_354_372, u_354_372 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_354_372, v_354_372 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_354_372, r_354_372 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_354_372, s_354_372 <=s (const 64 ((2**20)-1)),
    u_354_372 + v_354_372 <=s (const 64 (2**20)),
    u_354_372 - v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 + v_354_372 <=s (const 64 (2**20)),
    (const 64 0) - u_354_372 - v_354_372 <=s (const 64 (2**20)),
    r_354_372 + s_354_372 <=s (const 64 (2**20)),
    r_354_372 - s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 + s_354_372 <=s (const 64 (2**20)),
    (const 64 0) - r_354_372 - s_354_372 <=s (const 64 (2**20)),
    u_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_354_372 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_354_372 = (const 64 0) (mod (const 64 (2**(20-18))))
}

