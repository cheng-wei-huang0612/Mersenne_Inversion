proc divstep_177_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_1,
sint64 neg_g_177_low60_0_low20_1,
sint64 u_177_177,
sint64 v_177_177,
sint64 r_177_177,
sint64 s_177_177,
sint64 u_177_178,
sint64 v_177_178,
sint64 r_177_178,
sint64 s_177_178,
bit ne
)={
    u_177_177 * neg_f_177_low60_0_low20_0 + v_177_177 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_0 * (-(2**20)),
    r_177_177 * neg_f_177_low60_0_low20_0 + s_177_177 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_0 * (-(2**20))
&&
    u_177_177 * neg_f_177_low60_0_low20_0 + v_177_177 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_0 * (const 64 (-(2**20))),
    r_177_177 * neg_f_177_low60_0_low20_0 + s_177_177 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_0 + u_177_177 * (const 64 (2**21)) + v_177_177 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_0 + r_177_177 * (const 64 (2**21)) + s_177_177 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 177)) <=s delta, delta <=s (const 64 (1 + 2*177)),
    u_177_177 = (const 64 (-(2**20))),
    v_177_177 = (const 64 (0)),
    r_177_177 = (const 64 (0)),
    s_177_177 = (const 64 (-(2**20)))
}



// divsteps
// step177

// premise a
assume
neg_g_177_low60_0_low20_0 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_0 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_1 neg_f_177_low60_0_low20_0;
mov u_177_178 u_177_177;
mov v_177_178 v_177_177;

asr neg_g_177_low60_0_low20_1 neg_g_177_low60_0_low20_0 1;
asr r_177_178 r_177_177 1;
asr s_177_178 s_177_177 1;
assert
    true
&&
    neg_f_177_low60_0_low20_1 = neg_f_177_low60_0_low20_0,
    u_177_178 = u_177_177,
    v_177_178 = v_177_177,
    neg_g_177_low60_0_low20_1 * (const 64 2) = neg_g_177_low60_0_low20_0,
    r_177_178 * (const 64 2) = r_177_177,
    s_177_178 * (const 64 2) = s_177_177
;

assume
    neg_f_177_low60_0_low20_1 = neg_f_177_low60_0_low20_0,
    u_177_178 = u_177_177,
    v_177_178 = v_177_177,
    neg_g_177_low60_0_low20_1 * 2 = neg_g_177_low60_0_low20_0,
    r_177_178 * 2 = r_177_177,
    s_177_178 * 2 = s_177_177
&&
    true
;

{
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_1 + u_177_178 * (const 64 (2**21)) + v_177_178 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_1 + r_177_178 * (const 64 (2**21)) + s_177_178 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_1,
    neg_f_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_1,
    neg_g_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 178)) <=s delta, delta <=s (const 64 (1 + 2*178)),
    (const 64 (-(2**20))) <=s u_177_178, u_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_178, v_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_178, r_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_178, s_177_178 <=s (const 64 ((2**20))),
    u_177_178 + v_177_178 <=s (const 64 (2**20)),
    u_177_178 - v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 + v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 - v_177_178 <=s (const 64 (2**20)),
    r_177_178 + s_177_178 <=s (const 64 (2**20)),
    r_177_178 - s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 + s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 - s_177_178 <=s (const 64 (2**20)),
    u_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_177_178 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_177_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_1,
sint64 neg_g_177_low60_0_low20_1,
sint64 u_177_177,
sint64 v_177_177,
sint64 r_177_177,
sint64 s_177_177,
sint64 u_177_178,
sint64 v_177_178,
sint64 r_177_178,
sint64 s_177_178,
bit ne
)={
    u_177_177 * neg_f_177_low60_0_low20_0 + v_177_177 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_0 * (-(2**20)),
    r_177_177 * neg_f_177_low60_0_low20_0 + s_177_177 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_0 * (-(2**20))
&&
    u_177_177 * neg_f_177_low60_0_low20_0 + v_177_177 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_0 * (const 64 (-(2**20))),
    r_177_177 * neg_f_177_low60_0_low20_0 + s_177_177 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_0 + u_177_177 * (const 64 (2**21)) + v_177_177 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_0 + r_177_177 * (const 64 (2**21)) + s_177_177 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 177)) <=s delta, delta <=s (const 64 (1 + 2*177)),
    u_177_177 = (const 64 (-(2**20))),
    v_177_177 = (const 64 (0)),
    r_177_177 = (const 64 (0)),
    s_177_177 = (const 64 (-(2**20)))
}



// divsteps
// step177

// premise b
assume
neg_g_177_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
delta <s (const 64 0)
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

mov neg_f_177_low60_0_low20_1 neg_f_177_low60_0_low20_0;
mov u_177_178 u_177_177;
mov v_177_178 v_177_177;

add neg_g_177_low60_0_low20_1 neg_g_177_low60_0_low20_0 neg_f_177_low60_0_low20_0;
asr neg_g_177_low60_0_low20_1 neg_g_177_low60_0_low20_1 1;
add r_177_178 r_177_177 u_177_177;
asr r_177_178 r_177_178 1;
add s_177_178 s_177_177 v_177_177;
asr s_177_178 s_177_178 1;
assert
    true
&&
    neg_f_177_low60_0_low20_1 = neg_f_177_low60_0_low20_0,
    u_177_178 = u_177_177,
    v_177_178 = v_177_177,
    neg_g_177_low60_0_low20_1 * (const 64 2) = neg_g_177_low60_0_low20_0 + neg_f_177_low60_0_low20_0,
    r_177_178 * (const 64 2) = r_177_177 + u_177_177,
    s_177_178 * (const 64 2) = s_177_177 + v_177_177
;

assume
    neg_f_177_low60_0_low20_1 = neg_f_177_low60_0_low20_0,
    u_177_178 = u_177_177,
    v_177_178 = v_177_177,
    neg_g_177_low60_0_low20_1 * 2 = neg_g_177_low60_0_low20_0 + neg_f_177_low60_0_low20_0,
    r_177_178 * 2 = r_177_177 + u_177_177,
    s_177_178 * 2 = s_177_177 + v_177_177
&&
    true
;

{
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_1 + u_177_178 * (const 64 (2**21)) + v_177_178 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_1 + r_177_178 * (const 64 (2**21)) + s_177_178 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_1,
    neg_f_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_1,
    neg_g_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 178)) <=s delta, delta <=s (const 64 (1 + 2*178)),
    (const 64 (-(2**20))) <=s u_177_178, u_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_178, v_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_178, r_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_178, s_177_178 <=s (const 64 ((2**20))),
    u_177_178 + v_177_178 <=s (const 64 (2**20)),
    u_177_178 - v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 + v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 - v_177_178 <=s (const 64 (2**20)),
    r_177_178 + s_177_178 <=s (const 64 (2**20)),
    r_177_178 - s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 + s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 - s_177_178 <=s (const 64 (2**20)),
    u_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_177_178 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_177_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_1,
sint64 neg_g_177_low60_0_low20_1,
sint64 u_177_177,
sint64 v_177_177,
sint64 r_177_177,
sint64 s_177_177,
sint64 u_177_178,
sint64 v_177_178,
sint64 r_177_178,
sint64 s_177_178,
bit ne
)={
    u_177_177 * neg_f_177_low60_0_low20_0 + v_177_177 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_0 * (-(2**20)),
    r_177_177 * neg_f_177_low60_0_low20_0 + s_177_177 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_0 * (-(2**20))
&&
    u_177_177 * neg_f_177_low60_0_low20_0 + v_177_177 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_0 * (const 64 (-(2**20))),
    r_177_177 * neg_f_177_low60_0_low20_0 + s_177_177 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_0 + u_177_177 * (const 64 (2**21)) + v_177_177 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_0 + r_177_177 * (const 64 (2**21)) + s_177_177 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 177)) <=s delta, delta <=s (const 64 (1 + 2*177)),
    u_177_177 = (const 64 (-(2**20))),
    v_177_177 = (const 64 (0)),
    r_177_177 = (const 64 (0)),
    s_177_177 = (const 64 (-(2**20)))
}



// divsteps
// step177

// premise c
assume
neg_g_177_low60_0_low20_0 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_0 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_1 neg_g_177_low60_0_low20_0;
mov u_177_178 r_177_177;
mov v_177_178 s_177_177;

subs dc neg_g_177_low60_0_low20_1 neg_g_177_low60_0_low20_0 neg_f_177_low60_0_low20_0;
asr neg_g_177_low60_0_low20_1 neg_g_177_low60_0_low20_1 1;
subs dc r_177_178 r_177_177 u_177_177;
asr r_177_178 r_177_178 1;
subs dc s_177_178 s_177_177 v_177_177;
asr s_177_178 s_177_178 1;
assert
    true
&&
    neg_f_177_low60_0_low20_1 = neg_g_177_low60_0_low20_0,
    u_177_178 = r_177_177,
    v_177_178 = s_177_177,
    neg_g_177_low60_0_low20_1 * (const 64 2) = neg_g_177_low60_0_low20_0 - neg_f_177_low60_0_low20_0,
    r_177_178 * (const 64 2) = r_177_177 - u_177_177,
    s_177_178 * (const 64 2) = s_177_177 - v_177_177
;

assume
    neg_f_177_low60_0_low20_1 = neg_g_177_low60_0_low20_0,
    u_177_178 = r_177_177,
    v_177_178 = s_177_177,
    neg_g_177_low60_0_low20_1 * 2 = neg_g_177_low60_0_low20_0 - neg_f_177_low60_0_low20_0,
    r_177_178 * 2 = r_177_177 - u_177_177,
    s_177_178 * 2 = s_177_177 - v_177_177
&&
    true
;

{
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_1 + u_177_178 * (const 64 (2**21)) + v_177_178 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_1 + r_177_178 * (const 64 (2**21)) + s_177_178 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_1,
    neg_f_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_1,
    neg_g_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 178)) <=s delta, delta <=s (const 64 (1 + 2*178)),
    (const 64 (-(2**20))) <=s u_177_178, u_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_178, v_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_178, r_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_178, s_177_178 <=s (const 64 ((2**20))),
    u_177_178 + v_177_178 <=s (const 64 (2**20)),
    u_177_178 - v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 + v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 - v_177_178 <=s (const 64 (2**20)),
    r_177_178 + s_177_178 <=s (const 64 (2**20)),
    r_177_178 - s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 + s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 - s_177_178 <=s (const 64 (2**20)),
    u_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_177_178 = (const 64 0) (mod (const 64 (2**(20-1))))
}

proc divstep_178_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_1,
sint64 neg_g_177_low60_0_low20_1,
sint64 neg_f_177_low60_0_low20_2,
sint64 neg_g_177_low60_0_low20_2,
sint64 u_177_178,
sint64 v_177_178,
sint64 r_177_178,
sint64 s_177_178,
sint64 u_177_179,
sint64 v_177_179,
sint64 r_177_179,
sint64 s_177_179,
bit ne
)={
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (-(2**20)),
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (-(2**20))
&&
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (const 64 (-(2**20))),
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_1 + u_177_178 * (const 64 (2**21)) + v_177_178 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_1 + r_177_178 * (const 64 (2**21)) + s_177_178 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_1,
    neg_f_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_1,
    neg_g_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 178)) <=s delta, delta <=s (const 64 (1 + 2*178)),
    (const 64 (-(2**20))) <=s u_177_178, u_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_178, v_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_178, r_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_178, s_177_178 <=s (const 64 ((2**20))),
    u_177_178 + v_177_178 <=s (const 64 (2**20)),
    u_177_178 - v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 + v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 - v_177_178 <=s (const 64 (2**20)),
    r_177_178 + s_177_178 <=s (const 64 (2**20)),
    r_177_178 - s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 + s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 - s_177_178 <=s (const 64 (2**20)),
    u_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_177_178 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step178

// premise a
assume
neg_g_177_low60_0_low20_1 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_1 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_2 neg_f_177_low60_0_low20_1;
mov u_177_179 u_177_178;
mov v_177_179 v_177_178;

asr neg_g_177_low60_0_low20_2 neg_g_177_low60_0_low20_1 1;
asr r_177_179 r_177_178 1;
asr s_177_179 s_177_178 1;
assert
    true
&&
    neg_f_177_low60_0_low20_2 = neg_f_177_low60_0_low20_1,
    u_177_179 = u_177_178,
    v_177_179 = v_177_178,
    neg_g_177_low60_0_low20_2 * (const 64 2) = neg_g_177_low60_0_low20_1,
    r_177_179 * (const 64 2) = r_177_178,
    s_177_179 * (const 64 2) = s_177_178
;

assume
    neg_f_177_low60_0_low20_2 = neg_f_177_low60_0_low20_1,
    u_177_179 = u_177_178,
    v_177_179 = v_177_178,
    neg_g_177_low60_0_low20_2 * 2 = neg_g_177_low60_0_low20_1,
    r_177_179 * 2 = r_177_178,
    s_177_179 * 2 = s_177_178
&&
    true
;

{
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_2 + u_177_179 * (const 64 (2**21)) + v_177_179 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_2 + r_177_179 * (const 64 (2**21)) + s_177_179 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_2,
    neg_f_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_2,
    neg_g_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 179)) <=s delta, delta <=s (const 64 (1 + 2*179)),
    (const 64 (-(2**20))) <=s u_177_179, u_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_179, v_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_179, r_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_179, s_177_179 <=s (const 64 ((2**20))),
    u_177_179 + v_177_179 <=s (const 64 (2**20)),
    u_177_179 - v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 + v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 - v_177_179 <=s (const 64 (2**20)),
    r_177_179 + s_177_179 <=s (const 64 (2**20)),
    r_177_179 - s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 + s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 - s_177_179 <=s (const 64 (2**20)),
    u_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_177_179 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_178_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_1,
sint64 neg_g_177_low60_0_low20_1,
sint64 neg_f_177_low60_0_low20_2,
sint64 neg_g_177_low60_0_low20_2,
sint64 u_177_178,
sint64 v_177_178,
sint64 r_177_178,
sint64 s_177_178,
sint64 u_177_179,
sint64 v_177_179,
sint64 r_177_179,
sint64 s_177_179,
bit ne
)={
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (-(2**20)),
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (-(2**20))
&&
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (const 64 (-(2**20))),
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_1 + u_177_178 * (const 64 (2**21)) + v_177_178 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_1 + r_177_178 * (const 64 (2**21)) + s_177_178 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_1,
    neg_f_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_1,
    neg_g_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 178)) <=s delta, delta <=s (const 64 (1 + 2*178)),
    (const 64 (-(2**20))) <=s u_177_178, u_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_178, v_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_178, r_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_178, s_177_178 <=s (const 64 ((2**20))),
    u_177_178 + v_177_178 <=s (const 64 (2**20)),
    u_177_178 - v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 + v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 - v_177_178 <=s (const 64 (2**20)),
    r_177_178 + s_177_178 <=s (const 64 (2**20)),
    r_177_178 - s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 + s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 - s_177_178 <=s (const 64 (2**20)),
    u_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_177_178 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step178

// premise b
assume
neg_g_177_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_2 neg_f_177_low60_0_low20_1;
mov u_177_179 u_177_178;
mov v_177_179 v_177_178;

add neg_g_177_low60_0_low20_2 neg_g_177_low60_0_low20_1 neg_f_177_low60_0_low20_1;
asr neg_g_177_low60_0_low20_2 neg_g_177_low60_0_low20_2 1;
add r_177_179 r_177_178 u_177_178;
asr r_177_179 r_177_179 1;
add s_177_179 s_177_178 v_177_178;
asr s_177_179 s_177_179 1;
assert
    true
&&
    neg_f_177_low60_0_low20_2 = neg_f_177_low60_0_low20_1,
    u_177_179 = u_177_178,
    v_177_179 = v_177_178,
    neg_g_177_low60_0_low20_2 * (const 64 2) = neg_g_177_low60_0_low20_1 + neg_f_177_low60_0_low20_1,
    r_177_179 * (const 64 2) = r_177_178 + u_177_178,
    s_177_179 * (const 64 2) = s_177_178 + v_177_178
;

assume
    neg_f_177_low60_0_low20_2 = neg_f_177_low60_0_low20_1,
    u_177_179 = u_177_178,
    v_177_179 = v_177_178,
    neg_g_177_low60_0_low20_2 * 2 = neg_g_177_low60_0_low20_1 + neg_f_177_low60_0_low20_1,
    r_177_179 * 2 = r_177_178 + u_177_178,
    s_177_179 * 2 = s_177_178 + v_177_178
&&
    true
;

{
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_2 + u_177_179 * (const 64 (2**21)) + v_177_179 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_2 + r_177_179 * (const 64 (2**21)) + s_177_179 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_2,
    neg_f_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_2,
    neg_g_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 179)) <=s delta, delta <=s (const 64 (1 + 2*179)),
    (const 64 (-(2**20))) <=s u_177_179, u_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_179, v_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_179, r_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_179, s_177_179 <=s (const 64 ((2**20))),
    u_177_179 + v_177_179 <=s (const 64 (2**20)),
    u_177_179 - v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 + v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 - v_177_179 <=s (const 64 (2**20)),
    r_177_179 + s_177_179 <=s (const 64 (2**20)),
    r_177_179 - s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 + s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 - s_177_179 <=s (const 64 (2**20)),
    u_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_177_179 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_178_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_1,
sint64 neg_g_177_low60_0_low20_1,
sint64 neg_f_177_low60_0_low20_2,
sint64 neg_g_177_low60_0_low20_2,
sint64 u_177_178,
sint64 v_177_178,
sint64 r_177_178,
sint64 s_177_178,
sint64 u_177_179,
sint64 v_177_179,
sint64 r_177_179,
sint64 s_177_179,
bit ne
)={
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (-(2**20)),
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (-(2**20))
&&
    u_177_178 * neg_f_177_low60_0_low20_0 + v_177_178 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_1 * (const 64 (-(2**20))),
    r_177_178 * neg_f_177_low60_0_low20_0 + s_177_178 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_1 + u_177_178 * (const 64 (2**21)) + v_177_178 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_1 + r_177_178 * (const 64 (2**21)) + s_177_178 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_1,
    neg_f_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_1,
    neg_g_177_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 178)) <=s delta, delta <=s (const 64 (1 + 2*178)),
    (const 64 (-(2**20))) <=s u_177_178, u_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_178, v_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_178, r_177_178 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_178, s_177_178 <=s (const 64 ((2**20))),
    u_177_178 + v_177_178 <=s (const 64 (2**20)),
    u_177_178 - v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 + v_177_178 <=s (const 64 (2**20)),
    (const 64 0) - u_177_178 - v_177_178 <=s (const 64 (2**20)),
    r_177_178 + s_177_178 <=s (const 64 (2**20)),
    r_177_178 - s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 + s_177_178 <=s (const 64 (2**20)),
    (const 64 0) - r_177_178 - s_177_178 <=s (const 64 (2**20)),
    u_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    v_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    r_177_178 = (const 64 0) (mod (const 64 (2**(20-1)))),
    s_177_178 = (const 64 0) (mod (const 64 (2**(20-1))))
}



// divsteps
// step178

// premise c
assume
neg_g_177_low60_0_low20_1 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_1 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_2 neg_g_177_low60_0_low20_1;
mov u_177_179 r_177_178;
mov v_177_179 s_177_178;

subs dc neg_g_177_low60_0_low20_2 neg_g_177_low60_0_low20_1 neg_f_177_low60_0_low20_1;
asr neg_g_177_low60_0_low20_2 neg_g_177_low60_0_low20_2 1;
subs dc r_177_179 r_177_178 u_177_178;
asr r_177_179 r_177_179 1;
subs dc s_177_179 s_177_178 v_177_178;
asr s_177_179 s_177_179 1;
assert
    true
&&
    neg_f_177_low60_0_low20_2 = neg_g_177_low60_0_low20_1,
    u_177_179 = r_177_178,
    v_177_179 = s_177_178,
    neg_g_177_low60_0_low20_2 * (const 64 2) = neg_g_177_low60_0_low20_1 - neg_f_177_low60_0_low20_1,
    r_177_179 * (const 64 2) = r_177_178 - u_177_178,
    s_177_179 * (const 64 2) = s_177_178 - v_177_178
;

assume
    neg_f_177_low60_0_low20_2 = neg_g_177_low60_0_low20_1,
    u_177_179 = r_177_178,
    v_177_179 = s_177_178,
    neg_g_177_low60_0_low20_2 * 2 = neg_g_177_low60_0_low20_1 - neg_f_177_low60_0_low20_1,
    r_177_179 * 2 = r_177_178 - u_177_178,
    s_177_179 * 2 = s_177_178 - v_177_178
&&
    true
;

{
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_2 + u_177_179 * (const 64 (2**21)) + v_177_179 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_2 + r_177_179 * (const 64 (2**21)) + s_177_179 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_2,
    neg_f_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_2,
    neg_g_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 179)) <=s delta, delta <=s (const 64 (1 + 2*179)),
    (const 64 (-(2**20))) <=s u_177_179, u_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_179, v_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_179, r_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_179, s_177_179 <=s (const 64 ((2**20))),
    u_177_179 + v_177_179 <=s (const 64 (2**20)),
    u_177_179 - v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 + v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 - v_177_179 <=s (const 64 (2**20)),
    r_177_179 + s_177_179 <=s (const 64 (2**20)),
    r_177_179 - s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 + s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 - s_177_179 <=s (const 64 (2**20)),
    u_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_177_179 = (const 64 0) (mod (const 64 (2**(20-2))))
}

proc divstep_179_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_2,
sint64 neg_g_177_low60_0_low20_2,
sint64 neg_f_177_low60_0_low20_3,
sint64 neg_g_177_low60_0_low20_3,
sint64 u_177_179,
sint64 v_177_179,
sint64 r_177_179,
sint64 s_177_179,
sint64 u_177_180,
sint64 v_177_180,
sint64 r_177_180,
sint64 s_177_180,
bit ne
)={
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (-(2**20)),
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (-(2**20))
&&
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (const 64 (-(2**20))),
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_2 + u_177_179 * (const 64 (2**21)) + v_177_179 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_2 + r_177_179 * (const 64 (2**21)) + s_177_179 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_2,
    neg_f_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_2,
    neg_g_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 179)) <=s delta, delta <=s (const 64 (1 + 2*179)),
    (const 64 (-(2**20))) <=s u_177_179, u_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_179, v_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_179, r_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_179, s_177_179 <=s (const 64 ((2**20))),
    u_177_179 + v_177_179 <=s (const 64 (2**20)),
    u_177_179 - v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 + v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 - v_177_179 <=s (const 64 (2**20)),
    r_177_179 + s_177_179 <=s (const 64 (2**20)),
    r_177_179 - s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 + s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 - s_177_179 <=s (const 64 (2**20)),
    u_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_177_179 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step179

// premise a
assume
neg_g_177_low60_0_low20_2 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_2 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_3 neg_f_177_low60_0_low20_2;
mov u_177_180 u_177_179;
mov v_177_180 v_177_179;

asr neg_g_177_low60_0_low20_3 neg_g_177_low60_0_low20_2 1;
asr r_177_180 r_177_179 1;
asr s_177_180 s_177_179 1;
assert
    true
&&
    neg_f_177_low60_0_low20_3 = neg_f_177_low60_0_low20_2,
    u_177_180 = u_177_179,
    v_177_180 = v_177_179,
    neg_g_177_low60_0_low20_3 * (const 64 2) = neg_g_177_low60_0_low20_2,
    r_177_180 * (const 64 2) = r_177_179,
    s_177_180 * (const 64 2) = s_177_179
;

assume
    neg_f_177_low60_0_low20_3 = neg_f_177_low60_0_low20_2,
    u_177_180 = u_177_179,
    v_177_180 = v_177_179,
    neg_g_177_low60_0_low20_3 * 2 = neg_g_177_low60_0_low20_2,
    r_177_180 * 2 = r_177_179,
    s_177_180 * 2 = s_177_179
&&
    true
;

{
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_3 + u_177_180 * (const 64 (2**21)) + v_177_180 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_3 + r_177_180 * (const 64 (2**21)) + s_177_180 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_3,
    neg_f_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_3,
    neg_g_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 180)) <=s delta, delta <=s (const 64 (1 + 2*180)),
    (const 64 (-(2**20))) <=s u_177_180, u_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_180, v_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_180, r_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_180, s_177_180 <=s (const 64 ((2**20))),
    u_177_180 + v_177_180 <=s (const 64 (2**20)),
    u_177_180 - v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 + v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 - v_177_180 <=s (const 64 (2**20)),
    r_177_180 + s_177_180 <=s (const 64 (2**20)),
    r_177_180 - s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 + s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 - s_177_180 <=s (const 64 (2**20)),
    u_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_177_180 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_179_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_2,
sint64 neg_g_177_low60_0_low20_2,
sint64 neg_f_177_low60_0_low20_3,
sint64 neg_g_177_low60_0_low20_3,
sint64 u_177_179,
sint64 v_177_179,
sint64 r_177_179,
sint64 s_177_179,
sint64 u_177_180,
sint64 v_177_180,
sint64 r_177_180,
sint64 s_177_180,
bit ne
)={
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (-(2**20)),
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (-(2**20))
&&
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (const 64 (-(2**20))),
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_2 + u_177_179 * (const 64 (2**21)) + v_177_179 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_2 + r_177_179 * (const 64 (2**21)) + s_177_179 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_2,
    neg_f_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_2,
    neg_g_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 179)) <=s delta, delta <=s (const 64 (1 + 2*179)),
    (const 64 (-(2**20))) <=s u_177_179, u_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_179, v_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_179, r_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_179, s_177_179 <=s (const 64 ((2**20))),
    u_177_179 + v_177_179 <=s (const 64 (2**20)),
    u_177_179 - v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 + v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 - v_177_179 <=s (const 64 (2**20)),
    r_177_179 + s_177_179 <=s (const 64 (2**20)),
    r_177_179 - s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 + s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 - s_177_179 <=s (const 64 (2**20)),
    u_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_177_179 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step179

// premise b
assume
neg_g_177_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_3 neg_f_177_low60_0_low20_2;
mov u_177_180 u_177_179;
mov v_177_180 v_177_179;

add neg_g_177_low60_0_low20_3 neg_g_177_low60_0_low20_2 neg_f_177_low60_0_low20_2;
asr neg_g_177_low60_0_low20_3 neg_g_177_low60_0_low20_3 1;
add r_177_180 r_177_179 u_177_179;
asr r_177_180 r_177_180 1;
add s_177_180 s_177_179 v_177_179;
asr s_177_180 s_177_180 1;
assert
    true
&&
    neg_f_177_low60_0_low20_3 = neg_f_177_low60_0_low20_2,
    u_177_180 = u_177_179,
    v_177_180 = v_177_179,
    neg_g_177_low60_0_low20_3 * (const 64 2) = neg_g_177_low60_0_low20_2 + neg_f_177_low60_0_low20_2,
    r_177_180 * (const 64 2) = r_177_179 + u_177_179,
    s_177_180 * (const 64 2) = s_177_179 + v_177_179
;

assume
    neg_f_177_low60_0_low20_3 = neg_f_177_low60_0_low20_2,
    u_177_180 = u_177_179,
    v_177_180 = v_177_179,
    neg_g_177_low60_0_low20_3 * 2 = neg_g_177_low60_0_low20_2 + neg_f_177_low60_0_low20_2,
    r_177_180 * 2 = r_177_179 + u_177_179,
    s_177_180 * 2 = s_177_179 + v_177_179
&&
    true
;

{
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_3 + u_177_180 * (const 64 (2**21)) + v_177_180 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_3 + r_177_180 * (const 64 (2**21)) + s_177_180 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_3,
    neg_f_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_3,
    neg_g_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 180)) <=s delta, delta <=s (const 64 (1 + 2*180)),
    (const 64 (-(2**20))) <=s u_177_180, u_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_180, v_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_180, r_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_180, s_177_180 <=s (const 64 ((2**20))),
    u_177_180 + v_177_180 <=s (const 64 (2**20)),
    u_177_180 - v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 + v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 - v_177_180 <=s (const 64 (2**20)),
    r_177_180 + s_177_180 <=s (const 64 (2**20)),
    r_177_180 - s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 + s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 - s_177_180 <=s (const 64 (2**20)),
    u_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_177_180 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_179_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_2,
sint64 neg_g_177_low60_0_low20_2,
sint64 neg_f_177_low60_0_low20_3,
sint64 neg_g_177_low60_0_low20_3,
sint64 u_177_179,
sint64 v_177_179,
sint64 r_177_179,
sint64 s_177_179,
sint64 u_177_180,
sint64 v_177_180,
sint64 r_177_180,
sint64 s_177_180,
bit ne
)={
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (-(2**20)),
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (-(2**20))
&&
    u_177_179 * neg_f_177_low60_0_low20_0 + v_177_179 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_2 * (const 64 (-(2**20))),
    r_177_179 * neg_f_177_low60_0_low20_0 + s_177_179 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_2 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_2 + u_177_179 * (const 64 (2**21)) + v_177_179 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_2 + r_177_179 * (const 64 (2**21)) + s_177_179 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_2,
    neg_f_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_2,
    neg_g_177_low60_0_low20_2 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 179)) <=s delta, delta <=s (const 64 (1 + 2*179)),
    (const 64 (-(2**20))) <=s u_177_179, u_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_179, v_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_179, r_177_179 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_179, s_177_179 <=s (const 64 ((2**20))),
    u_177_179 + v_177_179 <=s (const 64 (2**20)),
    u_177_179 - v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 + v_177_179 <=s (const 64 (2**20)),
    (const 64 0) - u_177_179 - v_177_179 <=s (const 64 (2**20)),
    r_177_179 + s_177_179 <=s (const 64 (2**20)),
    r_177_179 - s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 + s_177_179 <=s (const 64 (2**20)),
    (const 64 0) - r_177_179 - s_177_179 <=s (const 64 (2**20)),
    u_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    v_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    r_177_179 = (const 64 0) (mod (const 64 (2**(20-2)))),
    s_177_179 = (const 64 0) (mod (const 64 (2**(20-2))))
}



// divsteps
// step179

// premise c
assume
neg_g_177_low60_0_low20_2 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_2 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_3 neg_g_177_low60_0_low20_2;
mov u_177_180 r_177_179;
mov v_177_180 s_177_179;

subs dc neg_g_177_low60_0_low20_3 neg_g_177_low60_0_low20_2 neg_f_177_low60_0_low20_2;
asr neg_g_177_low60_0_low20_3 neg_g_177_low60_0_low20_3 1;
subs dc r_177_180 r_177_179 u_177_179;
asr r_177_180 r_177_180 1;
subs dc s_177_180 s_177_179 v_177_179;
asr s_177_180 s_177_180 1;
assert
    true
&&
    neg_f_177_low60_0_low20_3 = neg_g_177_low60_0_low20_2,
    u_177_180 = r_177_179,
    v_177_180 = s_177_179,
    neg_g_177_low60_0_low20_3 * (const 64 2) = neg_g_177_low60_0_low20_2 - neg_f_177_low60_0_low20_2,
    r_177_180 * (const 64 2) = r_177_179 - u_177_179,
    s_177_180 * (const 64 2) = s_177_179 - v_177_179
;

assume
    neg_f_177_low60_0_low20_3 = neg_g_177_low60_0_low20_2,
    u_177_180 = r_177_179,
    v_177_180 = s_177_179,
    neg_g_177_low60_0_low20_3 * 2 = neg_g_177_low60_0_low20_2 - neg_f_177_low60_0_low20_2,
    r_177_180 * 2 = r_177_179 - u_177_179,
    s_177_180 * 2 = s_177_179 - v_177_179
&&
    true
;

{
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_3 + u_177_180 * (const 64 (2**21)) + v_177_180 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_3 + r_177_180 * (const 64 (2**21)) + s_177_180 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_3,
    neg_f_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_3,
    neg_g_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 180)) <=s delta, delta <=s (const 64 (1 + 2*180)),
    (const 64 (-(2**20))) <=s u_177_180, u_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_180, v_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_180, r_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_180, s_177_180 <=s (const 64 ((2**20))),
    u_177_180 + v_177_180 <=s (const 64 (2**20)),
    u_177_180 - v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 + v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 - v_177_180 <=s (const 64 (2**20)),
    r_177_180 + s_177_180 <=s (const 64 (2**20)),
    r_177_180 - s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 + s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 - s_177_180 <=s (const 64 (2**20)),
    u_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_177_180 = (const 64 0) (mod (const 64 (2**(20-3))))
}

proc divstep_180_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_3,
sint64 neg_g_177_low60_0_low20_3,
sint64 neg_f_177_low60_0_low20_4,
sint64 neg_g_177_low60_0_low20_4,
sint64 u_177_180,
sint64 v_177_180,
sint64 r_177_180,
sint64 s_177_180,
sint64 u_177_181,
sint64 v_177_181,
sint64 r_177_181,
sint64 s_177_181,
bit ne
)={
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (-(2**20)),
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (-(2**20))
&&
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (const 64 (-(2**20))),
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_3 + u_177_180 * (const 64 (2**21)) + v_177_180 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_3 + r_177_180 * (const 64 (2**21)) + s_177_180 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_3,
    neg_f_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_3,
    neg_g_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 180)) <=s delta, delta <=s (const 64 (1 + 2*180)),
    (const 64 (-(2**20))) <=s u_177_180, u_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_180, v_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_180, r_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_180, s_177_180 <=s (const 64 ((2**20))),
    u_177_180 + v_177_180 <=s (const 64 (2**20)),
    u_177_180 - v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 + v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 - v_177_180 <=s (const 64 (2**20)),
    r_177_180 + s_177_180 <=s (const 64 (2**20)),
    r_177_180 - s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 + s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 - s_177_180 <=s (const 64 (2**20)),
    u_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_177_180 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step180

// premise a
assume
neg_g_177_low60_0_low20_3 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_3 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_4 neg_f_177_low60_0_low20_3;
mov u_177_181 u_177_180;
mov v_177_181 v_177_180;

asr neg_g_177_low60_0_low20_4 neg_g_177_low60_0_low20_3 1;
asr r_177_181 r_177_180 1;
asr s_177_181 s_177_180 1;
assert
    true
&&
    neg_f_177_low60_0_low20_4 = neg_f_177_low60_0_low20_3,
    u_177_181 = u_177_180,
    v_177_181 = v_177_180,
    neg_g_177_low60_0_low20_4 * (const 64 2) = neg_g_177_low60_0_low20_3,
    r_177_181 * (const 64 2) = r_177_180,
    s_177_181 * (const 64 2) = s_177_180
;

assume
    neg_f_177_low60_0_low20_4 = neg_f_177_low60_0_low20_3,
    u_177_181 = u_177_180,
    v_177_181 = v_177_180,
    neg_g_177_low60_0_low20_4 * 2 = neg_g_177_low60_0_low20_3,
    r_177_181 * 2 = r_177_180,
    s_177_181 * 2 = s_177_180
&&
    true
;

{
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_4 + u_177_181 * (const 64 (2**21)) + v_177_181 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_4 + r_177_181 * (const 64 (2**21)) + s_177_181 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_4,
    neg_f_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_4,
    neg_g_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 181)) <=s delta, delta <=s (const 64 (1 + 2*181)),
    (const 64 (-(2**20))) <=s u_177_181, u_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_181, v_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_181, r_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_181, s_177_181 <=s (const 64 ((2**20))),
    u_177_181 + v_177_181 <=s (const 64 (2**20)),
    u_177_181 - v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 + v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 - v_177_181 <=s (const 64 (2**20)),
    r_177_181 + s_177_181 <=s (const 64 (2**20)),
    r_177_181 - s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 + s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 - s_177_181 <=s (const 64 (2**20)),
    u_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_177_181 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_180_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_3,
sint64 neg_g_177_low60_0_low20_3,
sint64 neg_f_177_low60_0_low20_4,
sint64 neg_g_177_low60_0_low20_4,
sint64 u_177_180,
sint64 v_177_180,
sint64 r_177_180,
sint64 s_177_180,
sint64 u_177_181,
sint64 v_177_181,
sint64 r_177_181,
sint64 s_177_181,
bit ne
)={
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (-(2**20)),
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (-(2**20))
&&
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (const 64 (-(2**20))),
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_3 + u_177_180 * (const 64 (2**21)) + v_177_180 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_3 + r_177_180 * (const 64 (2**21)) + s_177_180 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_3,
    neg_f_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_3,
    neg_g_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 180)) <=s delta, delta <=s (const 64 (1 + 2*180)),
    (const 64 (-(2**20))) <=s u_177_180, u_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_180, v_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_180, r_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_180, s_177_180 <=s (const 64 ((2**20))),
    u_177_180 + v_177_180 <=s (const 64 (2**20)),
    u_177_180 - v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 + v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 - v_177_180 <=s (const 64 (2**20)),
    r_177_180 + s_177_180 <=s (const 64 (2**20)),
    r_177_180 - s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 + s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 - s_177_180 <=s (const 64 (2**20)),
    u_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_177_180 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step180

// premise b
assume
neg_g_177_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_4 neg_f_177_low60_0_low20_3;
mov u_177_181 u_177_180;
mov v_177_181 v_177_180;

add neg_g_177_low60_0_low20_4 neg_g_177_low60_0_low20_3 neg_f_177_low60_0_low20_3;
asr neg_g_177_low60_0_low20_4 neg_g_177_low60_0_low20_4 1;
add r_177_181 r_177_180 u_177_180;
asr r_177_181 r_177_181 1;
add s_177_181 s_177_180 v_177_180;
asr s_177_181 s_177_181 1;
assert
    true
&&
    neg_f_177_low60_0_low20_4 = neg_f_177_low60_0_low20_3,
    u_177_181 = u_177_180,
    v_177_181 = v_177_180,
    neg_g_177_low60_0_low20_4 * (const 64 2) = neg_g_177_low60_0_low20_3 + neg_f_177_low60_0_low20_3,
    r_177_181 * (const 64 2) = r_177_180 + u_177_180,
    s_177_181 * (const 64 2) = s_177_180 + v_177_180
;

assume
    neg_f_177_low60_0_low20_4 = neg_f_177_low60_0_low20_3,
    u_177_181 = u_177_180,
    v_177_181 = v_177_180,
    neg_g_177_low60_0_low20_4 * 2 = neg_g_177_low60_0_low20_3 + neg_f_177_low60_0_low20_3,
    r_177_181 * 2 = r_177_180 + u_177_180,
    s_177_181 * 2 = s_177_180 + v_177_180
&&
    true
;

{
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_4 + u_177_181 * (const 64 (2**21)) + v_177_181 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_4 + r_177_181 * (const 64 (2**21)) + s_177_181 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_4,
    neg_f_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_4,
    neg_g_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 181)) <=s delta, delta <=s (const 64 (1 + 2*181)),
    (const 64 (-(2**20))) <=s u_177_181, u_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_181, v_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_181, r_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_181, s_177_181 <=s (const 64 ((2**20))),
    u_177_181 + v_177_181 <=s (const 64 (2**20)),
    u_177_181 - v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 + v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 - v_177_181 <=s (const 64 (2**20)),
    r_177_181 + s_177_181 <=s (const 64 (2**20)),
    r_177_181 - s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 + s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 - s_177_181 <=s (const 64 (2**20)),
    u_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_177_181 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_180_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_3,
sint64 neg_g_177_low60_0_low20_3,
sint64 neg_f_177_low60_0_low20_4,
sint64 neg_g_177_low60_0_low20_4,
sint64 u_177_180,
sint64 v_177_180,
sint64 r_177_180,
sint64 s_177_180,
sint64 u_177_181,
sint64 v_177_181,
sint64 r_177_181,
sint64 s_177_181,
bit ne
)={
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (-(2**20)),
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (-(2**20))
&&
    u_177_180 * neg_f_177_low60_0_low20_0 + v_177_180 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_3 * (const 64 (-(2**20))),
    r_177_180 * neg_f_177_low60_0_low20_0 + s_177_180 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_3 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_3 + u_177_180 * (const 64 (2**21)) + v_177_180 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_3 + r_177_180 * (const 64 (2**21)) + s_177_180 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_3,
    neg_f_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_3,
    neg_g_177_low60_0_low20_3 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 180)) <=s delta, delta <=s (const 64 (1 + 2*180)),
    (const 64 (-(2**20))) <=s u_177_180, u_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_180, v_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_180, r_177_180 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_180, s_177_180 <=s (const 64 ((2**20))),
    u_177_180 + v_177_180 <=s (const 64 (2**20)),
    u_177_180 - v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 + v_177_180 <=s (const 64 (2**20)),
    (const 64 0) - u_177_180 - v_177_180 <=s (const 64 (2**20)),
    r_177_180 + s_177_180 <=s (const 64 (2**20)),
    r_177_180 - s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 + s_177_180 <=s (const 64 (2**20)),
    (const 64 0) - r_177_180 - s_177_180 <=s (const 64 (2**20)),
    u_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    v_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    r_177_180 = (const 64 0) (mod (const 64 (2**(20-3)))),
    s_177_180 = (const 64 0) (mod (const 64 (2**(20-3))))
}



// divsteps
// step180

// premise c
assume
neg_g_177_low60_0_low20_3 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_3 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_4 neg_g_177_low60_0_low20_3;
mov u_177_181 r_177_180;
mov v_177_181 s_177_180;

subs dc neg_g_177_low60_0_low20_4 neg_g_177_low60_0_low20_3 neg_f_177_low60_0_low20_3;
asr neg_g_177_low60_0_low20_4 neg_g_177_low60_0_low20_4 1;
subs dc r_177_181 r_177_180 u_177_180;
asr r_177_181 r_177_181 1;
subs dc s_177_181 s_177_180 v_177_180;
asr s_177_181 s_177_181 1;
assert
    true
&&
    neg_f_177_low60_0_low20_4 = neg_g_177_low60_0_low20_3,
    u_177_181 = r_177_180,
    v_177_181 = s_177_180,
    neg_g_177_low60_0_low20_4 * (const 64 2) = neg_g_177_low60_0_low20_3 - neg_f_177_low60_0_low20_3,
    r_177_181 * (const 64 2) = r_177_180 - u_177_180,
    s_177_181 * (const 64 2) = s_177_180 - v_177_180
;

assume
    neg_f_177_low60_0_low20_4 = neg_g_177_low60_0_low20_3,
    u_177_181 = r_177_180,
    v_177_181 = s_177_180,
    neg_g_177_low60_0_low20_4 * 2 = neg_g_177_low60_0_low20_3 - neg_f_177_low60_0_low20_3,
    r_177_181 * 2 = r_177_180 - u_177_180,
    s_177_181 * 2 = s_177_180 - v_177_180
&&
    true
;

{
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_4 + u_177_181 * (const 64 (2**21)) + v_177_181 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_4 + r_177_181 * (const 64 (2**21)) + s_177_181 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_4,
    neg_f_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_4,
    neg_g_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 181)) <=s delta, delta <=s (const 64 (1 + 2*181)),
    (const 64 (-(2**20))) <=s u_177_181, u_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_181, v_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_181, r_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_181, s_177_181 <=s (const 64 ((2**20))),
    u_177_181 + v_177_181 <=s (const 64 (2**20)),
    u_177_181 - v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 + v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 - v_177_181 <=s (const 64 (2**20)),
    r_177_181 + s_177_181 <=s (const 64 (2**20)),
    r_177_181 - s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 + s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 - s_177_181 <=s (const 64 (2**20)),
    u_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_177_181 = (const 64 0) (mod (const 64 (2**(20-4))))
}

proc divstep_181_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_4,
sint64 neg_g_177_low60_0_low20_4,
sint64 neg_f_177_low60_0_low20_5,
sint64 neg_g_177_low60_0_low20_5,
sint64 u_177_181,
sint64 v_177_181,
sint64 r_177_181,
sint64 s_177_181,
sint64 u_177_182,
sint64 v_177_182,
sint64 r_177_182,
sint64 s_177_182,
bit ne
)={
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (-(2**20)),
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (-(2**20))
&&
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (const 64 (-(2**20))),
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_4 + u_177_181 * (const 64 (2**21)) + v_177_181 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_4 + r_177_181 * (const 64 (2**21)) + s_177_181 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_4,
    neg_f_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_4,
    neg_g_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 181)) <=s delta, delta <=s (const 64 (1 + 2*181)),
    (const 64 (-(2**20))) <=s u_177_181, u_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_181, v_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_181, r_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_181, s_177_181 <=s (const 64 ((2**20))),
    u_177_181 + v_177_181 <=s (const 64 (2**20)),
    u_177_181 - v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 + v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 - v_177_181 <=s (const 64 (2**20)),
    r_177_181 + s_177_181 <=s (const 64 (2**20)),
    r_177_181 - s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 + s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 - s_177_181 <=s (const 64 (2**20)),
    u_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_177_181 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step181

// premise a
assume
neg_g_177_low60_0_low20_4 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_4 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_5 neg_f_177_low60_0_low20_4;
mov u_177_182 u_177_181;
mov v_177_182 v_177_181;

asr neg_g_177_low60_0_low20_5 neg_g_177_low60_0_low20_4 1;
asr r_177_182 r_177_181 1;
asr s_177_182 s_177_181 1;
assert
    true
&&
    neg_f_177_low60_0_low20_5 = neg_f_177_low60_0_low20_4,
    u_177_182 = u_177_181,
    v_177_182 = v_177_181,
    neg_g_177_low60_0_low20_5 * (const 64 2) = neg_g_177_low60_0_low20_4,
    r_177_182 * (const 64 2) = r_177_181,
    s_177_182 * (const 64 2) = s_177_181
;

assume
    neg_f_177_low60_0_low20_5 = neg_f_177_low60_0_low20_4,
    u_177_182 = u_177_181,
    v_177_182 = v_177_181,
    neg_g_177_low60_0_low20_5 * 2 = neg_g_177_low60_0_low20_4,
    r_177_182 * 2 = r_177_181,
    s_177_182 * 2 = s_177_181
&&
    true
;

{
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_5 + u_177_182 * (const 64 (2**21)) + v_177_182 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_5 + r_177_182 * (const 64 (2**21)) + s_177_182 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_5,
    neg_f_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_5,
    neg_g_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 182)) <=s delta, delta <=s (const 64 (1 + 2*182)),
    (const 64 (-(2**20))) <=s u_177_182, u_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_182, v_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_182, r_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_182, s_177_182 <=s (const 64 ((2**20))),
    u_177_182 + v_177_182 <=s (const 64 (2**20)),
    u_177_182 - v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 + v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 - v_177_182 <=s (const 64 (2**20)),
    r_177_182 + s_177_182 <=s (const 64 (2**20)),
    r_177_182 - s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 + s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 - s_177_182 <=s (const 64 (2**20)),
    u_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_177_182 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_181_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_4,
sint64 neg_g_177_low60_0_low20_4,
sint64 neg_f_177_low60_0_low20_5,
sint64 neg_g_177_low60_0_low20_5,
sint64 u_177_181,
sint64 v_177_181,
sint64 r_177_181,
sint64 s_177_181,
sint64 u_177_182,
sint64 v_177_182,
sint64 r_177_182,
sint64 s_177_182,
bit ne
)={
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (-(2**20)),
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (-(2**20))
&&
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (const 64 (-(2**20))),
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_4 + u_177_181 * (const 64 (2**21)) + v_177_181 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_4 + r_177_181 * (const 64 (2**21)) + s_177_181 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_4,
    neg_f_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_4,
    neg_g_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 181)) <=s delta, delta <=s (const 64 (1 + 2*181)),
    (const 64 (-(2**20))) <=s u_177_181, u_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_181, v_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_181, r_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_181, s_177_181 <=s (const 64 ((2**20))),
    u_177_181 + v_177_181 <=s (const 64 (2**20)),
    u_177_181 - v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 + v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 - v_177_181 <=s (const 64 (2**20)),
    r_177_181 + s_177_181 <=s (const 64 (2**20)),
    r_177_181 - s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 + s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 - s_177_181 <=s (const 64 (2**20)),
    u_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_177_181 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step181

// premise b
assume
neg_g_177_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_5 neg_f_177_low60_0_low20_4;
mov u_177_182 u_177_181;
mov v_177_182 v_177_181;

add neg_g_177_low60_0_low20_5 neg_g_177_low60_0_low20_4 neg_f_177_low60_0_low20_4;
asr neg_g_177_low60_0_low20_5 neg_g_177_low60_0_low20_5 1;
add r_177_182 r_177_181 u_177_181;
asr r_177_182 r_177_182 1;
add s_177_182 s_177_181 v_177_181;
asr s_177_182 s_177_182 1;
assert
    true
&&
    neg_f_177_low60_0_low20_5 = neg_f_177_low60_0_low20_4,
    u_177_182 = u_177_181,
    v_177_182 = v_177_181,
    neg_g_177_low60_0_low20_5 * (const 64 2) = neg_g_177_low60_0_low20_4 + neg_f_177_low60_0_low20_4,
    r_177_182 * (const 64 2) = r_177_181 + u_177_181,
    s_177_182 * (const 64 2) = s_177_181 + v_177_181
;

assume
    neg_f_177_low60_0_low20_5 = neg_f_177_low60_0_low20_4,
    u_177_182 = u_177_181,
    v_177_182 = v_177_181,
    neg_g_177_low60_0_low20_5 * 2 = neg_g_177_low60_0_low20_4 + neg_f_177_low60_0_low20_4,
    r_177_182 * 2 = r_177_181 + u_177_181,
    s_177_182 * 2 = s_177_181 + v_177_181
&&
    true
;

{
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_5 + u_177_182 * (const 64 (2**21)) + v_177_182 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_5 + r_177_182 * (const 64 (2**21)) + s_177_182 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_5,
    neg_f_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_5,
    neg_g_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 182)) <=s delta, delta <=s (const 64 (1 + 2*182)),
    (const 64 (-(2**20))) <=s u_177_182, u_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_182, v_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_182, r_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_182, s_177_182 <=s (const 64 ((2**20))),
    u_177_182 + v_177_182 <=s (const 64 (2**20)),
    u_177_182 - v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 + v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 - v_177_182 <=s (const 64 (2**20)),
    r_177_182 + s_177_182 <=s (const 64 (2**20)),
    r_177_182 - s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 + s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 - s_177_182 <=s (const 64 (2**20)),
    u_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_177_182 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_181_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_4,
sint64 neg_g_177_low60_0_low20_4,
sint64 neg_f_177_low60_0_low20_5,
sint64 neg_g_177_low60_0_low20_5,
sint64 u_177_181,
sint64 v_177_181,
sint64 r_177_181,
sint64 s_177_181,
sint64 u_177_182,
sint64 v_177_182,
sint64 r_177_182,
sint64 s_177_182,
bit ne
)={
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (-(2**20)),
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (-(2**20))
&&
    u_177_181 * neg_f_177_low60_0_low20_0 + v_177_181 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_4 * (const 64 (-(2**20))),
    r_177_181 * neg_f_177_low60_0_low20_0 + s_177_181 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_4 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_4 + u_177_181 * (const 64 (2**21)) + v_177_181 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_4 + r_177_181 * (const 64 (2**21)) + s_177_181 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_4,
    neg_f_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_4,
    neg_g_177_low60_0_low20_4 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 181)) <=s delta, delta <=s (const 64 (1 + 2*181)),
    (const 64 (-(2**20))) <=s u_177_181, u_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_181, v_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_181, r_177_181 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_181, s_177_181 <=s (const 64 ((2**20))),
    u_177_181 + v_177_181 <=s (const 64 (2**20)),
    u_177_181 - v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 + v_177_181 <=s (const 64 (2**20)),
    (const 64 0) - u_177_181 - v_177_181 <=s (const 64 (2**20)),
    r_177_181 + s_177_181 <=s (const 64 (2**20)),
    r_177_181 - s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 + s_177_181 <=s (const 64 (2**20)),
    (const 64 0) - r_177_181 - s_177_181 <=s (const 64 (2**20)),
    u_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    v_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    r_177_181 = (const 64 0) (mod (const 64 (2**(20-4)))),
    s_177_181 = (const 64 0) (mod (const 64 (2**(20-4))))
}



// divsteps
// step181

// premise c
assume
neg_g_177_low60_0_low20_4 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_4 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_5 neg_g_177_low60_0_low20_4;
mov u_177_182 r_177_181;
mov v_177_182 s_177_181;

subs dc neg_g_177_low60_0_low20_5 neg_g_177_low60_0_low20_4 neg_f_177_low60_0_low20_4;
asr neg_g_177_low60_0_low20_5 neg_g_177_low60_0_low20_5 1;
subs dc r_177_182 r_177_181 u_177_181;
asr r_177_182 r_177_182 1;
subs dc s_177_182 s_177_181 v_177_181;
asr s_177_182 s_177_182 1;
assert
    true
&&
    neg_f_177_low60_0_low20_5 = neg_g_177_low60_0_low20_4,
    u_177_182 = r_177_181,
    v_177_182 = s_177_181,
    neg_g_177_low60_0_low20_5 * (const 64 2) = neg_g_177_low60_0_low20_4 - neg_f_177_low60_0_low20_4,
    r_177_182 * (const 64 2) = r_177_181 - u_177_181,
    s_177_182 * (const 64 2) = s_177_181 - v_177_181
;

assume
    neg_f_177_low60_0_low20_5 = neg_g_177_low60_0_low20_4,
    u_177_182 = r_177_181,
    v_177_182 = s_177_181,
    neg_g_177_low60_0_low20_5 * 2 = neg_g_177_low60_0_low20_4 - neg_f_177_low60_0_low20_4,
    r_177_182 * 2 = r_177_181 - u_177_181,
    s_177_182 * 2 = s_177_181 - v_177_181
&&
    true
;

{
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_5 + u_177_182 * (const 64 (2**21)) + v_177_182 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_5 + r_177_182 * (const 64 (2**21)) + s_177_182 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_5,
    neg_f_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_5,
    neg_g_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 182)) <=s delta, delta <=s (const 64 (1 + 2*182)),
    (const 64 (-(2**20))) <=s u_177_182, u_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_182, v_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_182, r_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_182, s_177_182 <=s (const 64 ((2**20))),
    u_177_182 + v_177_182 <=s (const 64 (2**20)),
    u_177_182 - v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 + v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 - v_177_182 <=s (const 64 (2**20)),
    r_177_182 + s_177_182 <=s (const 64 (2**20)),
    r_177_182 - s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 + s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 - s_177_182 <=s (const 64 (2**20)),
    u_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_177_182 = (const 64 0) (mod (const 64 (2**(20-5))))
}

proc divstep_182_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_5,
sint64 neg_g_177_low60_0_low20_5,
sint64 neg_f_177_low60_0_low20_6,
sint64 neg_g_177_low60_0_low20_6,
sint64 u_177_182,
sint64 v_177_182,
sint64 r_177_182,
sint64 s_177_182,
sint64 u_177_183,
sint64 v_177_183,
sint64 r_177_183,
sint64 s_177_183,
bit ne
)={
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (-(2**20)),
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (-(2**20))
&&
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (const 64 (-(2**20))),
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_5 + u_177_182 * (const 64 (2**21)) + v_177_182 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_5 + r_177_182 * (const 64 (2**21)) + s_177_182 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_5,
    neg_f_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_5,
    neg_g_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 182)) <=s delta, delta <=s (const 64 (1 + 2*182)),
    (const 64 (-(2**20))) <=s u_177_182, u_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_182, v_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_182, r_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_182, s_177_182 <=s (const 64 ((2**20))),
    u_177_182 + v_177_182 <=s (const 64 (2**20)),
    u_177_182 - v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 + v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 - v_177_182 <=s (const 64 (2**20)),
    r_177_182 + s_177_182 <=s (const 64 (2**20)),
    r_177_182 - s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 + s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 - s_177_182 <=s (const 64 (2**20)),
    u_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_177_182 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step182

// premise a
assume
neg_g_177_low60_0_low20_5 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_5 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_6 neg_f_177_low60_0_low20_5;
mov u_177_183 u_177_182;
mov v_177_183 v_177_182;

asr neg_g_177_low60_0_low20_6 neg_g_177_low60_0_low20_5 1;
asr r_177_183 r_177_182 1;
asr s_177_183 s_177_182 1;
assert
    true
&&
    neg_f_177_low60_0_low20_6 = neg_f_177_low60_0_low20_5,
    u_177_183 = u_177_182,
    v_177_183 = v_177_182,
    neg_g_177_low60_0_low20_6 * (const 64 2) = neg_g_177_low60_0_low20_5,
    r_177_183 * (const 64 2) = r_177_182,
    s_177_183 * (const 64 2) = s_177_182
;

assume
    neg_f_177_low60_0_low20_6 = neg_f_177_low60_0_low20_5,
    u_177_183 = u_177_182,
    v_177_183 = v_177_182,
    neg_g_177_low60_0_low20_6 * 2 = neg_g_177_low60_0_low20_5,
    r_177_183 * 2 = r_177_182,
    s_177_183 * 2 = s_177_182
&&
    true
;

{
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_6 + u_177_183 * (const 64 (2**21)) + v_177_183 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_6 + r_177_183 * (const 64 (2**21)) + s_177_183 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_6,
    neg_f_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_6,
    neg_g_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 183)) <=s delta, delta <=s (const 64 (1 + 2*183)),
    (const 64 (-(2**20))) <=s u_177_183, u_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_183, v_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_183, r_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_183, s_177_183 <=s (const 64 ((2**20))),
    u_177_183 + v_177_183 <=s (const 64 (2**20)),
    u_177_183 - v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 + v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 - v_177_183 <=s (const 64 (2**20)),
    r_177_183 + s_177_183 <=s (const 64 (2**20)),
    r_177_183 - s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 + s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 - s_177_183 <=s (const 64 (2**20)),
    u_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_177_183 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_182_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_5,
sint64 neg_g_177_low60_0_low20_5,
sint64 neg_f_177_low60_0_low20_6,
sint64 neg_g_177_low60_0_low20_6,
sint64 u_177_182,
sint64 v_177_182,
sint64 r_177_182,
sint64 s_177_182,
sint64 u_177_183,
sint64 v_177_183,
sint64 r_177_183,
sint64 s_177_183,
bit ne
)={
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (-(2**20)),
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (-(2**20))
&&
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (const 64 (-(2**20))),
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_5 + u_177_182 * (const 64 (2**21)) + v_177_182 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_5 + r_177_182 * (const 64 (2**21)) + s_177_182 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_5,
    neg_f_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_5,
    neg_g_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 182)) <=s delta, delta <=s (const 64 (1 + 2*182)),
    (const 64 (-(2**20))) <=s u_177_182, u_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_182, v_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_182, r_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_182, s_177_182 <=s (const 64 ((2**20))),
    u_177_182 + v_177_182 <=s (const 64 (2**20)),
    u_177_182 - v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 + v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 - v_177_182 <=s (const 64 (2**20)),
    r_177_182 + s_177_182 <=s (const 64 (2**20)),
    r_177_182 - s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 + s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 - s_177_182 <=s (const 64 (2**20)),
    u_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_177_182 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step182

// premise b
assume
neg_g_177_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_6 neg_f_177_low60_0_low20_5;
mov u_177_183 u_177_182;
mov v_177_183 v_177_182;

add neg_g_177_low60_0_low20_6 neg_g_177_low60_0_low20_5 neg_f_177_low60_0_low20_5;
asr neg_g_177_low60_0_low20_6 neg_g_177_low60_0_low20_6 1;
add r_177_183 r_177_182 u_177_182;
asr r_177_183 r_177_183 1;
add s_177_183 s_177_182 v_177_182;
asr s_177_183 s_177_183 1;
assert
    true
&&
    neg_f_177_low60_0_low20_6 = neg_f_177_low60_0_low20_5,
    u_177_183 = u_177_182,
    v_177_183 = v_177_182,
    neg_g_177_low60_0_low20_6 * (const 64 2) = neg_g_177_low60_0_low20_5 + neg_f_177_low60_0_low20_5,
    r_177_183 * (const 64 2) = r_177_182 + u_177_182,
    s_177_183 * (const 64 2) = s_177_182 + v_177_182
;

assume
    neg_f_177_low60_0_low20_6 = neg_f_177_low60_0_low20_5,
    u_177_183 = u_177_182,
    v_177_183 = v_177_182,
    neg_g_177_low60_0_low20_6 * 2 = neg_g_177_low60_0_low20_5 + neg_f_177_low60_0_low20_5,
    r_177_183 * 2 = r_177_182 + u_177_182,
    s_177_183 * 2 = s_177_182 + v_177_182
&&
    true
;

{
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_6 + u_177_183 * (const 64 (2**21)) + v_177_183 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_6 + r_177_183 * (const 64 (2**21)) + s_177_183 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_6,
    neg_f_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_6,
    neg_g_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 183)) <=s delta, delta <=s (const 64 (1 + 2*183)),
    (const 64 (-(2**20))) <=s u_177_183, u_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_183, v_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_183, r_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_183, s_177_183 <=s (const 64 ((2**20))),
    u_177_183 + v_177_183 <=s (const 64 (2**20)),
    u_177_183 - v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 + v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 - v_177_183 <=s (const 64 (2**20)),
    r_177_183 + s_177_183 <=s (const 64 (2**20)),
    r_177_183 - s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 + s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 - s_177_183 <=s (const 64 (2**20)),
    u_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_177_183 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_182_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_5,
sint64 neg_g_177_low60_0_low20_5,
sint64 neg_f_177_low60_0_low20_6,
sint64 neg_g_177_low60_0_low20_6,
sint64 u_177_182,
sint64 v_177_182,
sint64 r_177_182,
sint64 s_177_182,
sint64 u_177_183,
sint64 v_177_183,
sint64 r_177_183,
sint64 s_177_183,
bit ne
)={
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (-(2**20)),
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (-(2**20))
&&
    u_177_182 * neg_f_177_low60_0_low20_0 + v_177_182 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_5 * (const 64 (-(2**20))),
    r_177_182 * neg_f_177_low60_0_low20_0 + s_177_182 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_5 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_5 + u_177_182 * (const 64 (2**21)) + v_177_182 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_5 + r_177_182 * (const 64 (2**21)) + s_177_182 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_5,
    neg_f_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_5,
    neg_g_177_low60_0_low20_5 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 182)) <=s delta, delta <=s (const 64 (1 + 2*182)),
    (const 64 (-(2**20))) <=s u_177_182, u_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_182, v_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_182, r_177_182 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_182, s_177_182 <=s (const 64 ((2**20))),
    u_177_182 + v_177_182 <=s (const 64 (2**20)),
    u_177_182 - v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 + v_177_182 <=s (const 64 (2**20)),
    (const 64 0) - u_177_182 - v_177_182 <=s (const 64 (2**20)),
    r_177_182 + s_177_182 <=s (const 64 (2**20)),
    r_177_182 - s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 + s_177_182 <=s (const 64 (2**20)),
    (const 64 0) - r_177_182 - s_177_182 <=s (const 64 (2**20)),
    u_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    v_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    r_177_182 = (const 64 0) (mod (const 64 (2**(20-5)))),
    s_177_182 = (const 64 0) (mod (const 64 (2**(20-5))))
}



// divsteps
// step182

// premise c
assume
neg_g_177_low60_0_low20_5 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_5 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_6 neg_g_177_low60_0_low20_5;
mov u_177_183 r_177_182;
mov v_177_183 s_177_182;

subs dc neg_g_177_low60_0_low20_6 neg_g_177_low60_0_low20_5 neg_f_177_low60_0_low20_5;
asr neg_g_177_low60_0_low20_6 neg_g_177_low60_0_low20_6 1;
subs dc r_177_183 r_177_182 u_177_182;
asr r_177_183 r_177_183 1;
subs dc s_177_183 s_177_182 v_177_182;
asr s_177_183 s_177_183 1;
assert
    true
&&
    neg_f_177_low60_0_low20_6 = neg_g_177_low60_0_low20_5,
    u_177_183 = r_177_182,
    v_177_183 = s_177_182,
    neg_g_177_low60_0_low20_6 * (const 64 2) = neg_g_177_low60_0_low20_5 - neg_f_177_low60_0_low20_5,
    r_177_183 * (const 64 2) = r_177_182 - u_177_182,
    s_177_183 * (const 64 2) = s_177_182 - v_177_182
;

assume
    neg_f_177_low60_0_low20_6 = neg_g_177_low60_0_low20_5,
    u_177_183 = r_177_182,
    v_177_183 = s_177_182,
    neg_g_177_low60_0_low20_6 * 2 = neg_g_177_low60_0_low20_5 - neg_f_177_low60_0_low20_5,
    r_177_183 * 2 = r_177_182 - u_177_182,
    s_177_183 * 2 = s_177_182 - v_177_182
&&
    true
;

{
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_6 + u_177_183 * (const 64 (2**21)) + v_177_183 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_6 + r_177_183 * (const 64 (2**21)) + s_177_183 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_6,
    neg_f_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_6,
    neg_g_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 183)) <=s delta, delta <=s (const 64 (1 + 2*183)),
    (const 64 (-(2**20))) <=s u_177_183, u_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_183, v_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_183, r_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_183, s_177_183 <=s (const 64 ((2**20))),
    u_177_183 + v_177_183 <=s (const 64 (2**20)),
    u_177_183 - v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 + v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 - v_177_183 <=s (const 64 (2**20)),
    r_177_183 + s_177_183 <=s (const 64 (2**20)),
    r_177_183 - s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 + s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 - s_177_183 <=s (const 64 (2**20)),
    u_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_177_183 = (const 64 0) (mod (const 64 (2**(20-6))))
}

proc divstep_183_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_6,
sint64 neg_g_177_low60_0_low20_6,
sint64 neg_f_177_low60_0_low20_7,
sint64 neg_g_177_low60_0_low20_7,
sint64 u_177_183,
sint64 v_177_183,
sint64 r_177_183,
sint64 s_177_183,
sint64 u_177_184,
sint64 v_177_184,
sint64 r_177_184,
sint64 s_177_184,
bit ne
)={
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (-(2**20)),
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (-(2**20))
&&
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (const 64 (-(2**20))),
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_6 + u_177_183 * (const 64 (2**21)) + v_177_183 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_6 + r_177_183 * (const 64 (2**21)) + s_177_183 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_6,
    neg_f_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_6,
    neg_g_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 183)) <=s delta, delta <=s (const 64 (1 + 2*183)),
    (const 64 (-(2**20))) <=s u_177_183, u_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_183, v_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_183, r_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_183, s_177_183 <=s (const 64 ((2**20))),
    u_177_183 + v_177_183 <=s (const 64 (2**20)),
    u_177_183 - v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 + v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 - v_177_183 <=s (const 64 (2**20)),
    r_177_183 + s_177_183 <=s (const 64 (2**20)),
    r_177_183 - s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 + s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 - s_177_183 <=s (const 64 (2**20)),
    u_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_177_183 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step183

// premise a
assume
neg_g_177_low60_0_low20_6 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_6 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_7 neg_f_177_low60_0_low20_6;
mov u_177_184 u_177_183;
mov v_177_184 v_177_183;

asr neg_g_177_low60_0_low20_7 neg_g_177_low60_0_low20_6 1;
asr r_177_184 r_177_183 1;
asr s_177_184 s_177_183 1;
assert
    true
&&
    neg_f_177_low60_0_low20_7 = neg_f_177_low60_0_low20_6,
    u_177_184 = u_177_183,
    v_177_184 = v_177_183,
    neg_g_177_low60_0_low20_7 * (const 64 2) = neg_g_177_low60_0_low20_6,
    r_177_184 * (const 64 2) = r_177_183,
    s_177_184 * (const 64 2) = s_177_183
;

assume
    neg_f_177_low60_0_low20_7 = neg_f_177_low60_0_low20_6,
    u_177_184 = u_177_183,
    v_177_184 = v_177_183,
    neg_g_177_low60_0_low20_7 * 2 = neg_g_177_low60_0_low20_6,
    r_177_184 * 2 = r_177_183,
    s_177_184 * 2 = s_177_183
&&
    true
;

{
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_7 + u_177_184 * (const 64 (2**21)) + v_177_184 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_7 + r_177_184 * (const 64 (2**21)) + s_177_184 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_7,
    neg_f_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_7,
    neg_g_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 184)) <=s delta, delta <=s (const 64 (1 + 2*184)),
    (const 64 (-(2**20))) <=s u_177_184, u_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_184, v_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_184, r_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_184, s_177_184 <=s (const 64 ((2**20))),
    u_177_184 + v_177_184 <=s (const 64 (2**20)),
    u_177_184 - v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 + v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 - v_177_184 <=s (const 64 (2**20)),
    r_177_184 + s_177_184 <=s (const 64 (2**20)),
    r_177_184 - s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 + s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 - s_177_184 <=s (const 64 (2**20)),
    u_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_177_184 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_183_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_6,
sint64 neg_g_177_low60_0_low20_6,
sint64 neg_f_177_low60_0_low20_7,
sint64 neg_g_177_low60_0_low20_7,
sint64 u_177_183,
sint64 v_177_183,
sint64 r_177_183,
sint64 s_177_183,
sint64 u_177_184,
sint64 v_177_184,
sint64 r_177_184,
sint64 s_177_184,
bit ne
)={
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (-(2**20)),
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (-(2**20))
&&
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (const 64 (-(2**20))),
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_6 + u_177_183 * (const 64 (2**21)) + v_177_183 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_6 + r_177_183 * (const 64 (2**21)) + s_177_183 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_6,
    neg_f_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_6,
    neg_g_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 183)) <=s delta, delta <=s (const 64 (1 + 2*183)),
    (const 64 (-(2**20))) <=s u_177_183, u_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_183, v_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_183, r_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_183, s_177_183 <=s (const 64 ((2**20))),
    u_177_183 + v_177_183 <=s (const 64 (2**20)),
    u_177_183 - v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 + v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 - v_177_183 <=s (const 64 (2**20)),
    r_177_183 + s_177_183 <=s (const 64 (2**20)),
    r_177_183 - s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 + s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 - s_177_183 <=s (const 64 (2**20)),
    u_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_177_183 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step183

// premise b
assume
neg_g_177_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_7 neg_f_177_low60_0_low20_6;
mov u_177_184 u_177_183;
mov v_177_184 v_177_183;

add neg_g_177_low60_0_low20_7 neg_g_177_low60_0_low20_6 neg_f_177_low60_0_low20_6;
asr neg_g_177_low60_0_low20_7 neg_g_177_low60_0_low20_7 1;
add r_177_184 r_177_183 u_177_183;
asr r_177_184 r_177_184 1;
add s_177_184 s_177_183 v_177_183;
asr s_177_184 s_177_184 1;
assert
    true
&&
    neg_f_177_low60_0_low20_7 = neg_f_177_low60_0_low20_6,
    u_177_184 = u_177_183,
    v_177_184 = v_177_183,
    neg_g_177_low60_0_low20_7 * (const 64 2) = neg_g_177_low60_0_low20_6 + neg_f_177_low60_0_low20_6,
    r_177_184 * (const 64 2) = r_177_183 + u_177_183,
    s_177_184 * (const 64 2) = s_177_183 + v_177_183
;

assume
    neg_f_177_low60_0_low20_7 = neg_f_177_low60_0_low20_6,
    u_177_184 = u_177_183,
    v_177_184 = v_177_183,
    neg_g_177_low60_0_low20_7 * 2 = neg_g_177_low60_0_low20_6 + neg_f_177_low60_0_low20_6,
    r_177_184 * 2 = r_177_183 + u_177_183,
    s_177_184 * 2 = s_177_183 + v_177_183
&&
    true
;

{
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_7 + u_177_184 * (const 64 (2**21)) + v_177_184 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_7 + r_177_184 * (const 64 (2**21)) + s_177_184 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_7,
    neg_f_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_7,
    neg_g_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 184)) <=s delta, delta <=s (const 64 (1 + 2*184)),
    (const 64 (-(2**20))) <=s u_177_184, u_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_184, v_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_184, r_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_184, s_177_184 <=s (const 64 ((2**20))),
    u_177_184 + v_177_184 <=s (const 64 (2**20)),
    u_177_184 - v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 + v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 - v_177_184 <=s (const 64 (2**20)),
    r_177_184 + s_177_184 <=s (const 64 (2**20)),
    r_177_184 - s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 + s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 - s_177_184 <=s (const 64 (2**20)),
    u_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_177_184 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_183_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_6,
sint64 neg_g_177_low60_0_low20_6,
sint64 neg_f_177_low60_0_low20_7,
sint64 neg_g_177_low60_0_low20_7,
sint64 u_177_183,
sint64 v_177_183,
sint64 r_177_183,
sint64 s_177_183,
sint64 u_177_184,
sint64 v_177_184,
sint64 r_177_184,
sint64 s_177_184,
bit ne
)={
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (-(2**20)),
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (-(2**20))
&&
    u_177_183 * neg_f_177_low60_0_low20_0 + v_177_183 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_6 * (const 64 (-(2**20))),
    r_177_183 * neg_f_177_low60_0_low20_0 + s_177_183 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_6 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_6 + u_177_183 * (const 64 (2**21)) + v_177_183 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_6 + r_177_183 * (const 64 (2**21)) + s_177_183 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_6,
    neg_f_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_6,
    neg_g_177_low60_0_low20_6 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 183)) <=s delta, delta <=s (const 64 (1 + 2*183)),
    (const 64 (-(2**20))) <=s u_177_183, u_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_183, v_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_183, r_177_183 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_183, s_177_183 <=s (const 64 ((2**20))),
    u_177_183 + v_177_183 <=s (const 64 (2**20)),
    u_177_183 - v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 + v_177_183 <=s (const 64 (2**20)),
    (const 64 0) - u_177_183 - v_177_183 <=s (const 64 (2**20)),
    r_177_183 + s_177_183 <=s (const 64 (2**20)),
    r_177_183 - s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 + s_177_183 <=s (const 64 (2**20)),
    (const 64 0) - r_177_183 - s_177_183 <=s (const 64 (2**20)),
    u_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    v_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    r_177_183 = (const 64 0) (mod (const 64 (2**(20-6)))),
    s_177_183 = (const 64 0) (mod (const 64 (2**(20-6))))
}



// divsteps
// step183

// premise c
assume
neg_g_177_low60_0_low20_6 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_6 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_7 neg_g_177_low60_0_low20_6;
mov u_177_184 r_177_183;
mov v_177_184 s_177_183;

subs dc neg_g_177_low60_0_low20_7 neg_g_177_low60_0_low20_6 neg_f_177_low60_0_low20_6;
asr neg_g_177_low60_0_low20_7 neg_g_177_low60_0_low20_7 1;
subs dc r_177_184 r_177_183 u_177_183;
asr r_177_184 r_177_184 1;
subs dc s_177_184 s_177_183 v_177_183;
asr s_177_184 s_177_184 1;
assert
    true
&&
    neg_f_177_low60_0_low20_7 = neg_g_177_low60_0_low20_6,
    u_177_184 = r_177_183,
    v_177_184 = s_177_183,
    neg_g_177_low60_0_low20_7 * (const 64 2) = neg_g_177_low60_0_low20_6 - neg_f_177_low60_0_low20_6,
    r_177_184 * (const 64 2) = r_177_183 - u_177_183,
    s_177_184 * (const 64 2) = s_177_183 - v_177_183
;

assume
    neg_f_177_low60_0_low20_7 = neg_g_177_low60_0_low20_6,
    u_177_184 = r_177_183,
    v_177_184 = s_177_183,
    neg_g_177_low60_0_low20_7 * 2 = neg_g_177_low60_0_low20_6 - neg_f_177_low60_0_low20_6,
    r_177_184 * 2 = r_177_183 - u_177_183,
    s_177_184 * 2 = s_177_183 - v_177_183
&&
    true
;

{
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_7 + u_177_184 * (const 64 (2**21)) + v_177_184 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_7 + r_177_184 * (const 64 (2**21)) + s_177_184 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_7,
    neg_f_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_7,
    neg_g_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 184)) <=s delta, delta <=s (const 64 (1 + 2*184)),
    (const 64 (-(2**20))) <=s u_177_184, u_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_184, v_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_184, r_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_184, s_177_184 <=s (const 64 ((2**20))),
    u_177_184 + v_177_184 <=s (const 64 (2**20)),
    u_177_184 - v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 + v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 - v_177_184 <=s (const 64 (2**20)),
    r_177_184 + s_177_184 <=s (const 64 (2**20)),
    r_177_184 - s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 + s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 - s_177_184 <=s (const 64 (2**20)),
    u_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_177_184 = (const 64 0) (mod (const 64 (2**(20-7))))
}

proc divstep_184_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_7,
sint64 neg_g_177_low60_0_low20_7,
sint64 neg_f_177_low60_0_low20_8,
sint64 neg_g_177_low60_0_low20_8,
sint64 u_177_184,
sint64 v_177_184,
sint64 r_177_184,
sint64 s_177_184,
sint64 u_177_185,
sint64 v_177_185,
sint64 r_177_185,
sint64 s_177_185,
bit ne
)={
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (-(2**20)),
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (-(2**20))
&&
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (const 64 (-(2**20))),
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_7 + u_177_184 * (const 64 (2**21)) + v_177_184 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_7 + r_177_184 * (const 64 (2**21)) + s_177_184 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_7,
    neg_f_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_7,
    neg_g_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 184)) <=s delta, delta <=s (const 64 (1 + 2*184)),
    (const 64 (-(2**20))) <=s u_177_184, u_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_184, v_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_184, r_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_184, s_177_184 <=s (const 64 ((2**20))),
    u_177_184 + v_177_184 <=s (const 64 (2**20)),
    u_177_184 - v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 + v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 - v_177_184 <=s (const 64 (2**20)),
    r_177_184 + s_177_184 <=s (const 64 (2**20)),
    r_177_184 - s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 + s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 - s_177_184 <=s (const 64 (2**20)),
    u_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_177_184 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step184

// premise a
assume
neg_g_177_low60_0_low20_7 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_7 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_8 neg_f_177_low60_0_low20_7;
mov u_177_185 u_177_184;
mov v_177_185 v_177_184;

asr neg_g_177_low60_0_low20_8 neg_g_177_low60_0_low20_7 1;
asr r_177_185 r_177_184 1;
asr s_177_185 s_177_184 1;
assert
    true
&&
    neg_f_177_low60_0_low20_8 = neg_f_177_low60_0_low20_7,
    u_177_185 = u_177_184,
    v_177_185 = v_177_184,
    neg_g_177_low60_0_low20_8 * (const 64 2) = neg_g_177_low60_0_low20_7,
    r_177_185 * (const 64 2) = r_177_184,
    s_177_185 * (const 64 2) = s_177_184
;

assume
    neg_f_177_low60_0_low20_8 = neg_f_177_low60_0_low20_7,
    u_177_185 = u_177_184,
    v_177_185 = v_177_184,
    neg_g_177_low60_0_low20_8 * 2 = neg_g_177_low60_0_low20_7,
    r_177_185 * 2 = r_177_184,
    s_177_185 * 2 = s_177_184
&&
    true
;

{
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_8 + u_177_185 * (const 64 (2**21)) + v_177_185 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_8 + r_177_185 * (const 64 (2**21)) + s_177_185 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_8,
    neg_f_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_8,
    neg_g_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 185)) <=s delta, delta <=s (const 64 (1 + 2*185)),
    (const 64 (-(2**20))) <=s u_177_185, u_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_185, v_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_185, r_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_185, s_177_185 <=s (const 64 ((2**20))),
    u_177_185 + v_177_185 <=s (const 64 (2**20)),
    u_177_185 - v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 + v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 - v_177_185 <=s (const 64 (2**20)),
    r_177_185 + s_177_185 <=s (const 64 (2**20)),
    r_177_185 - s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 + s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 - s_177_185 <=s (const 64 (2**20)),
    u_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_177_185 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_184_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_7,
sint64 neg_g_177_low60_0_low20_7,
sint64 neg_f_177_low60_0_low20_8,
sint64 neg_g_177_low60_0_low20_8,
sint64 u_177_184,
sint64 v_177_184,
sint64 r_177_184,
sint64 s_177_184,
sint64 u_177_185,
sint64 v_177_185,
sint64 r_177_185,
sint64 s_177_185,
bit ne
)={
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (-(2**20)),
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (-(2**20))
&&
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (const 64 (-(2**20))),
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_7 + u_177_184 * (const 64 (2**21)) + v_177_184 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_7 + r_177_184 * (const 64 (2**21)) + s_177_184 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_7,
    neg_f_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_7,
    neg_g_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 184)) <=s delta, delta <=s (const 64 (1 + 2*184)),
    (const 64 (-(2**20))) <=s u_177_184, u_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_184, v_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_184, r_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_184, s_177_184 <=s (const 64 ((2**20))),
    u_177_184 + v_177_184 <=s (const 64 (2**20)),
    u_177_184 - v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 + v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 - v_177_184 <=s (const 64 (2**20)),
    r_177_184 + s_177_184 <=s (const 64 (2**20)),
    r_177_184 - s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 + s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 - s_177_184 <=s (const 64 (2**20)),
    u_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_177_184 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step184

// premise b
assume
neg_g_177_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_8 neg_f_177_low60_0_low20_7;
mov u_177_185 u_177_184;
mov v_177_185 v_177_184;

add neg_g_177_low60_0_low20_8 neg_g_177_low60_0_low20_7 neg_f_177_low60_0_low20_7;
asr neg_g_177_low60_0_low20_8 neg_g_177_low60_0_low20_8 1;
add r_177_185 r_177_184 u_177_184;
asr r_177_185 r_177_185 1;
add s_177_185 s_177_184 v_177_184;
asr s_177_185 s_177_185 1;
assert
    true
&&
    neg_f_177_low60_0_low20_8 = neg_f_177_low60_0_low20_7,
    u_177_185 = u_177_184,
    v_177_185 = v_177_184,
    neg_g_177_low60_0_low20_8 * (const 64 2) = neg_g_177_low60_0_low20_7 + neg_f_177_low60_0_low20_7,
    r_177_185 * (const 64 2) = r_177_184 + u_177_184,
    s_177_185 * (const 64 2) = s_177_184 + v_177_184
;

assume
    neg_f_177_low60_0_low20_8 = neg_f_177_low60_0_low20_7,
    u_177_185 = u_177_184,
    v_177_185 = v_177_184,
    neg_g_177_low60_0_low20_8 * 2 = neg_g_177_low60_0_low20_7 + neg_f_177_low60_0_low20_7,
    r_177_185 * 2 = r_177_184 + u_177_184,
    s_177_185 * 2 = s_177_184 + v_177_184
&&
    true
;

{
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_8 + u_177_185 * (const 64 (2**21)) + v_177_185 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_8 + r_177_185 * (const 64 (2**21)) + s_177_185 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_8,
    neg_f_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_8,
    neg_g_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 185)) <=s delta, delta <=s (const 64 (1 + 2*185)),
    (const 64 (-(2**20))) <=s u_177_185, u_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_185, v_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_185, r_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_185, s_177_185 <=s (const 64 ((2**20))),
    u_177_185 + v_177_185 <=s (const 64 (2**20)),
    u_177_185 - v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 + v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 - v_177_185 <=s (const 64 (2**20)),
    r_177_185 + s_177_185 <=s (const 64 (2**20)),
    r_177_185 - s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 + s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 - s_177_185 <=s (const 64 (2**20)),
    u_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_177_185 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_184_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_7,
sint64 neg_g_177_low60_0_low20_7,
sint64 neg_f_177_low60_0_low20_8,
sint64 neg_g_177_low60_0_low20_8,
sint64 u_177_184,
sint64 v_177_184,
sint64 r_177_184,
sint64 s_177_184,
sint64 u_177_185,
sint64 v_177_185,
sint64 r_177_185,
sint64 s_177_185,
bit ne
)={
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (-(2**20)),
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (-(2**20))
&&
    u_177_184 * neg_f_177_low60_0_low20_0 + v_177_184 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_7 * (const 64 (-(2**20))),
    r_177_184 * neg_f_177_low60_0_low20_0 + s_177_184 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_7 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_7 + u_177_184 * (const 64 (2**21)) + v_177_184 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_7 + r_177_184 * (const 64 (2**21)) + s_177_184 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_7,
    neg_f_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_7,
    neg_g_177_low60_0_low20_7 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 184)) <=s delta, delta <=s (const 64 (1 + 2*184)),
    (const 64 (-(2**20))) <=s u_177_184, u_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_184, v_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_184, r_177_184 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_184, s_177_184 <=s (const 64 ((2**20))),
    u_177_184 + v_177_184 <=s (const 64 (2**20)),
    u_177_184 - v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 + v_177_184 <=s (const 64 (2**20)),
    (const 64 0) - u_177_184 - v_177_184 <=s (const 64 (2**20)),
    r_177_184 + s_177_184 <=s (const 64 (2**20)),
    r_177_184 - s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 + s_177_184 <=s (const 64 (2**20)),
    (const 64 0) - r_177_184 - s_177_184 <=s (const 64 (2**20)),
    u_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    v_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    r_177_184 = (const 64 0) (mod (const 64 (2**(20-7)))),
    s_177_184 = (const 64 0) (mod (const 64 (2**(20-7))))
}



// divsteps
// step184

// premise c
assume
neg_g_177_low60_0_low20_7 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_7 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_8 neg_g_177_low60_0_low20_7;
mov u_177_185 r_177_184;
mov v_177_185 s_177_184;

subs dc neg_g_177_low60_0_low20_8 neg_g_177_low60_0_low20_7 neg_f_177_low60_0_low20_7;
asr neg_g_177_low60_0_low20_8 neg_g_177_low60_0_low20_8 1;
subs dc r_177_185 r_177_184 u_177_184;
asr r_177_185 r_177_185 1;
subs dc s_177_185 s_177_184 v_177_184;
asr s_177_185 s_177_185 1;
assert
    true
&&
    neg_f_177_low60_0_low20_8 = neg_g_177_low60_0_low20_7,
    u_177_185 = r_177_184,
    v_177_185 = s_177_184,
    neg_g_177_low60_0_low20_8 * (const 64 2) = neg_g_177_low60_0_low20_7 - neg_f_177_low60_0_low20_7,
    r_177_185 * (const 64 2) = r_177_184 - u_177_184,
    s_177_185 * (const 64 2) = s_177_184 - v_177_184
;

assume
    neg_f_177_low60_0_low20_8 = neg_g_177_low60_0_low20_7,
    u_177_185 = r_177_184,
    v_177_185 = s_177_184,
    neg_g_177_low60_0_low20_8 * 2 = neg_g_177_low60_0_low20_7 - neg_f_177_low60_0_low20_7,
    r_177_185 * 2 = r_177_184 - u_177_184,
    s_177_185 * 2 = s_177_184 - v_177_184
&&
    true
;

{
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_8 + u_177_185 * (const 64 (2**21)) + v_177_185 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_8 + r_177_185 * (const 64 (2**21)) + s_177_185 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_8,
    neg_f_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_8,
    neg_g_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 185)) <=s delta, delta <=s (const 64 (1 + 2*185)),
    (const 64 (-(2**20))) <=s u_177_185, u_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_185, v_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_185, r_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_185, s_177_185 <=s (const 64 ((2**20))),
    u_177_185 + v_177_185 <=s (const 64 (2**20)),
    u_177_185 - v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 + v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 - v_177_185 <=s (const 64 (2**20)),
    r_177_185 + s_177_185 <=s (const 64 (2**20)),
    r_177_185 - s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 + s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 - s_177_185 <=s (const 64 (2**20)),
    u_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_177_185 = (const 64 0) (mod (const 64 (2**(20-8))))
}

proc divstep_185_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_8,
sint64 neg_g_177_low60_0_low20_8,
sint64 neg_f_177_low60_0_low20_9,
sint64 neg_g_177_low60_0_low20_9,
sint64 u_177_185,
sint64 v_177_185,
sint64 r_177_185,
sint64 s_177_185,
sint64 u_177_186,
sint64 v_177_186,
sint64 r_177_186,
sint64 s_177_186,
bit ne
)={
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (-(2**20)),
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (-(2**20))
&&
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (const 64 (-(2**20))),
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_8 + u_177_185 * (const 64 (2**21)) + v_177_185 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_8 + r_177_185 * (const 64 (2**21)) + s_177_185 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_8,
    neg_f_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_8,
    neg_g_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 185)) <=s delta, delta <=s (const 64 (1 + 2*185)),
    (const 64 (-(2**20))) <=s u_177_185, u_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_185, v_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_185, r_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_185, s_177_185 <=s (const 64 ((2**20))),
    u_177_185 + v_177_185 <=s (const 64 (2**20)),
    u_177_185 - v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 + v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 - v_177_185 <=s (const 64 (2**20)),
    r_177_185 + s_177_185 <=s (const 64 (2**20)),
    r_177_185 - s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 + s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 - s_177_185 <=s (const 64 (2**20)),
    u_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_177_185 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step185

// premise a
assume
neg_g_177_low60_0_low20_8 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_8 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_9 neg_f_177_low60_0_low20_8;
mov u_177_186 u_177_185;
mov v_177_186 v_177_185;

asr neg_g_177_low60_0_low20_9 neg_g_177_low60_0_low20_8 1;
asr r_177_186 r_177_185 1;
asr s_177_186 s_177_185 1;
assert
    true
&&
    neg_f_177_low60_0_low20_9 = neg_f_177_low60_0_low20_8,
    u_177_186 = u_177_185,
    v_177_186 = v_177_185,
    neg_g_177_low60_0_low20_9 * (const 64 2) = neg_g_177_low60_0_low20_8,
    r_177_186 * (const 64 2) = r_177_185,
    s_177_186 * (const 64 2) = s_177_185
;

assume
    neg_f_177_low60_0_low20_9 = neg_f_177_low60_0_low20_8,
    u_177_186 = u_177_185,
    v_177_186 = v_177_185,
    neg_g_177_low60_0_low20_9 * 2 = neg_g_177_low60_0_low20_8,
    r_177_186 * 2 = r_177_185,
    s_177_186 * 2 = s_177_185
&&
    true
;

{
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_9 + u_177_186 * (const 64 (2**21)) + v_177_186 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_9 + r_177_186 * (const 64 (2**21)) + s_177_186 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_9,
    neg_f_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_9,
    neg_g_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 186)) <=s delta, delta <=s (const 64 (1 + 2*186)),
    (const 64 (-(2**20))) <=s u_177_186, u_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_186, v_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_186, r_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_186, s_177_186 <=s (const 64 ((2**20))),
    u_177_186 + v_177_186 <=s (const 64 (2**20)),
    u_177_186 - v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 + v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 - v_177_186 <=s (const 64 (2**20)),
    r_177_186 + s_177_186 <=s (const 64 (2**20)),
    r_177_186 - s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 + s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 - s_177_186 <=s (const 64 (2**20)),
    u_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_177_186 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_185_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_8,
sint64 neg_g_177_low60_0_low20_8,
sint64 neg_f_177_low60_0_low20_9,
sint64 neg_g_177_low60_0_low20_9,
sint64 u_177_185,
sint64 v_177_185,
sint64 r_177_185,
sint64 s_177_185,
sint64 u_177_186,
sint64 v_177_186,
sint64 r_177_186,
sint64 s_177_186,
bit ne
)={
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (-(2**20)),
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (-(2**20))
&&
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (const 64 (-(2**20))),
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_8 + u_177_185 * (const 64 (2**21)) + v_177_185 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_8 + r_177_185 * (const 64 (2**21)) + s_177_185 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_8,
    neg_f_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_8,
    neg_g_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 185)) <=s delta, delta <=s (const 64 (1 + 2*185)),
    (const 64 (-(2**20))) <=s u_177_185, u_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_185, v_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_185, r_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_185, s_177_185 <=s (const 64 ((2**20))),
    u_177_185 + v_177_185 <=s (const 64 (2**20)),
    u_177_185 - v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 + v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 - v_177_185 <=s (const 64 (2**20)),
    r_177_185 + s_177_185 <=s (const 64 (2**20)),
    r_177_185 - s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 + s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 - s_177_185 <=s (const 64 (2**20)),
    u_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_177_185 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step185

// premise b
assume
neg_g_177_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_9 neg_f_177_low60_0_low20_8;
mov u_177_186 u_177_185;
mov v_177_186 v_177_185;

add neg_g_177_low60_0_low20_9 neg_g_177_low60_0_low20_8 neg_f_177_low60_0_low20_8;
asr neg_g_177_low60_0_low20_9 neg_g_177_low60_0_low20_9 1;
add r_177_186 r_177_185 u_177_185;
asr r_177_186 r_177_186 1;
add s_177_186 s_177_185 v_177_185;
asr s_177_186 s_177_186 1;
assert
    true
&&
    neg_f_177_low60_0_low20_9 = neg_f_177_low60_0_low20_8,
    u_177_186 = u_177_185,
    v_177_186 = v_177_185,
    neg_g_177_low60_0_low20_9 * (const 64 2) = neg_g_177_low60_0_low20_8 + neg_f_177_low60_0_low20_8,
    r_177_186 * (const 64 2) = r_177_185 + u_177_185,
    s_177_186 * (const 64 2) = s_177_185 + v_177_185
;

assume
    neg_f_177_low60_0_low20_9 = neg_f_177_low60_0_low20_8,
    u_177_186 = u_177_185,
    v_177_186 = v_177_185,
    neg_g_177_low60_0_low20_9 * 2 = neg_g_177_low60_0_low20_8 + neg_f_177_low60_0_low20_8,
    r_177_186 * 2 = r_177_185 + u_177_185,
    s_177_186 * 2 = s_177_185 + v_177_185
&&
    true
;

{
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_9 + u_177_186 * (const 64 (2**21)) + v_177_186 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_9 + r_177_186 * (const 64 (2**21)) + s_177_186 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_9,
    neg_f_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_9,
    neg_g_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 186)) <=s delta, delta <=s (const 64 (1 + 2*186)),
    (const 64 (-(2**20))) <=s u_177_186, u_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_186, v_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_186, r_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_186, s_177_186 <=s (const 64 ((2**20))),
    u_177_186 + v_177_186 <=s (const 64 (2**20)),
    u_177_186 - v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 + v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 - v_177_186 <=s (const 64 (2**20)),
    r_177_186 + s_177_186 <=s (const 64 (2**20)),
    r_177_186 - s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 + s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 - s_177_186 <=s (const 64 (2**20)),
    u_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_177_186 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_185_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_8,
sint64 neg_g_177_low60_0_low20_8,
sint64 neg_f_177_low60_0_low20_9,
sint64 neg_g_177_low60_0_low20_9,
sint64 u_177_185,
sint64 v_177_185,
sint64 r_177_185,
sint64 s_177_185,
sint64 u_177_186,
sint64 v_177_186,
sint64 r_177_186,
sint64 s_177_186,
bit ne
)={
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (-(2**20)),
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (-(2**20))
&&
    u_177_185 * neg_f_177_low60_0_low20_0 + v_177_185 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_8 * (const 64 (-(2**20))),
    r_177_185 * neg_f_177_low60_0_low20_0 + s_177_185 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_8 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_8 + u_177_185 * (const 64 (2**21)) + v_177_185 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_8 + r_177_185 * (const 64 (2**21)) + s_177_185 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_8,
    neg_f_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_8,
    neg_g_177_low60_0_low20_8 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 185)) <=s delta, delta <=s (const 64 (1 + 2*185)),
    (const 64 (-(2**20))) <=s u_177_185, u_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_185, v_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_185, r_177_185 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_185, s_177_185 <=s (const 64 ((2**20))),
    u_177_185 + v_177_185 <=s (const 64 (2**20)),
    u_177_185 - v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 + v_177_185 <=s (const 64 (2**20)),
    (const 64 0) - u_177_185 - v_177_185 <=s (const 64 (2**20)),
    r_177_185 + s_177_185 <=s (const 64 (2**20)),
    r_177_185 - s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 + s_177_185 <=s (const 64 (2**20)),
    (const 64 0) - r_177_185 - s_177_185 <=s (const 64 (2**20)),
    u_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    v_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    r_177_185 = (const 64 0) (mod (const 64 (2**(20-8)))),
    s_177_185 = (const 64 0) (mod (const 64 (2**(20-8))))
}



// divsteps
// step185

// premise c
assume
neg_g_177_low60_0_low20_8 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_8 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_9 neg_g_177_low60_0_low20_8;
mov u_177_186 r_177_185;
mov v_177_186 s_177_185;

subs dc neg_g_177_low60_0_low20_9 neg_g_177_low60_0_low20_8 neg_f_177_low60_0_low20_8;
asr neg_g_177_low60_0_low20_9 neg_g_177_low60_0_low20_9 1;
subs dc r_177_186 r_177_185 u_177_185;
asr r_177_186 r_177_186 1;
subs dc s_177_186 s_177_185 v_177_185;
asr s_177_186 s_177_186 1;
assert
    true
&&
    neg_f_177_low60_0_low20_9 = neg_g_177_low60_0_low20_8,
    u_177_186 = r_177_185,
    v_177_186 = s_177_185,
    neg_g_177_low60_0_low20_9 * (const 64 2) = neg_g_177_low60_0_low20_8 - neg_f_177_low60_0_low20_8,
    r_177_186 * (const 64 2) = r_177_185 - u_177_185,
    s_177_186 * (const 64 2) = s_177_185 - v_177_185
;

assume
    neg_f_177_low60_0_low20_9 = neg_g_177_low60_0_low20_8,
    u_177_186 = r_177_185,
    v_177_186 = s_177_185,
    neg_g_177_low60_0_low20_9 * 2 = neg_g_177_low60_0_low20_8 - neg_f_177_low60_0_low20_8,
    r_177_186 * 2 = r_177_185 - u_177_185,
    s_177_186 * 2 = s_177_185 - v_177_185
&&
    true
;

{
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_9 + u_177_186 * (const 64 (2**21)) + v_177_186 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_9 + r_177_186 * (const 64 (2**21)) + s_177_186 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_9,
    neg_f_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_9,
    neg_g_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 186)) <=s delta, delta <=s (const 64 (1 + 2*186)),
    (const 64 (-(2**20))) <=s u_177_186, u_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_186, v_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_186, r_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_186, s_177_186 <=s (const 64 ((2**20))),
    u_177_186 + v_177_186 <=s (const 64 (2**20)),
    u_177_186 - v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 + v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 - v_177_186 <=s (const 64 (2**20)),
    r_177_186 + s_177_186 <=s (const 64 (2**20)),
    r_177_186 - s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 + s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 - s_177_186 <=s (const 64 (2**20)),
    u_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_177_186 = (const 64 0) (mod (const 64 (2**(20-9))))
}

proc divstep_186_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_9,
sint64 neg_g_177_low60_0_low20_9,
sint64 neg_f_177_low60_0_low20_10,
sint64 neg_g_177_low60_0_low20_10,
sint64 u_177_186,
sint64 v_177_186,
sint64 r_177_186,
sint64 s_177_186,
sint64 u_177_187,
sint64 v_177_187,
sint64 r_177_187,
sint64 s_177_187,
bit ne
)={
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (-(2**20)),
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (-(2**20))
&&
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (const 64 (-(2**20))),
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_9 + u_177_186 * (const 64 (2**21)) + v_177_186 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_9 + r_177_186 * (const 64 (2**21)) + s_177_186 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_9,
    neg_f_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_9,
    neg_g_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 186)) <=s delta, delta <=s (const 64 (1 + 2*186)),
    (const 64 (-(2**20))) <=s u_177_186, u_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_186, v_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_186, r_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_186, s_177_186 <=s (const 64 ((2**20))),
    u_177_186 + v_177_186 <=s (const 64 (2**20)),
    u_177_186 - v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 + v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 - v_177_186 <=s (const 64 (2**20)),
    r_177_186 + s_177_186 <=s (const 64 (2**20)),
    r_177_186 - s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 + s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 - s_177_186 <=s (const 64 (2**20)),
    u_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_177_186 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step186

// premise a
assume
neg_g_177_low60_0_low20_9 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_9 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_10 neg_f_177_low60_0_low20_9;
mov u_177_187 u_177_186;
mov v_177_187 v_177_186;

asr neg_g_177_low60_0_low20_10 neg_g_177_low60_0_low20_9 1;
asr r_177_187 r_177_186 1;
asr s_177_187 s_177_186 1;
assert
    true
&&
    neg_f_177_low60_0_low20_10 = neg_f_177_low60_0_low20_9,
    u_177_187 = u_177_186,
    v_177_187 = v_177_186,
    neg_g_177_low60_0_low20_10 * (const 64 2) = neg_g_177_low60_0_low20_9,
    r_177_187 * (const 64 2) = r_177_186,
    s_177_187 * (const 64 2) = s_177_186
;

assume
    neg_f_177_low60_0_low20_10 = neg_f_177_low60_0_low20_9,
    u_177_187 = u_177_186,
    v_177_187 = v_177_186,
    neg_g_177_low60_0_low20_10 * 2 = neg_g_177_low60_0_low20_9,
    r_177_187 * 2 = r_177_186,
    s_177_187 * 2 = s_177_186
&&
    true
;

{
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_10 + u_177_187 * (const 64 (2**21)) + v_177_187 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_10 + r_177_187 * (const 64 (2**21)) + s_177_187 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_10,
    neg_f_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_10,
    neg_g_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 187)) <=s delta, delta <=s (const 64 (1 + 2*187)),
    (const 64 (-(2**20))) <=s u_177_187, u_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_187, v_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_187, r_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_187, s_177_187 <=s (const 64 ((2**20))),
    u_177_187 + v_177_187 <=s (const 64 (2**20)),
    u_177_187 - v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 + v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 - v_177_187 <=s (const 64 (2**20)),
    r_177_187 + s_177_187 <=s (const 64 (2**20)),
    r_177_187 - s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 + s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 - s_177_187 <=s (const 64 (2**20)),
    u_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_177_187 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_186_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_9,
sint64 neg_g_177_low60_0_low20_9,
sint64 neg_f_177_low60_0_low20_10,
sint64 neg_g_177_low60_0_low20_10,
sint64 u_177_186,
sint64 v_177_186,
sint64 r_177_186,
sint64 s_177_186,
sint64 u_177_187,
sint64 v_177_187,
sint64 r_177_187,
sint64 s_177_187,
bit ne
)={
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (-(2**20)),
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (-(2**20))
&&
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (const 64 (-(2**20))),
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_9 + u_177_186 * (const 64 (2**21)) + v_177_186 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_9 + r_177_186 * (const 64 (2**21)) + s_177_186 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_9,
    neg_f_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_9,
    neg_g_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 186)) <=s delta, delta <=s (const 64 (1 + 2*186)),
    (const 64 (-(2**20))) <=s u_177_186, u_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_186, v_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_186, r_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_186, s_177_186 <=s (const 64 ((2**20))),
    u_177_186 + v_177_186 <=s (const 64 (2**20)),
    u_177_186 - v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 + v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 - v_177_186 <=s (const 64 (2**20)),
    r_177_186 + s_177_186 <=s (const 64 (2**20)),
    r_177_186 - s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 + s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 - s_177_186 <=s (const 64 (2**20)),
    u_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_177_186 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step186

// premise b
assume
neg_g_177_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_10 neg_f_177_low60_0_low20_9;
mov u_177_187 u_177_186;
mov v_177_187 v_177_186;

add neg_g_177_low60_0_low20_10 neg_g_177_low60_0_low20_9 neg_f_177_low60_0_low20_9;
asr neg_g_177_low60_0_low20_10 neg_g_177_low60_0_low20_10 1;
add r_177_187 r_177_186 u_177_186;
asr r_177_187 r_177_187 1;
add s_177_187 s_177_186 v_177_186;
asr s_177_187 s_177_187 1;
assert
    true
&&
    neg_f_177_low60_0_low20_10 = neg_f_177_low60_0_low20_9,
    u_177_187 = u_177_186,
    v_177_187 = v_177_186,
    neg_g_177_low60_0_low20_10 * (const 64 2) = neg_g_177_low60_0_low20_9 + neg_f_177_low60_0_low20_9,
    r_177_187 * (const 64 2) = r_177_186 + u_177_186,
    s_177_187 * (const 64 2) = s_177_186 + v_177_186
;

assume
    neg_f_177_low60_0_low20_10 = neg_f_177_low60_0_low20_9,
    u_177_187 = u_177_186,
    v_177_187 = v_177_186,
    neg_g_177_low60_0_low20_10 * 2 = neg_g_177_low60_0_low20_9 + neg_f_177_low60_0_low20_9,
    r_177_187 * 2 = r_177_186 + u_177_186,
    s_177_187 * 2 = s_177_186 + v_177_186
&&
    true
;

{
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_10 + u_177_187 * (const 64 (2**21)) + v_177_187 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_10 + r_177_187 * (const 64 (2**21)) + s_177_187 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_10,
    neg_f_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_10,
    neg_g_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 187)) <=s delta, delta <=s (const 64 (1 + 2*187)),
    (const 64 (-(2**20))) <=s u_177_187, u_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_187, v_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_187, r_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_187, s_177_187 <=s (const 64 ((2**20))),
    u_177_187 + v_177_187 <=s (const 64 (2**20)),
    u_177_187 - v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 + v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 - v_177_187 <=s (const 64 (2**20)),
    r_177_187 + s_177_187 <=s (const 64 (2**20)),
    r_177_187 - s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 + s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 - s_177_187 <=s (const 64 (2**20)),
    u_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_177_187 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_186_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_9,
sint64 neg_g_177_low60_0_low20_9,
sint64 neg_f_177_low60_0_low20_10,
sint64 neg_g_177_low60_0_low20_10,
sint64 u_177_186,
sint64 v_177_186,
sint64 r_177_186,
sint64 s_177_186,
sint64 u_177_187,
sint64 v_177_187,
sint64 r_177_187,
sint64 s_177_187,
bit ne
)={
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (-(2**20)),
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (-(2**20))
&&
    u_177_186 * neg_f_177_low60_0_low20_0 + v_177_186 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_9 * (const 64 (-(2**20))),
    r_177_186 * neg_f_177_low60_0_low20_0 + s_177_186 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_9 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_9 + u_177_186 * (const 64 (2**21)) + v_177_186 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_9 + r_177_186 * (const 64 (2**21)) + s_177_186 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_9,
    neg_f_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_9,
    neg_g_177_low60_0_low20_9 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 186)) <=s delta, delta <=s (const 64 (1 + 2*186)),
    (const 64 (-(2**20))) <=s u_177_186, u_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_186, v_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_186, r_177_186 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_186, s_177_186 <=s (const 64 ((2**20))),
    u_177_186 + v_177_186 <=s (const 64 (2**20)),
    u_177_186 - v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 + v_177_186 <=s (const 64 (2**20)),
    (const 64 0) - u_177_186 - v_177_186 <=s (const 64 (2**20)),
    r_177_186 + s_177_186 <=s (const 64 (2**20)),
    r_177_186 - s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 + s_177_186 <=s (const 64 (2**20)),
    (const 64 0) - r_177_186 - s_177_186 <=s (const 64 (2**20)),
    u_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    v_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    r_177_186 = (const 64 0) (mod (const 64 (2**(20-9)))),
    s_177_186 = (const 64 0) (mod (const 64 (2**(20-9))))
}



// divsteps
// step186

// premise c
assume
neg_g_177_low60_0_low20_9 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_9 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_10 neg_g_177_low60_0_low20_9;
mov u_177_187 r_177_186;
mov v_177_187 s_177_186;

subs dc neg_g_177_low60_0_low20_10 neg_g_177_low60_0_low20_9 neg_f_177_low60_0_low20_9;
asr neg_g_177_low60_0_low20_10 neg_g_177_low60_0_low20_10 1;
subs dc r_177_187 r_177_186 u_177_186;
asr r_177_187 r_177_187 1;
subs dc s_177_187 s_177_186 v_177_186;
asr s_177_187 s_177_187 1;
assert
    true
&&
    neg_f_177_low60_0_low20_10 = neg_g_177_low60_0_low20_9,
    u_177_187 = r_177_186,
    v_177_187 = s_177_186,
    neg_g_177_low60_0_low20_10 * (const 64 2) = neg_g_177_low60_0_low20_9 - neg_f_177_low60_0_low20_9,
    r_177_187 * (const 64 2) = r_177_186 - u_177_186,
    s_177_187 * (const 64 2) = s_177_186 - v_177_186
;

assume
    neg_f_177_low60_0_low20_10 = neg_g_177_low60_0_low20_9,
    u_177_187 = r_177_186,
    v_177_187 = s_177_186,
    neg_g_177_low60_0_low20_10 * 2 = neg_g_177_low60_0_low20_9 - neg_f_177_low60_0_low20_9,
    r_177_187 * 2 = r_177_186 - u_177_186,
    s_177_187 * 2 = s_177_186 - v_177_186
&&
    true
;

{
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_10 + u_177_187 * (const 64 (2**21)) + v_177_187 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_10 + r_177_187 * (const 64 (2**21)) + s_177_187 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_10,
    neg_f_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_10,
    neg_g_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 187)) <=s delta, delta <=s (const 64 (1 + 2*187)),
    (const 64 (-(2**20))) <=s u_177_187, u_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_187, v_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_187, r_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_187, s_177_187 <=s (const 64 ((2**20))),
    u_177_187 + v_177_187 <=s (const 64 (2**20)),
    u_177_187 - v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 + v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 - v_177_187 <=s (const 64 (2**20)),
    r_177_187 + s_177_187 <=s (const 64 (2**20)),
    r_177_187 - s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 + s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 - s_177_187 <=s (const 64 (2**20)),
    u_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_177_187 = (const 64 0) (mod (const 64 (2**(20-10))))
}

proc divstep_187_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_10,
sint64 neg_g_177_low60_0_low20_10,
sint64 neg_f_177_low60_0_low20_11,
sint64 neg_g_177_low60_0_low20_11,
sint64 u_177_187,
sint64 v_177_187,
sint64 r_177_187,
sint64 s_177_187,
sint64 u_177_188,
sint64 v_177_188,
sint64 r_177_188,
sint64 s_177_188,
bit ne
)={
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (-(2**20)),
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (-(2**20))
&&
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (const 64 (-(2**20))),
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_10 + u_177_187 * (const 64 (2**21)) + v_177_187 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_10 + r_177_187 * (const 64 (2**21)) + s_177_187 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_10,
    neg_f_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_10,
    neg_g_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 187)) <=s delta, delta <=s (const 64 (1 + 2*187)),
    (const 64 (-(2**20))) <=s u_177_187, u_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_187, v_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_187, r_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_187, s_177_187 <=s (const 64 ((2**20))),
    u_177_187 + v_177_187 <=s (const 64 (2**20)),
    u_177_187 - v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 + v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 - v_177_187 <=s (const 64 (2**20)),
    r_177_187 + s_177_187 <=s (const 64 (2**20)),
    r_177_187 - s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 + s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 - s_177_187 <=s (const 64 (2**20)),
    u_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_177_187 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step187

// premise a
assume
neg_g_177_low60_0_low20_10 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_10 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_11 neg_f_177_low60_0_low20_10;
mov u_177_188 u_177_187;
mov v_177_188 v_177_187;

asr neg_g_177_low60_0_low20_11 neg_g_177_low60_0_low20_10 1;
asr r_177_188 r_177_187 1;
asr s_177_188 s_177_187 1;
assert
    true
&&
    neg_f_177_low60_0_low20_11 = neg_f_177_low60_0_low20_10,
    u_177_188 = u_177_187,
    v_177_188 = v_177_187,
    neg_g_177_low60_0_low20_11 * (const 64 2) = neg_g_177_low60_0_low20_10,
    r_177_188 * (const 64 2) = r_177_187,
    s_177_188 * (const 64 2) = s_177_187
;

assume
    neg_f_177_low60_0_low20_11 = neg_f_177_low60_0_low20_10,
    u_177_188 = u_177_187,
    v_177_188 = v_177_187,
    neg_g_177_low60_0_low20_11 * 2 = neg_g_177_low60_0_low20_10,
    r_177_188 * 2 = r_177_187,
    s_177_188 * 2 = s_177_187
&&
    true
;

{
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_11 + u_177_188 * (const 64 (2**21)) + v_177_188 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_11 + r_177_188 * (const 64 (2**21)) + s_177_188 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_11,
    neg_f_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_11,
    neg_g_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 188)) <=s delta, delta <=s (const 64 (1 + 2*188)),
    (const 64 (-(2**20))) <=s u_177_188, u_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_188, v_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_188, r_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_188, s_177_188 <=s (const 64 ((2**20))),
    u_177_188 + v_177_188 <=s (const 64 (2**20)),
    u_177_188 - v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 + v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 - v_177_188 <=s (const 64 (2**20)),
    r_177_188 + s_177_188 <=s (const 64 (2**20)),
    r_177_188 - s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 + s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 - s_177_188 <=s (const 64 (2**20)),
    u_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_177_188 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_187_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_10,
sint64 neg_g_177_low60_0_low20_10,
sint64 neg_f_177_low60_0_low20_11,
sint64 neg_g_177_low60_0_low20_11,
sint64 u_177_187,
sint64 v_177_187,
sint64 r_177_187,
sint64 s_177_187,
sint64 u_177_188,
sint64 v_177_188,
sint64 r_177_188,
sint64 s_177_188,
bit ne
)={
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (-(2**20)),
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (-(2**20))
&&
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (const 64 (-(2**20))),
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_10 + u_177_187 * (const 64 (2**21)) + v_177_187 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_10 + r_177_187 * (const 64 (2**21)) + s_177_187 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_10,
    neg_f_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_10,
    neg_g_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 187)) <=s delta, delta <=s (const 64 (1 + 2*187)),
    (const 64 (-(2**20))) <=s u_177_187, u_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_187, v_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_187, r_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_187, s_177_187 <=s (const 64 ((2**20))),
    u_177_187 + v_177_187 <=s (const 64 (2**20)),
    u_177_187 - v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 + v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 - v_177_187 <=s (const 64 (2**20)),
    r_177_187 + s_177_187 <=s (const 64 (2**20)),
    r_177_187 - s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 + s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 - s_177_187 <=s (const 64 (2**20)),
    u_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_177_187 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step187

// premise b
assume
neg_g_177_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_11 neg_f_177_low60_0_low20_10;
mov u_177_188 u_177_187;
mov v_177_188 v_177_187;

add neg_g_177_low60_0_low20_11 neg_g_177_low60_0_low20_10 neg_f_177_low60_0_low20_10;
asr neg_g_177_low60_0_low20_11 neg_g_177_low60_0_low20_11 1;
add r_177_188 r_177_187 u_177_187;
asr r_177_188 r_177_188 1;
add s_177_188 s_177_187 v_177_187;
asr s_177_188 s_177_188 1;
assert
    true
&&
    neg_f_177_low60_0_low20_11 = neg_f_177_low60_0_low20_10,
    u_177_188 = u_177_187,
    v_177_188 = v_177_187,
    neg_g_177_low60_0_low20_11 * (const 64 2) = neg_g_177_low60_0_low20_10 + neg_f_177_low60_0_low20_10,
    r_177_188 * (const 64 2) = r_177_187 + u_177_187,
    s_177_188 * (const 64 2) = s_177_187 + v_177_187
;

assume
    neg_f_177_low60_0_low20_11 = neg_f_177_low60_0_low20_10,
    u_177_188 = u_177_187,
    v_177_188 = v_177_187,
    neg_g_177_low60_0_low20_11 * 2 = neg_g_177_low60_0_low20_10 + neg_f_177_low60_0_low20_10,
    r_177_188 * 2 = r_177_187 + u_177_187,
    s_177_188 * 2 = s_177_187 + v_177_187
&&
    true
;

{
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_11 + u_177_188 * (const 64 (2**21)) + v_177_188 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_11 + r_177_188 * (const 64 (2**21)) + s_177_188 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_11,
    neg_f_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_11,
    neg_g_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 188)) <=s delta, delta <=s (const 64 (1 + 2*188)),
    (const 64 (-(2**20))) <=s u_177_188, u_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_188, v_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_188, r_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_188, s_177_188 <=s (const 64 ((2**20))),
    u_177_188 + v_177_188 <=s (const 64 (2**20)),
    u_177_188 - v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 + v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 - v_177_188 <=s (const 64 (2**20)),
    r_177_188 + s_177_188 <=s (const 64 (2**20)),
    r_177_188 - s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 + s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 - s_177_188 <=s (const 64 (2**20)),
    u_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_177_188 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_187_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_10,
sint64 neg_g_177_low60_0_low20_10,
sint64 neg_f_177_low60_0_low20_11,
sint64 neg_g_177_low60_0_low20_11,
sint64 u_177_187,
sint64 v_177_187,
sint64 r_177_187,
sint64 s_177_187,
sint64 u_177_188,
sint64 v_177_188,
sint64 r_177_188,
sint64 s_177_188,
bit ne
)={
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (-(2**20)),
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (-(2**20))
&&
    u_177_187 * neg_f_177_low60_0_low20_0 + v_177_187 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_10 * (const 64 (-(2**20))),
    r_177_187 * neg_f_177_low60_0_low20_0 + s_177_187 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_10 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_10 + u_177_187 * (const 64 (2**21)) + v_177_187 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_10 + r_177_187 * (const 64 (2**21)) + s_177_187 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_10,
    neg_f_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_10,
    neg_g_177_low60_0_low20_10 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 187)) <=s delta, delta <=s (const 64 (1 + 2*187)),
    (const 64 (-(2**20))) <=s u_177_187, u_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_187, v_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_187, r_177_187 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_187, s_177_187 <=s (const 64 ((2**20))),
    u_177_187 + v_177_187 <=s (const 64 (2**20)),
    u_177_187 - v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 + v_177_187 <=s (const 64 (2**20)),
    (const 64 0) - u_177_187 - v_177_187 <=s (const 64 (2**20)),
    r_177_187 + s_177_187 <=s (const 64 (2**20)),
    r_177_187 - s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 + s_177_187 <=s (const 64 (2**20)),
    (const 64 0) - r_177_187 - s_177_187 <=s (const 64 (2**20)),
    u_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    v_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    r_177_187 = (const 64 0) (mod (const 64 (2**(20-10)))),
    s_177_187 = (const 64 0) (mod (const 64 (2**(20-10))))
}



// divsteps
// step187

// premise c
assume
neg_g_177_low60_0_low20_10 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_10 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_11 neg_g_177_low60_0_low20_10;
mov u_177_188 r_177_187;
mov v_177_188 s_177_187;

subs dc neg_g_177_low60_0_low20_11 neg_g_177_low60_0_low20_10 neg_f_177_low60_0_low20_10;
asr neg_g_177_low60_0_low20_11 neg_g_177_low60_0_low20_11 1;
subs dc r_177_188 r_177_187 u_177_187;
asr r_177_188 r_177_188 1;
subs dc s_177_188 s_177_187 v_177_187;
asr s_177_188 s_177_188 1;
assert
    true
&&
    neg_f_177_low60_0_low20_11 = neg_g_177_low60_0_low20_10,
    u_177_188 = r_177_187,
    v_177_188 = s_177_187,
    neg_g_177_low60_0_low20_11 * (const 64 2) = neg_g_177_low60_0_low20_10 - neg_f_177_low60_0_low20_10,
    r_177_188 * (const 64 2) = r_177_187 - u_177_187,
    s_177_188 * (const 64 2) = s_177_187 - v_177_187
;

assume
    neg_f_177_low60_0_low20_11 = neg_g_177_low60_0_low20_10,
    u_177_188 = r_177_187,
    v_177_188 = s_177_187,
    neg_g_177_low60_0_low20_11 * 2 = neg_g_177_low60_0_low20_10 - neg_f_177_low60_0_low20_10,
    r_177_188 * 2 = r_177_187 - u_177_187,
    s_177_188 * 2 = s_177_187 - v_177_187
&&
    true
;

{
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_11 + u_177_188 * (const 64 (2**21)) + v_177_188 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_11 + r_177_188 * (const 64 (2**21)) + s_177_188 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_11,
    neg_f_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_11,
    neg_g_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 188)) <=s delta, delta <=s (const 64 (1 + 2*188)),
    (const 64 (-(2**20))) <=s u_177_188, u_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_188, v_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_188, r_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_188, s_177_188 <=s (const 64 ((2**20))),
    u_177_188 + v_177_188 <=s (const 64 (2**20)),
    u_177_188 - v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 + v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 - v_177_188 <=s (const 64 (2**20)),
    r_177_188 + s_177_188 <=s (const 64 (2**20)),
    r_177_188 - s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 + s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 - s_177_188 <=s (const 64 (2**20)),
    u_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_177_188 = (const 64 0) (mod (const 64 (2**(20-11))))
}

proc divstep_188_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_11,
sint64 neg_g_177_low60_0_low20_11,
sint64 neg_f_177_low60_0_low20_12,
sint64 neg_g_177_low60_0_low20_12,
sint64 u_177_188,
sint64 v_177_188,
sint64 r_177_188,
sint64 s_177_188,
sint64 u_177_189,
sint64 v_177_189,
sint64 r_177_189,
sint64 s_177_189,
bit ne
)={
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (-(2**20)),
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (-(2**20))
&&
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (const 64 (-(2**20))),
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_11 + u_177_188 * (const 64 (2**21)) + v_177_188 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_11 + r_177_188 * (const 64 (2**21)) + s_177_188 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_11,
    neg_f_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_11,
    neg_g_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 188)) <=s delta, delta <=s (const 64 (1 + 2*188)),
    (const 64 (-(2**20))) <=s u_177_188, u_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_188, v_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_188, r_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_188, s_177_188 <=s (const 64 ((2**20))),
    u_177_188 + v_177_188 <=s (const 64 (2**20)),
    u_177_188 - v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 + v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 - v_177_188 <=s (const 64 (2**20)),
    r_177_188 + s_177_188 <=s (const 64 (2**20)),
    r_177_188 - s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 + s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 - s_177_188 <=s (const 64 (2**20)),
    u_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_177_188 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step188

// premise a
assume
neg_g_177_low60_0_low20_11 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_11 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_12 neg_f_177_low60_0_low20_11;
mov u_177_189 u_177_188;
mov v_177_189 v_177_188;

asr neg_g_177_low60_0_low20_12 neg_g_177_low60_0_low20_11 1;
asr r_177_189 r_177_188 1;
asr s_177_189 s_177_188 1;
assert
    true
&&
    neg_f_177_low60_0_low20_12 = neg_f_177_low60_0_low20_11,
    u_177_189 = u_177_188,
    v_177_189 = v_177_188,
    neg_g_177_low60_0_low20_12 * (const 64 2) = neg_g_177_low60_0_low20_11,
    r_177_189 * (const 64 2) = r_177_188,
    s_177_189 * (const 64 2) = s_177_188
;

assume
    neg_f_177_low60_0_low20_12 = neg_f_177_low60_0_low20_11,
    u_177_189 = u_177_188,
    v_177_189 = v_177_188,
    neg_g_177_low60_0_low20_12 * 2 = neg_g_177_low60_0_low20_11,
    r_177_189 * 2 = r_177_188,
    s_177_189 * 2 = s_177_188
&&
    true
;

{
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_12 + u_177_189 * (const 64 (2**21)) + v_177_189 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_12 + r_177_189 * (const 64 (2**21)) + s_177_189 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_12,
    neg_f_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_12,
    neg_g_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 189)) <=s delta, delta <=s (const 64 (1 + 2*189)),
    (const 64 (-(2**20))) <=s u_177_189, u_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_189, v_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_189, r_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_189, s_177_189 <=s (const 64 ((2**20))),
    u_177_189 + v_177_189 <=s (const 64 (2**20)),
    u_177_189 - v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 + v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 - v_177_189 <=s (const 64 (2**20)),
    r_177_189 + s_177_189 <=s (const 64 (2**20)),
    r_177_189 - s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 + s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 - s_177_189 <=s (const 64 (2**20)),
    u_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_177_189 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_188_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_11,
sint64 neg_g_177_low60_0_low20_11,
sint64 neg_f_177_low60_0_low20_12,
sint64 neg_g_177_low60_0_low20_12,
sint64 u_177_188,
sint64 v_177_188,
sint64 r_177_188,
sint64 s_177_188,
sint64 u_177_189,
sint64 v_177_189,
sint64 r_177_189,
sint64 s_177_189,
bit ne
)={
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (-(2**20)),
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (-(2**20))
&&
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (const 64 (-(2**20))),
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_11 + u_177_188 * (const 64 (2**21)) + v_177_188 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_11 + r_177_188 * (const 64 (2**21)) + s_177_188 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_11,
    neg_f_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_11,
    neg_g_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 188)) <=s delta, delta <=s (const 64 (1 + 2*188)),
    (const 64 (-(2**20))) <=s u_177_188, u_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_188, v_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_188, r_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_188, s_177_188 <=s (const 64 ((2**20))),
    u_177_188 + v_177_188 <=s (const 64 (2**20)),
    u_177_188 - v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 + v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 - v_177_188 <=s (const 64 (2**20)),
    r_177_188 + s_177_188 <=s (const 64 (2**20)),
    r_177_188 - s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 + s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 - s_177_188 <=s (const 64 (2**20)),
    u_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_177_188 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step188

// premise b
assume
neg_g_177_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_12 neg_f_177_low60_0_low20_11;
mov u_177_189 u_177_188;
mov v_177_189 v_177_188;

add neg_g_177_low60_0_low20_12 neg_g_177_low60_0_low20_11 neg_f_177_low60_0_low20_11;
asr neg_g_177_low60_0_low20_12 neg_g_177_low60_0_low20_12 1;
add r_177_189 r_177_188 u_177_188;
asr r_177_189 r_177_189 1;
add s_177_189 s_177_188 v_177_188;
asr s_177_189 s_177_189 1;
assert
    true
&&
    neg_f_177_low60_0_low20_12 = neg_f_177_low60_0_low20_11,
    u_177_189 = u_177_188,
    v_177_189 = v_177_188,
    neg_g_177_low60_0_low20_12 * (const 64 2) = neg_g_177_low60_0_low20_11 + neg_f_177_low60_0_low20_11,
    r_177_189 * (const 64 2) = r_177_188 + u_177_188,
    s_177_189 * (const 64 2) = s_177_188 + v_177_188
;

assume
    neg_f_177_low60_0_low20_12 = neg_f_177_low60_0_low20_11,
    u_177_189 = u_177_188,
    v_177_189 = v_177_188,
    neg_g_177_low60_0_low20_12 * 2 = neg_g_177_low60_0_low20_11 + neg_f_177_low60_0_low20_11,
    r_177_189 * 2 = r_177_188 + u_177_188,
    s_177_189 * 2 = s_177_188 + v_177_188
&&
    true
;

{
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_12 + u_177_189 * (const 64 (2**21)) + v_177_189 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_12 + r_177_189 * (const 64 (2**21)) + s_177_189 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_12,
    neg_f_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_12,
    neg_g_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 189)) <=s delta, delta <=s (const 64 (1 + 2*189)),
    (const 64 (-(2**20))) <=s u_177_189, u_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_189, v_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_189, r_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_189, s_177_189 <=s (const 64 ((2**20))),
    u_177_189 + v_177_189 <=s (const 64 (2**20)),
    u_177_189 - v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 + v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 - v_177_189 <=s (const 64 (2**20)),
    r_177_189 + s_177_189 <=s (const 64 (2**20)),
    r_177_189 - s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 + s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 - s_177_189 <=s (const 64 (2**20)),
    u_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_177_189 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_188_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_11,
sint64 neg_g_177_low60_0_low20_11,
sint64 neg_f_177_low60_0_low20_12,
sint64 neg_g_177_low60_0_low20_12,
sint64 u_177_188,
sint64 v_177_188,
sint64 r_177_188,
sint64 s_177_188,
sint64 u_177_189,
sint64 v_177_189,
sint64 r_177_189,
sint64 s_177_189,
bit ne
)={
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (-(2**20)),
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (-(2**20))
&&
    u_177_188 * neg_f_177_low60_0_low20_0 + v_177_188 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_11 * (const 64 (-(2**20))),
    r_177_188 * neg_f_177_low60_0_low20_0 + s_177_188 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_11 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_11 + u_177_188 * (const 64 (2**21)) + v_177_188 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_11 + r_177_188 * (const 64 (2**21)) + s_177_188 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_11,
    neg_f_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_11,
    neg_g_177_low60_0_low20_11 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 188)) <=s delta, delta <=s (const 64 (1 + 2*188)),
    (const 64 (-(2**20))) <=s u_177_188, u_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_188, v_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_188, r_177_188 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_188, s_177_188 <=s (const 64 ((2**20))),
    u_177_188 + v_177_188 <=s (const 64 (2**20)),
    u_177_188 - v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 + v_177_188 <=s (const 64 (2**20)),
    (const 64 0) - u_177_188 - v_177_188 <=s (const 64 (2**20)),
    r_177_188 + s_177_188 <=s (const 64 (2**20)),
    r_177_188 - s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 + s_177_188 <=s (const 64 (2**20)),
    (const 64 0) - r_177_188 - s_177_188 <=s (const 64 (2**20)),
    u_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    v_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    r_177_188 = (const 64 0) (mod (const 64 (2**(20-11)))),
    s_177_188 = (const 64 0) (mod (const 64 (2**(20-11))))
}



// divsteps
// step188

// premise c
assume
neg_g_177_low60_0_low20_11 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_11 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_12 neg_g_177_low60_0_low20_11;
mov u_177_189 r_177_188;
mov v_177_189 s_177_188;

subs dc neg_g_177_low60_0_low20_12 neg_g_177_low60_0_low20_11 neg_f_177_low60_0_low20_11;
asr neg_g_177_low60_0_low20_12 neg_g_177_low60_0_low20_12 1;
subs dc r_177_189 r_177_188 u_177_188;
asr r_177_189 r_177_189 1;
subs dc s_177_189 s_177_188 v_177_188;
asr s_177_189 s_177_189 1;
assert
    true
&&
    neg_f_177_low60_0_low20_12 = neg_g_177_low60_0_low20_11,
    u_177_189 = r_177_188,
    v_177_189 = s_177_188,
    neg_g_177_low60_0_low20_12 * (const 64 2) = neg_g_177_low60_0_low20_11 - neg_f_177_low60_0_low20_11,
    r_177_189 * (const 64 2) = r_177_188 - u_177_188,
    s_177_189 * (const 64 2) = s_177_188 - v_177_188
;

assume
    neg_f_177_low60_0_low20_12 = neg_g_177_low60_0_low20_11,
    u_177_189 = r_177_188,
    v_177_189 = s_177_188,
    neg_g_177_low60_0_low20_12 * 2 = neg_g_177_low60_0_low20_11 - neg_f_177_low60_0_low20_11,
    r_177_189 * 2 = r_177_188 - u_177_188,
    s_177_189 * 2 = s_177_188 - v_177_188
&&
    true
;

{
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_12 + u_177_189 * (const 64 (2**21)) + v_177_189 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_12 + r_177_189 * (const 64 (2**21)) + s_177_189 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_12,
    neg_f_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_12,
    neg_g_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 189)) <=s delta, delta <=s (const 64 (1 + 2*189)),
    (const 64 (-(2**20))) <=s u_177_189, u_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_189, v_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_189, r_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_189, s_177_189 <=s (const 64 ((2**20))),
    u_177_189 + v_177_189 <=s (const 64 (2**20)),
    u_177_189 - v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 + v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 - v_177_189 <=s (const 64 (2**20)),
    r_177_189 + s_177_189 <=s (const 64 (2**20)),
    r_177_189 - s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 + s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 - s_177_189 <=s (const 64 (2**20)),
    u_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_177_189 = (const 64 0) (mod (const 64 (2**(20-12))))
}

proc divstep_189_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_12,
sint64 neg_g_177_low60_0_low20_12,
sint64 neg_f_177_low60_0_low20_13,
sint64 neg_g_177_low60_0_low20_13,
sint64 u_177_189,
sint64 v_177_189,
sint64 r_177_189,
sint64 s_177_189,
sint64 u_177_190,
sint64 v_177_190,
sint64 r_177_190,
sint64 s_177_190,
bit ne
)={
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (-(2**20)),
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (-(2**20))
&&
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (const 64 (-(2**20))),
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_12 + u_177_189 * (const 64 (2**21)) + v_177_189 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_12 + r_177_189 * (const 64 (2**21)) + s_177_189 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_12,
    neg_f_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_12,
    neg_g_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 189)) <=s delta, delta <=s (const 64 (1 + 2*189)),
    (const 64 (-(2**20))) <=s u_177_189, u_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_189, v_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_189, r_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_189, s_177_189 <=s (const 64 ((2**20))),
    u_177_189 + v_177_189 <=s (const 64 (2**20)),
    u_177_189 - v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 + v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 - v_177_189 <=s (const 64 (2**20)),
    r_177_189 + s_177_189 <=s (const 64 (2**20)),
    r_177_189 - s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 + s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 - s_177_189 <=s (const 64 (2**20)),
    u_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_177_189 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step189

// premise a
assume
neg_g_177_low60_0_low20_12 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_12 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_13 neg_f_177_low60_0_low20_12;
mov u_177_190 u_177_189;
mov v_177_190 v_177_189;

asr neg_g_177_low60_0_low20_13 neg_g_177_low60_0_low20_12 1;
asr r_177_190 r_177_189 1;
asr s_177_190 s_177_189 1;
assert
    true
&&
    neg_f_177_low60_0_low20_13 = neg_f_177_low60_0_low20_12,
    u_177_190 = u_177_189,
    v_177_190 = v_177_189,
    neg_g_177_low60_0_low20_13 * (const 64 2) = neg_g_177_low60_0_low20_12,
    r_177_190 * (const 64 2) = r_177_189,
    s_177_190 * (const 64 2) = s_177_189
;

assume
    neg_f_177_low60_0_low20_13 = neg_f_177_low60_0_low20_12,
    u_177_190 = u_177_189,
    v_177_190 = v_177_189,
    neg_g_177_low60_0_low20_13 * 2 = neg_g_177_low60_0_low20_12,
    r_177_190 * 2 = r_177_189,
    s_177_190 * 2 = s_177_189
&&
    true
;

{
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_13 + u_177_190 * (const 64 (2**21)) + v_177_190 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_13 + r_177_190 * (const 64 (2**21)) + s_177_190 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_13,
    neg_f_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_13,
    neg_g_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 190)) <=s delta, delta <=s (const 64 (1 + 2*190)),
    (const 64 (-(2**20))) <=s u_177_190, u_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_190, v_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_190, r_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_190, s_177_190 <=s (const 64 ((2**20))),
    u_177_190 + v_177_190 <=s (const 64 (2**20)),
    u_177_190 - v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 + v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 - v_177_190 <=s (const 64 (2**20)),
    r_177_190 + s_177_190 <=s (const 64 (2**20)),
    r_177_190 - s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 + s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 - s_177_190 <=s (const 64 (2**20)),
    u_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_177_190 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_189_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_12,
sint64 neg_g_177_low60_0_low20_12,
sint64 neg_f_177_low60_0_low20_13,
sint64 neg_g_177_low60_0_low20_13,
sint64 u_177_189,
sint64 v_177_189,
sint64 r_177_189,
sint64 s_177_189,
sint64 u_177_190,
sint64 v_177_190,
sint64 r_177_190,
sint64 s_177_190,
bit ne
)={
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (-(2**20)),
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (-(2**20))
&&
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (const 64 (-(2**20))),
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_12 + u_177_189 * (const 64 (2**21)) + v_177_189 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_12 + r_177_189 * (const 64 (2**21)) + s_177_189 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_12,
    neg_f_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_12,
    neg_g_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 189)) <=s delta, delta <=s (const 64 (1 + 2*189)),
    (const 64 (-(2**20))) <=s u_177_189, u_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_189, v_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_189, r_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_189, s_177_189 <=s (const 64 ((2**20))),
    u_177_189 + v_177_189 <=s (const 64 (2**20)),
    u_177_189 - v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 + v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 - v_177_189 <=s (const 64 (2**20)),
    r_177_189 + s_177_189 <=s (const 64 (2**20)),
    r_177_189 - s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 + s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 - s_177_189 <=s (const 64 (2**20)),
    u_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_177_189 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step189

// premise b
assume
neg_g_177_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_13 neg_f_177_low60_0_low20_12;
mov u_177_190 u_177_189;
mov v_177_190 v_177_189;

add neg_g_177_low60_0_low20_13 neg_g_177_low60_0_low20_12 neg_f_177_low60_0_low20_12;
asr neg_g_177_low60_0_low20_13 neg_g_177_low60_0_low20_13 1;
add r_177_190 r_177_189 u_177_189;
asr r_177_190 r_177_190 1;
add s_177_190 s_177_189 v_177_189;
asr s_177_190 s_177_190 1;
assert
    true
&&
    neg_f_177_low60_0_low20_13 = neg_f_177_low60_0_low20_12,
    u_177_190 = u_177_189,
    v_177_190 = v_177_189,
    neg_g_177_low60_0_low20_13 * (const 64 2) = neg_g_177_low60_0_low20_12 + neg_f_177_low60_0_low20_12,
    r_177_190 * (const 64 2) = r_177_189 + u_177_189,
    s_177_190 * (const 64 2) = s_177_189 + v_177_189
;

assume
    neg_f_177_low60_0_low20_13 = neg_f_177_low60_0_low20_12,
    u_177_190 = u_177_189,
    v_177_190 = v_177_189,
    neg_g_177_low60_0_low20_13 * 2 = neg_g_177_low60_0_low20_12 + neg_f_177_low60_0_low20_12,
    r_177_190 * 2 = r_177_189 + u_177_189,
    s_177_190 * 2 = s_177_189 + v_177_189
&&
    true
;

{
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_13 + u_177_190 * (const 64 (2**21)) + v_177_190 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_13 + r_177_190 * (const 64 (2**21)) + s_177_190 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_13,
    neg_f_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_13,
    neg_g_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 190)) <=s delta, delta <=s (const 64 (1 + 2*190)),
    (const 64 (-(2**20))) <=s u_177_190, u_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_190, v_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_190, r_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_190, s_177_190 <=s (const 64 ((2**20))),
    u_177_190 + v_177_190 <=s (const 64 (2**20)),
    u_177_190 - v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 + v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 - v_177_190 <=s (const 64 (2**20)),
    r_177_190 + s_177_190 <=s (const 64 (2**20)),
    r_177_190 - s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 + s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 - s_177_190 <=s (const 64 (2**20)),
    u_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_177_190 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_189_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_12,
sint64 neg_g_177_low60_0_low20_12,
sint64 neg_f_177_low60_0_low20_13,
sint64 neg_g_177_low60_0_low20_13,
sint64 u_177_189,
sint64 v_177_189,
sint64 r_177_189,
sint64 s_177_189,
sint64 u_177_190,
sint64 v_177_190,
sint64 r_177_190,
sint64 s_177_190,
bit ne
)={
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (-(2**20)),
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (-(2**20))
&&
    u_177_189 * neg_f_177_low60_0_low20_0 + v_177_189 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_12 * (const 64 (-(2**20))),
    r_177_189 * neg_f_177_low60_0_low20_0 + s_177_189 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_12 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_12 + u_177_189 * (const 64 (2**21)) + v_177_189 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_12 + r_177_189 * (const 64 (2**21)) + s_177_189 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_12,
    neg_f_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_12,
    neg_g_177_low60_0_low20_12 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 189)) <=s delta, delta <=s (const 64 (1 + 2*189)),
    (const 64 (-(2**20))) <=s u_177_189, u_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_189, v_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_189, r_177_189 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_189, s_177_189 <=s (const 64 ((2**20))),
    u_177_189 + v_177_189 <=s (const 64 (2**20)),
    u_177_189 - v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 + v_177_189 <=s (const 64 (2**20)),
    (const 64 0) - u_177_189 - v_177_189 <=s (const 64 (2**20)),
    r_177_189 + s_177_189 <=s (const 64 (2**20)),
    r_177_189 - s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 + s_177_189 <=s (const 64 (2**20)),
    (const 64 0) - r_177_189 - s_177_189 <=s (const 64 (2**20)),
    u_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    v_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    r_177_189 = (const 64 0) (mod (const 64 (2**(20-12)))),
    s_177_189 = (const 64 0) (mod (const 64 (2**(20-12))))
}



// divsteps
// step189

// premise c
assume
neg_g_177_low60_0_low20_12 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_12 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_13 neg_g_177_low60_0_low20_12;
mov u_177_190 r_177_189;
mov v_177_190 s_177_189;

subs dc neg_g_177_low60_0_low20_13 neg_g_177_low60_0_low20_12 neg_f_177_low60_0_low20_12;
asr neg_g_177_low60_0_low20_13 neg_g_177_low60_0_low20_13 1;
subs dc r_177_190 r_177_189 u_177_189;
asr r_177_190 r_177_190 1;
subs dc s_177_190 s_177_189 v_177_189;
asr s_177_190 s_177_190 1;
assert
    true
&&
    neg_f_177_low60_0_low20_13 = neg_g_177_low60_0_low20_12,
    u_177_190 = r_177_189,
    v_177_190 = s_177_189,
    neg_g_177_low60_0_low20_13 * (const 64 2) = neg_g_177_low60_0_low20_12 - neg_f_177_low60_0_low20_12,
    r_177_190 * (const 64 2) = r_177_189 - u_177_189,
    s_177_190 * (const 64 2) = s_177_189 - v_177_189
;

assume
    neg_f_177_low60_0_low20_13 = neg_g_177_low60_0_low20_12,
    u_177_190 = r_177_189,
    v_177_190 = s_177_189,
    neg_g_177_low60_0_low20_13 * 2 = neg_g_177_low60_0_low20_12 - neg_f_177_low60_0_low20_12,
    r_177_190 * 2 = r_177_189 - u_177_189,
    s_177_190 * 2 = s_177_189 - v_177_189
&&
    true
;

{
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_13 + u_177_190 * (const 64 (2**21)) + v_177_190 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_13 + r_177_190 * (const 64 (2**21)) + s_177_190 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_13,
    neg_f_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_13,
    neg_g_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 190)) <=s delta, delta <=s (const 64 (1 + 2*190)),
    (const 64 (-(2**20))) <=s u_177_190, u_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_190, v_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_190, r_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_190, s_177_190 <=s (const 64 ((2**20))),
    u_177_190 + v_177_190 <=s (const 64 (2**20)),
    u_177_190 - v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 + v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 - v_177_190 <=s (const 64 (2**20)),
    r_177_190 + s_177_190 <=s (const 64 (2**20)),
    r_177_190 - s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 + s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 - s_177_190 <=s (const 64 (2**20)),
    u_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_177_190 = (const 64 0) (mod (const 64 (2**(20-13))))
}

proc divstep_190_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_13,
sint64 neg_g_177_low60_0_low20_13,
sint64 neg_f_177_low60_0_low20_14,
sint64 neg_g_177_low60_0_low20_14,
sint64 u_177_190,
sint64 v_177_190,
sint64 r_177_190,
sint64 s_177_190,
sint64 u_177_191,
sint64 v_177_191,
sint64 r_177_191,
sint64 s_177_191,
bit ne
)={
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (-(2**20)),
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (-(2**20))
&&
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (const 64 (-(2**20))),
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_13 + u_177_190 * (const 64 (2**21)) + v_177_190 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_13 + r_177_190 * (const 64 (2**21)) + s_177_190 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_13,
    neg_f_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_13,
    neg_g_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 190)) <=s delta, delta <=s (const 64 (1 + 2*190)),
    (const 64 (-(2**20))) <=s u_177_190, u_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_190, v_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_190, r_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_190, s_177_190 <=s (const 64 ((2**20))),
    u_177_190 + v_177_190 <=s (const 64 (2**20)),
    u_177_190 - v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 + v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 - v_177_190 <=s (const 64 (2**20)),
    r_177_190 + s_177_190 <=s (const 64 (2**20)),
    r_177_190 - s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 + s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 - s_177_190 <=s (const 64 (2**20)),
    u_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_177_190 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step190

// premise a
assume
neg_g_177_low60_0_low20_13 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_13 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_14 neg_f_177_low60_0_low20_13;
mov u_177_191 u_177_190;
mov v_177_191 v_177_190;

asr neg_g_177_low60_0_low20_14 neg_g_177_low60_0_low20_13 1;
asr r_177_191 r_177_190 1;
asr s_177_191 s_177_190 1;
assert
    true
&&
    neg_f_177_low60_0_low20_14 = neg_f_177_low60_0_low20_13,
    u_177_191 = u_177_190,
    v_177_191 = v_177_190,
    neg_g_177_low60_0_low20_14 * (const 64 2) = neg_g_177_low60_0_low20_13,
    r_177_191 * (const 64 2) = r_177_190,
    s_177_191 * (const 64 2) = s_177_190
;

assume
    neg_f_177_low60_0_low20_14 = neg_f_177_low60_0_low20_13,
    u_177_191 = u_177_190,
    v_177_191 = v_177_190,
    neg_g_177_low60_0_low20_14 * 2 = neg_g_177_low60_0_low20_13,
    r_177_191 * 2 = r_177_190,
    s_177_191 * 2 = s_177_190
&&
    true
;

{
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_14 + u_177_191 * (const 64 (2**21)) + v_177_191 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_14 + r_177_191 * (const 64 (2**21)) + s_177_191 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_14,
    neg_f_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_14,
    neg_g_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 191)) <=s delta, delta <=s (const 64 (1 + 2*191)),
    (const 64 (-(2**20))) <=s u_177_191, u_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_191, v_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_191, r_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_191, s_177_191 <=s (const 64 ((2**20))),
    u_177_191 + v_177_191 <=s (const 64 (2**20)),
    u_177_191 - v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 + v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 - v_177_191 <=s (const 64 (2**20)),
    r_177_191 + s_177_191 <=s (const 64 (2**20)),
    r_177_191 - s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 + s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 - s_177_191 <=s (const 64 (2**20)),
    u_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_177_191 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_190_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_13,
sint64 neg_g_177_low60_0_low20_13,
sint64 neg_f_177_low60_0_low20_14,
sint64 neg_g_177_low60_0_low20_14,
sint64 u_177_190,
sint64 v_177_190,
sint64 r_177_190,
sint64 s_177_190,
sint64 u_177_191,
sint64 v_177_191,
sint64 r_177_191,
sint64 s_177_191,
bit ne
)={
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (-(2**20)),
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (-(2**20))
&&
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (const 64 (-(2**20))),
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_13 + u_177_190 * (const 64 (2**21)) + v_177_190 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_13 + r_177_190 * (const 64 (2**21)) + s_177_190 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_13,
    neg_f_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_13,
    neg_g_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 190)) <=s delta, delta <=s (const 64 (1 + 2*190)),
    (const 64 (-(2**20))) <=s u_177_190, u_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_190, v_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_190, r_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_190, s_177_190 <=s (const 64 ((2**20))),
    u_177_190 + v_177_190 <=s (const 64 (2**20)),
    u_177_190 - v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 + v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 - v_177_190 <=s (const 64 (2**20)),
    r_177_190 + s_177_190 <=s (const 64 (2**20)),
    r_177_190 - s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 + s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 - s_177_190 <=s (const 64 (2**20)),
    u_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_177_190 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step190

// premise b
assume
neg_g_177_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_14 neg_f_177_low60_0_low20_13;
mov u_177_191 u_177_190;
mov v_177_191 v_177_190;

add neg_g_177_low60_0_low20_14 neg_g_177_low60_0_low20_13 neg_f_177_low60_0_low20_13;
asr neg_g_177_low60_0_low20_14 neg_g_177_low60_0_low20_14 1;
add r_177_191 r_177_190 u_177_190;
asr r_177_191 r_177_191 1;
add s_177_191 s_177_190 v_177_190;
asr s_177_191 s_177_191 1;
assert
    true
&&
    neg_f_177_low60_0_low20_14 = neg_f_177_low60_0_low20_13,
    u_177_191 = u_177_190,
    v_177_191 = v_177_190,
    neg_g_177_low60_0_low20_14 * (const 64 2) = neg_g_177_low60_0_low20_13 + neg_f_177_low60_0_low20_13,
    r_177_191 * (const 64 2) = r_177_190 + u_177_190,
    s_177_191 * (const 64 2) = s_177_190 + v_177_190
;

assume
    neg_f_177_low60_0_low20_14 = neg_f_177_low60_0_low20_13,
    u_177_191 = u_177_190,
    v_177_191 = v_177_190,
    neg_g_177_low60_0_low20_14 * 2 = neg_g_177_low60_0_low20_13 + neg_f_177_low60_0_low20_13,
    r_177_191 * 2 = r_177_190 + u_177_190,
    s_177_191 * 2 = s_177_190 + v_177_190
&&
    true
;

{
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_14 + u_177_191 * (const 64 (2**21)) + v_177_191 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_14 + r_177_191 * (const 64 (2**21)) + s_177_191 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_14,
    neg_f_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_14,
    neg_g_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 191)) <=s delta, delta <=s (const 64 (1 + 2*191)),
    (const 64 (-(2**20))) <=s u_177_191, u_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_191, v_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_191, r_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_191, s_177_191 <=s (const 64 ((2**20))),
    u_177_191 + v_177_191 <=s (const 64 (2**20)),
    u_177_191 - v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 + v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 - v_177_191 <=s (const 64 (2**20)),
    r_177_191 + s_177_191 <=s (const 64 (2**20)),
    r_177_191 - s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 + s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 - s_177_191 <=s (const 64 (2**20)),
    u_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_177_191 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_190_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_13,
sint64 neg_g_177_low60_0_low20_13,
sint64 neg_f_177_low60_0_low20_14,
sint64 neg_g_177_low60_0_low20_14,
sint64 u_177_190,
sint64 v_177_190,
sint64 r_177_190,
sint64 s_177_190,
sint64 u_177_191,
sint64 v_177_191,
sint64 r_177_191,
sint64 s_177_191,
bit ne
)={
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (-(2**20)),
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (-(2**20))
&&
    u_177_190 * neg_f_177_low60_0_low20_0 + v_177_190 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_13 * (const 64 (-(2**20))),
    r_177_190 * neg_f_177_low60_0_low20_0 + s_177_190 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_13 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_13 + u_177_190 * (const 64 (2**21)) + v_177_190 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_13 + r_177_190 * (const 64 (2**21)) + s_177_190 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_13,
    neg_f_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_13,
    neg_g_177_low60_0_low20_13 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 190)) <=s delta, delta <=s (const 64 (1 + 2*190)),
    (const 64 (-(2**20))) <=s u_177_190, u_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_190, v_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_190, r_177_190 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_190, s_177_190 <=s (const 64 ((2**20))),
    u_177_190 + v_177_190 <=s (const 64 (2**20)),
    u_177_190 - v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 + v_177_190 <=s (const 64 (2**20)),
    (const 64 0) - u_177_190 - v_177_190 <=s (const 64 (2**20)),
    r_177_190 + s_177_190 <=s (const 64 (2**20)),
    r_177_190 - s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 + s_177_190 <=s (const 64 (2**20)),
    (const 64 0) - r_177_190 - s_177_190 <=s (const 64 (2**20)),
    u_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    v_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    r_177_190 = (const 64 0) (mod (const 64 (2**(20-13)))),
    s_177_190 = (const 64 0) (mod (const 64 (2**(20-13))))
}



// divsteps
// step190

// premise c
assume
neg_g_177_low60_0_low20_13 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_13 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_14 neg_g_177_low60_0_low20_13;
mov u_177_191 r_177_190;
mov v_177_191 s_177_190;

subs dc neg_g_177_low60_0_low20_14 neg_g_177_low60_0_low20_13 neg_f_177_low60_0_low20_13;
asr neg_g_177_low60_0_low20_14 neg_g_177_low60_0_low20_14 1;
subs dc r_177_191 r_177_190 u_177_190;
asr r_177_191 r_177_191 1;
subs dc s_177_191 s_177_190 v_177_190;
asr s_177_191 s_177_191 1;
assert
    true
&&
    neg_f_177_low60_0_low20_14 = neg_g_177_low60_0_low20_13,
    u_177_191 = r_177_190,
    v_177_191 = s_177_190,
    neg_g_177_low60_0_low20_14 * (const 64 2) = neg_g_177_low60_0_low20_13 - neg_f_177_low60_0_low20_13,
    r_177_191 * (const 64 2) = r_177_190 - u_177_190,
    s_177_191 * (const 64 2) = s_177_190 - v_177_190
;

assume
    neg_f_177_low60_0_low20_14 = neg_g_177_low60_0_low20_13,
    u_177_191 = r_177_190,
    v_177_191 = s_177_190,
    neg_g_177_low60_0_low20_14 * 2 = neg_g_177_low60_0_low20_13 - neg_f_177_low60_0_low20_13,
    r_177_191 * 2 = r_177_190 - u_177_190,
    s_177_191 * 2 = s_177_190 - v_177_190
&&
    true
;

{
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_14 + u_177_191 * (const 64 (2**21)) + v_177_191 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_14 + r_177_191 * (const 64 (2**21)) + s_177_191 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_14,
    neg_f_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_14,
    neg_g_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 191)) <=s delta, delta <=s (const 64 (1 + 2*191)),
    (const 64 (-(2**20))) <=s u_177_191, u_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_191, v_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_191, r_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_191, s_177_191 <=s (const 64 ((2**20))),
    u_177_191 + v_177_191 <=s (const 64 (2**20)),
    u_177_191 - v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 + v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 - v_177_191 <=s (const 64 (2**20)),
    r_177_191 + s_177_191 <=s (const 64 (2**20)),
    r_177_191 - s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 + s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 - s_177_191 <=s (const 64 (2**20)),
    u_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_177_191 = (const 64 0) (mod (const 64 (2**(20-14))))
}

proc divstep_191_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_14,
sint64 neg_g_177_low60_0_low20_14,
sint64 neg_f_177_low60_0_low20_15,
sint64 neg_g_177_low60_0_low20_15,
sint64 u_177_191,
sint64 v_177_191,
sint64 r_177_191,
sint64 s_177_191,
sint64 u_177_192,
sint64 v_177_192,
sint64 r_177_192,
sint64 s_177_192,
bit ne
)={
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (-(2**20)),
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (-(2**20))
&&
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (const 64 (-(2**20))),
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_14 + u_177_191 * (const 64 (2**21)) + v_177_191 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_14 + r_177_191 * (const 64 (2**21)) + s_177_191 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_14,
    neg_f_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_14,
    neg_g_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 191)) <=s delta, delta <=s (const 64 (1 + 2*191)),
    (const 64 (-(2**20))) <=s u_177_191, u_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_191, v_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_191, r_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_191, s_177_191 <=s (const 64 ((2**20))),
    u_177_191 + v_177_191 <=s (const 64 (2**20)),
    u_177_191 - v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 + v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 - v_177_191 <=s (const 64 (2**20)),
    r_177_191 + s_177_191 <=s (const 64 (2**20)),
    r_177_191 - s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 + s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 - s_177_191 <=s (const 64 (2**20)),
    u_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_177_191 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step191

// premise a
assume
neg_g_177_low60_0_low20_14 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_14 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_15 neg_f_177_low60_0_low20_14;
mov u_177_192 u_177_191;
mov v_177_192 v_177_191;

asr neg_g_177_low60_0_low20_15 neg_g_177_low60_0_low20_14 1;
asr r_177_192 r_177_191 1;
asr s_177_192 s_177_191 1;
assert
    true
&&
    neg_f_177_low60_0_low20_15 = neg_f_177_low60_0_low20_14,
    u_177_192 = u_177_191,
    v_177_192 = v_177_191,
    neg_g_177_low60_0_low20_15 * (const 64 2) = neg_g_177_low60_0_low20_14,
    r_177_192 * (const 64 2) = r_177_191,
    s_177_192 * (const 64 2) = s_177_191
;

assume
    neg_f_177_low60_0_low20_15 = neg_f_177_low60_0_low20_14,
    u_177_192 = u_177_191,
    v_177_192 = v_177_191,
    neg_g_177_low60_0_low20_15 * 2 = neg_g_177_low60_0_low20_14,
    r_177_192 * 2 = r_177_191,
    s_177_192 * 2 = s_177_191
&&
    true
;

{
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_15 + u_177_192 * (const 64 (2**21)) + v_177_192 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_15 + r_177_192 * (const 64 (2**21)) + s_177_192 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_15,
    neg_f_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_15,
    neg_g_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 192)) <=s delta, delta <=s (const 64 (1 + 2*192)),
    (const 64 (-(2**20))) <=s u_177_192, u_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_192, v_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_192, r_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_192, s_177_192 <=s (const 64 ((2**20))),
    u_177_192 + v_177_192 <=s (const 64 (2**20)),
    u_177_192 - v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 + v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 - v_177_192 <=s (const 64 (2**20)),
    r_177_192 + s_177_192 <=s (const 64 (2**20)),
    r_177_192 - s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 + s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 - s_177_192 <=s (const 64 (2**20)),
    u_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_177_192 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_191_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_14,
sint64 neg_g_177_low60_0_low20_14,
sint64 neg_f_177_low60_0_low20_15,
sint64 neg_g_177_low60_0_low20_15,
sint64 u_177_191,
sint64 v_177_191,
sint64 r_177_191,
sint64 s_177_191,
sint64 u_177_192,
sint64 v_177_192,
sint64 r_177_192,
sint64 s_177_192,
bit ne
)={
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (-(2**20)),
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (-(2**20))
&&
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (const 64 (-(2**20))),
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_14 + u_177_191 * (const 64 (2**21)) + v_177_191 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_14 + r_177_191 * (const 64 (2**21)) + s_177_191 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_14,
    neg_f_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_14,
    neg_g_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 191)) <=s delta, delta <=s (const 64 (1 + 2*191)),
    (const 64 (-(2**20))) <=s u_177_191, u_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_191, v_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_191, r_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_191, s_177_191 <=s (const 64 ((2**20))),
    u_177_191 + v_177_191 <=s (const 64 (2**20)),
    u_177_191 - v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 + v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 - v_177_191 <=s (const 64 (2**20)),
    r_177_191 + s_177_191 <=s (const 64 (2**20)),
    r_177_191 - s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 + s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 - s_177_191 <=s (const 64 (2**20)),
    u_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_177_191 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step191

// premise b
assume
neg_g_177_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_15 neg_f_177_low60_0_low20_14;
mov u_177_192 u_177_191;
mov v_177_192 v_177_191;

add neg_g_177_low60_0_low20_15 neg_g_177_low60_0_low20_14 neg_f_177_low60_0_low20_14;
asr neg_g_177_low60_0_low20_15 neg_g_177_low60_0_low20_15 1;
add r_177_192 r_177_191 u_177_191;
asr r_177_192 r_177_192 1;
add s_177_192 s_177_191 v_177_191;
asr s_177_192 s_177_192 1;
assert
    true
&&
    neg_f_177_low60_0_low20_15 = neg_f_177_low60_0_low20_14,
    u_177_192 = u_177_191,
    v_177_192 = v_177_191,
    neg_g_177_low60_0_low20_15 * (const 64 2) = neg_g_177_low60_0_low20_14 + neg_f_177_low60_0_low20_14,
    r_177_192 * (const 64 2) = r_177_191 + u_177_191,
    s_177_192 * (const 64 2) = s_177_191 + v_177_191
;

assume
    neg_f_177_low60_0_low20_15 = neg_f_177_low60_0_low20_14,
    u_177_192 = u_177_191,
    v_177_192 = v_177_191,
    neg_g_177_low60_0_low20_15 * 2 = neg_g_177_low60_0_low20_14 + neg_f_177_low60_0_low20_14,
    r_177_192 * 2 = r_177_191 + u_177_191,
    s_177_192 * 2 = s_177_191 + v_177_191
&&
    true
;

{
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_15 + u_177_192 * (const 64 (2**21)) + v_177_192 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_15 + r_177_192 * (const 64 (2**21)) + s_177_192 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_15,
    neg_f_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_15,
    neg_g_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 192)) <=s delta, delta <=s (const 64 (1 + 2*192)),
    (const 64 (-(2**20))) <=s u_177_192, u_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_192, v_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_192, r_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_192, s_177_192 <=s (const 64 ((2**20))),
    u_177_192 + v_177_192 <=s (const 64 (2**20)),
    u_177_192 - v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 + v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 - v_177_192 <=s (const 64 (2**20)),
    r_177_192 + s_177_192 <=s (const 64 (2**20)),
    r_177_192 - s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 + s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 - s_177_192 <=s (const 64 (2**20)),
    u_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_177_192 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_191_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_14,
sint64 neg_g_177_low60_0_low20_14,
sint64 neg_f_177_low60_0_low20_15,
sint64 neg_g_177_low60_0_low20_15,
sint64 u_177_191,
sint64 v_177_191,
sint64 r_177_191,
sint64 s_177_191,
sint64 u_177_192,
sint64 v_177_192,
sint64 r_177_192,
sint64 s_177_192,
bit ne
)={
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (-(2**20)),
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (-(2**20))
&&
    u_177_191 * neg_f_177_low60_0_low20_0 + v_177_191 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_14 * (const 64 (-(2**20))),
    r_177_191 * neg_f_177_low60_0_low20_0 + s_177_191 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_14 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_14 + u_177_191 * (const 64 (2**21)) + v_177_191 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_14 + r_177_191 * (const 64 (2**21)) + s_177_191 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_14,
    neg_f_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_14,
    neg_g_177_low60_0_low20_14 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 191)) <=s delta, delta <=s (const 64 (1 + 2*191)),
    (const 64 (-(2**20))) <=s u_177_191, u_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_191, v_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_191, r_177_191 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_191, s_177_191 <=s (const 64 ((2**20))),
    u_177_191 + v_177_191 <=s (const 64 (2**20)),
    u_177_191 - v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 + v_177_191 <=s (const 64 (2**20)),
    (const 64 0) - u_177_191 - v_177_191 <=s (const 64 (2**20)),
    r_177_191 + s_177_191 <=s (const 64 (2**20)),
    r_177_191 - s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 + s_177_191 <=s (const 64 (2**20)),
    (const 64 0) - r_177_191 - s_177_191 <=s (const 64 (2**20)),
    u_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    v_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    r_177_191 = (const 64 0) (mod (const 64 (2**(20-14)))),
    s_177_191 = (const 64 0) (mod (const 64 (2**(20-14))))
}



// divsteps
// step191

// premise c
assume
neg_g_177_low60_0_low20_14 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_14 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_15 neg_g_177_low60_0_low20_14;
mov u_177_192 r_177_191;
mov v_177_192 s_177_191;

subs dc neg_g_177_low60_0_low20_15 neg_g_177_low60_0_low20_14 neg_f_177_low60_0_low20_14;
asr neg_g_177_low60_0_low20_15 neg_g_177_low60_0_low20_15 1;
subs dc r_177_192 r_177_191 u_177_191;
asr r_177_192 r_177_192 1;
subs dc s_177_192 s_177_191 v_177_191;
asr s_177_192 s_177_192 1;
assert
    true
&&
    neg_f_177_low60_0_low20_15 = neg_g_177_low60_0_low20_14,
    u_177_192 = r_177_191,
    v_177_192 = s_177_191,
    neg_g_177_low60_0_low20_15 * (const 64 2) = neg_g_177_low60_0_low20_14 - neg_f_177_low60_0_low20_14,
    r_177_192 * (const 64 2) = r_177_191 - u_177_191,
    s_177_192 * (const 64 2) = s_177_191 - v_177_191
;

assume
    neg_f_177_low60_0_low20_15 = neg_g_177_low60_0_low20_14,
    u_177_192 = r_177_191,
    v_177_192 = s_177_191,
    neg_g_177_low60_0_low20_15 * 2 = neg_g_177_low60_0_low20_14 - neg_f_177_low60_0_low20_14,
    r_177_192 * 2 = r_177_191 - u_177_191,
    s_177_192 * 2 = s_177_191 - v_177_191
&&
    true
;

{
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_15 + u_177_192 * (const 64 (2**21)) + v_177_192 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_15 + r_177_192 * (const 64 (2**21)) + s_177_192 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_15,
    neg_f_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_15,
    neg_g_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 192)) <=s delta, delta <=s (const 64 (1 + 2*192)),
    (const 64 (-(2**20))) <=s u_177_192, u_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_192, v_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_192, r_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_192, s_177_192 <=s (const 64 ((2**20))),
    u_177_192 + v_177_192 <=s (const 64 (2**20)),
    u_177_192 - v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 + v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 - v_177_192 <=s (const 64 (2**20)),
    r_177_192 + s_177_192 <=s (const 64 (2**20)),
    r_177_192 - s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 + s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 - s_177_192 <=s (const 64 (2**20)),
    u_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_177_192 = (const 64 0) (mod (const 64 (2**(20-15))))
}

proc divstep_192_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_15,
sint64 neg_g_177_low60_0_low20_15,
sint64 neg_f_177_low60_0_low20_16,
sint64 neg_g_177_low60_0_low20_16,
sint64 u_177_192,
sint64 v_177_192,
sint64 r_177_192,
sint64 s_177_192,
sint64 u_177_193,
sint64 v_177_193,
sint64 r_177_193,
sint64 s_177_193,
bit ne
)={
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (-(2**20)),
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (-(2**20))
&&
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (const 64 (-(2**20))),
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_15 + u_177_192 * (const 64 (2**21)) + v_177_192 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_15 + r_177_192 * (const 64 (2**21)) + s_177_192 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_15,
    neg_f_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_15,
    neg_g_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 192)) <=s delta, delta <=s (const 64 (1 + 2*192)),
    (const 64 (-(2**20))) <=s u_177_192, u_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_192, v_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_192, r_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_192, s_177_192 <=s (const 64 ((2**20))),
    u_177_192 + v_177_192 <=s (const 64 (2**20)),
    u_177_192 - v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 + v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 - v_177_192 <=s (const 64 (2**20)),
    r_177_192 + s_177_192 <=s (const 64 (2**20)),
    r_177_192 - s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 + s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 - s_177_192 <=s (const 64 (2**20)),
    u_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_177_192 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step192

// premise a
assume
neg_g_177_low60_0_low20_15 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_15 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_16 neg_f_177_low60_0_low20_15;
mov u_177_193 u_177_192;
mov v_177_193 v_177_192;

asr neg_g_177_low60_0_low20_16 neg_g_177_low60_0_low20_15 1;
asr r_177_193 r_177_192 1;
asr s_177_193 s_177_192 1;
assert
    true
&&
    neg_f_177_low60_0_low20_16 = neg_f_177_low60_0_low20_15,
    u_177_193 = u_177_192,
    v_177_193 = v_177_192,
    neg_g_177_low60_0_low20_16 * (const 64 2) = neg_g_177_low60_0_low20_15,
    r_177_193 * (const 64 2) = r_177_192,
    s_177_193 * (const 64 2) = s_177_192
;

assume
    neg_f_177_low60_0_low20_16 = neg_f_177_low60_0_low20_15,
    u_177_193 = u_177_192,
    v_177_193 = v_177_192,
    neg_g_177_low60_0_low20_16 * 2 = neg_g_177_low60_0_low20_15,
    r_177_193 * 2 = r_177_192,
    s_177_193 * 2 = s_177_192
&&
    true
;

{
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_16 + u_177_193 * (const 64 (2**21)) + v_177_193 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_16 + r_177_193 * (const 64 (2**21)) + s_177_193 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_16,
    neg_f_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_16,
    neg_g_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 193)) <=s delta, delta <=s (const 64 (1 + 2*193)),
    (const 64 (-(2**20))) <=s u_177_193, u_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_193, v_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_193, r_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_193, s_177_193 <=s (const 64 ((2**20))),
    u_177_193 + v_177_193 <=s (const 64 (2**20)),
    u_177_193 - v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 + v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 - v_177_193 <=s (const 64 (2**20)),
    r_177_193 + s_177_193 <=s (const 64 (2**20)),
    r_177_193 - s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 + s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 - s_177_193 <=s (const 64 (2**20)),
    u_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_177_193 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_192_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_15,
sint64 neg_g_177_low60_0_low20_15,
sint64 neg_f_177_low60_0_low20_16,
sint64 neg_g_177_low60_0_low20_16,
sint64 u_177_192,
sint64 v_177_192,
sint64 r_177_192,
sint64 s_177_192,
sint64 u_177_193,
sint64 v_177_193,
sint64 r_177_193,
sint64 s_177_193,
bit ne
)={
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (-(2**20)),
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (-(2**20))
&&
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (const 64 (-(2**20))),
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_15 + u_177_192 * (const 64 (2**21)) + v_177_192 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_15 + r_177_192 * (const 64 (2**21)) + s_177_192 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_15,
    neg_f_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_15,
    neg_g_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 192)) <=s delta, delta <=s (const 64 (1 + 2*192)),
    (const 64 (-(2**20))) <=s u_177_192, u_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_192, v_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_192, r_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_192, s_177_192 <=s (const 64 ((2**20))),
    u_177_192 + v_177_192 <=s (const 64 (2**20)),
    u_177_192 - v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 + v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 - v_177_192 <=s (const 64 (2**20)),
    r_177_192 + s_177_192 <=s (const 64 (2**20)),
    r_177_192 - s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 + s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 - s_177_192 <=s (const 64 (2**20)),
    u_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_177_192 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step192

// premise b
assume
neg_g_177_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_16 neg_f_177_low60_0_low20_15;
mov u_177_193 u_177_192;
mov v_177_193 v_177_192;

add neg_g_177_low60_0_low20_16 neg_g_177_low60_0_low20_15 neg_f_177_low60_0_low20_15;
asr neg_g_177_low60_0_low20_16 neg_g_177_low60_0_low20_16 1;
add r_177_193 r_177_192 u_177_192;
asr r_177_193 r_177_193 1;
add s_177_193 s_177_192 v_177_192;
asr s_177_193 s_177_193 1;
assert
    true
&&
    neg_f_177_low60_0_low20_16 = neg_f_177_low60_0_low20_15,
    u_177_193 = u_177_192,
    v_177_193 = v_177_192,
    neg_g_177_low60_0_low20_16 * (const 64 2) = neg_g_177_low60_0_low20_15 + neg_f_177_low60_0_low20_15,
    r_177_193 * (const 64 2) = r_177_192 + u_177_192,
    s_177_193 * (const 64 2) = s_177_192 + v_177_192
;

assume
    neg_f_177_low60_0_low20_16 = neg_f_177_low60_0_low20_15,
    u_177_193 = u_177_192,
    v_177_193 = v_177_192,
    neg_g_177_low60_0_low20_16 * 2 = neg_g_177_low60_0_low20_15 + neg_f_177_low60_0_low20_15,
    r_177_193 * 2 = r_177_192 + u_177_192,
    s_177_193 * 2 = s_177_192 + v_177_192
&&
    true
;

{
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_16 + u_177_193 * (const 64 (2**21)) + v_177_193 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_16 + r_177_193 * (const 64 (2**21)) + s_177_193 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_16,
    neg_f_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_16,
    neg_g_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 193)) <=s delta, delta <=s (const 64 (1 + 2*193)),
    (const 64 (-(2**20))) <=s u_177_193, u_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_193, v_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_193, r_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_193, s_177_193 <=s (const 64 ((2**20))),
    u_177_193 + v_177_193 <=s (const 64 (2**20)),
    u_177_193 - v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 + v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 - v_177_193 <=s (const 64 (2**20)),
    r_177_193 + s_177_193 <=s (const 64 (2**20)),
    r_177_193 - s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 + s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 - s_177_193 <=s (const 64 (2**20)),
    u_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_177_193 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_192_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_15,
sint64 neg_g_177_low60_0_low20_15,
sint64 neg_f_177_low60_0_low20_16,
sint64 neg_g_177_low60_0_low20_16,
sint64 u_177_192,
sint64 v_177_192,
sint64 r_177_192,
sint64 s_177_192,
sint64 u_177_193,
sint64 v_177_193,
sint64 r_177_193,
sint64 s_177_193,
bit ne
)={
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (-(2**20)),
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (-(2**20))
&&
    u_177_192 * neg_f_177_low60_0_low20_0 + v_177_192 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_15 * (const 64 (-(2**20))),
    r_177_192 * neg_f_177_low60_0_low20_0 + s_177_192 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_15 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_15 + u_177_192 * (const 64 (2**21)) + v_177_192 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_15 + r_177_192 * (const 64 (2**21)) + s_177_192 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_15,
    neg_f_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_15,
    neg_g_177_low60_0_low20_15 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 192)) <=s delta, delta <=s (const 64 (1 + 2*192)),
    (const 64 (-(2**20))) <=s u_177_192, u_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_192, v_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_192, r_177_192 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_192, s_177_192 <=s (const 64 ((2**20))),
    u_177_192 + v_177_192 <=s (const 64 (2**20)),
    u_177_192 - v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 + v_177_192 <=s (const 64 (2**20)),
    (const 64 0) - u_177_192 - v_177_192 <=s (const 64 (2**20)),
    r_177_192 + s_177_192 <=s (const 64 (2**20)),
    r_177_192 - s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 + s_177_192 <=s (const 64 (2**20)),
    (const 64 0) - r_177_192 - s_177_192 <=s (const 64 (2**20)),
    u_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    v_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    r_177_192 = (const 64 0) (mod (const 64 (2**(20-15)))),
    s_177_192 = (const 64 0) (mod (const 64 (2**(20-15))))
}



// divsteps
// step192

// premise c
assume
neg_g_177_low60_0_low20_15 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_15 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_16 neg_g_177_low60_0_low20_15;
mov u_177_193 r_177_192;
mov v_177_193 s_177_192;

subs dc neg_g_177_low60_0_low20_16 neg_g_177_low60_0_low20_15 neg_f_177_low60_0_low20_15;
asr neg_g_177_low60_0_low20_16 neg_g_177_low60_0_low20_16 1;
subs dc r_177_193 r_177_192 u_177_192;
asr r_177_193 r_177_193 1;
subs dc s_177_193 s_177_192 v_177_192;
asr s_177_193 s_177_193 1;
assert
    true
&&
    neg_f_177_low60_0_low20_16 = neg_g_177_low60_0_low20_15,
    u_177_193 = r_177_192,
    v_177_193 = s_177_192,
    neg_g_177_low60_0_low20_16 * (const 64 2) = neg_g_177_low60_0_low20_15 - neg_f_177_low60_0_low20_15,
    r_177_193 * (const 64 2) = r_177_192 - u_177_192,
    s_177_193 * (const 64 2) = s_177_192 - v_177_192
;

assume
    neg_f_177_low60_0_low20_16 = neg_g_177_low60_0_low20_15,
    u_177_193 = r_177_192,
    v_177_193 = s_177_192,
    neg_g_177_low60_0_low20_16 * 2 = neg_g_177_low60_0_low20_15 - neg_f_177_low60_0_low20_15,
    r_177_193 * 2 = r_177_192 - u_177_192,
    s_177_193 * 2 = s_177_192 - v_177_192
&&
    true
;

{
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_16 + u_177_193 * (const 64 (2**21)) + v_177_193 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_16 + r_177_193 * (const 64 (2**21)) + s_177_193 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_16,
    neg_f_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_16,
    neg_g_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 193)) <=s delta, delta <=s (const 64 (1 + 2*193)),
    (const 64 (-(2**20))) <=s u_177_193, u_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_193, v_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_193, r_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_193, s_177_193 <=s (const 64 ((2**20))),
    u_177_193 + v_177_193 <=s (const 64 (2**20)),
    u_177_193 - v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 + v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 - v_177_193 <=s (const 64 (2**20)),
    r_177_193 + s_177_193 <=s (const 64 (2**20)),
    r_177_193 - s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 + s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 - s_177_193 <=s (const 64 (2**20)),
    u_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_177_193 = (const 64 0) (mod (const 64 (2**(20-16))))
}

proc divstep_193_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_16,
sint64 neg_g_177_low60_0_low20_16,
sint64 neg_f_177_low60_0_low20_17,
sint64 neg_g_177_low60_0_low20_17,
sint64 u_177_193,
sint64 v_177_193,
sint64 r_177_193,
sint64 s_177_193,
sint64 u_177_194,
sint64 v_177_194,
sint64 r_177_194,
sint64 s_177_194,
bit ne
)={
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (-(2**20)),
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (-(2**20))
&&
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (const 64 (-(2**20))),
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_16 + u_177_193 * (const 64 (2**21)) + v_177_193 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_16 + r_177_193 * (const 64 (2**21)) + s_177_193 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_16,
    neg_f_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_16,
    neg_g_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 193)) <=s delta, delta <=s (const 64 (1 + 2*193)),
    (const 64 (-(2**20))) <=s u_177_193, u_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_193, v_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_193, r_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_193, s_177_193 <=s (const 64 ((2**20))),
    u_177_193 + v_177_193 <=s (const 64 (2**20)),
    u_177_193 - v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 + v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 - v_177_193 <=s (const 64 (2**20)),
    r_177_193 + s_177_193 <=s (const 64 (2**20)),
    r_177_193 - s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 + s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 - s_177_193 <=s (const 64 (2**20)),
    u_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_177_193 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step193

// premise a
assume
neg_g_177_low60_0_low20_16 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_16 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_17 neg_f_177_low60_0_low20_16;
mov u_177_194 u_177_193;
mov v_177_194 v_177_193;

asr neg_g_177_low60_0_low20_17 neg_g_177_low60_0_low20_16 1;
asr r_177_194 r_177_193 1;
asr s_177_194 s_177_193 1;
assert
    true
&&
    neg_f_177_low60_0_low20_17 = neg_f_177_low60_0_low20_16,
    u_177_194 = u_177_193,
    v_177_194 = v_177_193,
    neg_g_177_low60_0_low20_17 * (const 64 2) = neg_g_177_low60_0_low20_16,
    r_177_194 * (const 64 2) = r_177_193,
    s_177_194 * (const 64 2) = s_177_193
;

assume
    neg_f_177_low60_0_low20_17 = neg_f_177_low60_0_low20_16,
    u_177_194 = u_177_193,
    v_177_194 = v_177_193,
    neg_g_177_low60_0_low20_17 * 2 = neg_g_177_low60_0_low20_16,
    r_177_194 * 2 = r_177_193,
    s_177_194 * 2 = s_177_193
&&
    true
;

{
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_17 + u_177_194 * (const 64 (2**21)) + v_177_194 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_17 + r_177_194 * (const 64 (2**21)) + s_177_194 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_17,
    neg_f_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_17,
    neg_g_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 194)) <=s delta, delta <=s (const 64 (1 + 2*194)),
    (const 64 (-(2**20))) <=s u_177_194, u_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_194, v_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_194, r_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_194, s_177_194 <=s (const 64 ((2**20))),
    u_177_194 + v_177_194 <=s (const 64 (2**20)),
    u_177_194 - v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 + v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 - v_177_194 <=s (const 64 (2**20)),
    r_177_194 + s_177_194 <=s (const 64 (2**20)),
    r_177_194 - s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 + s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 - s_177_194 <=s (const 64 (2**20)),
    u_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_177_194 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_193_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_16,
sint64 neg_g_177_low60_0_low20_16,
sint64 neg_f_177_low60_0_low20_17,
sint64 neg_g_177_low60_0_low20_17,
sint64 u_177_193,
sint64 v_177_193,
sint64 r_177_193,
sint64 s_177_193,
sint64 u_177_194,
sint64 v_177_194,
sint64 r_177_194,
sint64 s_177_194,
bit ne
)={
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (-(2**20)),
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (-(2**20))
&&
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (const 64 (-(2**20))),
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_16 + u_177_193 * (const 64 (2**21)) + v_177_193 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_16 + r_177_193 * (const 64 (2**21)) + s_177_193 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_16,
    neg_f_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_16,
    neg_g_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 193)) <=s delta, delta <=s (const 64 (1 + 2*193)),
    (const 64 (-(2**20))) <=s u_177_193, u_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_193, v_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_193, r_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_193, s_177_193 <=s (const 64 ((2**20))),
    u_177_193 + v_177_193 <=s (const 64 (2**20)),
    u_177_193 - v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 + v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 - v_177_193 <=s (const 64 (2**20)),
    r_177_193 + s_177_193 <=s (const 64 (2**20)),
    r_177_193 - s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 + s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 - s_177_193 <=s (const 64 (2**20)),
    u_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_177_193 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step193

// premise b
assume
neg_g_177_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_17 neg_f_177_low60_0_low20_16;
mov u_177_194 u_177_193;
mov v_177_194 v_177_193;

add neg_g_177_low60_0_low20_17 neg_g_177_low60_0_low20_16 neg_f_177_low60_0_low20_16;
asr neg_g_177_low60_0_low20_17 neg_g_177_low60_0_low20_17 1;
add r_177_194 r_177_193 u_177_193;
asr r_177_194 r_177_194 1;
add s_177_194 s_177_193 v_177_193;
asr s_177_194 s_177_194 1;
assert
    true
&&
    neg_f_177_low60_0_low20_17 = neg_f_177_low60_0_low20_16,
    u_177_194 = u_177_193,
    v_177_194 = v_177_193,
    neg_g_177_low60_0_low20_17 * (const 64 2) = neg_g_177_low60_0_low20_16 + neg_f_177_low60_0_low20_16,
    r_177_194 * (const 64 2) = r_177_193 + u_177_193,
    s_177_194 * (const 64 2) = s_177_193 + v_177_193
;

assume
    neg_f_177_low60_0_low20_17 = neg_f_177_low60_0_low20_16,
    u_177_194 = u_177_193,
    v_177_194 = v_177_193,
    neg_g_177_low60_0_low20_17 * 2 = neg_g_177_low60_0_low20_16 + neg_f_177_low60_0_low20_16,
    r_177_194 * 2 = r_177_193 + u_177_193,
    s_177_194 * 2 = s_177_193 + v_177_193
&&
    true
;

{
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_17 + u_177_194 * (const 64 (2**21)) + v_177_194 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_17 + r_177_194 * (const 64 (2**21)) + s_177_194 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_17,
    neg_f_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_17,
    neg_g_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 194)) <=s delta, delta <=s (const 64 (1 + 2*194)),
    (const 64 (-(2**20))) <=s u_177_194, u_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_194, v_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_194, r_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_194, s_177_194 <=s (const 64 ((2**20))),
    u_177_194 + v_177_194 <=s (const 64 (2**20)),
    u_177_194 - v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 + v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 - v_177_194 <=s (const 64 (2**20)),
    r_177_194 + s_177_194 <=s (const 64 (2**20)),
    r_177_194 - s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 + s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 - s_177_194 <=s (const 64 (2**20)),
    u_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_177_194 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_193_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_16,
sint64 neg_g_177_low60_0_low20_16,
sint64 neg_f_177_low60_0_low20_17,
sint64 neg_g_177_low60_0_low20_17,
sint64 u_177_193,
sint64 v_177_193,
sint64 r_177_193,
sint64 s_177_193,
sint64 u_177_194,
sint64 v_177_194,
sint64 r_177_194,
sint64 s_177_194,
bit ne
)={
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (-(2**20)),
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (-(2**20))
&&
    u_177_193 * neg_f_177_low60_0_low20_0 + v_177_193 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_16 * (const 64 (-(2**20))),
    r_177_193 * neg_f_177_low60_0_low20_0 + s_177_193 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_16 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_16 + u_177_193 * (const 64 (2**21)) + v_177_193 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_16 + r_177_193 * (const 64 (2**21)) + s_177_193 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_16,
    neg_f_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_16,
    neg_g_177_low60_0_low20_16 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 193)) <=s delta, delta <=s (const 64 (1 + 2*193)),
    (const 64 (-(2**20))) <=s u_177_193, u_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_193, v_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_193, r_177_193 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_193, s_177_193 <=s (const 64 ((2**20))),
    u_177_193 + v_177_193 <=s (const 64 (2**20)),
    u_177_193 - v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 + v_177_193 <=s (const 64 (2**20)),
    (const 64 0) - u_177_193 - v_177_193 <=s (const 64 (2**20)),
    r_177_193 + s_177_193 <=s (const 64 (2**20)),
    r_177_193 - s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 + s_177_193 <=s (const 64 (2**20)),
    (const 64 0) - r_177_193 - s_177_193 <=s (const 64 (2**20)),
    u_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    v_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    r_177_193 = (const 64 0) (mod (const 64 (2**(20-16)))),
    s_177_193 = (const 64 0) (mod (const 64 (2**(20-16))))
}



// divsteps
// step193

// premise c
assume
neg_g_177_low60_0_low20_16 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_16 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_17 neg_g_177_low60_0_low20_16;
mov u_177_194 r_177_193;
mov v_177_194 s_177_193;

subs dc neg_g_177_low60_0_low20_17 neg_g_177_low60_0_low20_16 neg_f_177_low60_0_low20_16;
asr neg_g_177_low60_0_low20_17 neg_g_177_low60_0_low20_17 1;
subs dc r_177_194 r_177_193 u_177_193;
asr r_177_194 r_177_194 1;
subs dc s_177_194 s_177_193 v_177_193;
asr s_177_194 s_177_194 1;
assert
    true
&&
    neg_f_177_low60_0_low20_17 = neg_g_177_low60_0_low20_16,
    u_177_194 = r_177_193,
    v_177_194 = s_177_193,
    neg_g_177_low60_0_low20_17 * (const 64 2) = neg_g_177_low60_0_low20_16 - neg_f_177_low60_0_low20_16,
    r_177_194 * (const 64 2) = r_177_193 - u_177_193,
    s_177_194 * (const 64 2) = s_177_193 - v_177_193
;

assume
    neg_f_177_low60_0_low20_17 = neg_g_177_low60_0_low20_16,
    u_177_194 = r_177_193,
    v_177_194 = s_177_193,
    neg_g_177_low60_0_low20_17 * 2 = neg_g_177_low60_0_low20_16 - neg_f_177_low60_0_low20_16,
    r_177_194 * 2 = r_177_193 - u_177_193,
    s_177_194 * 2 = s_177_193 - v_177_193
&&
    true
;

{
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_17 + u_177_194 * (const 64 (2**21)) + v_177_194 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_17 + r_177_194 * (const 64 (2**21)) + s_177_194 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_17,
    neg_f_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_17,
    neg_g_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 194)) <=s delta, delta <=s (const 64 (1 + 2*194)),
    (const 64 (-(2**20))) <=s u_177_194, u_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_194, v_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_194, r_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_194, s_177_194 <=s (const 64 ((2**20))),
    u_177_194 + v_177_194 <=s (const 64 (2**20)),
    u_177_194 - v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 + v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 - v_177_194 <=s (const 64 (2**20)),
    r_177_194 + s_177_194 <=s (const 64 (2**20)),
    r_177_194 - s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 + s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 - s_177_194 <=s (const 64 (2**20)),
    u_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_177_194 = (const 64 0) (mod (const 64 (2**(20-17))))
}

proc divstep_194_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_17,
sint64 neg_g_177_low60_0_low20_17,
sint64 neg_f_177_low60_0_low20_18,
sint64 neg_g_177_low60_0_low20_18,
sint64 u_177_194,
sint64 v_177_194,
sint64 r_177_194,
sint64 s_177_194,
sint64 u_177_195,
sint64 v_177_195,
sint64 r_177_195,
sint64 s_177_195,
bit ne
)={
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (-(2**20)),
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (-(2**20))
&&
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (const 64 (-(2**20))),
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_17 + u_177_194 * (const 64 (2**21)) + v_177_194 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_17 + r_177_194 * (const 64 (2**21)) + s_177_194 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_17,
    neg_f_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_17,
    neg_g_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 194)) <=s delta, delta <=s (const 64 (1 + 2*194)),
    (const 64 (-(2**20))) <=s u_177_194, u_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_194, v_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_194, r_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_194, s_177_194 <=s (const 64 ((2**20))),
    u_177_194 + v_177_194 <=s (const 64 (2**20)),
    u_177_194 - v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 + v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 - v_177_194 <=s (const 64 (2**20)),
    r_177_194 + s_177_194 <=s (const 64 (2**20)),
    r_177_194 - s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 + s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 - s_177_194 <=s (const 64 (2**20)),
    u_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_177_194 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step194

// premise a
assume
neg_g_177_low60_0_low20_17 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_17 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_18 neg_f_177_low60_0_low20_17;
mov u_177_195 u_177_194;
mov v_177_195 v_177_194;

asr neg_g_177_low60_0_low20_18 neg_g_177_low60_0_low20_17 1;
asr r_177_195 r_177_194 1;
asr s_177_195 s_177_194 1;
assert
    true
&&
    neg_f_177_low60_0_low20_18 = neg_f_177_low60_0_low20_17,
    u_177_195 = u_177_194,
    v_177_195 = v_177_194,
    neg_g_177_low60_0_low20_18 * (const 64 2) = neg_g_177_low60_0_low20_17,
    r_177_195 * (const 64 2) = r_177_194,
    s_177_195 * (const 64 2) = s_177_194
;

assume
    neg_f_177_low60_0_low20_18 = neg_f_177_low60_0_low20_17,
    u_177_195 = u_177_194,
    v_177_195 = v_177_194,
    neg_g_177_low60_0_low20_18 * 2 = neg_g_177_low60_0_low20_17,
    r_177_195 * 2 = r_177_194,
    s_177_195 * 2 = s_177_194
&&
    true
;

{
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_18 + u_177_195 * (const 64 (2**21)) + v_177_195 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_18 + r_177_195 * (const 64 (2**21)) + s_177_195 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_18,
    neg_f_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_18,
    neg_g_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 195)) <=s delta, delta <=s (const 64 (1 + 2*195)),
    (const 64 (-(2**20))) <=s u_177_195, u_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_195, v_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_195, r_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_195, s_177_195 <=s (const 64 ((2**20))),
    u_177_195 + v_177_195 <=s (const 64 (2**20)),
    u_177_195 - v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 + v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 - v_177_195 <=s (const 64 (2**20)),
    r_177_195 + s_177_195 <=s (const 64 (2**20)),
    r_177_195 - s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 + s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 - s_177_195 <=s (const 64 (2**20)),
    u_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_177_195 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_194_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_17,
sint64 neg_g_177_low60_0_low20_17,
sint64 neg_f_177_low60_0_low20_18,
sint64 neg_g_177_low60_0_low20_18,
sint64 u_177_194,
sint64 v_177_194,
sint64 r_177_194,
sint64 s_177_194,
sint64 u_177_195,
sint64 v_177_195,
sint64 r_177_195,
sint64 s_177_195,
bit ne
)={
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (-(2**20)),
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (-(2**20))
&&
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (const 64 (-(2**20))),
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_17 + u_177_194 * (const 64 (2**21)) + v_177_194 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_17 + r_177_194 * (const 64 (2**21)) + s_177_194 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_17,
    neg_f_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_17,
    neg_g_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 194)) <=s delta, delta <=s (const 64 (1 + 2*194)),
    (const 64 (-(2**20))) <=s u_177_194, u_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_194, v_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_194, r_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_194, s_177_194 <=s (const 64 ((2**20))),
    u_177_194 + v_177_194 <=s (const 64 (2**20)),
    u_177_194 - v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 + v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 - v_177_194 <=s (const 64 (2**20)),
    r_177_194 + s_177_194 <=s (const 64 (2**20)),
    r_177_194 - s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 + s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 - s_177_194 <=s (const 64 (2**20)),
    u_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_177_194 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step194

// premise b
assume
neg_g_177_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_18 neg_f_177_low60_0_low20_17;
mov u_177_195 u_177_194;
mov v_177_195 v_177_194;

add neg_g_177_low60_0_low20_18 neg_g_177_low60_0_low20_17 neg_f_177_low60_0_low20_17;
asr neg_g_177_low60_0_low20_18 neg_g_177_low60_0_low20_18 1;
add r_177_195 r_177_194 u_177_194;
asr r_177_195 r_177_195 1;
add s_177_195 s_177_194 v_177_194;
asr s_177_195 s_177_195 1;
assert
    true
&&
    neg_f_177_low60_0_low20_18 = neg_f_177_low60_0_low20_17,
    u_177_195 = u_177_194,
    v_177_195 = v_177_194,
    neg_g_177_low60_0_low20_18 * (const 64 2) = neg_g_177_low60_0_low20_17 + neg_f_177_low60_0_low20_17,
    r_177_195 * (const 64 2) = r_177_194 + u_177_194,
    s_177_195 * (const 64 2) = s_177_194 + v_177_194
;

assume
    neg_f_177_low60_0_low20_18 = neg_f_177_low60_0_low20_17,
    u_177_195 = u_177_194,
    v_177_195 = v_177_194,
    neg_g_177_low60_0_low20_18 * 2 = neg_g_177_low60_0_low20_17 + neg_f_177_low60_0_low20_17,
    r_177_195 * 2 = r_177_194 + u_177_194,
    s_177_195 * 2 = s_177_194 + v_177_194
&&
    true
;

{
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_18 + u_177_195 * (const 64 (2**21)) + v_177_195 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_18 + r_177_195 * (const 64 (2**21)) + s_177_195 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_18,
    neg_f_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_18,
    neg_g_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 195)) <=s delta, delta <=s (const 64 (1 + 2*195)),
    (const 64 (-(2**20))) <=s u_177_195, u_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_195, v_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_195, r_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_195, s_177_195 <=s (const 64 ((2**20))),
    u_177_195 + v_177_195 <=s (const 64 (2**20)),
    u_177_195 - v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 + v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 - v_177_195 <=s (const 64 (2**20)),
    r_177_195 + s_177_195 <=s (const 64 (2**20)),
    r_177_195 - s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 + s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 - s_177_195 <=s (const 64 (2**20)),
    u_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_177_195 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_194_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_17,
sint64 neg_g_177_low60_0_low20_17,
sint64 neg_f_177_low60_0_low20_18,
sint64 neg_g_177_low60_0_low20_18,
sint64 u_177_194,
sint64 v_177_194,
sint64 r_177_194,
sint64 s_177_194,
sint64 u_177_195,
sint64 v_177_195,
sint64 r_177_195,
sint64 s_177_195,
bit ne
)={
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (-(2**20)),
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (-(2**20))
&&
    u_177_194 * neg_f_177_low60_0_low20_0 + v_177_194 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_17 * (const 64 (-(2**20))),
    r_177_194 * neg_f_177_low60_0_low20_0 + s_177_194 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_17 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_17 + u_177_194 * (const 64 (2**21)) + v_177_194 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_17 + r_177_194 * (const 64 (2**21)) + s_177_194 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_17,
    neg_f_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_17,
    neg_g_177_low60_0_low20_17 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 194)) <=s delta, delta <=s (const 64 (1 + 2*194)),
    (const 64 (-(2**20))) <=s u_177_194, u_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_194, v_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_194, r_177_194 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_194, s_177_194 <=s (const 64 ((2**20))),
    u_177_194 + v_177_194 <=s (const 64 (2**20)),
    u_177_194 - v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 + v_177_194 <=s (const 64 (2**20)),
    (const 64 0) - u_177_194 - v_177_194 <=s (const 64 (2**20)),
    r_177_194 + s_177_194 <=s (const 64 (2**20)),
    r_177_194 - s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 + s_177_194 <=s (const 64 (2**20)),
    (const 64 0) - r_177_194 - s_177_194 <=s (const 64 (2**20)),
    u_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    v_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    r_177_194 = (const 64 0) (mod (const 64 (2**(20-17)))),
    s_177_194 = (const 64 0) (mod (const 64 (2**(20-17))))
}



// divsteps
// step194

// premise c
assume
neg_g_177_low60_0_low20_17 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_17 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_18 neg_g_177_low60_0_low20_17;
mov u_177_195 r_177_194;
mov v_177_195 s_177_194;

subs dc neg_g_177_low60_0_low20_18 neg_g_177_low60_0_low20_17 neg_f_177_low60_0_low20_17;
asr neg_g_177_low60_0_low20_18 neg_g_177_low60_0_low20_18 1;
subs dc r_177_195 r_177_194 u_177_194;
asr r_177_195 r_177_195 1;
subs dc s_177_195 s_177_194 v_177_194;
asr s_177_195 s_177_195 1;
assert
    true
&&
    neg_f_177_low60_0_low20_18 = neg_g_177_low60_0_low20_17,
    u_177_195 = r_177_194,
    v_177_195 = s_177_194,
    neg_g_177_low60_0_low20_18 * (const 64 2) = neg_g_177_low60_0_low20_17 - neg_f_177_low60_0_low20_17,
    r_177_195 * (const 64 2) = r_177_194 - u_177_194,
    s_177_195 * (const 64 2) = s_177_194 - v_177_194
;

assume
    neg_f_177_low60_0_low20_18 = neg_g_177_low60_0_low20_17,
    u_177_195 = r_177_194,
    v_177_195 = s_177_194,
    neg_g_177_low60_0_low20_18 * 2 = neg_g_177_low60_0_low20_17 - neg_f_177_low60_0_low20_17,
    r_177_195 * 2 = r_177_194 - u_177_194,
    s_177_195 * 2 = s_177_194 - v_177_194
&&
    true
;

{
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_18 + u_177_195 * (const 64 (2**21)) + v_177_195 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_18 + r_177_195 * (const 64 (2**21)) + s_177_195 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_18,
    neg_f_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_18,
    neg_g_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 195)) <=s delta, delta <=s (const 64 (1 + 2*195)),
    (const 64 (-(2**20))) <=s u_177_195, u_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_195, v_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_195, r_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_195, s_177_195 <=s (const 64 ((2**20))),
    u_177_195 + v_177_195 <=s (const 64 (2**20)),
    u_177_195 - v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 + v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 - v_177_195 <=s (const 64 (2**20)),
    r_177_195 + s_177_195 <=s (const 64 (2**20)),
    r_177_195 - s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 + s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 - s_177_195 <=s (const 64 (2**20)),
    u_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_177_195 = (const 64 0) (mod (const 64 (2**(20-18))))
}

proc divstep_195_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_18,
sint64 neg_g_177_low60_0_low20_18,
sint64 neg_f_177_low60_0_low20_19,
sint64 neg_g_177_low60_0_low20_19,
sint64 u_177_195,
sint64 v_177_195,
sint64 r_177_195,
sint64 s_177_195,
sint64 u_177_196,
sint64 v_177_196,
sint64 r_177_196,
sint64 s_177_196,
bit ne
)={
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (-(2**20)),
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (-(2**20))
&&
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (const 64 (-(2**20))),
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_18 + u_177_195 * (const 64 (2**21)) + v_177_195 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_18 + r_177_195 * (const 64 (2**21)) + s_177_195 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_18,
    neg_f_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_18,
    neg_g_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 195)) <=s delta, delta <=s (const 64 (1 + 2*195)),
    (const 64 (-(2**20))) <=s u_177_195, u_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_195, v_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_195, r_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_195, s_177_195 <=s (const 64 ((2**20))),
    u_177_195 + v_177_195 <=s (const 64 (2**20)),
    u_177_195 - v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 + v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 - v_177_195 <=s (const 64 (2**20)),
    r_177_195 + s_177_195 <=s (const 64 (2**20)),
    r_177_195 - s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 + s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 - s_177_195 <=s (const 64 (2**20)),
    u_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_177_195 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step195

// premise a
assume
neg_g_177_low60_0_low20_18 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_18 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_19 neg_f_177_low60_0_low20_18;
mov u_177_196 u_177_195;
mov v_177_196 v_177_195;

asr neg_g_177_low60_0_low20_19 neg_g_177_low60_0_low20_18 1;
asr r_177_196 r_177_195 1;
asr s_177_196 s_177_195 1;
assert
    true
&&
    neg_f_177_low60_0_low20_19 = neg_f_177_low60_0_low20_18,
    u_177_196 = u_177_195,
    v_177_196 = v_177_195,
    neg_g_177_low60_0_low20_19 * (const 64 2) = neg_g_177_low60_0_low20_18,
    r_177_196 * (const 64 2) = r_177_195,
    s_177_196 * (const 64 2) = s_177_195
;

assume
    neg_f_177_low60_0_low20_19 = neg_f_177_low60_0_low20_18,
    u_177_196 = u_177_195,
    v_177_196 = v_177_195,
    neg_g_177_low60_0_low20_19 * 2 = neg_g_177_low60_0_low20_18,
    r_177_196 * 2 = r_177_195,
    s_177_196 * 2 = s_177_195
&&
    true
;

{
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_19 + u_177_196 * (const 64 (2**21)) + v_177_196 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_19 + r_177_196 * (const 64 (2**21)) + s_177_196 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_19,
    neg_f_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_19,
    neg_g_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 196)) <=s delta, delta <=s (const 64 (1 + 2*196)),
    (const 64 (-(2**20))) <=s u_177_196, u_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_196, v_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_196, r_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_196, s_177_196 <=s (const 64 ((2**20))),
    u_177_196 + v_177_196 <=s (const 64 (2**20)),
    u_177_196 - v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 + v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 - v_177_196 <=s (const 64 (2**20)),
    r_177_196 + s_177_196 <=s (const 64 (2**20)),
    r_177_196 - s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 + s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 - s_177_196 <=s (const 64 (2**20)),
    u_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_177_196 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_195_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_18,
sint64 neg_g_177_low60_0_low20_18,
sint64 neg_f_177_low60_0_low20_19,
sint64 neg_g_177_low60_0_low20_19,
sint64 u_177_195,
sint64 v_177_195,
sint64 r_177_195,
sint64 s_177_195,
sint64 u_177_196,
sint64 v_177_196,
sint64 r_177_196,
sint64 s_177_196,
bit ne
)={
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (-(2**20)),
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (-(2**20))
&&
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (const 64 (-(2**20))),
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_18 + u_177_195 * (const 64 (2**21)) + v_177_195 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_18 + r_177_195 * (const 64 (2**21)) + s_177_195 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_18,
    neg_f_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_18,
    neg_g_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 195)) <=s delta, delta <=s (const 64 (1 + 2*195)),
    (const 64 (-(2**20))) <=s u_177_195, u_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_195, v_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_195, r_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_195, s_177_195 <=s (const 64 ((2**20))),
    u_177_195 + v_177_195 <=s (const 64 (2**20)),
    u_177_195 - v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 + v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 - v_177_195 <=s (const 64 (2**20)),
    r_177_195 + s_177_195 <=s (const 64 (2**20)),
    r_177_195 - s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 + s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 - s_177_195 <=s (const 64 (2**20)),
    u_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_177_195 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step195

// premise b
assume
neg_g_177_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_19 neg_f_177_low60_0_low20_18;
mov u_177_196 u_177_195;
mov v_177_196 v_177_195;

add neg_g_177_low60_0_low20_19 neg_g_177_low60_0_low20_18 neg_f_177_low60_0_low20_18;
asr neg_g_177_low60_0_low20_19 neg_g_177_low60_0_low20_19 1;
add r_177_196 r_177_195 u_177_195;
asr r_177_196 r_177_196 1;
add s_177_196 s_177_195 v_177_195;
asr s_177_196 s_177_196 1;
assert
    true
&&
    neg_f_177_low60_0_low20_19 = neg_f_177_low60_0_low20_18,
    u_177_196 = u_177_195,
    v_177_196 = v_177_195,
    neg_g_177_low60_0_low20_19 * (const 64 2) = neg_g_177_low60_0_low20_18 + neg_f_177_low60_0_low20_18,
    r_177_196 * (const 64 2) = r_177_195 + u_177_195,
    s_177_196 * (const 64 2) = s_177_195 + v_177_195
;

assume
    neg_f_177_low60_0_low20_19 = neg_f_177_low60_0_low20_18,
    u_177_196 = u_177_195,
    v_177_196 = v_177_195,
    neg_g_177_low60_0_low20_19 * 2 = neg_g_177_low60_0_low20_18 + neg_f_177_low60_0_low20_18,
    r_177_196 * 2 = r_177_195 + u_177_195,
    s_177_196 * 2 = s_177_195 + v_177_195
&&
    true
;

{
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_19 + u_177_196 * (const 64 (2**21)) + v_177_196 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_19 + r_177_196 * (const 64 (2**21)) + s_177_196 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_19,
    neg_f_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_19,
    neg_g_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 196)) <=s delta, delta <=s (const 64 (1 + 2*196)),
    (const 64 (-(2**20))) <=s u_177_196, u_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_196, v_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_196, r_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_196, s_177_196 <=s (const 64 ((2**20))),
    u_177_196 + v_177_196 <=s (const 64 (2**20)),
    u_177_196 - v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 + v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 - v_177_196 <=s (const 64 (2**20)),
    r_177_196 + s_177_196 <=s (const 64 (2**20)),
    r_177_196 - s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 + s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 - s_177_196 <=s (const 64 (2**20)),
    u_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_177_196 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_195_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_18,
sint64 neg_g_177_low60_0_low20_18,
sint64 neg_f_177_low60_0_low20_19,
sint64 neg_g_177_low60_0_low20_19,
sint64 u_177_195,
sint64 v_177_195,
sint64 r_177_195,
sint64 s_177_195,
sint64 u_177_196,
sint64 v_177_196,
sint64 r_177_196,
sint64 s_177_196,
bit ne
)={
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (-(2**20)),
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (-(2**20))
&&
    u_177_195 * neg_f_177_low60_0_low20_0 + v_177_195 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_18 * (const 64 (-(2**20))),
    r_177_195 * neg_f_177_low60_0_low20_0 + s_177_195 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_18 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_18 + u_177_195 * (const 64 (2**21)) + v_177_195 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_18 + r_177_195 * (const 64 (2**21)) + s_177_195 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_18,
    neg_f_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_18,
    neg_g_177_low60_0_low20_18 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 195)) <=s delta, delta <=s (const 64 (1 + 2*195)),
    (const 64 (-(2**20))) <=s u_177_195, u_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_195, v_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_195, r_177_195 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_195, s_177_195 <=s (const 64 ((2**20))),
    u_177_195 + v_177_195 <=s (const 64 (2**20)),
    u_177_195 - v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 + v_177_195 <=s (const 64 (2**20)),
    (const 64 0) - u_177_195 - v_177_195 <=s (const 64 (2**20)),
    r_177_195 + s_177_195 <=s (const 64 (2**20)),
    r_177_195 - s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 + s_177_195 <=s (const 64 (2**20)),
    (const 64 0) - r_177_195 - s_177_195 <=s (const 64 (2**20)),
    u_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    v_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    r_177_195 = (const 64 0) (mod (const 64 (2**(20-18)))),
    s_177_195 = (const 64 0) (mod (const 64 (2**(20-18))))
}



// divsteps
// step195

// premise c
assume
neg_g_177_low60_0_low20_18 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_18 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_19 neg_g_177_low60_0_low20_18;
mov u_177_196 r_177_195;
mov v_177_196 s_177_195;

subs dc neg_g_177_low60_0_low20_19 neg_g_177_low60_0_low20_18 neg_f_177_low60_0_low20_18;
asr neg_g_177_low60_0_low20_19 neg_g_177_low60_0_low20_19 1;
subs dc r_177_196 r_177_195 u_177_195;
asr r_177_196 r_177_196 1;
subs dc s_177_196 s_177_195 v_177_195;
asr s_177_196 s_177_196 1;
assert
    true
&&
    neg_f_177_low60_0_low20_19 = neg_g_177_low60_0_low20_18,
    u_177_196 = r_177_195,
    v_177_196 = s_177_195,
    neg_g_177_low60_0_low20_19 * (const 64 2) = neg_g_177_low60_0_low20_18 - neg_f_177_low60_0_low20_18,
    r_177_196 * (const 64 2) = r_177_195 - u_177_195,
    s_177_196 * (const 64 2) = s_177_195 - v_177_195
;

assume
    neg_f_177_low60_0_low20_19 = neg_g_177_low60_0_low20_18,
    u_177_196 = r_177_195,
    v_177_196 = s_177_195,
    neg_g_177_low60_0_low20_19 * 2 = neg_g_177_low60_0_low20_18 - neg_f_177_low60_0_low20_18,
    r_177_196 * 2 = r_177_195 - u_177_195,
    s_177_196 * 2 = s_177_195 - v_177_195
&&
    true
;

{
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_19 + u_177_196 * (const 64 (2**21)) + v_177_196 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_19 + r_177_196 * (const 64 (2**21)) + s_177_196 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_19,
    neg_f_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_19,
    neg_g_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 196)) <=s delta, delta <=s (const 64 (1 + 2*196)),
    (const 64 (-(2**20))) <=s u_177_196, u_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_196, v_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_196, r_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_196, s_177_196 <=s (const 64 ((2**20))),
    u_177_196 + v_177_196 <=s (const 64 (2**20)),
    u_177_196 - v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 + v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 - v_177_196 <=s (const 64 (2**20)),
    r_177_196 + s_177_196 <=s (const 64 (2**20)),
    r_177_196 - s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 + s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 - s_177_196 <=s (const 64 (2**20)),
    u_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_177_196 = (const 64 0) (mod (const 64 (2**(20-19))))
}

proc divstep_196_a (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_19,
sint64 neg_g_177_low60_0_low20_19,
sint64 neg_f_177_low60_0_low20_20,
sint64 neg_g_177_low60_0_low20_20,
sint64 u_177_196,
sint64 v_177_196,
sint64 r_177_196,
sint64 s_177_196,
sint64 u_177_197,
sint64 v_177_197,
sint64 r_177_197,
sint64 s_177_197,
bit ne
)={
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (-(2**20)),
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (-(2**20))
&&
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (const 64 (-(2**20))),
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_19 + u_177_196 * (const 64 (2**21)) + v_177_196 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_19 + r_177_196 * (const 64 (2**21)) + s_177_196 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_19,
    neg_f_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_19,
    neg_g_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 196)) <=s delta, delta <=s (const 64 (1 + 2*196)),
    (const 64 (-(2**20))) <=s u_177_196, u_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_196, v_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_196, r_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_196, s_177_196 <=s (const 64 ((2**20))),
    u_177_196 + v_177_196 <=s (const 64 (2**20)),
    u_177_196 - v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 + v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 - v_177_196 <=s (const 64 (2**20)),
    r_177_196 + s_177_196 <=s (const 64 (2**20)),
    r_177_196 - s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 + s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 - s_177_196 <=s (const 64 (2**20)),
    u_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_177_196 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step196

// premise a
assume
neg_g_177_low60_0_low20_19 = 0 (mod 2)
&&
neg_g_177_low60_0_low20_19 = const 64 0 (mod (const 64 2))
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

mov neg_f_177_low60_0_low20_20 neg_f_177_low60_0_low20_19;
mov u_177_197 u_177_196;
mov v_177_197 v_177_196;

asr neg_g_177_low60_0_low20_20 neg_g_177_low60_0_low20_19 1;
asr r_177_197 r_177_196 1;
asr s_177_197 s_177_196 1;
assert
    true
&&
    neg_f_177_low60_0_low20_20 = neg_f_177_low60_0_low20_19,
    u_177_197 = u_177_196,
    v_177_197 = v_177_196,
    neg_g_177_low60_0_low20_20 * (const 64 2) = neg_g_177_low60_0_low20_19,
    r_177_197 * (const 64 2) = r_177_196,
    s_177_197 * (const 64 2) = s_177_196
;

assume
    neg_f_177_low60_0_low20_20 = neg_f_177_low60_0_low20_19,
    u_177_197 = u_177_196,
    v_177_197 = v_177_196,
    neg_g_177_low60_0_low20_20 * 2 = neg_g_177_low60_0_low20_19,
    r_177_197 * 2 = r_177_196,
    s_177_197 * 2 = s_177_196
&&
    true
;

{
    u_177_197 * neg_f_177_low60_0_low20_0 + v_177_197 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_197 * neg_f_177_low60_0_low20_0 + s_177_197 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_20 + u_177_197 * (const 64 (2**21)) + v_177_197 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_20 + r_177_197 * (const 64 (2**21)) + s_177_197 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_20,
    neg_f_177_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_20,
    neg_g_177_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 197)) <=s delta, delta <=s (const 64 (1 + 2*197)),
    (const 64 (-(2**20))) <=s u_177_197, u_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_197, v_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_197, r_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_197, s_177_197 <=s (const 64 ((2**20))),
    u_177_197 + v_177_197 <=s (const 64 (2**20)),
    u_177_197 - v_177_197 <=s (const 64 (2**20)),
    (const 64 0) - u_177_197 + v_177_197 <=s (const 64 (2**20)),
    (const 64 0) - u_177_197 - v_177_197 <=s (const 64 (2**20)),
    r_177_197 + s_177_197 <=s (const 64 (2**20)),
    r_177_197 - s_177_197 <=s (const 64 (2**20)),
    (const 64 0) - r_177_197 + s_177_197 <=s (const 64 (2**20)),
    (const 64 0) - r_177_197 - s_177_197 <=s (const 64 (2**20)),
    u_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_177_197 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_196_b (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_19,
sint64 neg_g_177_low60_0_low20_19,
sint64 neg_f_177_low60_0_low20_20,
sint64 neg_g_177_low60_0_low20_20,
sint64 u_177_196,
sint64 v_177_196,
sint64 r_177_196,
sint64 s_177_196,
sint64 u_177_197,
sint64 v_177_197,
sint64 r_177_197,
sint64 s_177_197,
bit ne
)={
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (-(2**20)),
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (-(2**20))
&&
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (const 64 (-(2**20))),
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_19 + u_177_196 * (const 64 (2**21)) + v_177_196 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_19 + r_177_196 * (const 64 (2**21)) + s_177_196 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_19,
    neg_f_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_19,
    neg_g_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 196)) <=s delta, delta <=s (const 64 (1 + 2*196)),
    (const 64 (-(2**20))) <=s u_177_196, u_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_196, v_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_196, r_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_196, s_177_196 <=s (const 64 ((2**20))),
    u_177_196 + v_177_196 <=s (const 64 (2**20)),
    u_177_196 - v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 + v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 - v_177_196 <=s (const 64 (2**20)),
    r_177_196 + s_177_196 <=s (const 64 (2**20)),
    r_177_196 - s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 + s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 - s_177_196 <=s (const 64 (2**20)),
    u_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_177_196 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step196

// premise b
assume
neg_g_177_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_20 neg_f_177_low60_0_low20_19;
mov u_177_197 u_177_196;
mov v_177_197 v_177_196;

add neg_g_177_low60_0_low20_20 neg_g_177_low60_0_low20_19 neg_f_177_low60_0_low20_19;
asr neg_g_177_low60_0_low20_20 neg_g_177_low60_0_low20_20 1;
add r_177_197 r_177_196 u_177_196;
asr r_177_197 r_177_197 1;
add s_177_197 s_177_196 v_177_196;
asr s_177_197 s_177_197 1;
assert
    true
&&
    neg_f_177_low60_0_low20_20 = neg_f_177_low60_0_low20_19,
    u_177_197 = u_177_196,
    v_177_197 = v_177_196,
    neg_g_177_low60_0_low20_20 * (const 64 2) = neg_g_177_low60_0_low20_19 + neg_f_177_low60_0_low20_19,
    r_177_197 * (const 64 2) = r_177_196 + u_177_196,
    s_177_197 * (const 64 2) = s_177_196 + v_177_196
;

assume
    neg_f_177_low60_0_low20_20 = neg_f_177_low60_0_low20_19,
    u_177_197 = u_177_196,
    v_177_197 = v_177_196,
    neg_g_177_low60_0_low20_20 * 2 = neg_g_177_low60_0_low20_19 + neg_f_177_low60_0_low20_19,
    r_177_197 * 2 = r_177_196 + u_177_196,
    s_177_197 * 2 = s_177_196 + v_177_196
&&
    true
;

{
    u_177_197 * neg_f_177_low60_0_low20_0 + v_177_197 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_197 * neg_f_177_low60_0_low20_0 + s_177_197 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_20 + u_177_197 * (const 64 (2**21)) + v_177_197 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_20 + r_177_197 * (const 64 (2**21)) + s_177_197 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_20,
    neg_f_177_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_20,
    neg_g_177_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 197)) <=s delta, delta <=s (const 64 (1 + 2*197)),
    (const 64 (-(2**20))) <=s u_177_197, u_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_197, v_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_197, r_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_197, s_177_197 <=s (const 64 ((2**20))),
    u_177_197 + v_177_197 <=s (const 64 (2**20)),
    u_177_197 - v_177_197 <=s (const 64 (2**20)),
    (const 64 0) - u_177_197 + v_177_197 <=s (const 64 (2**20)),
    (const 64 0) - u_177_197 - v_177_197 <=s (const 64 (2**20)),
    r_177_197 + s_177_197 <=s (const 64 (2**20)),
    r_177_197 - s_177_197 <=s (const 64 (2**20)),
    (const 64 0) - r_177_197 + s_177_197 <=s (const 64 (2**20)),
    (const 64 0) - r_177_197 - s_177_197 <=s (const 64 (2**20)),
    u_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_177_197 = (const 64 0) (mod (const 64 (2**(20-20))))
}

proc divstep_196_c (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 neg_f_177_low60_0_low20_0,
sint64 neg_g_177_low60_0_low20_0,
sint64 neg_f_177_low60_0_low20_19,
sint64 neg_g_177_low60_0_low20_19,
sint64 neg_f_177_low60_0_low20_20,
sint64 neg_g_177_low60_0_low20_20,
sint64 u_177_196,
sint64 v_177_196,
sint64 r_177_196,
sint64 s_177_196,
sint64 u_177_197,
sint64 v_177_197,
sint64 r_177_197,
sint64 s_177_197,
bit ne
)={
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (-(2**20)),
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (-(2**20))
&&
    u_177_196 * neg_f_177_low60_0_low20_0 + v_177_196 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_19 * (const 64 (-(2**20))),
    r_177_196 * neg_f_177_low60_0_low20_0 + s_177_196 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_19 * (const 64 (-(2**20))),
    fuv = neg_f_177_low60_0_low20_19 + u_177_196 * (const 64 (2**21)) + v_177_196 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_19 + r_177_196 * (const 64 (2**21)) + s_177_196 * (const 64 (2**42)),
    const 64 0 <=s neg_f_177_low60_0_low20_0,
    neg_f_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_0,
    neg_g_177_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_f_177_low60_0_low20_19,
    neg_f_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s neg_g_177_low60_0_low20_19,
    neg_g_177_low60_0_low20_19 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 196)) <=s delta, delta <=s (const 64 (1 + 2*196)),
    (const 64 (-(2**20))) <=s u_177_196, u_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_196, v_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_196, r_177_196 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_196, s_177_196 <=s (const 64 ((2**20))),
    u_177_196 + v_177_196 <=s (const 64 (2**20)),
    u_177_196 - v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 + v_177_196 <=s (const 64 (2**20)),
    (const 64 0) - u_177_196 - v_177_196 <=s (const 64 (2**20)),
    r_177_196 + s_177_196 <=s (const 64 (2**20)),
    r_177_196 - s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 + s_177_196 <=s (const 64 (2**20)),
    (const 64 0) - r_177_196 - s_177_196 <=s (const 64 (2**20)),
    u_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_177_196 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_177_196 = (const 64 0) (mod (const 64 (2**(20-19))))
}



// divsteps
// step196

// premise c
assume
neg_g_177_low60_0_low20_19 = 1 (mod 2)
&&
neg_g_177_low60_0_low20_19 = const 64 1 (mod (const 64 2)),
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

mov neg_f_177_low60_0_low20_20 neg_g_177_low60_0_low20_19;
mov u_177_197 r_177_196;
mov v_177_197 s_177_196;

subs dc neg_g_177_low60_0_low20_20 neg_g_177_low60_0_low20_19 neg_f_177_low60_0_low20_19;
asr neg_g_177_low60_0_low20_20 neg_g_177_low60_0_low20_20 1;
subs dc r_177_197 r_177_196 u_177_196;
asr r_177_197 r_177_197 1;
subs dc s_177_197 s_177_196 v_177_196;
asr s_177_197 s_177_197 1;
assert
    true
&&
    neg_f_177_low60_0_low20_20 = neg_g_177_low60_0_low20_19,
    u_177_197 = r_177_196,
    v_177_197 = s_177_196,
    neg_g_177_low60_0_low20_20 * (const 64 2) = neg_g_177_low60_0_low20_19 - neg_f_177_low60_0_low20_19,
    r_177_197 * (const 64 2) = r_177_196 - u_177_196,
    s_177_197 * (const 64 2) = s_177_196 - v_177_196
;

assume
    neg_f_177_low60_0_low20_20 = neg_g_177_low60_0_low20_19,
    u_177_197 = r_177_196,
    v_177_197 = s_177_196,
    neg_g_177_low60_0_low20_20 * 2 = neg_g_177_low60_0_low20_19 - neg_f_177_low60_0_low20_19,
    r_177_197 * 2 = r_177_196 - u_177_196,
    s_177_197 * 2 = s_177_196 - v_177_196
&&
    true
;

{
    u_177_197 * neg_f_177_low60_0_low20_0 + v_177_197 * neg_g_177_low60_0_low20_0 = neg_f_177_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3],
    r_177_197 * neg_f_177_low60_0_low20_0 + s_177_197 * neg_g_177_low60_0_low20_0 = neg_g_177_low60_0_low20_20 * (-(2**20)) prove with [algebra solver smt:z3]
&&
    fuv = neg_f_177_low60_0_low20_20 + u_177_197 * (const 64 (2**21)) + v_177_197 * (const 64 (2**42)),
    grs = neg_g_177_low60_0_low20_20 + r_177_197 * (const 64 (2**21)) + s_177_197 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_177_low60_0_low20_20,
    neg_f_177_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_177_low60_0_low20_20,
    neg_g_177_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 197)) <=s delta, delta <=s (const 64 (1 + 2*197)),
    (const 64 (-(2**20))) <=s u_177_197, u_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s v_177_197, v_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s r_177_197, r_177_197 <=s (const 64 ((2**20))),
    (const 64 (-(2**20))) <=s s_177_197, s_177_197 <=s (const 64 ((2**20))),
    u_177_197 + v_177_197 <=s (const 64 (2**20)),
    u_177_197 - v_177_197 <=s (const 64 (2**20)),
    (const 64 0) - u_177_197 + v_177_197 <=s (const 64 (2**20)),
    (const 64 0) - u_177_197 - v_177_197 <=s (const 64 (2**20)),
    r_177_197 + s_177_197 <=s (const 64 (2**20)),
    r_177_197 - s_177_197 <=s (const 64 (2**20)),
    (const 64 0) - r_177_197 + s_177_197 <=s (const 64 (2**20)),
    (const 64 0) - r_177_197 - s_177_197 <=s (const 64 (2**20)),
    u_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_177_197 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_177_197 = (const 64 0) (mod (const 64 (2**(20-20))))
}

