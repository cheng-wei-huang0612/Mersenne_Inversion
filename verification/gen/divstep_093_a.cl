proc divstep_093_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_59_low60_20_low20_0,
sint64 g_59_low60_20_low20_0,
sint64 f_59_low60_20_low20_14,
sint64 g_59_low60_20_low20_14,
sint64 f_59_low60_20_low20_15,
sint64 g_59_low60_20_low20_15,
sint64 u_79_93,
sint64 v_79_93,
sint64 r_79_93,
sint64 s_79_93,
sint64 u_79_94,
sint64 v_79_94,
sint64 r_79_94,
sint64 s_79_94,
bit ne
)={
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (-(2**20)),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (-(2**20))
&&
    u_79_93 * f_59_low60_20_low20_0 + v_79_93 * g_59_low60_20_low20_0 = f_59_low60_20_low20_14 * (const 64 (-(2**20))),
    r_79_93 * f_59_low60_20_low20_0 + s_79_93 * g_59_low60_20_low20_0 = g_59_low60_20_low20_14 * (const 64 (-(2**20))),
    fuv = f_59_low60_20_low20_14 + u_79_93 * (const 64 (2**21)) + v_79_93 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_14 + r_79_93 * (const 64 (2**21)) + s_79_93 * (const 64 (2**42)),
    const 64 0 <=s f_59_low60_20_low20_0,
    f_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_0,
    g_59_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_59_low60_20_low20_14,
    f_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_59_low60_20_low20_14,
    g_59_low60_20_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 93)) <=s delta, delta <=s (const 64 (1 + 2*93)),
    (const 64 (-(2**20))) <=s u_79_93, u_79_93 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_79_93, v_79_93 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_79_93, r_79_93 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_79_93, s_79_93 <=s (const 64 ((2**20))),
    u_79_93 + v_79_93 <=s (const 64 (2**20)),
    u_79_93 - v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 + v_79_93 <=s (const 64 (2**20)),
    (const 64 0) - u_79_93 - v_79_93 <=s (const 64 (2**20)),
    r_79_93 + s_79_93 <=s (const 64 (2**20)),
    r_79_93 - s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 + s_79_93 <=s (const 64 (2**20)),
    (const 64 0) - r_79_93 - s_79_93 <=s (const 64 (2**20)),
    u_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_79_93 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_79_93 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step93

// premise a
assume
g_59_low60_20_low20_14 = 0 (mod 2)
&&
g_59_low60_20_low20_14 = const 64 0 (mod (const 64 2))
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

mov f_59_low60_20_low20_15 f_59_low60_20_low20_14;
mov u_79_94 u_79_93;
mov v_79_94 v_79_93;

asr g_59_low60_20_low20_15 g_59_low60_20_low20_14 1;
asr r_79_94 r_79_93 1;
asr s_79_94 s_79_93 1;
assert
    true
&&
    f_59_low60_20_low20_15 = f_59_low60_20_low20_14,
    u_79_94 = u_79_93,
    v_79_94 = v_79_93,
    g_59_low60_20_low20_15 * (const 64 2) = g_59_low60_20_low20_14,
    r_79_94 * (const 64 2) = r_79_93,
    s_79_94 * (const 64 2) = s_79_93
;

assume
    f_59_low60_20_low20_15 = f_59_low60_20_low20_14,
    u_79_94 = u_79_93,
    v_79_94 = v_79_93,
    g_59_low60_20_low20_15 * 2 = g_59_low60_20_low20_14,
    r_79_94 * 2 = r_79_93,
    s_79_94 * 2 = s_79_93
&&
    true
;

{
    u_79_94 * f_59_low60_20_low20_0 + v_79_94 * g_59_low60_20_low20_0 = f_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_79_94 * f_59_low60_20_low20_0 + s_79_94 * g_59_low60_20_low20_0 = g_59_low60_20_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_59_low60_20_low20_15 + u_79_94 * (const 64 (2**21)) + v_79_94 * (const 64 (2**42)),
    grs = g_59_low60_20_low20_15 + r_79_94 * (const 64 (2**21)) + s_79_94 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_59_low60_20_low20_15,
    f_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_59_low60_20_low20_15,
    g_59_low60_20_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 94)) <=s delta, delta <=s (const 64 (1 + 2*94)),
    (const 64 (-(2**20))) <=s u_79_94, u_79_94 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_79_94, v_79_94 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_79_94, r_79_94 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_79_94, s_79_94 <=s (const 64 ((2**20))),
    u_79_94 + v_79_94 <=s (const 64 (2**20)),
    u_79_94 - v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 + v_79_94 <=s (const 64 (2**20)),
    (const 64 0) - u_79_94 - v_79_94 <=s (const 64 (2**20)),
    r_79_94 + s_79_94 <=s (const 64 (2**20)),
    r_79_94 - s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 + s_79_94 <=s (const 64 (2**20)),
    (const 64 0) - r_79_94 - s_79_94 <=s (const 64 (2**20)),
    u_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_79_94 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_79_94 = (const 64 0) (mod (const 64 (2**(20-15))))
}

