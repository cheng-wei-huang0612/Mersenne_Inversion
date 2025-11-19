
proc divstep_0 (
sint64 fuv,
sint64 grs,
sint64 delta,
sint64 f_0_low60_0_low20_0,
sint64 g_0_low60_0_low20_0,
sint64 f_0_low60_0_low20_1,
sint64 g_0_low60_0_low20_1,
sint64 f_0_low60_0_low20_2,
sint64 g_0_low60_0_low20_2,
sint64 u_0_0,
sint64 v_0_0,
sint64 r_0_0,
sint64 s_0_0,
sint64 u_0_1,
sint64 v_0_1,
sint64 r_0_1,
sint64 s_0_1,
sint64 u_0_2,
sint64 v_0_2,
sint64 r_0_2,
sint64 s_0_2,
bit ne_out
)={
    u_0_0 * f_0_low60_0_low20_0 + v_0_0 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
    r_0_0 * f_0_low60_0_low20_0 + s_0_0 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
    u_0_0 * f_0_low60_0_low20_0 + v_0_0 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (const 64 (-(2**20))),
    r_0_0 * f_0_low60_0_low20_0 + s_0_0 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (const 64 (-(2**20))),
    fuv = f_0_low60_0_low20_0 + u_0_0 * (const 64 (2**21)) + v_0_0 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_0 + r_0_0 * (const 64 (2**21)) + s_0_0 * (const 64 (2**42)),
    const 64 0 <=s f_0_low60_0_low20_0,
    f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    const 64 0 <=s g_0_low60_0_low20_0,
    g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1),
    u_0_0 = (const 64 (-(2**20))),
    v_0_0 = (const 64 (0)),
    r_0_0 = (const 64 (0)),
    s_0_0 = (const 64 (-(2**20)))
}



mov x7 fuv;
mov x8 grs;
mov x3 delta;

// divsteps
// step0



    // perform the same divstep on {f|g}_0_low60_0_low20_{0 to 1}
    // and {u|v|r|s}_0_{0 to 1}
    mov f_0_low60_0_low20_1 f_0_low60_0_low20_0;
    mov u_0_1 u_0_0;
    mov v_0_1 v_0_0;
    mov g_0_low60_0_low20_1 g_0_low60_0_low20_0;
    mov r_0_1 r_0_0;
    mov s_0_1 s_0_0;

(* tst	x8, #0x1                                    #! PC = 0xaaaaca660fa8 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;

    cmov tmp0 ne f_0_low60_0_low20_1 0@sint64;
    cmov tmp1 ne u_0_1 0@sint64;
    cmov tmp2 ne v_0_1 0@sint64;

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

    subs dc tmp0_neg 0@sint64 tmp0;
    subs dc tmp1_neg 0@sint64 tmp1;
    subs dc tmp2_neg 0@sint64 tmp2;
    cmov tmp0 ge tmp0_neg tmp0;
    cmov tmp1 ge tmp1_neg tmp1;
    cmov tmp2 ge tmp2_neg tmp2;

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;

    cmov f_0_low60_0_low20_1 ge g_0_low60_0_low20_1 f_0_low60_0_low20_1;
    cmov u_0_1 ge r_0_1 u_0_1;
    cmov v_0_1 ge s_0_1 v_0_1;

(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
adds dc x8 x8 x10;

    adds dc g_0_low60_0_low20_1 g_0_low60_0_low20_1 tmp0;
    adds dc r_0_1 r_0_1 tmp1;
    adds dc s_0_1 s_0_1 tmp2;

(* add	x3, x3, #0x2                                #! PC = 0xaaaaca660fc4 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca660fc8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca660fcc *)
split x8 dc x8 1;

    split g_0_low60_0_low20_1 dc g_0_low60_0_low20_1 1;
    split r_0_1 dc r_0_1 1;
    split s_0_1 dc s_0_1 1;

assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta,

        f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
        u_0_1 = u_0_0,
        v_0_1 = v_0_0,
        g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0,
        r_0_1 * (const 64 2) = r_0_0,
        s_0_1 * (const 64 2) = s_0_0
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta,

        f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
        u_0_1 = u_0_0,
        v_0_1 = v_0_0,
        g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0 + f_0_low60_0_low20_0,
        r_0_1 * (const 64 2) = r_0_0 + u_0_0,
        s_0_1 * (const 64 2) = s_0_0 + v_0_0
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta,

        f_0_low60_0_low20_1 = g_0_low60_0_low20_0,
        u_0_1 = r_0_0,
        v_0_1 = s_0_0,
        g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0 - f_0_low60_0_low20_0,
        r_0_1 * (const 64 2) = r_0_0 - u_0_0,
        s_0_1 * (const 64 2) = s_0_0 - v_0_0
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;
mov ne_out ne;
cut
    true
&&
    u_0_1 * f_0_low60_0_low20_0 + v_0_1 * g_0_low60_0_low20_0 = f_0_low60_0_low20_1 * (const 64 (-(2**20))),
    r_0_1 * f_0_low60_0_low20_0 + s_0_1 * g_0_low60_0_low20_0 = g_0_low60_0_low20_1 * (const 64 (-(2**20))),
    fuv = f_0_low60_0_low20_1 + u_0_1 * (const 64 (2**21)) + v_0_1 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_1 + r_0_1 * (const 64 (2**21)) + s_0_1 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_1,
    f_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_1,
    g_0_low60_0_low20_1 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne_out 63) (mod (const 64 2)),
    (const 64 (1 + (-2) * 1)) <=s delta, delta <=s (const 64 (1 + 2*1)),
    (const 64 (-(2**20))) <=s u_0_1, u_0_1 <=s (const 64 (2**19)),
    (const 64 (-(2**20))) <=s v_0_1, v_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)))),
    (const 64 ((2**(20 - 1) -(2**20)))) <=s r_0_1, r_0_1 <=s (const 64 (2**19)),
    (const 64 ((2**(20 - 1) -(2**20)))) <=s s_0_1, s_0_1 <=s (const 64 ((2**19) - (2**(20 - 1)) )),
    (const 64 ((2**(20 - 1) -(2**19)))) <=s (r_0_1 - u_0_1), (r_0_1 - u_0_1) <=s (const 64 ((2**20))),
    (const 64 ( -(2**19))) <=s (s_0_1 - v_0_1), (s_0_1 - v_0_1) <=s (const 64 ((2**20) - (2**(20 - 1)) ))
;



mov x7 fuv;
mov x8 grs;
mov x3 delta;

// divsteps
// step1



    // perform the same divstep on {f|g}_0_low60_0_low20_{1 to 2}
    // and {u|v|r|s}_0_{1 to 2}
    mov f_0_low60_0_low20_1 f_0_low60_0_low20_0;
    mov u_0_1 u_0_0;
    mov v_0_1 v_0_0;
    mov g_0_low60_0_low20_1 g_0_low60_0_low20_0;
    mov r_0_1 r_0_0;
    mov s_0_1 s_0_0;

(* tst	x8, #0x1                                    #! PC = 0xaaaaca660fa8 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;

    cmov tmp0 ne f_0_low60_0_low20_1 0@sint64;
    cmov tmp1 ne u_0_1 0@sint64;
    cmov tmp2 ne v_0_1 0@sint64;

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

    subs dc tmp0_neg 0@sint64 tmp0;
    subs dc tmp1_neg 0@sint64 tmp1;
    subs dc tmp2_neg 0@sint64 tmp2;
    cmov tmp0 ge tmp0_neg tmp0;
    cmov tmp1 ge tmp1_neg tmp1;
    cmov tmp2 ge tmp2_neg tmp2;

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;

    cmov f_0_low60_0_low20_1 ge g_0_low60_0_low20_1 f_0_low60_0_low20_1;
    cmov u_0_1 ge r_0_1 u_0_1;
    cmov v_0_1 ge s_0_1 v_0_1;

(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
adds dc x8 x8 x10;

    adds dc g_0_low60_0_low20_1 g_0_low60_0_low20_1 tmp0;
    adds dc r_0_1 r_0_1 tmp1;
    adds dc s_0_1 s_0_1 tmp2;

(* add	x3, x3, #0x2                                #! PC = 0xaaaaca660fc4 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca660fc8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca660fcc *)
split x8 dc x8 1;

    split g_0_low60_0_low20_1 dc g_0_low60_0_low20_1 1;
    split r_0_1 dc r_0_1 1;
    split s_0_1 dc s_0_1 1;

assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta,

        f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
        u_0_1 = u_0_0,
        v_0_1 = v_0_0,
        g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0,
        r_0_1 * (const 64 2) = r_0_0,
        s_0_1 * (const 64 2) = s_0_0
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta,

        f_0_low60_0_low20_1 = f_0_low60_0_low20_0,
        u_0_1 = u_0_0,
        v_0_1 = v_0_0,
        g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0 + f_0_low60_0_low20_0,
        r_0_1 * (const 64 2) = r_0_0 + u_0_0,
        s_0_1 * (const 64 2) = s_0_0 + v_0_0
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta,

        f_0_low60_0_low20_1 = g_0_low60_0_low20_0,
        u_0_1 = r_0_0,
        v_0_1 = s_0_0,
        g_0_low60_0_low20_1 * (const 64 2) = g_0_low60_0_low20_0 - f_0_low60_0_low20_0,
        r_0_1 * (const 64 2) = r_0_0 - u_0_0,
        s_0_1 * (const 64 2) = s_0_0 - v_0_0
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;
mov ne_out ne;

