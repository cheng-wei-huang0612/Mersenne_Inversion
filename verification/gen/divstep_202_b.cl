proc divstep_202_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_177_low60_20_low20_0,
sint64 g_177_low60_20_low20_0,
sint64 f_177_low60_20_low20_5,
sint64 g_177_low60_20_low20_5,
sint64 f_177_low60_20_low20_6,
sint64 g_177_low60_20_low20_6,
sint64 u_197_202,
sint64 v_197_202,
sint64 r_197_202,
sint64 s_197_202,
sint64 u_197_203,
sint64 v_197_203,
sint64 r_197_203,
sint64 s_197_203,
bit ne
)={
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (-(2**20)),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (-(2**20))
&&
    u_197_202 * f_177_low60_20_low20_0 + v_197_202 * g_177_low60_20_low20_0 = f_177_low60_20_low20_5 * (const 64 (-(2**20))),
    r_197_202 * f_177_low60_20_low20_0 + s_197_202 * g_177_low60_20_low20_0 = g_177_low60_20_low20_5 * (const 64 (-(2**20))),
    fuv = f_177_low60_20_low20_5 + u_197_202 * (const 64 (2**21)) + v_197_202 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_5 + r_197_202 * (const 64 (2**21)) + s_197_202 * (const 64 (2**42)),
    const 64 0 <=s f_177_low60_20_low20_0,
    f_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_0,
    g_177_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_177_low60_20_low20_5,
    f_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_177_low60_20_low20_5,
    g_177_low60_20_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 202)) <=s delta, delta <=s (const 64 (1 + 2*202)),
    (const 64 (-(2**20))) <=s u_197_202, u_197_202 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_197_202, v_197_202 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_197_202, r_197_202 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_197_202, s_197_202 <=s (const 64 ((2**20))),
    u_197_202 + v_197_202 <=s (const 64 (2**20)),
    u_197_202 - v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 + v_197_202 <=s (const 64 (2**20)),
    (const 64 0) - u_197_202 - v_197_202 <=s (const 64 (2**20)),
    r_197_202 + s_197_202 <=s (const 64 (2**20)),
    r_197_202 - s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 + s_197_202 <=s (const 64 (2**20)),
    (const 64 0) - r_197_202 - s_197_202 <=s (const 64 (2**20)),
    u_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_197_202 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_197_202 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step202

// premise b
assume
g_177_low60_20_low20_5 = 1 (mod 2)
&&
g_177_low60_20_low20_5 = const 64 1 (mod (const 64 2)),
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

mov f_177_low60_20_low20_6 f_177_low60_20_low20_5;
mov u_197_203 u_197_202;
mov v_197_203 v_197_202;

add g_177_low60_20_low20_6 g_177_low60_20_low20_5 f_177_low60_20_low20_5;
asr g_177_low60_20_low20_6 g_177_low60_20_low20_6 1;
add r_197_203 r_197_202 u_197_202;
asr r_197_203 r_197_203 1;
add s_197_203 s_197_202 v_197_202;
asr s_197_203 s_197_203 1;
assert
    true
&&
    f_177_low60_20_low20_6 = f_177_low60_20_low20_5,
    u_197_203 = u_197_202,
    v_197_203 = v_197_202,
    g_177_low60_20_low20_6 * (const 64 2) = g_177_low60_20_low20_5 + f_177_low60_20_low20_5,
    r_197_203 * (const 64 2) = r_197_202 + u_197_202,
    s_197_203 * (const 64 2) = s_197_202 + v_197_202
;

assume
    f_177_low60_20_low20_6 = f_177_low60_20_low20_5,
    u_197_203 = u_197_202,
    v_197_203 = v_197_202,
    g_177_low60_20_low20_6 * 2 = g_177_low60_20_low20_5 + f_177_low60_20_low20_5,
    r_197_203 * 2 = r_197_202 + u_197_202,
    s_197_203 * 2 = s_197_202 + v_197_202
&&
    true
;

{
    u_197_203 * f_177_low60_20_low20_0 + v_197_203 * g_177_low60_20_low20_0 = f_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_197_203 * f_177_low60_20_low20_0 + s_197_203 * g_177_low60_20_low20_0 = g_177_low60_20_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_177_low60_20_low20_6 + u_197_203 * (const 64 (2**21)) + v_197_203 * (const 64 (2**42)),
    grs = g_177_low60_20_low20_6 + r_197_203 * (const 64 (2**21)) + s_197_203 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_177_low60_20_low20_6,
    f_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_177_low60_20_low20_6,
    g_177_low60_20_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 203)) <=s delta, delta <=s (const 64 (1 + 2*203)),
    (const 64 (-(2**20))) <=s u_197_203, u_197_203 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_197_203, v_197_203 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_197_203, r_197_203 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_197_203, s_197_203 <=s (const 64 ((2**20))),
    u_197_203 + v_197_203 <=s (const 64 (2**20)),
    u_197_203 - v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 + v_197_203 <=s (const 64 (2**20)),
    (const 64 0) - u_197_203 - v_197_203 <=s (const 64 (2**20)),
    r_197_203 + s_197_203 <=s (const 64 (2**20)),
    r_197_203 - s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 + s_197_203 <=s (const 64 (2**20)),
    (const 64 0) - r_197_203 - s_197_203 <=s (const 64 (2**20)),
    u_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_197_203 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_197_203 = (const 64 0) (mod (const 64 (2**(20-6))))
}

