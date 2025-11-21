proc divstep_526_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_40_low20_0,
sint64 g_472_low60_40_low20_0,
sint64 f_472_low60_40_low20_14,
sint64 g_472_low60_40_low20_14,
sint64 f_472_low60_40_low20_15,
sint64 g_472_low60_40_low20_15,
sint64 u_512_526,
sint64 v_512_526,
sint64 r_512_526,
sint64 s_512_526,
sint64 u_512_527,
sint64 v_512_527,
sint64 r_512_527,
sint64 s_512_527,
bit ne
)={
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (-(2**20)),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (-(2**20))
&&
    u_512_526 * f_472_low60_40_low20_0 + v_512_526 * g_472_low60_40_low20_0 = f_472_low60_40_low20_14 * (const 64 (-(2**20))),
    r_512_526 * f_472_low60_40_low20_0 + s_512_526 * g_472_low60_40_low20_0 = g_472_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = f_472_low60_40_low20_14 + u_512_526 * (const 64 (2**21)) + v_512_526 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_14 + r_512_526 * (const 64 (2**21)) + s_512_526 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_40_low20_0,
    f_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_0,
    g_472_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_40_low20_14,
    f_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_40_low20_14,
    g_472_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 526)) <=s delta, delta <=s (const 64 (1 + 2*526)),
    (const 64 (-(2**20))) <=s u_512_526, u_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_526, v_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_526, r_512_526 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_526, s_512_526 <=s (const 64 ((2**20))),
    u_512_526 + v_512_526 <=s (const 64 (2**20)),
    u_512_526 - v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 + v_512_526 <=s (const 64 (2**20)),
    (const 64 0) - u_512_526 - v_512_526 <=s (const 64 (2**20)),
    r_512_526 + s_512_526 <=s (const 64 (2**20)),
    r_512_526 - s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 + s_512_526 <=s (const 64 (2**20)),
    (const 64 0) - r_512_526 - s_512_526 <=s (const 64 (2**20)),
    u_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_512_526 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_512_526 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step54

// premise a
assume
g_472_low60_40_low20_14 = 0 (mod 2)
&&
g_472_low60_40_low20_14 = const 64 0 (mod (const 64 2))
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

// premise a
assert true &&
    x7 = fuv,
    x8 * (const 64 2) = grs,
    x3 = (const 64 2) + delta
;


mov fuv x7;
mov grs x8;
mov delta x3;

// According to premise a

mov f_472_low60_40_low20_15 f_472_low60_40_low20_14;
mov u_512_527 u_512_526;
mov v_512_527 v_512_526;

asr g_472_low60_40_low20_15 g_472_low60_40_low20_14 1;
asr r_512_527 r_512_526 1;
asr s_512_527 s_512_526 1;
assert
    true
&&
    f_472_low60_40_low20_15 = f_472_low60_40_low20_14,
    u_512_527 = u_512_526,
    v_512_527 = v_512_526,
    g_472_low60_40_low20_15 * (const 64 2) = g_472_low60_40_low20_14,
    r_512_527 * (const 64 2) = r_512_526,
    s_512_527 * (const 64 2) = s_512_526
;

assume
    f_472_low60_40_low20_15 = f_472_low60_40_low20_14,
    u_512_527 = u_512_526,
    v_512_527 = v_512_526,
    g_472_low60_40_low20_15 * 2 = g_472_low60_40_low20_14,
    r_512_527 * 2 = r_512_526,
    s_512_527 * 2 = s_512_526
&&
    true
;

{
    u_512_527 * f_472_low60_40_low20_0 + v_512_527 * g_472_low60_40_low20_0 = f_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_512_527 * f_472_low60_40_low20_0 + s_512_527 * g_472_low60_40_low20_0 = g_472_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_40_low20_15 + u_512_527 * (const 64 (2**21)) + v_512_527 * (const 64 (2**42)),
    grs = g_472_low60_40_low20_15 + r_512_527 * (const 64 (2**21)) + s_512_527 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_40_low20_15,
    f_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_40_low20_15,
    g_472_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 527)) <=s delta, delta <=s (const 64 (1 + 2*527)),
    (const 64 (-(2**20))) <=s u_512_527, u_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_512_527, v_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_512_527, r_512_527 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_512_527, s_512_527 <=s (const 64 ((2**20))),
    u_512_527 + v_512_527 <=s (const 64 (2**20)),
    u_512_527 - v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 + v_512_527 <=s (const 64 (2**20)),
    (const 64 0) - u_512_527 - v_512_527 <=s (const 64 (2**20)),
    r_512_527 + s_512_527 <=s (const 64 (2**20)),
    r_512_527 - s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 + s_512_527 <=s (const 64 (2**20)),
    (const 64 0) - r_512_527 - s_512_527 <=s (const 64 (2**20)),
    u_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_512_527 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_512_527 = (const 64 0) (mod (const 64 (2**(20-15))))
}

