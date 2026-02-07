proc divstep_315_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_295_low60_20_low20_0,
sint64 g_295_low60_20_low20_0,
sint64 f_295_low60_20_low20_1,
sint64 g_295_low60_20_low20_1,
sint64 u_315_315,
sint64 v_315_315,
sint64 r_315_315,
sint64 s_315_315,
sint64 u_315_316,
sint64 v_315_316,
sint64 r_315_316,
sint64 s_315_316,
bit ne
)={
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (-(2**20)),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (-(2**20))
&&
    u_315_315 * f_295_low60_20_low20_0 + v_315_315 * g_295_low60_20_low20_0 = f_295_low60_20_low20_0 * (const 64 (-(2**20))),
    r_315_315 * f_295_low60_20_low20_0 + s_315_315 * g_295_low60_20_low20_0 = g_295_low60_20_low20_0 * (const 64 (-(2**20))),
    fuv = f_295_low60_20_low20_0 + u_315_315 * (const 64 (2**21)) + v_315_315 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_0 + r_315_315 * (const 64 (2**21)) + s_315_315 * (const 64 (2**42)),
    const 64 0 <=s f_295_low60_20_low20_0,
    f_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_295_low60_20_low20_0,
    g_295_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 315)) <=s delta, delta <=s (const 64 (1 + 2*315)),
    u_315_315 = (const 64 (-(2**20))),
    v_315_315 = (const 64 (0)),
    r_315_315 = (const 64 (0)),
    s_315_315 = (const 64 (-(2**20)))
}



// divsteps
// step315

// premise c
assume
g_295_low60_20_low20_0 = 1 (mod 2)
&&
g_295_low60_20_low20_0 = const 64 1 (mod (const 64 2)),
delta >=s (const 64 0)
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

mov f_295_low60_20_low20_1 g_295_low60_20_low20_0;
mov u_315_316 r_315_315;
mov v_315_316 s_315_315;

subs dc g_295_low60_20_low20_1 g_295_low60_20_low20_0 f_295_low60_20_low20_0;
asr g_295_low60_20_low20_1 g_295_low60_20_low20_1 1;
subs dc r_315_316 r_315_315 u_315_315;
asr r_315_316 r_315_316 1;
subs dc s_315_316 s_315_315 v_315_315;
asr s_315_316 s_315_316 1;
assert
    true
&&
    f_295_low60_20_low20_1 = g_295_low60_20_low20_0,
    u_315_316 = r_315_315,
    v_315_316 = s_315_315,
    g_295_low60_20_low20_1 * (const 64 2) = g_295_low60_20_low20_0 - f_295_low60_20_low20_0,
    r_315_316 * (const 64 2) = r_315_315 - u_315_315,
    s_315_316 * (const 64 2) = s_315_315 - v_315_315
;

assume
    f_295_low60_20_low20_1 = g_295_low60_20_low20_0,
    u_315_316 = r_315_315,
    v_315_316 = s_315_315,
    g_295_low60_20_low20_1 * 2 = g_295_low60_20_low20_0 - f_295_low60_20_low20_0,
    r_315_316 * 2 = r_315_315 - u_315_315,
    s_315_316 * 2 = s_315_315 - v_315_315
&&
    true
;

{
    u_315_316 * f_295_low60_20_low20_0 + v_315_316 * g_295_low60_20_low20_0 = f_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_315_316 * f_295_low60_20_low20_0 + s_315_316 * g_295_low60_20_low20_0 = g_295_low60_20_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_295_low60_20_low20_1 + u_315_316 * (const 64 (2**21)) + v_315_316 * (const 64 (2**42)),
    grs = g_295_low60_20_low20_1 + r_315_316 * (const 64 (2**21)) + s_315_316 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_295_low60_20_low20_1,
    f_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_295_low60_20_low20_1,
    g_295_low60_20_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 316)) <=s delta, delta <=s (const 64 (1 + 2*316)),
    (const 64 (-(2**20))) <=s u_315_316, u_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_315_316, v_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_315_316, r_315_316 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_315_316, s_315_316 <=s (const 64 ((2**20))),
    u_315_316 + v_315_316 <=s (const 64 (2**20)),
    u_315_316 - v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 + v_315_316 <=s (const 64 (2**20)),
    (const 64 0) - u_315_316 - v_315_316 <=s (const 64 (2**20)),
    r_315_316 + s_315_316 <=s (const 64 (2**20)),
    r_315_316 - s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 + s_315_316 <=s (const 64 (2**20)),
    (const 64 0) - r_315_316 - s_315_316 <=s (const 64 (2**20)),
    u_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_315_316 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_315_316 = (const 64 0) (mod (const 64 (2**(20-1))))
}

