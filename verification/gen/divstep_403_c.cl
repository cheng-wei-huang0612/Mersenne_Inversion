proc divstep_403_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_354_low60_40_low20_0,
sint64 g_354_low60_40_low20_0,
sint64 f_354_low60_40_low20_9,
sint64 g_354_low60_40_low20_9,
sint64 f_354_low60_40_low20_10,
sint64 g_354_low60_40_low20_10,
sint64 u_394_403,
sint64 v_394_403,
sint64 r_394_403,
sint64 s_394_403,
sint64 u_394_404,
sint64 v_394_404,
sint64 r_394_404,
sint64 s_394_404,
bit ne
)={
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (-(2**20)),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (-(2**20))
&&
    u_394_403 * f_354_low60_40_low20_0 + v_394_403 * g_354_low60_40_low20_0 = f_354_low60_40_low20_9 * (const 64 (-(2**20))),
    r_394_403 * f_354_low60_40_low20_0 + s_394_403 * g_354_low60_40_low20_0 = g_354_low60_40_low20_9 * (const 64 (-(2**20))),
    fuv = f_354_low60_40_low20_9 + u_394_403 * (const 64 (2**21)) + v_394_403 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_9 + r_394_403 * (const 64 (2**21)) + s_394_403 * (const 64 (2**42)),
    const 64 0 <=s f_354_low60_40_low20_0,
    f_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_0,
    g_354_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_354_low60_40_low20_9,
    f_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_354_low60_40_low20_9,
    g_354_low60_40_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 403)) <=s delta, delta <=s (const 64 (1 + 2*403)),
    (const 64 (-(2**20))) <=s u_394_403, u_394_403 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_394_403, v_394_403 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_394_403, r_394_403 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_394_403, s_394_403 <=s (const 64 ((2**20))),
    u_394_403 + v_394_403 <=s (const 64 (2**20)),
    u_394_403 - v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 + v_394_403 <=s (const 64 (2**20)),
    (const 64 0) - u_394_403 - v_394_403 <=s (const 64 (2**20)),
    r_394_403 + s_394_403 <=s (const 64 (2**20)),
    r_394_403 - s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 + s_394_403 <=s (const 64 (2**20)),
    (const 64 0) - r_394_403 - s_394_403 <=s (const 64 (2**20)),
    u_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_394_403 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_394_403 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step403

// premise c
assume
g_354_low60_40_low20_9 = 1 (mod 2)
&&
g_354_low60_40_low20_9 = const 64 1 (mod (const 64 2)),
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

mov f_354_low60_40_low20_10 g_354_low60_40_low20_9;
mov u_394_404 r_394_403;
mov v_394_404 s_394_403;

subs dc g_354_low60_40_low20_10 g_354_low60_40_low20_9 f_354_low60_40_low20_9;
asr g_354_low60_40_low20_10 g_354_low60_40_low20_10 1;
subs dc r_394_404 r_394_403 u_394_403;
asr r_394_404 r_394_404 1;
subs dc s_394_404 s_394_403 v_394_403;
asr s_394_404 s_394_404 1;
assert
    true
&&
    f_354_low60_40_low20_10 = g_354_low60_40_low20_9,
    u_394_404 = r_394_403,
    v_394_404 = s_394_403,
    g_354_low60_40_low20_10 * (const 64 2) = g_354_low60_40_low20_9 - f_354_low60_40_low20_9,
    r_394_404 * (const 64 2) = r_394_403 - u_394_403,
    s_394_404 * (const 64 2) = s_394_403 - v_394_403
;

assume
    f_354_low60_40_low20_10 = g_354_low60_40_low20_9,
    u_394_404 = r_394_403,
    v_394_404 = s_394_403,
    g_354_low60_40_low20_10 * 2 = g_354_low60_40_low20_9 - f_354_low60_40_low20_9,
    r_394_404 * 2 = r_394_403 - u_394_403,
    s_394_404 * 2 = s_394_403 - v_394_403
&&
    true
;

{
    u_394_404 * f_354_low60_40_low20_0 + v_394_404 * g_354_low60_40_low20_0 = f_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_394_404 * f_354_low60_40_low20_0 + s_394_404 * g_354_low60_40_low20_0 = g_354_low60_40_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_354_low60_40_low20_10 + u_394_404 * (const 64 (2**21)) + v_394_404 * (const 64 (2**42)),
    grs = g_354_low60_40_low20_10 + r_394_404 * (const 64 (2**21)) + s_394_404 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_354_low60_40_low20_10,
    f_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_354_low60_40_low20_10,
    g_354_low60_40_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 404)) <=s delta, delta <=s (const 64 (1 + 2*404)),
    (const 64 (-(2**20))) <=s u_394_404, u_394_404 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_394_404, v_394_404 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_394_404, r_394_404 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_394_404, s_394_404 <=s (const 64 ((2**20))),
    u_394_404 + v_394_404 <=s (const 64 (2**20)),
    u_394_404 - v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 + v_394_404 <=s (const 64 (2**20)),
    (const 64 0) - u_394_404 - v_394_404 <=s (const 64 (2**20)),
    r_394_404 + s_394_404 <=s (const 64 (2**20)),
    r_394_404 - s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 + s_394_404 <=s (const 64 (2**20)),
    (const 64 0) - r_394_404 - s_394_404 <=s (const 64 (2**20)),
    u_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_394_404 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_394_404 = (const 64 0) (mod (const 64 (2**(20-10))))
}

