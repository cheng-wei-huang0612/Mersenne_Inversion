proc divstep_051_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_40_low20_0,
sint64 g_0_low60_40_low20_0,
sint64 f_0_low60_40_low20_11,
sint64 g_0_low60_40_low20_11,
sint64 f_0_low60_40_low20_12,
sint64 g_0_low60_40_low20_12,
sint64 u_40_51,
sint64 v_40_51,
sint64 r_40_51,
sint64 s_40_51,
sint64 u_40_52,
sint64 v_40_52,
sint64 r_40_52,
sint64 s_40_52,
bit ne
)={
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (-(2**20)),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (-(2**20))
&&
    u_40_51 * f_0_low60_40_low20_0 + v_40_51 * g_0_low60_40_low20_0 = f_0_low60_40_low20_11 * (const 64 (-(2**20))),
    r_40_51 * f_0_low60_40_low20_0 + s_40_51 * g_0_low60_40_low20_0 = g_0_low60_40_low20_11 * (const 64 (-(2**20))),
    fuv = f_0_low60_40_low20_11 + u_40_51 * (const 64 (2**21)) + v_40_51 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_11 + r_40_51 * (const 64 (2**21)) + s_40_51 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_40_low20_11,
    f_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_40_low20_11,
    g_0_low60_40_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 51)) <=s delta, delta <=s (const 64 (1 + 2*51)),
    (const 64 (-(2**20))) <=s u_40_51, u_40_51 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_40_51, v_40_51 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_40_51, r_40_51 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_40_51, s_40_51 <=s (const 64 ((2**20))),
    u_40_51 + v_40_51 <=s (const 64 (2**20)),
    u_40_51 - v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 + v_40_51 <=s (const 64 (2**20)),
    (const 64 0) - u_40_51 - v_40_51 <=s (const 64 (2**20)),
    r_40_51 + s_40_51 <=s (const 64 (2**20)),
    r_40_51 - s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 + s_40_51 <=s (const 64 (2**20)),
    (const 64 0) - r_40_51 - s_40_51 <=s (const 64 (2**20)),
    u_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_40_51 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_40_51 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step51

// premise b
assume
g_0_low60_40_low20_11 = 1 (mod 2)
&&
g_0_low60_40_low20_11 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_40_low20_12 f_0_low60_40_low20_11;
mov u_40_52 u_40_51;
mov v_40_52 v_40_51;

add g_0_low60_40_low20_12 g_0_low60_40_low20_11 f_0_low60_40_low20_11;
asr g_0_low60_40_low20_12 g_0_low60_40_low20_12 1;
add r_40_52 r_40_51 u_40_51;
asr r_40_52 r_40_52 1;
add s_40_52 s_40_51 v_40_51;
asr s_40_52 s_40_52 1;
assert
    true
&&
    f_0_low60_40_low20_12 = f_0_low60_40_low20_11,
    u_40_52 = u_40_51,
    v_40_52 = v_40_51,
    g_0_low60_40_low20_12 * (const 64 2) = g_0_low60_40_low20_11 + f_0_low60_40_low20_11,
    r_40_52 * (const 64 2) = r_40_51 + u_40_51,
    s_40_52 * (const 64 2) = s_40_51 + v_40_51
;

assume
    f_0_low60_40_low20_12 = f_0_low60_40_low20_11,
    u_40_52 = u_40_51,
    v_40_52 = v_40_51,
    g_0_low60_40_low20_12 * 2 = g_0_low60_40_low20_11 + f_0_low60_40_low20_11,
    r_40_52 * 2 = r_40_51 + u_40_51,
    s_40_52 * 2 = s_40_51 + v_40_51
&&
    true
;

{
    u_40_52 * f_0_low60_40_low20_0 + v_40_52 * g_0_low60_40_low20_0 = f_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_40_52 * f_0_low60_40_low20_0 + s_40_52 * g_0_low60_40_low20_0 = g_0_low60_40_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_40_low20_12 + u_40_52 * (const 64 (2**21)) + v_40_52 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_12 + r_40_52 * (const 64 (2**21)) + s_40_52 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_12,
    f_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_12,
    g_0_low60_40_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 52)) <=s delta, delta <=s (const 64 (1 + 2*52)),
    (const 64 (-(2**20))) <=s u_40_52, u_40_52 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_40_52, v_40_52 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_40_52, r_40_52 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_40_52, s_40_52 <=s (const 64 ((2**20))),
    u_40_52 + v_40_52 <=s (const 64 (2**20)),
    u_40_52 - v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 + v_40_52 <=s (const 64 (2**20)),
    (const 64 0) - u_40_52 - v_40_52 <=s (const 64 (2**20)),
    r_40_52 + s_40_52 <=s (const 64 (2**20)),
    r_40_52 - s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 + s_40_52 <=s (const 64 (2**20)),
    (const 64 0) - r_40_52 - s_40_52 <=s (const 64 (2**20)),
    u_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_40_52 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_40_52 = (const 64 0) (mod (const 64 (2**(20-12))))
}

