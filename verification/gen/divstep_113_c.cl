proc divstep_113_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_59_low60_40_low20_0,
sint64 neg_g_59_low60_40_low20_0,
sint64 neg_f_59_low60_40_low20_14,
sint64 neg_g_59_low60_40_low20_14,
sint64 neg_f_59_low60_40_low20_15,
sint64 neg_g_59_low60_40_low20_15,
sint64 u_99_113,
sint64 v_99_113,
sint64 r_99_113,
sint64 s_99_113,
sint64 u_99_114,
sint64 v_99_114,
sint64 r_99_114,
sint64 s_99_114,
bit ne
)={
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (-(2**20)),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (-(2**20))
&&
    u_99_113 * neg_f_59_low60_40_low20_0 + v_99_113 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_14 * (const 64 (-(2**20))),
    r_99_113 * neg_f_59_low60_40_low20_0 + s_99_113 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_59_low60_40_low20_14 + u_99_113 * (const 64 (2**21)) + v_99_113 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_14 + r_99_113 * (const 64 (2**21)) + s_99_113 * (const 64 (2**42)),
    const 64 0 <=s neg_f_59_low60_40_low20_0,
    neg_f_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_0,
    neg_g_59_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_59_low60_40_low20_14,
    neg_f_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_59_low60_40_low20_14,
    neg_g_59_low60_40_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 113)) <=s delta, delta <=s (const 64 (1 + 2*113)),
    (const 64 (-(2**20))) <=s u_99_113, u_99_113 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_99_113, v_99_113 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_99_113, r_99_113 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_99_113, s_99_113 <=s (const 64 ((2**20))),
    u_99_113 + v_99_113 <=s (const 64 (2**20)),
    u_99_113 - v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 + v_99_113 <=s (const 64 (2**20)),
    (const 64 0) - u_99_113 - v_99_113 <=s (const 64 (2**20)),
    r_99_113 + s_99_113 <=s (const 64 (2**20)),
    r_99_113 - s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 + s_99_113 <=s (const 64 (2**20)),
    (const 64 0) - r_99_113 - s_99_113 <=s (const 64 (2**20)),
    u_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_99_113 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_99_113 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step113

// premise c
assume
neg_g_59_low60_40_low20_14 = 1 (mod 2)
&&
neg_g_59_low60_40_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_59_low60_40_low20_15 neg_g_59_low60_40_low20_14;
mov u_99_114 r_99_113;
mov v_99_114 s_99_113;

subs dc neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_14 neg_f_59_low60_40_low20_14;
asr neg_g_59_low60_40_low20_15 neg_g_59_low60_40_low20_15 1;
subs dc r_99_114 r_99_113 u_99_113;
asr r_99_114 r_99_114 1;
subs dc s_99_114 s_99_113 v_99_113;
asr s_99_114 s_99_114 1;
assert
    true
&&
    neg_f_59_low60_40_low20_15 = neg_g_59_low60_40_low20_14,
    u_99_114 = r_99_113,
    v_99_114 = s_99_113,
    neg_g_59_low60_40_low20_15 * (const 64 2) = neg_g_59_low60_40_low20_14 - neg_f_59_low60_40_low20_14,
    r_99_114 * (const 64 2) = r_99_113 - u_99_113,
    s_99_114 * (const 64 2) = s_99_113 - v_99_113
;

assume
    neg_f_59_low60_40_low20_15 = neg_g_59_low60_40_low20_14,
    u_99_114 = r_99_113,
    v_99_114 = s_99_113,
    neg_g_59_low60_40_low20_15 * 2 = neg_g_59_low60_40_low20_14 - neg_f_59_low60_40_low20_14,
    r_99_114 * 2 = r_99_113 - u_99_113,
    s_99_114 * 2 = s_99_113 - v_99_113
&&
    true
;

{
    u_99_114 * neg_f_59_low60_40_low20_0 + v_99_114 * neg_g_59_low60_40_low20_0 = neg_f_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_99_114 * neg_f_59_low60_40_low20_0 + s_99_114 * neg_g_59_low60_40_low20_0 = neg_g_59_low60_40_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_59_low60_40_low20_15 + u_99_114 * (const 64 (2**21)) + v_99_114 * (const 64 (2**42)),
    grs = neg_g_59_low60_40_low20_15 + r_99_114 * (const 64 (2**21)) + s_99_114 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_59_low60_40_low20_15,
    neg_f_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_59_low60_40_low20_15,
    neg_g_59_low60_40_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 114)) <=s delta, delta <=s (const 64 (1 + 2*114)),
    (const 64 (-(2**20))) <=s u_99_114, u_99_114 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_99_114, v_99_114 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_99_114, r_99_114 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_99_114, s_99_114 <=s (const 64 ((2**20))),
    u_99_114 + v_99_114 <=s (const 64 (2**20)),
    u_99_114 - v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 + v_99_114 <=s (const 64 (2**20)),
    (const 64 0) - u_99_114 - v_99_114 <=s (const 64 (2**20)),
    r_99_114 + s_99_114 <=s (const 64 (2**20)),
    r_99_114 - s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 + s_99_114 <=s (const 64 (2**20)),
    (const 64 0) - r_99_114 - s_99_114 <=s (const 64 (2**20)),
    u_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_99_114 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_99_114 = (const 64 0) (mod (const 64 (2**(20-15))))
}

