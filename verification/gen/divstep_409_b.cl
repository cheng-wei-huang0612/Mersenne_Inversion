proc divstep_409_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_15,
sint64 g_354_low60_40_low20_15,
sint64 f_354_low60_40_low20_16,
sint64 g_354_low60_40_low20_16,
sint64 u_394_409,
sint64 v_394_409,
sint64 r_394_409,
sint64 s_394_409,
sint64 u_394_410,
sint64 v_394_410,
sint64 r_394_410,
sint64 s_394_410,
bit ne
)={
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (-(2**20)),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (-(2**20))
&&
    u_394_409 * f_354_low60_40_low20_0 + v_394_409 * g_354_low60_40_low20_0 = f_354_low60_40_low20_15 * (const 64 (-(2**20))),
    r_394_409 * f_354_low60_40_low20_0 + s_394_409 * g_354_low60_40_low20_0 = g_354_low60_40_low20_15 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_15 + u_394_409 * (const 64 (2**21)) + v_394_409 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_15 + r_394_409 * (const 64 (2**21)) + s_394_409 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_15,
    f_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_15,
    g_354_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 409)) <=s delta, delta <=s (const 64 (1 + 2*409)),
    (const 64 (-(2**20))) <=s u_394_409, u_394_409 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_394_409, v_394_409 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_394_409, r_394_409 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_394_409, s_394_409 <=s (const 64 ((2**20))),
    u_394_409 + v_394_409 <=s (const 64 (2**20)),
    u_394_409 - v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 + v_394_409 <=s (const 64 (2**20)),
    (const 64 0) - u_394_409 - v_394_409 <=s (const 64 (2**20)),
    r_394_409 + s_394_409 <=s (const 64 (2**20)),
    r_394_409 - s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 + s_394_409 <=s (const 64 (2**20)),
    (const 64 0) - r_394_409 - s_394_409 <=s (const 64 (2**20)),
    u_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_394_409 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_394_409 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step409

// premise b
assume
g_354_low60_40_low20_15 = 1 (mod 2)
&&
g_354_low60_40_low20_15 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_16 f_354_low60_40_low20_15;
mov u_394_410 u_394_409;
mov v_394_410 v_394_409;

add g_354_low60_40_low20_16 g_354_low60_40_low20_15 f_354_low60_40_low20_15;
asr g_354_low60_40_low20_16 g_354_low60_40_low20_16 1;
add r_394_410 r_394_409 u_394_409;
asr r_394_410 r_394_410 1;
add s_394_410 s_394_409 v_394_409;
asr s_394_410 s_394_410 1;
assert
    true
&&
    f_354_low60_40_low20_16 = f_354_low60_40_low20_15,
    u_394_410 = u_394_409,
    v_394_410 = v_394_409,
    g_354_low60_40_low20_16 * (const 64 2) = g_354_low60_40_low20_15 + f_354_low60_40_low20_15,
    r_394_410 * (const 64 2) = r_394_409 + u_394_409,
    s_394_410 * (const 64 2) = s_394_409 + v_394_409
;

assume
    f_354_low60_40_low20_16 = f_354_low60_40_low20_15,
    u_394_410 = u_394_409,
    v_394_410 = v_394_409,
    g_354_low60_40_low20_16 * 2 = g_354_low60_40_low20_15 + f_354_low60_40_low20_15,
    r_394_410 * 2 = r_394_409 + u_394_409,
    s_394_410 * 2 = s_394_409 + v_394_409
&&
    true
;

{
    u_394_410 * f_354_low60_40_low20_0 + v_394_410 * g_354_low60_40_low20_0 = f_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_410 * f_354_low60_40_low20_0 + s_394_410 * g_354_low60_40_low20_0 = g_354_low60_40_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_16 + u_394_410 * (const 64 (2**21)) + v_394_410 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_16 + r_394_410 * (const 64 (2**21)) + s_394_410 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_16,
    f_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_16,
    g_354_low60_40_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 410)) <=s delta, delta <=s (const 64 (1 + 2*410)),
    (const 64 (-(2**20))) <=s u_394_410, u_394_410 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_394_410, v_394_410 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_394_410, r_394_410 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_394_410, s_394_410 <=s (const 64 ((2**20))),
    u_394_410 + v_394_410 <=s (const 64 (2**20)),
    u_394_410 - v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 + v_394_410 <=s (const 64 (2**20)),
    (const 64 0) - u_394_410 - v_394_410 <=s (const 64 (2**20)),
    r_394_410 + s_394_410 <=s (const 64 (2**20)),
    r_394_410 - s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 + s_394_410 <=s (const 64 (2**20)),
    (const 64 0) - r_394_410 - s_394_410 <=s (const 64 (2**20)),
    u_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_394_410 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_394_410 = (const 64 0) (mod (const 64 (2**(20-16))))
}

