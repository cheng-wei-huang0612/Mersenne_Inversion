proc divstep_03_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_3,
sint64 g_0_low60_0_low20_3,
sint64 f_0_low60_0_low20_4,
sint64 g_0_low60_0_low20_4,
sint64 u_0_3,
sint64 v_0_3,
sint64 r_0_3,
sint64 s_0_3,
sint64 u_0_4,
sint64 v_0_4,
sint64 r_0_4,
sint64 s_0_4,
bit ne
)={
    u_0_3 * f_0_low60_0_low20_0 + v_0_3 * g_0_low60_0_low20_0 = f_0_low60_0_low20_3 * (-(2**20)),
    r_0_3 * f_0_low60_0_low20_0 + s_0_3 * g_0_low60_0_low20_0 = g_0_low60_0_low20_3 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_3 + u_0_3 * (const 64 (2**21)) + v_0_3 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_3 + r_0_3 * (const 64 (2**21)) + s_0_3 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s f_0_low60_0_low20_3,
    f_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_3,
    g_0_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 3)) <=s delta, delta <=s (const 64 (1 + 2*3)),
    (const 64 (-(2**20))) <=s u_0_3, u_0_3 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_3, v_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)) )),
    (const 64 ((2**(20-3))-(2**20))) <=s r_0_3, r_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**20))) <=s s_0_3, s_0_3 <=s (const 64 ((2**19) - (2**(20 - 3)))),
    (const 64 ((2**(20-3))-(2**19))) <=s (r_0_3 - u_0_3), (r_0_3 - u_0_3) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_3 - v_0_3), (s_0_3 - v_0_3) <=s (const 64 ((2**20) - (2**(20 - 3)))),
    u_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_0_3 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_0_3 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step3

// premise c
assume
    g_0_low60_0_low20_3 = 1 (mod 2)
&&
    g_0_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov f_0_low60_0_low20_4 g_0_low60_0_low20_3;
mov u_0_4 r_0_3;
mov v_0_4 s_0_3;

subs dc g_0_low60_0_low20_4 g_0_low60_0_low20_3 f_0_low60_0_low20_3;
asr g_0_low60_0_low20_4 g_0_low60_0_low20_4 1;
subs dc r_0_4 r_0_3 u_0_3;
asr r_0_4 r_0_4 1;
subs dc s_0_4 s_0_3 v_0_3;
asr s_0_4 s_0_4 1;
assert
    true
&&
    f_0_low60_0_low20_4 = g_0_low60_0_low20_3,
    u_0_4 = r_0_3,
    v_0_4 = s_0_3,
    g_0_low60_0_low20_4 * (const 64 2) = g_0_low60_0_low20_3 - f_0_low60_0_low20_3,
    r_0_4 * (const 64 2) = r_0_3 - u_0_3,
    s_0_4 * (const 64 2) = s_0_3 - v_0_3
;

assume
    f_0_low60_0_low20_4 = g_0_low60_0_low20_3,
    u_0_4 = r_0_3,
    v_0_4 = s_0_3,
    g_0_low60_0_low20_4 * 2 = g_0_low60_0_low20_3 - f_0_low60_0_low20_3,
    r_0_4 * 2 = r_0_3 - u_0_3,
    s_0_4 * 2 = s_0_3 - v_0_3
&&
    true
;

{
    u_0_4 * f_0_low60_0_low20_0 + v_0_4 * g_0_low60_0_low20_0 = f_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_0_4 * f_0_low60_0_low20_0 + s_0_4 * g_0_low60_0_low20_0 = g_0_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = f_0_low60_0_low20_4 + u_0_4 * (const 64 (2**21)) + v_0_4 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_4 + r_0_4 * (const 64 (2**21)) + s_0_4 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_4,
    f_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_4,
    g_0_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 4)) <=s delta, delta <=s (const 64 (1 + 2*4)),
    (const 64 (-(2**20))) <=s u_0_4, u_0_4 <=s (const 64 ((2**19))),
    (const 64 (-(2**20))) <=s v_0_4, v_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)) )),
    (const 64 ((2**(20-4))-(2**20))) <=s r_0_4, r_0_4 <=s (const 64 ((2**19))),
    (const 64 ((2**(20-4))-(2**20))) <=s s_0_4, s_0_4 <=s (const 64 ((2**19) - (2**(20 - 4)))),
    (const 64 ((2**(20-4))-(2**19))) <=s (r_0_4 - u_0_4), (r_0_4 - u_0_4) <=s (const 64 ((2**20))),
    (const 64 (-(2**19))) <=s (s_0_4 - v_0_4), (s_0_4 - v_0_4) <=s (const 64 ((2**20) - (2**(20 - 4)))),
    u_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_0_4 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_0_4 = (const 64 0) (mod (const 64 (2**(20-4))))
}

