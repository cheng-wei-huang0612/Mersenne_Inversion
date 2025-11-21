proc divstep_483_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_472_low60_0_low20_0,
sint64 g_472_low60_0_low20_0,
sint64 f_472_low60_0_low20_11,
sint64 g_472_low60_0_low20_11,
sint64 f_472_low60_0_low20_12,
sint64 g_472_low60_0_low20_12,
sint64 u_472_483,
sint64 v_472_483,
sint64 r_472_483,
sint64 s_472_483,
sint64 u_472_484,
sint64 v_472_484,
sint64 r_472_484,
sint64 s_472_484,
bit ne
)={
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (-(2**20)),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (-(2**20))
&&
    u_472_483 * f_472_low60_0_low20_0 + v_472_483 * g_472_low60_0_low20_0 = f_472_low60_0_low20_11 * (const 64 (-(2**20))),
    r_472_483 * f_472_low60_0_low20_0 + s_472_483 * g_472_low60_0_low20_0 = g_472_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = f_472_low60_0_low20_11 + u_472_483 * (const 64 (2**21)) + v_472_483 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_11 + r_472_483 * (const 64 (2**21)) + s_472_483 * (const 64 (2**42)),
    const 64 0 <=s f_472_low60_0_low20_0,
    f_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_0,
    g_472_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_472_low60_0_low20_11,
    f_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_472_low60_0_low20_11,
    g_472_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 483)) <=s delta, delta <=s (const 64 (1 + 2*483)),
    (const 64 (-(2**20))) <=s u_472_483, u_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_483, v_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_483, r_472_483 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_483, s_472_483 <=s (const 64 ((2**20))),
    u_472_483 + v_472_483 <=s (const 64 (2**20)),
    u_472_483 - v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 + v_472_483 <=s (const 64 (2**20)),
    (const 64 0) - u_472_483 - v_472_483 <=s (const 64 (2**20)),
    r_472_483 + s_472_483 <=s (const 64 (2**20)),
    r_472_483 - s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 + s_472_483 <=s (const 64 (2**20)),
    (const 64 0) - r_472_483 - s_472_483 <=s (const 64 (2**20)),
    u_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_472_483 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_472_483 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step483

// premise a
assume
g_472_low60_0_low20_11 = 0 (mod 2)
&&
g_472_low60_0_low20_11 = const 64 0 (mod (const 64 2))
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

mov f_472_low60_0_low20_12 f_472_low60_0_low20_11;
mov u_472_484 u_472_483;
mov v_472_484 v_472_483;

asr g_472_low60_0_low20_12 g_472_low60_0_low20_11 1;
asr r_472_484 r_472_483 1;
asr s_472_484 s_472_483 1;
assert
    true
&&
    f_472_low60_0_low20_12 = f_472_low60_0_low20_11,
    u_472_484 = u_472_483,
    v_472_484 = v_472_483,
    g_472_low60_0_low20_12 * (const 64 2) = g_472_low60_0_low20_11,
    r_472_484 * (const 64 2) = r_472_483,
    s_472_484 * (const 64 2) = s_472_483
;

assume
    f_472_low60_0_low20_12 = f_472_low60_0_low20_11,
    u_472_484 = u_472_483,
    v_472_484 = v_472_483,
    g_472_low60_0_low20_12 * 2 = g_472_low60_0_low20_11,
    r_472_484 * 2 = r_472_483,
    s_472_484 * 2 = s_472_483
&&
    true
;

{
    u_472_484 * f_472_low60_0_low20_0 + v_472_484 * g_472_low60_0_low20_0 = f_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_472_484 * f_472_low60_0_low20_0 + s_472_484 * g_472_low60_0_low20_0 = g_472_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_472_low60_0_low20_12 + u_472_484 * (const 64 (2**21)) + v_472_484 * (const 64 (2**42)),
    grs = g_472_low60_0_low20_12 + r_472_484 * (const 64 (2**21)) + s_472_484 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_472_low60_0_low20_12,
    f_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_472_low60_0_low20_12,
    g_472_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 484)) <=s delta, delta <=s (const 64 (1 + 2*484)),
    (const 64 (-(2**20))) <=s u_472_484, u_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_472_484, v_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_472_484, r_472_484 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_472_484, s_472_484 <=s (const 64 ((2**20))),
    u_472_484 + v_472_484 <=s (const 64 (2**20)),
    u_472_484 - v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 + v_472_484 <=s (const 64 (2**20)),
    (const 64 0) - u_472_484 - v_472_484 <=s (const 64 (2**20)),
    r_472_484 + s_472_484 <=s (const 64 (2**20)),
    r_472_484 - s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 + s_472_484 <=s (const 64 (2**20)),
    (const 64 0) - r_472_484 - s_472_484 <=s (const 64 (2**20)),
    u_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_472_484 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_472_484 = (const 64 0) (mod (const 64 (2**(20-12))))
}

