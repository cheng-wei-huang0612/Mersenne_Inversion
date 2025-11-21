proc divstep_244_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_236_low60_0_low20_0,
sint64 g_236_low60_0_low20_0,
sint64 f_236_low60_0_low20_8,
sint64 g_236_low60_0_low20_8,
sint64 f_236_low60_0_low20_9,
sint64 g_236_low60_0_low20_9,
sint64 u_236_244,
sint64 v_236_244,
sint64 r_236_244,
sint64 s_236_244,
sint64 u_236_245,
sint64 v_236_245,
sint64 r_236_245,
sint64 s_236_245,
bit ne
)={
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (-(2**20)),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (-(2**20))
&&
    u_236_244 * f_236_low60_0_low20_0 + v_236_244 * g_236_low60_0_low20_0 = f_236_low60_0_low20_8 * (const 64 (-(2**20))),
    r_236_244 * f_236_low60_0_low20_0 + s_236_244 * g_236_low60_0_low20_0 = g_236_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = f_236_low60_0_low20_8 + u_236_244 * (const 64 (2**21)) + v_236_244 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_8 + r_236_244 * (const 64 (2**21)) + s_236_244 * (const 64 (2**42)),
    const 64 0 <=s f_236_low60_0_low20_0,
    f_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_0,
    g_236_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_236_low60_0_low20_8,
    f_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_236_low60_0_low20_8,
    g_236_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 244)) <=s delta, delta <=s (const 64 (1 + 2*244)),
    (const 64 (-(2**20))) <=s u_236_244, u_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_244, v_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_244, r_236_244 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_244, s_236_244 <=s (const 64 ((2**20))),
    u_236_244 + v_236_244 <=s (const 64 (2**20)),
    u_236_244 - v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 + v_236_244 <=s (const 64 (2**20)),
    (const 64 0) - u_236_244 - v_236_244 <=s (const 64 (2**20)),
    r_236_244 + s_236_244 <=s (const 64 (2**20)),
    r_236_244 - s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 + s_236_244 <=s (const 64 (2**20)),
    (const 64 0) - r_236_244 - s_236_244 <=s (const 64 (2**20)),
    u_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_236_244 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_236_244 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step8

// premise c
assume
g_236_low60_0_low20_8 = 1 (mod 2)
&&
g_236_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
delta >=s (const 64 0)
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

mov f_236_low60_0_low20_9 g_236_low60_0_low20_8;
mov u_236_245 r_236_244;
mov v_236_245 s_236_244;

subs dc g_236_low60_0_low20_9 g_236_low60_0_low20_8 f_236_low60_0_low20_8;
asr g_236_low60_0_low20_9 g_236_low60_0_low20_9 1;
subs dc r_236_245 r_236_244 u_236_244;
asr r_236_245 r_236_245 1;
subs dc s_236_245 s_236_244 v_236_244;
asr s_236_245 s_236_245 1;
assert
    true
&&
    f_236_low60_0_low20_9 = g_236_low60_0_low20_8,
    u_236_245 = r_236_244,
    v_236_245 = s_236_244,
    g_236_low60_0_low20_9 * (const 64 2) = g_236_low60_0_low20_8 - f_236_low60_0_low20_8,
    r_236_245 * (const 64 2) = r_236_244 - u_236_244,
    s_236_245 * (const 64 2) = s_236_244 - v_236_244
;

assume
    f_236_low60_0_low20_9 = g_236_low60_0_low20_8,
    u_236_245 = r_236_244,
    v_236_245 = s_236_244,
    g_236_low60_0_low20_9 * 2 = g_236_low60_0_low20_8 - f_236_low60_0_low20_8,
    r_236_245 * 2 = r_236_244 - u_236_244,
    s_236_245 * 2 = s_236_244 - v_236_244
&&
    true
;

{
    u_236_245 * f_236_low60_0_low20_0 + v_236_245 * g_236_low60_0_low20_0 = f_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_236_245 * f_236_low60_0_low20_0 + s_236_245 * g_236_low60_0_low20_0 = g_236_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_236_low60_0_low20_9 + u_236_245 * (const 64 (2**21)) + v_236_245 * (const 64 (2**42)),
    grs = g_236_low60_0_low20_9 + r_236_245 * (const 64 (2**21)) + s_236_245 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_236_low60_0_low20_9,
    f_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_236_low60_0_low20_9,
    g_236_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 245)) <=s delta, delta <=s (const 64 (1 + 2*245)),
    (const 64 (-(2**20))) <=s u_236_245, u_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_236_245, v_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_236_245, r_236_245 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_236_245, s_236_245 <=s (const 64 ((2**20))),
    u_236_245 + v_236_245 <=s (const 64 (2**20)),
    u_236_245 - v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 + v_236_245 <=s (const 64 (2**20)),
    (const 64 0) - u_236_245 - v_236_245 <=s (const 64 (2**20)),
    r_236_245 + s_236_245 <=s (const 64 (2**20)),
    r_236_245 - s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 + s_236_245 <=s (const 64 (2**20)),
    (const 64 0) - r_236_245 - s_236_245 <=s (const 64 (2**20)),
    u_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_236_245 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_236_245 = (const 64 0) (mod (const 64 (2**(20-9))))
}

