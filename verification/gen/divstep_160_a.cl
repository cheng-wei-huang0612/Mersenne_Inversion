proc divstep_160_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_118_low60_40_low20_0,
sint64 g_118_low60_40_low20_0,
sint64 f_118_low60_40_low20_2,
sint64 g_118_low60_40_low20_2,
sint64 f_118_low60_40_low20_3,
sint64 g_118_low60_40_low20_3,
sint64 u_158_160,
sint64 v_158_160,
sint64 r_158_160,
sint64 s_158_160,
sint64 u_158_161,
sint64 v_158_161,
sint64 r_158_161,
sint64 s_158_161,
bit ne
)={
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (-(2**20)),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (-(2**20))
&&
    u_158_160 * f_118_low60_40_low20_0 + v_158_160 * g_118_low60_40_low20_0 = f_118_low60_40_low20_2 * (const 64 (-(2**20))),
    r_158_160 * f_118_low60_40_low20_0 + s_158_160 * g_118_low60_40_low20_0 = g_118_low60_40_low20_2 * (const 64 (-(2**20))),
    fuv = f_118_low60_40_low20_2 + u_158_160 * (const 64 (2**21)) + v_158_160 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_2 + r_158_160 * (const 64 (2**21)) + s_158_160 * (const 64 (2**42)),
    const 64 0 <=s f_118_low60_40_low20_0,
    f_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_0,
    g_118_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_118_low60_40_low20_2,
    f_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_118_low60_40_low20_2,
    g_118_low60_40_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 160)) <=s delta, delta <=s (const 64 (1 + 2*160)),
    (const 64 (-(2**20))) <=s u_158_160, u_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_160, v_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_160, r_158_160 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_160, s_158_160 <=s (const 64 ((2**20))),
    u_158_160 + v_158_160 <=s (const 64 (2**20)),
    u_158_160 - v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 + v_158_160 <=s (const 64 (2**20)),
    (const 64 0) - u_158_160 - v_158_160 <=s (const 64 (2**20)),
    r_158_160 + s_158_160 <=s (const 64 (2**20)),
    r_158_160 - s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 + s_158_160 <=s (const 64 (2**20)),
    (const 64 0) - r_158_160 - s_158_160 <=s (const 64 (2**20)),
    u_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_158_160 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_158_160 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step160

// premise a
assume
g_118_low60_40_low20_2 = 0 (mod 2)
&&
g_118_low60_40_low20_2 = const 64 0 (mod (const 64 2))
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

mov f_118_low60_40_low20_3 f_118_low60_40_low20_2;
mov u_158_161 u_158_160;
mov v_158_161 v_158_160;

asr g_118_low60_40_low20_3 g_118_low60_40_low20_2 1;
asr r_158_161 r_158_160 1;
asr s_158_161 s_158_160 1;
assert
    true
&&
    f_118_low60_40_low20_3 = f_118_low60_40_low20_2,
    u_158_161 = u_158_160,
    v_158_161 = v_158_160,
    g_118_low60_40_low20_3 * (const 64 2) = g_118_low60_40_low20_2,
    r_158_161 * (const 64 2) = r_158_160,
    s_158_161 * (const 64 2) = s_158_160
;

assume
    f_118_low60_40_low20_3 = f_118_low60_40_low20_2,
    u_158_161 = u_158_160,
    v_158_161 = v_158_160,
    g_118_low60_40_low20_3 * 2 = g_118_low60_40_low20_2,
    r_158_161 * 2 = r_158_160,
    s_158_161 * 2 = s_158_160
&&
    true
;

{
    u_158_161 * f_118_low60_40_low20_0 + v_158_161 * g_118_low60_40_low20_0 = f_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_158_161 * f_118_low60_40_low20_0 + s_158_161 * g_118_low60_40_low20_0 = g_118_low60_40_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_118_low60_40_low20_3 + u_158_161 * (const 64 (2**21)) + v_158_161 * (const 64 (2**42)),
    grs = g_118_low60_40_low20_3 + r_158_161 * (const 64 (2**21)) + s_158_161 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_118_low60_40_low20_3,
    f_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_118_low60_40_low20_3,
    g_118_low60_40_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 161)) <=s delta, delta <=s (const 64 (1 + 2*161)),
    (const 64 (-(2**20))) <=s u_158_161, u_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_158_161, v_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_158_161, r_158_161 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_158_161, s_158_161 <=s (const 64 ((2**20))),
    u_158_161 + v_158_161 <=s (const 64 (2**20)),
    u_158_161 - v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 + v_158_161 <=s (const 64 (2**20)),
    (const 64 0) - u_158_161 - v_158_161 <=s (const 64 (2**20)),
    r_158_161 + s_158_161 <=s (const 64 (2**20)),
    r_158_161 - s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 + s_158_161 <=s (const 64 (2**20)),
    (const 64 0) - r_158_161 - s_158_161 <=s (const 64 (2**20)),
    u_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_158_161 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_158_161 = (const 64 0) (mod (const 64 (2**(20-3))))
}

