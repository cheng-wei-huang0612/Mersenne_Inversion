proc divstep_452_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_413_low60_20_low20_0,
sint64 g_413_low60_20_low20_0,
sint64 f_413_low60_20_low20_19,
sint64 g_413_low60_20_low20_19,
sint64 f_413_low60_20_low20_20,
sint64 g_413_low60_20_low20_20,
sint64 u_433_452,
sint64 v_433_452,
sint64 r_433_452,
sint64 s_433_452,
sint64 u_433_453,
sint64 v_433_453,
sint64 r_433_453,
sint64 s_433_453,
bit ne
)={
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (-(2**20)),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (-(2**20))
&&
    u_433_452 * f_413_low60_20_low20_0 + v_433_452 * g_413_low60_20_low20_0 = f_413_low60_20_low20_19 * (const 64 (-(2**20))),
    r_433_452 * f_413_low60_20_low20_0 + s_433_452 * g_413_low60_20_low20_0 = g_413_low60_20_low20_19 * (const 64 (-(2**20))),
    fuv = f_413_low60_20_low20_19 + u_433_452 * (const 64 (2**21)) + v_433_452 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_19 + r_433_452 * (const 64 (2**21)) + s_433_452 * (const 64 (2**42)),
    const 64 0 <=s f_413_low60_20_low20_0,
    f_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_0,
    g_413_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_413_low60_20_low20_19,
    f_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_413_low60_20_low20_19,
    g_413_low60_20_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 452)) <=s delta, delta <=s (const 64 (1 + 2*452)),
    (const 64 (-(2**20))) <=s u_433_452, u_433_452 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_433_452, v_433_452 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_433_452, r_433_452 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_433_452, s_433_452 <=s (const 64 ((2**20))),
    u_433_452 + v_433_452 <=s (const 64 (2**20)),
    u_433_452 - v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 + v_433_452 <=s (const 64 (2**20)),
    (const 64 0) - u_433_452 - v_433_452 <=s (const 64 (2**20)),
    r_433_452 + s_433_452 <=s (const 64 (2**20)),
    r_433_452 - s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 + s_433_452 <=s (const 64 (2**20)),
    (const 64 0) - r_433_452 - s_433_452 <=s (const 64 (2**20)),
    u_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_433_452 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_433_452 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step452

// premise b
assume
g_413_low60_20_low20_19 = 1 (mod 2)
&&
g_413_low60_20_low20_19 = const 64 1 (mod (const 64 2)),
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

mov f_413_low60_20_low20_20 f_413_low60_20_low20_19;
mov u_433_453 u_433_452;
mov v_433_453 v_433_452;

add g_413_low60_20_low20_20 g_413_low60_20_low20_19 f_413_low60_20_low20_19;
asr g_413_low60_20_low20_20 g_413_low60_20_low20_20 1;
add r_433_453 r_433_452 u_433_452;
asr r_433_453 r_433_453 1;
add s_433_453 s_433_452 v_433_452;
asr s_433_453 s_433_453 1;
assert
    true
&&
    f_413_low60_20_low20_20 = f_413_low60_20_low20_19,
    u_433_453 = u_433_452,
    v_433_453 = v_433_452,
    g_413_low60_20_low20_20 * (const 64 2) = g_413_low60_20_low20_19 + f_413_low60_20_low20_19,
    r_433_453 * (const 64 2) = r_433_452 + u_433_452,
    s_433_453 * (const 64 2) = s_433_452 + v_433_452
;

assume
    f_413_low60_20_low20_20 = f_413_low60_20_low20_19,
    u_433_453 = u_433_452,
    v_433_453 = v_433_452,
    g_413_low60_20_low20_20 * 2 = g_413_low60_20_low20_19 + f_413_low60_20_low20_19,
    r_433_453 * 2 = r_433_452 + u_433_452,
    s_433_453 * 2 = s_433_452 + v_433_452
&&
    true
;

{
    u_433_453 * f_413_low60_20_low20_0 + v_433_453 * g_413_low60_20_low20_0 = f_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_433_453 * f_413_low60_20_low20_0 + s_433_453 * g_413_low60_20_low20_0 = g_413_low60_20_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_413_low60_20_low20_20 + u_433_453 * (const 64 (2**21)) + v_433_453 * (const 64 (2**42)),
    grs = g_413_low60_20_low20_20 + r_433_453 * (const 64 (2**21)) + s_433_453 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_413_low60_20_low20_20,
    f_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_413_low60_20_low20_20,
    g_413_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 453)) <=s delta, delta <=s (const 64 (1 + 2*453)),
    (const 64 (-(2**20))) <=s u_433_453, u_433_453 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_433_453, v_433_453 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_433_453, r_433_453 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_433_453, s_433_453 <=s (const 64 ((2**20))),
    u_433_453 + v_433_453 <=s (const 64 (2**20)),
    u_433_453 - v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 + v_433_453 <=s (const 64 (2**20)),
    (const 64 0) - u_433_453 - v_433_453 <=s (const 64 (2**20)),
    r_433_453 + s_433_453 <=s (const 64 (2**20)),
    r_433_453 - s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 + s_433_453 <=s (const 64 (2**20)),
    (const 64 0) - r_433_453 - s_433_453 <=s (const 64 (2**20)),
    u_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_433_453 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_433_453 = (const 64 0) (mod (const 64 (2**(20-20))))
}

