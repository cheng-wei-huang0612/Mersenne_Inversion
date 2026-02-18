proc divstep_373_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_0_low20_0,
sint64 g_354_low60_0_low20_0,
sint64 f_354_low60_0_low20_19,
sint64 g_354_low60_0_low20_19,
sint64 f_354_low60_0_low20_20,
sint64 g_354_low60_0_low20_20,
sint64 u_354_373,
sint64 v_354_373,
sint64 r_354_373,
sint64 s_354_373,
sint64 u_354_374,
sint64 v_354_374,
sint64 r_354_374,
sint64 s_354_374,
bit ne
)={
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (-(2**20)),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (-(2**20))
&&
    u_354_373 * f_354_low60_0_low20_0 + v_354_373 * g_354_low60_0_low20_0 = f_354_low60_0_low20_19 * (const 64 (-(2**20))),
    r_354_373 * f_354_low60_0_low20_0 + s_354_373 * g_354_low60_0_low20_0 = g_354_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = f_354_low60_0_low20_19 + u_354_373 * (const 64 (2**21)) + v_354_373 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_19 + r_354_373 * (const 64 (2**21)) + s_354_373 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_0_low20_0,
    f_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_0,
    g_354_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_0_low20_19,
    f_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_0_low20_19,
    g_354_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 373)) <=s delta, delta <=s (const 64 (1 + 2*373)),
    (const 64 (-(2**20))) <=s u_354_373, u_354_373 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_354_373, v_354_373 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_354_373, r_354_373 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_354_373, s_354_373 <=s (const 64 ((2**20)-1)),
    u_354_373 + v_354_373 <=s (const 64 (2**20)),
    u_354_373 - v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 + v_354_373 <=s (const 64 (2**20)),
    (const 64 0) - u_354_373 - v_354_373 <=s (const 64 (2**20)),
    r_354_373 + s_354_373 <=s (const 64 (2**20)),
    r_354_373 - s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 + s_354_373 <=s (const 64 (2**20)),
    (const 64 0) - r_354_373 - s_354_373 <=s (const 64 (2**20)),
    u_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_354_373 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_354_373 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step373

// premise a
assume
g_354_low60_0_low20_19 = 0 (mod 2)
&&
g_354_low60_0_low20_19 = const 64 0 (mod (const 64 2))
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

mov f_354_low60_0_low20_20 f_354_low60_0_low20_19;
mov u_354_374 u_354_373;
mov v_354_374 v_354_373;

asr g_354_low60_0_low20_20 g_354_low60_0_low20_19 1;
asr r_354_374 r_354_373 1;
asr s_354_374 s_354_373 1;
assert
    true
&&
    f_354_low60_0_low20_20 = f_354_low60_0_low20_19,
    u_354_374 = u_354_373,
    v_354_374 = v_354_373,
    g_354_low60_0_low20_20 * (const 64 2) = g_354_low60_0_low20_19,
    r_354_374 * (const 64 2) = r_354_373,
    s_354_374 * (const 64 2) = s_354_373
;

assume
    f_354_low60_0_low20_20 = f_354_low60_0_low20_19,
    u_354_374 = u_354_373,
    v_354_374 = v_354_373,
    g_354_low60_0_low20_20 * 2 = g_354_low60_0_low20_19,
    r_354_374 * 2 = r_354_373,
    s_354_374 * 2 = s_354_373
&&
    true
;

{
    u_354_374 * f_354_low60_0_low20_0 + v_354_374 * g_354_low60_0_low20_0 = f_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_354_374 * f_354_low60_0_low20_0 + s_354_374 * g_354_low60_0_low20_0 = g_354_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_0_low20_20 + u_354_374 * (const 64 (2**21)) + v_354_374 * (const 64 (2**42)),
    grs = g_354_low60_0_low20_20 + r_354_374 * (const 64 (2**21)) + s_354_374 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_0_low20_20,
    f_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_0_low20_20,
    g_354_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 374)) <=s delta, delta <=s (const 64 (1 + 2*374)),
    (const 64 (-(2**20))) <=s u_354_374, u_354_374 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_354_374, v_354_374 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_354_374, r_354_374 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_354_374, s_354_374 <=s (const 64 ((2**20)-1)),
    u_354_374 + v_354_374 <=s (const 64 (2**20)),
    u_354_374 - v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 + v_354_374 <=s (const 64 (2**20)),
    (const 64 0) - u_354_374 - v_354_374 <=s (const 64 (2**20)),
    r_354_374 + s_354_374 <=s (const 64 (2**20)),
    r_354_374 - s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 + s_354_374 <=s (const 64 (2**20)),
    (const 64 0) - r_354_374 - s_354_374 <=s (const 64 (2**20)),
    u_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_354_374 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_354_374 = (const 64 0) (mod (const 64 (2**(20-20))))
}

