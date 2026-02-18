
proc divstep_ver_a(fuv@sint64, grs@sint64, delta@sint64, delta_range@sint64;
                   fuv_out@sint64, grs_out@sint64, delta_out@sint64, ne_out@bit, delta_range_out@sint64) = {
    true && 
    fuv = (const 64 1) (mod (const 64 2)),
    (const 64 (-1400)) <=s delta_range, delta_range <=s (const 64 1400),
    ((const 64 0)-delta_range) <=s delta, delta <=s delta_range
}

mov x8 grs;
mov x7 fuv;
mov x3 delta;


(* tst	x8, #0x1 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;

(* csel	x10, x7, xzr, ne *)
cmov x10 ne x7 0@sint64;

(* ccmp	x3, xzr, #0x8, ne *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;

(* cneg	x3, x3, ge *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;;

(* cneg	x10, x10, ge *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;;

(* csel	x7, x8, x7, ge *)
cmov x7 ge x8 x7;

(* add	x8, x8, x10 *)
adds dc x8 x8 x10;

(* add	x3, x3, #0x2 *)
add x3 x3 0x2@sint64;

(* tst	x8, #0x2 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;

(* asr	x8, x8, #1 *)
ssplit x8 dcL x8 1;

assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
mov ne_out ne;
add delta_range_out delta_range 2@sint64;

{true &&
    fuv_out = (const 64 1) (mod (const 64 2)),
    grs_out = (uext ne_out 63) (mod (const 64 2)),
    (const 64 0) -delta_range_out <=s delta_out, delta_out <=s delta_range_out,
    delta_range_out = delta_range + (const 64 2)
}


proc divstep_ver_b(fuv@sint64, grs@sint64, delta@sint64, ne@bit, delta_range@sint64;
                   fuv_out@sint64, grs_out@sint64, delta_out@sint64, ne_out@bit, delta_range_out@sint64) = {
    true && 
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    ((const 64 0)-delta_range) <=s delta, delta <=s delta_range,
    (const 64 (-1400)) <=s delta_range, delta_range <=s (const 64 1400)
}

mov x8 grs;
mov x7 fuv;
mov x3 delta;

(* csel	x10, x7, xzr, ne *)
cmov x10 ne x7 0@sint64;	// ne = any;

(* ccmp	x3, xzr, #0x8, ne *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;

(* cneg	x3, x3, ge *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;

(* cneg	x10, x10, ge *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;

(* csel	x7, x8, x7, ge *)
cmov x7 ge x8 x7;	// ge = tcont;

(* add	x8, x8, x10 *)
adds dc x8 x8 x10;

(* add	x3, x3, #0x2 *)
add x3 x3 0x2@sint64;

(* tst	x8, #0x2 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;

(* asr	x8, x8, #1 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
mov ne_out ne;
add delta_range_out delta_range 2@sint64;


{true &&
    fuv_out = (const 64 1) (mod (const 64 2)),
    grs_out = (uext ne_out 63) (mod (const 64 2)),
    (const 64 0) -delta_range_out <=s delta_out, delta_out <=s delta_range_out,
    delta_range_out = delta_range + (const 64 2)
}


proc divstep_ver_c(fuv@sint64, grs@sint64, delta@sint64, ne@bit, delta_range@sint64;
                   fuv_out@sint64, grs_out@sint64, delta_out@sint64, delta_range_out@sint64) = {
    true && 
    fuv = (const 64 1) (mod (const 64 2)),
    grs = (uext ne 63) (mod (const 64 2)),
    ((const 64 0)-delta_range) <=s delta, delta <=s delta_range,
    (const 64 (-1400)) <=s delta_range, delta_range <=s (const 64 1400)
}

mov x8 grs;
mov x7 fuv;
mov x3 delta;

(* csel	x10, x7, xzr, ne *)
cmov x10 ne x7 0@sint64;	// ne = any;

(* ccmp	x3, xzr, #0x8, ne *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;

(* cneg	x3, x3, ge *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;

(* cneg	x10, x10, ge *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;

(* csel	x7, x8, x7, ge *)
cmov x7 ge x8 x7;	// ge = tcont;

(* add	x8, x8, x10 *)
adds dc x8 x8 x10;

(* add	x3, x3, #0x2 *)
add x3 x3 0x2@sint64;

(* asr	x8, x8, #1 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
add delta_range_out delta_range 2@sint64;


{true &&
    fuv_out = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range_out <=s delta_out, delta_out <=s delta_range_out,
    delta_range_out = delta_range + (const 64 2)
}


proc extraction (
    fuv@sint64, grs@sint64,
    f_xxx_20@sint64, g_xxx_20@sint64,
    u@sint64, r@sint64,
    v@sint64, s@sint64,
    const_2p41a2p20@sint64;
    u_out@sint64, r_out@sint64,
    v_out@sint64, s_out@sint64

)
= {
    true
&&
    fuv = f_xxx_20 + u * (const 64 (2**21)) + v * (const 64 (2**42)),
    grs = g_xxx_20 + r * (const 64 (2**21)) + s * (const 64 (2**42)),

    (const 64 (-(2**20)+1)) <=s f_xxx_20,
    f_xxx_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_xxx_20,
    g_xxx_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1)),

    const_2p41a2p20 = (const 64 (2**20 + 2**41))
}

mov x6 const_2p41a2p20;
mov x7 fuv;
mov x8 grs;


(* add	x12, x7, x6                                 #! PC = 0xaaaaafca0c08 *)
add x12 x7 x6;

(* asr	x12, x12, #42                               #! PC = 0xaaaaafca0c0c *)
cast x12@sint64 x12;
split x12 dc x12 42;

(* add	x11, x7, #0x100, lsl #12                    #! PC = 0xaaaaafca0c10 *)
add x11 x7 (2**20)@sint64;

(* lsl	x11, x11, #22                               #! PC = 0xaaaaafca0c14 *)
split dcH x11 x11 (64-22); shl x11 x11 22;

(* asr	x11, x11, #43                               #! PC = 0xaaaaafca0c18 *)
cast x11@sint64 x11;
split x11 dc x11 43;

(* add	x14, x8, x6                                 #! PC = 0xaaaaafca0c1c *)
add x14 x8 x6;

(* asr	x14, x14, #42                               #! PC = 0xaaaaafca0c20 *)
cast x14@sint64 x14;
split x14 dc x14 42;

(* add	x13, x8, #0x100, lsl #12                    #! PC = 0xaaaaafca0c24 *)
add x13 x8 (2**20)@sint64;

(* lsl	x13, x13, #22                               #! PC = 0xaaaaafca0c28 *)
split dcH x13 x13 (64-22); shl x13 x13 22;

(* asr	x13, x13, #43                               #! PC = 0xaaaaafca0c2c *)
cast x13@sint64 x13;
split x13 dc x13 43;


mov u_out x11;
mov v_out x12;
mov r_out x13;
mov s_out x14;


assert true && u_out = u;
assert true && v_out = v;
assert true && r_out = r;
assert true && s_out = s;
assume u_out = u && u_out = u;
assume v_out = v && v_out = v;
assume r_out = r && r_out = r;
assume s_out = s && s_out = s;


{
    u_out = u,
    v_out = v,
    r_out = r,
    s_out = s
    &&
    u_out = u,
    v_out = v,
    r_out = r,
    s_out = s
}


proc update_fg_1 (
f@sint64, g@sint64,
u@sint64, r@sint64,
v@sint64, s@sint64,
f_updated@sint64, g_updated@sint64;
f_out@sint64, g_out@sint64
)
=
{
    u * f + v * g = f_updated * (-(2**20)),
    r * f + s * g = g_updated * (-(2**20))
    &&
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1))
}

mov x11 u;
mov x12 v;
mov x13 r;
mov x14 s;
mov x1 f;
mov x2 g;


(* mul	x9, x11, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x11 x1;
(* madd	x9, x12, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x12;
adds dc x9 x9 tmp;

assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * f_updated (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * f_updated;

(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;
(* mul	x10, x13, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x13 x1;
(* madd	x10, x14, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x14;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * g_updated (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * g_updated;

(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;
(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;



assert true && x1 = (const 64 (-1)) * f_updated (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_updated (mod (const 64 (2**44)));
mov f_out x1;
mov g_out x2;



{true &&
    f_out = (const 64 (-1)) * f_updated (mod (const 64 (2**44))),
    g_out = (const 64 (-1)) * g_updated (mod (const 64 (2**44)))
}


proc update_fg_2 (
f@sint64, g@sint64,
u@sint64, r@sint64,
v@sint64, s@sint64,
f_updated@sint64, g_updated@sint64;
f_out@sint64, g_out@sint64
)
=
{
    u * f + v * g = f_updated * (-(2**20)),
    r * f + s * g = g_updated * (-(2**20))
    &&
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1))
}

mov x15 u;
mov x16 v;
mov x17 r;
mov x20 s;
mov x1 f;
mov x2 g;


(* mul	x9, x15, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x15 x1;
(* madd	x9, x16, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x16;
adds dc x9 x9 tmp;

assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * f_updated (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * f_updated;

(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;
(* mul	x10, x17, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x17 x1;
(* madd	x10, x20, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x20;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * g_updated (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * g_updated;


(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;
(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;




assert true && x1 = (const 64 (-1)) * f_updated (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_updated (mod (const 64 (2**44)));
mov f_out x1;
mov g_out x2;



{true && 
    f_out = (const 64 (-1)) * f_updated (mod (const 64 (2**44))),
    g_out = (const 64 (-1)) * g_updated (mod (const 64 (2**44)))
}



proc update_uuvvrrss (
    u_0_20@sint64,
    v_0_20@sint64,
    r_0_20@sint64,
    s_0_20@sint64,
    u_20_40@sint64,
    v_20_40@sint64,
    r_20_40@sint64,
    s_20_40@sint64;
    u_0_40@sint64,
    v_0_40@sint64,
    r_0_40@sint64,
    s_0_40@sint64
) = 
{
  true
        &&

(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20) - 1)),
u_20_40 + v_20_40 <=s (const 64 (2**20)),
u_20_40 - v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
r_20_40 + s_20_40 <=s (const 64 (2**20)),
r_20_40 - s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
u_0_20 + v_0_20 <=s (const 64 (2**20)),
u_0_20 - v_0_20 <=s (const 64 (2**20)),
(const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
(const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
r_0_20 + s_0_20 <=s (const 64 (2**20)),
r_0_20 - s_0_20 <=s (const 64 (2**20)),
(const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
(const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))
}




mov x11 u_0_20;
mov x12 v_0_20;
mov x13 r_0_20;
mov x14 s_0_20;
mov x15 u_20_40;
mov x16 v_20_40;
mov x17 r_20_40;
mov x20 s_20_40;



// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
smul x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
smul tmp x13 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
smul x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
smul tmp x13 x20;
sadd x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
smul x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
smul tmp x14 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
smul x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
smul tmp x14 x20;
sadd x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;

mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;


assert
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
    && true
;

assert true &&
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
;

// By theorem from matrix norm, we have
assume true &&
u_0_40 + v_0_40 <=s (const 64 (2**40)),
u_0_40 - v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
r_0_40 + s_0_40 <=s (const 64 (2**40)),
r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1));

{
u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
    &&
u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40,
u_0_40 + v_0_40 <=s (const 64 (2**40)),
u_0_40 - v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
r_0_40 + s_0_40 <=s (const 64 (2**40)),
r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1))
}


proc update_uuvvrrss_2 (
    u_0_40@sint64,
    v_0_40@sint64,
    r_0_40@sint64,
    s_0_40@sint64,
    u_40_59@sint64,
    v_40_59@sint64,
    r_40_59@sint64,
    s_40_59@sint64;
    u_0_59@sint64,
    v_0_59@sint64,
    r_0_59@sint64,
    s_0_59@sint64
) = 
{
  true
        &&

    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1)),

    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20) - 1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40))

}




mov x11 u_0_40;
mov x12 v_0_40;
mov x13 r_0_40;
mov x14 s_0_40;
mov x15 u_40_59;
mov x16 v_40_59;
mov x17 r_40_59;
mov x20 s_40_59;



// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
smul x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
smul tmp x13 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
smul x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
smul tmp x13 x20;
sadd x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
smul x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
smul tmp x14 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
smul x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
smul tmp x14 x20;
sadd x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;

mov u_0_59 x11;
mov v_0_59 x12;
mov r_0_59 x13;
mov s_0_59 x14;


assert
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    && true
;

assert true &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
;

// By theorem from matrix norm, we have
assume true &&
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1));

{
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59,
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1))
}

proc prepare_vec_uuvvrrss (
u@sint64, v@sint64, r@sint64, s@sint64,
%vec_4x_2p30m1@sint32[4];
%vec_uu0_rr0_vv0_ss0@sint32[4], %vec_uu1_rr1_vv1_ss1@sint32[4])
= {true &&
%vec_4x_2p30m1 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32],
(const 64 (-(2**60))) <=s u, u <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v, v <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r, r <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s, s <=s (const 64 ((2**60) - 1))
}

mov x11 u;
mov x12 v;
mov x13 r;
mov x14 s;
nondet %v16@sint64[2];
nondet %v17@sint64[2];
mov %v2 %vec_4x_2p30m1;

(* mov	v16.d[0], x11                               #! PC = 0xaaaabe371960 *)
mov %v16 [x11, %v16[1]];

(* mov	v16.d[1], x13                               #! PC = 0xaaaabe371964 *)
mov %v16 [%v16[0], x13];

(* mov	v17.d[0], x12                               #! PC = 0xaaaabe371968 *)
mov %v17 [x12, %v17[1]];

(* mov	v17.d[1], x14                               #! PC = 0xaaaabe37196c *)
mov %v17 [%v17[0], x14];

(* uzp1	v13.4s, v16.4s, v17.4s                     #! PC = 0xaaaabe371970 *)
cast %v16@sint32[4] %v16;
cast %v17@sint32[4] %v17;
mov %v13 [%v16[0], %v16[2], %v17[0], %v17[2]];

(* and	v13.16b, v13.16b, v2.16b                    #! PC = 0xaaaabe371974 *)
and %v13@sint32[4] %v13 %v2;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371978 *)
cast %v16@sint64[2] %v16;
split %v16 %dc %v16 30;

(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37197c *)
cast %v17@sint64[2] %v17;
split %v17 %dc %v17 30;

(* uzp1	v14.4s, v16.4s, v17.4s                     #! PC = 0xaaaabe371980 *)
cast %v16@sint32[4] %v16;
cast %v17@sint32[4] %v17;
mov %v14 [%v16[0], %v16[2], %v17[0], %v17[2]];

mov %vec_uu0_rr0_vv0_ss0 %v13;
mov %vec_uu1_rr1_vv1_ss1 %v14;

{true &&
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]]) 2 = u,
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]]) 2 = r,
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]]) 2 = v,
    sext (slimbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]]) 2 = s
}


proc main(op_x0@uint64, op_x1@uint64, op_x2@uint64, op_x3@uint64)
= {true && true}

nondet x19@uint64;
nondet x20@uint64;
nondet x21@uint64;
nondet x22@uint64;
nondet x23@uint64;
nondet x24@uint64;
nondet x25@uint64;
nondet x26@uint64;
nondet x27@uint64;
nondet x28@uint64;
nondet x29@uint64;
nondet x30@uint64;
nondet sp@uint64;
nondet %v8@uint64[2];
nondet %v9@uint64[2];
nondet %v10@uint64[2];
nondet %v11@uint64[2];
nondet %v12@uint64[2];
nondet %v13@uint64[2];
nondet %v14@uint64[2];
nondet %v15@uint64[2];



nondet %v3@sint32[4];
nondet %v5@sint32[4];
nondet %v6@sint32[4];




mov L0xffffc68e1808 op_x0;
mov L0xffffc68e1810 op_x1;
mov L0xffffc68e1818 op_x2;
mov L0xffffc68e1820 op_x3;

(* #! -> SP = 0xffffc68e17c0 *)
#! 0xffffc68e17c0 = 0xffffc68e17c0;

(* stp	x29, x30, [sp, #-16]!                       #! EA = L0xffffc68e17b0; PC = 0xaaaabe370e88 *)
mov L0xffffc68e17b0 x29; mov L0xffffc68e17b8 x30;

(* mov	x29, sp                                     #! PC = 0xaaaabe370e8c *)
mov x29 sp;

(* stp	x19, x20, [sp, #-16]!                       #! EA = L0xffffc68e17a0; PC = 0xaaaabe370e90 *)
mov L0xffffc68e17a0 x19; mov L0xffffc68e17a8 x20;

(* stp	x21, x22, [sp, #-16]!                       #! EA = L0xffffc68e1790; PC = 0xaaaabe370e94 *)
mov L0xffffc68e1790 x21; mov L0xffffc68e1798 x22;

(* stp	x23, x24, [sp, #-16]!                       #! EA = L0xffffc68e1780; PC = 0xaaaabe370e98 *)
mov L0xffffc68e1780 x23; mov L0xffffc68e1788 x24;

(* stp	x25, x26, [sp, #-16]!                       #! EA = L0xffffc68e1770; PC = 0xaaaabe370e9c *)
mov L0xffffc68e1770 x25; mov L0xffffc68e1778 x26;

(* stp	x27, x28, [sp, #-16]!                       #! EA = L0xffffc68e1760; PC = 0xaaaabe370ea0 *)
mov L0xffffc68e1760 x27; mov L0xffffc68e1768 x28;

(* stp	q8, q9, [sp, #-32]!                         #! EA = L0xffffc68e1740; PC = 0xaaaabe370ea4 *)
mov [L0xffffc68e1740, L0xffffc68e1748] %v8;
mov [L0xffffc68e1750, L0xffffc68e1758] %v9;

(* stp	q10, q11, [sp, #-32]!                       #! EA = L0xffffc68e1720; PC = 0xaaaabe370ea8 *)
mov [L0xffffc68e1720, L0xffffc68e1728] %v10;
mov [L0xffffc68e1730, L0xffffc68e1738] %v11;

(* stp	q12, q13, [sp, #-32]!                       #! EA = L0xffffc68e1700; PC = 0xaaaabe370eac *)
mov [L0xffffc68e1700, L0xffffc68e1708] %v12;
mov [L0xffffc68e1710, L0xffffc68e1718] %v13;

(* stp	q14, q15, [sp, #-32]!                       #! EA = L0xffffc68e16e0; PC = 0xaaaabe370eb0 *)
mov [L0xffffc68e16e0, L0xffffc68e16e8] %v14;
mov [L0xffffc68e16f0, L0xffffc68e16f8] %v15;

(* ldp	x5, x22, [x1]                               #! EA = L0xffffc68e1808; Value = 0x0000000000000000; PC = 0xaaaabe370eb4 *)
mov x5 L0xffffc68e1808; mov x22 L0xffffc68e1810;

(* ldp	x4, x21, [x1, #16]                          #! EA = L0xffffc68e1818; Value = 0x0000000000000000; PC = 0xaaaabe370eb8 *)
mov x4 L0xffffc68e1818; mov x21 L0xffffc68e1820;


    ghost x5_old@uint64, x22_old@uint64, x4_old@uint64, x21_old@uint64:
    and [x5_old = x5, x22_old = x22, x4_old = x4, x21_old = x21]
    &&
    and [x5_old = x5, x22_old = x22, x4_old = x4, x21_old = x21]
    ;

(* mov	x2, #0x13                  	// #19          #! PC = 0xaaaabe370ebc *)
mov x2 0x13@uint64;

(* lsr	x3, x21, #63                                #! PC = 0xaaaabe370ec0 *)
split x3 dcL x21 63;

(* madd	x3, x2, x3, x2                             #! PC = 0xaaaabe370ec4 *)
mull dcH mul_tmp x2 x3;
adds dc x3 mul_tmp x2;

(* adds	x5, x5, x3                                 #! PC = 0xaaaabe370ec8 *)
adds carry x5 x5 x3;

(* adcs	x22, x22, xzr                              #! PC = 0xaaaabe370ecc *)
adcs carry x22 x22 0@uint64 carry;

(* adcs	x4, x4, xzr                                #! PC = 0xaaaabe370ed0 *)
adcs carry x4 x4 0@uint64 carry;

(* orr	x21, x21, #0x8000000000000000               #! PC = 0xaaaabe370ed4 *)
or x21@uint64 x21 0x8000000000000000@uint64;

(* adcs	x21, x21, xzr                              #! PC = 0xaaaabe370ed8 *)
adcs carry x21 x21 0@uint64 carry;

(* csel	x3, x2, xzr, cc	// cc = lo, ul, last       #! PC = 0xaaaabe370edc *)
cmov x3 carry 0@uint64 x2;

(* subs	x5, x5, x3                                 #! PC = 0xaaaabe370ee0 *)
subc carry x5 x5 x3;

(* sbcs	x22, x22, xzr                              #! PC = 0xaaaabe370ee4 *)
sbcs carry x22 x22 0@uint64 carry;

(* sbcs	x4, x4, xzr                                #! PC = 0xaaaabe370ee8 *)
sbcs carry x4 x4 0@uint64 carry;

(* sbc	x21, x21, xzr                               #! PC = 0xaaaabe370eec *)
sbc x21 x21 0@uint64 carry;

(* and	x21, x21, #0x7fffffffffffffff               #! PC = 0xaaaabe370ef0 *)
and x21@uint64 x21 0x7fffffffffffffff@uint64;


    // so far x5 x22 x4 x21 should be normalize to mod 25519
    assert
    true &&
    ulimbs 64 [x5_old, x22_old, x4_old, x21_old] = 
    ulimbs 64 [x5, x22, x4, x21]
    (mod (const 256 ((2**255) - 19))),
    slimbs 64 [x5, x22, x4, x21] >=s (const 256 0),
    slimbs 64 [x5, x22, x4, x21] <=s (const 256 ((2**255) - 19))
    ;



cast %v5@uint64[2] %v5;
cast %v6@uint64[2] %v6;

(* mov	v5.d[0], x5                                 #! PC = 0xaaaabe370ef4 *)
mov %v5 [x5, %v5[1]];

(* mov	v5.d[1], x22                                #! PC = 0xaaaabe370ef8 *)
mov %v5 [%v5[0], x22];

(* mov	v6.d[0], x4                                 #! PC = 0xaaaabe370efc *)
mov %v6 [x4, %v6[1]];

(* mov	v6.d[1], x21                                #! PC = 0xaaaabe370f00 *)
mov %v6 [%v6[0], x21];

(* movi	v4.2d, #0xffffffffffffffff                 #! PC = 0xaaaabe370f04 *)
broadcast %v4 2 [0xffffffffffffffff@uint64];

(* mov	x2, #0xffffffffffffffff    	// #-1          #! PC = 0xaaaabe370f08 *)
mov x2 0xffffffffffffffff@uint64;

(* lsr	x2, x2, #1                                  #! PC = 0xaaaabe370f0c *)
split x2 dcL x2 1;


cast %v3@uint64[2] %v3;

(* mov	v3.d[1], x2                                 #! PC = 0xaaaabe370f10 *)
mov %v3 [%v3[0], x2];

(* mov	x2, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaabe370f14 *)
mov x2 0xffffffffffffffed@uint64;

(* mov	v3.d[0], x2                                 #! PC = 0xaaaabe370f18 *)
mov %v3 [x2, %v3[1]];

(* zip1	v8.2d, v3.2d, v5.2d                        #! PC = 0xaaaabe370f1c *)
mov %v8 [%v3[0], %v5[0]];

(* zip2	v9.2d, v4.2d, v5.2d                        #! PC = 0xaaaabe370f20 *)
mov %v9 [%v4[1], %v5[1]];

(* zip1	v10.2d, v4.2d, v6.2d                       #! PC = 0xaaaabe370f24 *)
mov %v10 [%v4[0], %v6[0]];

(* zip2	v11.2d, v3.2d, v6.2d                       #! PC = 0xaaaabe370f28 *)
mov %v11 [%v3[1], %v6[1]];

(* ushr	v1.2d, v4.2d, #34                          #! PC = 0xaaaabe370f2c *)
shrs %v1 %dc %v4 [34, 34];

(* and	v3.16b, v8.16b, v1.16b                      #! PC = 0xaaaabe370f30 *)
and %v3@uint64[2] %v8 %v1;

(* ushr	v12.2d, v8.2d, #30                         #! PC = 0xaaaabe370f34 *)
shrs %v12 %dc %v8 [30, 30];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f38 *)
and %v12@uint64[2] %v12 %v1;

(* sli	v3.2d, v12.2d, #32                          #! PC = 0xaaaabe370f3c *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v3 %v3 32; or %v3@uint64[2] %slih %v3;

(* ushr	v4.2d, v8.2d, #60                          #! PC = 0xaaaabe370f40 *)
shrs %v4 %dc %v8 [60, 60];

(* shl	v12.2d, v9.2d, #4                           #! PC = 0xaaaabe370f44 *)
shls %dc %v12 %v9 [4, 4];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f48 *)
and %v12@uint64[2] %v12 %v1;

(* orr	v4.16b, v4.16b, v12.16b                     #! PC = 0xaaaabe370f4c *)
or %v4@uint64[2] %v4 %v12;

(* ushr	v12.2d, v9.2d, #26                         #! PC = 0xaaaabe370f50 *)
shrs %v12 %dc %v9 [26, 26];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f54 *)
and %v12@uint64[2] %v12 %v1;

(* sli	v4.2d, v12.2d, #32                          #! PC = 0xaaaabe370f58 *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v4 %v4 32; or %v4@uint64[2] %slih %v4;

(* ushr	v5.2d, v9.2d, #56                          #! PC = 0xaaaabe370f5c *)
shrs %v5 %dc %v9 [56, 56];

(* shl	v12.2d, v10.2d, #8                          #! PC = 0xaaaabe370f60 *)
shls %dc %v12 %v10 [8, 8];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f64 *)
and %v12@uint64[2] %v12 %v1;

(* orr	v5.16b, v5.16b, v12.16b                     #! PC = 0xaaaabe370f68 *)
or %v5@uint64[2] %v5 %v12;

(* ushr	v12.2d, v10.2d, #22                        #! PC = 0xaaaabe370f6c *)
shrs %v12 %dc %v10 [22, 22];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f70 *)
and %v12@uint64[2] %v12 %v1;

(* sli	v5.2d, v12.2d, #32                          #! PC = 0xaaaabe370f74 *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v5 %v5 32; or %v5@uint64[2] %slih %v5;

(* ushr	v6.2d, v10.2d, #52                         #! PC = 0xaaaabe370f78 *)
shrs %v6 %dc %v10 [52, 52];

(* shl	v12.2d, v11.2d, #12                         #! PC = 0xaaaabe370f7c *)
shls %dc %v12 %v11 [12, 12];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f80 *)
and %v12@uint64[2] %v12 %v1;

(* orr	v6.16b, v6.16b, v12.16b                     #! PC = 0xaaaabe370f84 *)
or %v6@uint64[2] %v6 %v12;

(* ushr	v12.2d, v11.2d, #18                        #! PC = 0xaaaabe370f88 *)
shrs %v12 %dc %v11 [18, 18];

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f8c *)
and %v12@uint64[2] %v12 %v1;

(* sli	v6.2d, v12.2d, #32                          #! PC = 0xaaaabe370f90 *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v6 %v6 32; or %v6@uint64[2] %slih %v6;

(* ushr	v7.2d, v11.2d, #48                         #! PC = 0xaaaabe370f94 *)
shrs %v7 %dc %v11 [48, 48];

(* movi	v8.2d, #0x0                                #! PC = 0xaaaabe370f98 *)
broadcast %v8 2 [0x0@uint64];

(* mov	x2, #0x1                   	// #1           #! PC = 0xaaaabe370f9c *)
mov x2 0x1@uint64;

(* mov	v8.d[1], x2                                 #! PC = 0xaaaabe370fa0 *)
mov %v8 [%v8[0], x2];

(* movi	v9.2d, #0x0                                #! PC = 0xaaaabe370fa4 *)
broadcast %v9 2 [0x0@uint64];

(* movi	v10.2d, #0x0                               #! PC = 0xaaaabe370fa8 *)
broadcast %v10 2 [0x0@uint64];

(* movi	v11.2d, #0x0                               #! PC = 0xaaaabe370fac *)
broadcast %v11 2 [0x0@uint64];

(* movi	v12.2d, #0x0                               #! PC = 0xaaaabe370fb0 *)
broadcast %v12 2 [0x0@uint64];


cast %v1@sint32[4] %v1;
nondet %v2@sint32[4];

(* uzp1	v2.4s, v1.4s, v1.4s                        #! PC = 0xaaaabe370fb4 *)
mov %v2 [%v1[0], %v1[2], %v1[0], %v1[2]];

(* mov	x4, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaabe370fb8 *)
mov x4 0xffffffffffffffed@uint64;

(* mov	x21, #0xffffffffffffffff    	// #-1         #! PC = 0xaaaabe370fbc *)
mov x21 0xffffffffffffffff@uint64;

(* mov	x1, x4                                      #! PC = 0xaaaabe370fc0 *)
mov x1 x4;

(* mov	x2, x5                                      #! PC = 0xaaaabe370fc4 *)
mov x2 x5;

(* mov	x3, #0x1                   	// #1           #! PC = 0xaaaabe370fc8 *)
mov x3 0x1@uint64;


cast x3@sint64 x3;

(* mov	x6, #0x20000000000         	// #2199023255552#! PC = 0xaaaabe370fcc *)


mov x6 0x20000000000@sint64;

(* add	x6, x6, #0x100, lsl #12                     #! PC = 0xaaaabe370fd0 *)


split dcH tmp 0x100@sint64 52;
cast tmp@sint64 tmp;
shl tmp tmp 12;
adds carry x6 x6 tmp;

(* mov	x7, #0x286b0000            	// #678100992   #! PC = 0xaaaabe370fd4 *)

(* movk	x7, #0xca1b                                #! PC = 0xaaaabe370fd8 *)


mov x7 678100992@uint64;

(* dup	v15.4s, w7                                  #! PC = 0xaaaabe370fdc *)
cast w7@sint32 x7;
mov %v15 [w7,w7,w7,w7];


    cast %v3@sint32[4] %v3;
    mov [F0, F1, G0, G1] %v3;
    cast %v4@sint32[4] %v4;
    mov [F2, F3, G2, G3] %v4;
    cast %v5@sint32[4] %v5;
    mov [F4, F5, G4, G5] %v5;
    cast %v6@sint32[4] %v6;
    mov [F6, F7, G6, G7] %v6;
    cast %v7@sint32[4] %v7;
    mov [F8, F9, G8, G9] %v7;
    cast %v8@sint32[4] %v8;
    mov [V0, V1, S0, S1] %v8;
    cast %v9@sint32[4] %v9;
    mov [V2, V3, S2, S3] %v9;
    cast %v10@sint32[4] %v10;
    mov [V4, V5, S4, S5] %v10;
    cast %v11@sint32[4] %v11;
    mov [V6, V7, S6, S7] %v11;
    cast %v12@sint32[4] %v12;
    mov [V8, V9, S8, S9] %v12;

    mov %vec_4x_2p30m1 %v2;

assert
    true
&&
    F0 = (const 32 ((2**30) - 19)),
    F1 = (const 32 ((2**30) -  1)),
    F2 = (const 32 ((2**30) -  1)),
    F3 = (const 32 ((2**30) -  1)),
    F4 = (const 32 ((2**30) -  1)),
    F5 = (const 32 ((2**30) -  1)),
    F6 = (const 32 ((2**30) -  1)),
    F7 = (const 32 ((2**30) -  1)),
    F8 = (const 32 ((2**15) -  1)),
    F9 = (const 32 0),
    G9 = (const 32 0),
    V0 = (const 32 0),
    V1 = (const 32 0),
    V2 = (const 32 0),
    V3 = (const 32 0),
    V4 = (const 32 0),
    V5 = (const 32 0),
    V6 = (const 32 0),
    V7 = (const 32 0),
    V8 = (const 32 0),
    V9 = (const 32 0),
    S0 = (const 32 1),
    S1 = (const 32 0),
    S2 = (const 32 0),
    S3 = (const 32 0),
    S4 = (const 32 0),
    S5 = (const 32 0),
    S6 = (const 32 0),
    S7 = (const 32 0),
    S8 = (const 32 0),
    S9 = (const 32 0),
    (const 32 0) <=s F0, F0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F1, F1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F2, F2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F3, F3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F4, F4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F5, F5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F6, F6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F7, F7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F8, F8 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G0, G0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G1, G1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G2, G2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G3, G3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G4, G4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G5, G5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G6, G6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G7, G7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G8, G8 <=s (const 32 ((2**30)-1)),
    slimbs 30 [F0, F1, F2, F3, F4, F5, F6, F7, F8] = (const 272 ((2**255) - 19)),
    slimbs 30 [G0, G1, G2, G3, G4, G5, G6, G7, G8] = (uext (limbs 64 [op_x0, op_x1, op_x2, op_x3]) 16) (mod (const 272 ((2**255) - 19))),
    slimbs 30 [V0, V1, V2, V3, V4, V5, V6, V7, V8] = (const 272 0),
    slimbs 30 [S0, S1, S2, S3, S4, S5, S6, S7, S8] = (const 272 1),
    %v2 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32],
    ulimbs 64 [x4, x21] = const 128 (-19),
    uext (ulimbs 64 [x5, x22]) 144 = slimbs 30 [G0, G1, G2, G3, G4, G5, G6, G7, G8] (mod (const 272 (2**128))),
    %v15 = [678100992@uint32, 678100992@uint32, 678100992@uint32, 678100992@uint32],
    x6 = (const 64 (2**20 + 2**41))
;


(* and	x7, x1, #0xfffff                            #! PC = 0xaaaabe370fe0 *)
and x7@uint64 x1 0xfffff@uint64;

(* and	x8, x2, #0xfffff                            #! PC = 0xaaaabe370fe4 *)
and x8@uint64 x2 0xfffff@uint64;

(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaabe370fe8 *)
or x7@uint64 x7 0xfffffe0000000000@uint64;

(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaabe370fec *)
or x8@uint64 x8 0xc000000000000000@uint64;


    cast x1@sint64 x1;
    cast x2@sint64 x2;
    cast x7@sint64 x7;
    cast x8@sint64 x8;

mov const_2p41a2p20 x6;
mov f_0_low60_0 x1;
mov g_0_low60_0 x2;
mov delta x3;
mov fuv x7;
mov grs x8;
and f_0_low60_0_low20_0@sint64 f_0_low60_0 (2**20 - 1)@sint64;
and g_0_low60_0_low20_0@sint64 g_0_low60_0 (2**20 - 1)@sint64;
mov u_0_20 (-(2**20))@sint64;
mov v_0_20 ( 0)@sint64;
mov r_0_20 ( 0)@sint64;
mov s_0_20 (-(2**20))@sint64;

cut
u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
fuv = f_0_low60_0_low20_0 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
grs = g_0_low60_0_low20_0 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_0,
f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_0,
g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
fuv = (const 64 1) (mod (const 64 2)),
delta = (const 64 1),
u_0_20 = (const 64 (-(2**20))),
v_0_20 = (const 64 (0)),
r_0_20 = (const 64 (0)),
s_0_20 = (const 64 (-(2**20))),
const_2p41a2p20 = (const 64 (2**20 + 2**41)),
%v2 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32]
;

// divstep 0
(* tst	x8, #0x1                                    #! PC = 0xaaaabe370ff0 *)

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe370ff4 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe370ff8 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe370ffc *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371000 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371004 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371008 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37100c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371010 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371014 *)


call divstep_ver_a(x7, x8, x3, 1@sint64; x7, x8 ,x3, ne, delta_range);

// divstep 1
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371018 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37101c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371020 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371024 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371028 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37102c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371030 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371034 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371038 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 2
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37103c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371040 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371044 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371048 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37104c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371050 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371054 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371058 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37105c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 3
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371060 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371064 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371068 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37106c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371070 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371074 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371078 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37107c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371080 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 4
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371084 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371088 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37108c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371090 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371094 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371098 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37109c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3710a0 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3710a4 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 5
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3710a8 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3710ac *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3710b0 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3710b4 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3710b8 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3710bc *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3710c0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3710c4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3710c8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 6
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3710cc *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3710d0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3710d4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3710d8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3710dc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3710e0 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3710e4 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3710e8 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3710ec *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 7
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3710f0 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3710f4 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3710f8 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3710fc *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371100 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371104 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371108 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37110c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371110 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 8
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371114 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371118 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37111c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371120 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371124 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371128 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37112c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371130 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371134 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 9
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371138 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37113c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371140 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371144 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371148 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37114c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371150 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371154 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371158 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 10
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37115c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371160 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371164 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371168 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37116c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371170 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371174 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371178 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37117c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 11
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371180 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371184 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371188 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37118c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371190 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371194 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371198 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37119c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3711a0 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 12
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3711a4 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3711a8 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3711ac *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3711b0 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3711b4 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3711b8 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3711bc *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3711c0 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3711c4 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 13
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3711c8 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3711cc *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3711d0 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3711d4 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3711d8 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3711dc *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3711e0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3711e4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3711e8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 14
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3711ec *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3711f0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3711f4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3711f8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3711fc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371200 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371204 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371208 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37120c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 15
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371210 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371214 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371218 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37121c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371220 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371224 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371228 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37122c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371230 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 16
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371234 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371238 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37123c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371240 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371244 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371248 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37124c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371250 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371254 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 17
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371258 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37125c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371260 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371264 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371268 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37126c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371270 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371274 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371278 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 18
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37127c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371280 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371284 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371288 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37128c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371290 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371294 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371298 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37129c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 19
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3712a0 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3712a4 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3712a8 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3712ac *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3712b0 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3712b4 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3712b8 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3712bc *)


call divstep_ver_c(x7, x8, x3, ne, delta_range; x7, x8 ,x3, delta_range);


mov fuv x7;
mov grs x8;
mov delta x3;

nondet f_0_low60_0_low20_20@sint64;
nondet g_0_low60_0_low20_20@sint64;
nondet u_0_20@sint64;
nondet v_0_20@sint64;
nondet r_0_20@sint64;
nondet s_0_20@sint64;
nondet f_0_low60_20@sint64;
nondet g_0_low60_20@sint64;

// from lemma we have
assume
    u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
    r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    fuv = (const 64 1) (mod (const 64 2)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20)),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))
;

// by the theory of jumpdivstep, we have
assume
    u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
    r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
    f_0_low60_20 = (const 64 1) (mod (const 64 2))
;

cut
    u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
    r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
    fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
    grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
    f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
    g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
    f_0_low60_20 = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 41),
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20)),
    const_2p41a2p20 = (const 64 (2**20 + 2**41))
;


// extraction

(* add	x12, x7, x6                                 #! PC = 0xaaaabe3712c0 *)

(* asr	x12, x12, #42                               #! PC = 0xaaaabe3712c4 *)

(* add	x11, x7, #0x100, lsl #12                    #! PC = 0xaaaabe3712c8 *)

(* lsl	x11, x11, #22                               #! PC = 0xaaaabe3712cc *)

(* asr	x11, x11, #43                               #! PC = 0xaaaabe3712d0 *)

(* add	x14, x8, x6                                 #! PC = 0xaaaabe3712d4 *)

(* asr	x14, x14, #42                               #! PC = 0xaaaabe3712d8 *)

(* add	x13, x8, #0x100, lsl #12                    #! PC = 0xaaaabe3712dc *)

(* lsl	x13, x13, #22                               #! PC = 0xaaaabe3712e0 *)

(* asr	x13, x13, #43                               #! PC = 0xaaaabe3712e4 *)


call extraction(
    x7, x8,
    f_0_low60_0_low20_20, g_0_low60_0_low20_20,
    u_0_20, r_0_20,
    v_0_20, s_0_20,
    x6;
    x11, x13,
    x12, x14);

(* mul	x9, x11, x1                                 #! PC = 0xaaaabe3712e8 *)

(* madd	x9, x12, x2, x9                            #! PC = 0xaaaabe3712ec *)

(* asr	x9, x9, #20                                 #! PC = 0xaaaabe3712f0 *)

(* mul	x10, x13, x1                                #! PC = 0xaaaabe3712f4 *)

(* madd	x10, x14, x2, x10                          #! PC = 0xaaaabe3712f8 *)

(* asr	x2, x10, #20                                #! PC = 0xaaaabe3712fc *)

(* mov	x1, x9                                      #! PC = 0xaaaabe371300 *)


call update_fg_1(
    x1, x2,
    x11, x13,
    x12, x14,
    f_0_low60_20, g_0_low60_20;
    x1, x2
    );


mov neg_f_0_low60_20 x1;
mov neg_g_0_low60_20 x2;
assert true && neg_f_0_low60_20 = (const 64 (-1)) * f_0_low60_20 (mod (const 64 (2**44)));
assert true && neg_g_0_low60_20 = (const 64 (-1)) * g_0_low60_20 (mod (const 64 (2**44)));

mov const_2p41a2p20 x6;


(* and	x7, x1, #0xfffff                            #! PC = 0xaaaabe371304 *)
and x7@uint64 x1 0xfffff@uint64;

(* and	x8, x2, #0xfffff                            #! PC = 0xaaaabe371308 *)
and x8@uint64 x2 0xfffff@uint64;

(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaabe37130c *)
or x7@uint64 x7 0xfffffe0000000000@uint64;

(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaabe371310 *)
or x8@uint64 x8 0xc000000000000000@uint64;


    cast x1@sint64 x1;
    cast x2@sint64 x2;
    cast x7@sint64 x7;
    cast x8@sint64 x8;

mov const_2p41a2p20 x6;
mov neg_f_0_low60_20 x1;
mov neg_g_0_low60_20 x2;
mov delta x3;
mov fuv x7;
mov grs x8;
and neg_f_0_low60_20_low20_0@sint64 neg_f_0_low60_20 (2**20 - 1)@sint64;
and neg_g_0_low60_20_low20_0@sint64 neg_g_0_low60_20 (2**20 - 1)@sint64;
mov u_20_40 (-(2**20))@sint64;
mov v_20_40 ( 0)@sint64;
mov r_20_40 ( 0)@sint64;
mov s_20_40 (-(2**20))@sint64;
cut
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))
&&
    fuv = neg_f_0_low60_20_low20_0 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_0 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_0,
    neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_0,
    neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 41),
    u_20_40 = (const 64 (-(2**20))),
    v_20_40 = (const 64 (0)),
    r_20_40 = (const 64 (0)),
    s_20_40 = (const 64 (-(2**20))),
    const_2p41a2p20 = (const 64 (2**20 + 2**41)),

and [
    x11 = u_0_20,
    x12 = v_0_20,
    x13 = r_0_20,
    x14 = s_0_20,
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))] prove with [all cuts]
;

// divstep 20
(* tst	x8, #0x1                                    #! PC = 0xaaaabe371314 *)

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371318 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37131c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371320 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371324 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371328 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37132c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371330 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371334 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371338 *)


call divstep_ver_a(x7, x8, x3, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 21
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37133c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371340 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371344 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371348 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37134c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371350 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371354 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371358 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37135c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 22
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371360 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371364 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371368 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37136c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371370 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371374 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371378 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37137c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371380 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 23
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371384 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371388 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37138c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371390 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371394 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371398 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37139c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3713a0 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3713a4 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 24
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3713a8 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3713ac *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3713b0 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3713b4 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3713b8 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3713bc *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3713c0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3713c4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3713c8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 25
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3713cc *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3713d0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3713d4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3713d8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3713dc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3713e0 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3713e4 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3713e8 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3713ec *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 26
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3713f0 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3713f4 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3713f8 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3713fc *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371400 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371404 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371408 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37140c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371410 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 27
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371414 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371418 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37141c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371420 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371424 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371428 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37142c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371430 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371434 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 28
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371438 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37143c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371440 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371444 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371448 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37144c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371450 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371454 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371458 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 29
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37145c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371460 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371464 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371468 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37146c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371470 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371474 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371478 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37147c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 30
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371480 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371484 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371488 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37148c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371490 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371494 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371498 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37149c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3714a0 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 31
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3714a4 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3714a8 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3714ac *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3714b0 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3714b4 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3714b8 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3714bc *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3714c0 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3714c4 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 32
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3714c8 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3714cc *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3714d0 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3714d4 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3714d8 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3714dc *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3714e0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3714e4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3714e8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 33
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3714ec *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3714f0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3714f4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3714f8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3714fc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371500 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371504 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371508 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37150c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 34
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371510 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371514 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371518 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37151c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371520 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371524 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371528 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37152c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371530 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 35
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371534 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371538 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37153c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371540 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371544 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371548 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37154c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371550 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371554 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 36
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371558 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37155c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371560 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371564 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371568 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37156c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371570 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371574 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371578 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 37
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37157c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371580 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371584 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371588 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37158c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371590 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371594 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371598 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37159c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 38
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3715a0 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3715a4 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3715a8 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3715ac *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3715b0 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3715b4 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3715b8 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3715bc *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3715c0 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 39
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3715c4 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3715c8 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3715cc *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3715d0 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3715d4 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3715d8 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3715dc *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3715e0 *)


call divstep_ver_c(x7, x8, x3, ne, delta_range; x7, x8 ,x3, delta_range);



mov fuv x7;
mov grs x8;
mov delta x3;
mov const_2p41a2p20 x6;

nondet neg_f_0_low60_20_low20_20@sint64;
nondet neg_g_0_low60_20_low20_20@sint64;
nondet u_20_40@sint64;
nondet v_20_40@sint64;
nondet r_20_40@sint64;
nondet s_20_40@sint64;

// from lemma we have
assume
    u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_20 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_20 * (-(2**20))
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
    u_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    v_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    r_20_40 = (const 64 0) (mod (const 64 (2**(20-20)))),
    s_20_40 = (const 64 0) (mod (const 64 (2**(20-20))))
;


nondet neg_f_0_low60_40@sint64;
nondet neg_g_0_low60_40@sint64;
nondet f_0_low60_40@sint64;
nondet g_0_low60_40@sint64;
// by the theory of jumpdivstep, we have
assume
    u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
    u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
    r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
    neg_f_0_low60_40 = (const 64 1) (mod (const 64 2))
;

cut
    u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
    r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
    u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
    r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
    fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
    grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
    neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
    neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 81),

    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
    u_20_40 + v_20_40 <=s (const 64 (2**20)),
    u_20_40 - v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
    (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
    r_20_40 + s_20_40 <=s (const 64 (2**20)),
    r_20_40 - s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
    (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),

and [
    x11 = u_0_20,
    x12 = v_0_20,
    x13 = r_0_20,
    x14 = s_0_20,
    (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
    u_0_20 + v_0_20 <=s (const 64 (2**20)),
    u_0_20 - v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    r_0_20 + s_0_20 <=s (const 64 (2**20)),
    r_0_20 - s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))] prove with [all cuts]
    ,

    const_2p41a2p20 = (const 64 (2**20 + 2**41)),
    neg_f_0_low60_40 = (const 64 1) (mod (const 64 2))
;

(* add	x16, x7, x6                                 #! PC = 0xaaaabe3715e4 *)

(* asr	x16, x16, #42                               #! PC = 0xaaaabe3715e8 *)

(* add	x15, x7, #0x100, lsl #12                    #! PC = 0xaaaabe3715ec *)

(* lsl	x15, x15, #22                               #! PC = 0xaaaabe3715f0 *)

(* asr	x15, x15, #43                               #! PC = 0xaaaabe3715f4 *)

(* add	x20, x8, x6                                 #! PC = 0xaaaabe3715f8 *)

(* asr	x20, x20, #42                               #! PC = 0xaaaabe3715fc *)

(* add	x17, x8, #0x100, lsl #12                    #! PC = 0xaaaabe371600 *)

(* lsl	x17, x17, #22                               #! PC = 0xaaaabe371604 *)

(* asr	x17, x17, #43                               #! PC = 0xaaaabe371608 *)


call extraction(
    x7, x8,
    neg_f_0_low60_20_low20_20, neg_g_0_low60_20_low20_20,
    u_20_40, r_20_40,
    v_20_40, s_20_40,
    x6;
    x15, x17,
    x16, x20);

(* mul	x9, x15, x1                                 #! PC = 0xaaaabe37160c *)

(* madd	x9, x16, x2, x9                            #! PC = 0xaaaabe371610 *)

(* asr	x9, x9, #20                                 #! PC = 0xaaaabe371614 *)

(* mul	x10, x17, x1                                #! PC = 0xaaaabe371618 *)

(* madd	x10, x20, x2, x10                          #! PC = 0xaaaabe37161c *)

(* asr	x2, x10, #20                                #! PC = 0xaaaabe371620 *)

(* mov	x1, x9                                      #! PC = 0xaaaabe371624 *)


call update_fg_2(
    x1, x2,
    x15, x17,
    x16, x20,
    neg_f_0_low60_40, neg_g_0_low60_40;
    x1, x2
    );

(* mul	x9, x15, x11                                #! PC = 0xaaaabe371628 *)

(* madd	x10, x16, x13, x9                          #! PC = 0xaaaabe37162c *)

(* mul	x9, x17, x11                                #! PC = 0xaaaabe371630 *)

(* madd	x13, x20, x13, x9                          #! PC = 0xaaaabe371634 *)

(* mov	x11, x10                                    #! PC = 0xaaaabe371638 *)

(* mul	x9, x15, x12                                #! PC = 0xaaaabe37163c *)

(* madd	x10, x16, x14, x9                          #! PC = 0xaaaabe371640 *)

(* mul	x9, x17, x12                                #! PC = 0xaaaabe371644 *)

(* madd	x14, x20, x14, x9                          #! PC = 0xaaaabe371648 *)

(* mov	x12, x10                                    #! PC = 0xaaaabe37164c *)


call update_uuvvrrss(
x11,x12,x13,x14,x15,x16,x17,x20;
x11,x12,x13,x14
);

(* and	x7, x1, #0xfffff                            #! PC = 0xaaaabe371650 *)
and x7@uint64 x1 0xfffff@uint64;

(* and	x8, x2, #0xfffff                            #! PC = 0xaaaabe371654 *)
and x8@uint64 x2 0xfffff@uint64;

(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaabe371658 *)
or x7@uint64 x7 0xfffffe0000000000@uint64;

(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaabe37165c *)
or x8@uint64 x8 0xc000000000000000@uint64;


    cast x1@sint64 x1;
    cast x2@sint64 x2;
    cast x7@sint64 x7;
    cast x8@sint64 x8;

mov const_2p41a2p20 x6;
mov f_0_low60_40 x1;
mov g_0_low60_40 x2;
mov delta x3;
mov fuv x7;
mov grs x8;
mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;

and f_0_low60_40_low20_0@sint64 f_0_low60_40 (2**20 - 1)@sint64;
and g_0_low60_40_low20_0@sint64 g_0_low60_40 (2**20 - 1)@sint64;
mov u_40_59 (-(2**20))@sint64;
mov v_40_59 ( 0)@sint64;
mov r_40_59 ( 0)@sint64;
mov s_40_59 (-(2**20))@sint64;

cut
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (-(2**20)),
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (-(2**20))
&&
    fuv = f_0_low60_40_low20_0 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_0 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),

    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_0,
    f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_0,
    g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
    fuv = (const 64 1) (mod (const 64 2)),
    delta = (const 64 1) (mod (const 64 2)),
    (const 64 0) -delta_range <=s delta, delta <=s delta_range,
    delta_range = (const 64 81),
    u_40_59 = (const 64 (-(2**20))),
    v_40_59 = (const 64 (0)),
    r_40_59 = (const 64 (0)),
    s_40_59 = (const 64 (-(2**20))),
    const_2p41a2p20 = (const 64 (2**20 + 2**41)),

    x11 = u_0_40,
    x12 = v_0_40,
    x13 = r_0_40,
    x14 = s_0_40,
    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40)-1)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40))
;

// divstep 40
(* tst	x8, #0x1                                    #! PC = 0xaaaabe371660 *)

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371664 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371668 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37166c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371670 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371674 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371678 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37167c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371680 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371684 *)


call divstep_ver_a(x7, x8, x3, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 41
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371688 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37168c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371690 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371694 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371698 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37169c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3716a0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3716a4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3716a8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 42
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3716ac *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3716b0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3716b4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3716b8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3716bc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3716c0 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3716c4 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3716c8 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3716cc *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 43
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3716d0 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3716d4 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3716d8 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3716dc *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3716e0 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3716e4 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3716e8 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3716ec *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3716f0 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 44
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3716f4 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3716f8 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3716fc *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371700 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371704 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371708 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37170c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371710 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371714 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 45
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371718 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37171c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371720 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371724 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371728 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37172c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371730 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371734 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371738 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 46
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37173c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371740 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371744 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371748 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37174c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371750 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371754 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371758 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37175c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 47
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371760 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371764 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371768 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37176c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371770 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371774 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371778 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37177c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371780 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 48
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371784 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371788 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37178c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371790 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371794 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371798 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37179c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3717a0 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3717a4 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 49
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3717a8 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3717ac *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3717b0 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3717b4 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3717b8 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3717bc *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3717c0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3717c4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3717c8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 50
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3717cc *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3717d0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3717d4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3717d8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3717dc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3717e0 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3717e4 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3717e8 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3717ec *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 51
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3717f0 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3717f4 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3717f8 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3717fc *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371800 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371804 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371808 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37180c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371810 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 52
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371814 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371818 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe37181c *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371820 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371824 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371828 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe37182c *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371830 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371834 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 53
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371838 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe37183c *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371840 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371844 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371848 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe37184c *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371850 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371854 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371858 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 54
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe37185c *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371860 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371864 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe371868 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe37186c *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371870 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371874 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe371878 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe37187c *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 55
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe371880 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe371884 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe371888 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe37188c *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe371890 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371894 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371898 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe37189c *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3718a0 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 56
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3718a4 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3718a8 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3718ac *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3718b0 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3718b4 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3718b8 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3718bc *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3718c0 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3718c4 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 57
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3718c8 *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3718cc *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3718d0 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3718d4 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3718d8 *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe3718dc *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe3718e0 *)

(* tst	x8, #0x2                                    #! PC = 0xaaaabe3718e4 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe3718e8 *)


call divstep_ver_b(x7, x8, x3, ne, delta_range; x7, x8 ,x3, ne, delta_range);

// divstep 58
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaabe3718ec *)

(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaabe3718f0 *)

(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaabe3718f4 *)

(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaabe3718f8 *)

(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaabe3718fc *)

(* add	x8, x8, x10                                 #! PC = 0xaaaabe371900 *)

(* add	x3, x3, #0x2                                #! PC = 0xaaaabe371904 *)

(* asr	x8, x8, #1                                  #! PC = 0xaaaabe371908 *)


call divstep_ver_c(x7, x8, x3, ne, delta_range; x7, x8 ,x3, delta_range);



mov fuv x7;
mov grs x8;
mov delta x3;
mov const_2p41a2p20 x6;

nondet f_0_low60_40_low20_19@sint64;
nondet g_0_low60_40_low20_19@sint64;
nondet u_40_59@sint64;
nondet v_40_59@sint64;
nondet r_40_59@sint64;
nondet s_40_59@sint64;

// from lemma we have
assume
    u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_19 * (-(2**20)),
    r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_19 * (-(2**20))
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19))))
;


nondet neg_f_0_low60_59@sint64;
nondet neg_g_0_low60_59@sint64;
nondet f_0_low60_59@sint64;
nondet g_0_low60_59@sint64;
// by the theory of jumpdivstep, we have
assume
    u_40_59 * f_0_low60_40 + v_40_59 * g_0_low60_40 = f_0_low60_59 * (-(2**20)),
    r_40_59 * f_0_low60_40 + s_40_59 * g_0_low60_40 = g_0_low60_59 * (-(2**20))
&&
    f_0_low60_59 = (const 64 1) (mod (const 64 2))
;

cut
    u_40_59 * f_0_low60_40 + v_40_59 * g_0_low60_40 = f_0_low60_59 * (-(2**20)),
    r_40_59 * f_0_low60_40 + s_40_59 * g_0_low60_40 = g_0_low60_59 * (-(2**20))
&&
    fuv = f_0_low60_40_low20_19 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
    grs = g_0_low60_40_low20_19 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
    (const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_19,
    f_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_19,
    g_0_low60_40_low20_19 <=s (const 64 ((2**20)-1)),
    (const 64 (1 + (-2) * 59)) <=s delta, delta <=s (const 64 (1 + 2*59)),
    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20)-1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    v_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    r_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),
    s_40_59 = (const 64 0) (mod (const 64 (2**(20-19)))),

and [
    x11 = u_0_40,
    x12 = v_0_40,
    x13 = r_0_40,
    x14 = s_0_40,
    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40)-1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40)-1)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
    %v2 = [1073741823@sint32, 1073741823@sint32, 1073741823@sint32, 1073741823@sint32]
    ] prove with [all cuts]
    ,

    const_2p41a2p20 = (const 64 (2**20 + 2**41)),
    f_0_low60_59 = (const 64 1) (mod (const 64 2))
;

(* add	x16, x7, x6                                 #! PC = 0xaaaabe37190c *)

(* asr	x16, x16, #42                               #! PC = 0xaaaabe371910 *)

(* add	x15, x7, #0x100, lsl #12                    #! PC = 0xaaaabe371914 *)

(* lsl	x15, x15, #22                               #! PC = 0xaaaabe371918 *)

(* asr	x15, x15, #43                               #! PC = 0xaaaabe37191c *)

(* add	x20, x8, x6                                 #! PC = 0xaaaabe371920 *)

(* asr	x20, x20, #42                               #! PC = 0xaaaabe371924 *)

(* add	x17, x8, #0x100, lsl #12                    #! PC = 0xaaaabe371928 *)


call extraction(
    x7, x8,
    f_0_low60_40_low20_19, g_0_low60_40_low20_19,
    u_40_59, r_40_59,
    v_40_59, s_40_59,
    x6;
    x15, x17,
    x16, x20);

(* lsl	x17, x17, #22                               #! PC = 0xaaaabe37192c *)

(* asr	x17, x17, #43                               #! PC = 0xaaaabe371930 *)

(* mul	x9, x15, x11                                #! PC = 0xaaaabe371934 *)

(* madd	x10, x16, x13, x9                          #! PC = 0xaaaabe371938 *)

(* mul	x9, x17, x11                                #! PC = 0xaaaabe37193c *)

(* madd	x13, x20, x13, x9                          #! PC = 0xaaaabe371940 *)

(* mov	x11, x10                                    #! PC = 0xaaaabe371944 *)

(* mul	x9, x15, x12                                #! PC = 0xaaaabe371948 *)

(* madd	x10, x16, x14, x9                          #! PC = 0xaaaabe37194c *)

(* mul	x9, x17, x12                                #! PC = 0xaaaabe371950 *)

(* madd	x14, x20, x14, x9                          #! PC = 0xaaaabe371954 *)

(* mov	x12, x10                                    #! PC = 0xaaaabe371958 *)


call update_uuvvrrss_2(
    x11, x12, x13, x14, x15, x16, x17, x20;
    x11, x12, x13, x14
);

(* mov	x19, #0x9                   	// #9          #! PC = 0xaaaabe37195c *)

// x19 is the loop counter
(* mov	v16.d[0], x11                               #! PC = 0xaaaabe371960 *)

(* mov	v16.d[1], x13                               #! PC = 0xaaaabe371964 *)

(* mov	v17.d[0], x12                               #! PC = 0xaaaabe371968 *)

(* mov	v17.d[1], x14                               #! PC = 0xaaaabe37196c *)

(* uzp1	v13.4s, v16.4s, v17.4s                     #! PC = 0xaaaabe371970 *)

(* and	v13.16b, v13.16b, v2.16b                    #! PC = 0xaaaabe371974 *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371978 *)

(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37197c *)

(* uzp1	v14.4s, v16.4s, v17.4s                     #! PC = 0xaaaabe371980 *)


    call prepare_vec_uuvvrrss(
    x11, x12, x13, x14,
    %v2;
    %v13, %v14
);
//
// (* cmp	x11, xzr                                    #! PC = 0xaaaabe371984 *)
// subc zero dc 0@uint64 x11;
//
// (* csetm	x23, mi	// mi = first                     #! PC = 0xaaaabe371988 *)
// csetm	%%x23, mi	// mi = first                     #! 0xaaaabe371988 = 0xaaaabe371988;
//
// (* cneg	x11, x11, mi	// mi = first                 #! PC = 0xaaaabe37198c *)
// cneg	%%x11, %%x11, mi	// mi = first                 #! 0xaaaabe37198c = 0xaaaabe37198c;
//
// (* cmp	x12, xzr                                    #! PC = 0xaaaabe371990 *)
// subc zero dc 0@uint64 x12;
//
// (* csetm	x24, mi	// mi = first                     #! PC = 0xaaaabe371994 *)
// csetm	%%x24, mi	// mi = first                     #! 0xaaaabe371994 = 0xaaaabe371994;
//
// (* cneg	x12, x12, mi	// mi = first                 #! PC = 0xaaaabe371998 *)
// cneg	%%x12, %%x12, mi	// mi = first                 #! 0xaaaabe371998 = 0xaaaabe371998;
//
// (* cmp	x13, xzr                                    #! PC = 0xaaaabe37199c *)
// subc zero dc 0@uint64 x13;
//
// (* csetm	x25, mi	// mi = first                     #! PC = 0xaaaabe3719a0 *)
// csetm	%%x25, mi	// mi = first                     #! 0xaaaabe3719a0 = 0xaaaabe3719a0;
//
// (* cneg	x13, x13, mi	// mi = first                 #! PC = 0xaaaabe3719a4 *)
// cneg	%%x13, %%x13, mi	// mi = first                 #! 0xaaaabe3719a4 = 0xaaaabe3719a4;
//
// (* cmp	x14, xzr                                    #! PC = 0xaaaabe3719a8 *)
// subc zero dc 0@uint64 x14;
//
// (* csetm	x26, mi	// mi = first                     #! PC = 0xaaaabe3719ac *)
// csetm	%%x26, mi	// mi = first                     #! 0xaaaabe3719ac = 0xaaaabe3719ac;
//
// (* cneg	x14, x14, mi	// mi = first                 #! PC = 0xaaaabe3719b0 *)
// cneg	%%x14, %%x14, mi	// mi = first                 #! 0xaaaabe3719b0 = 0xaaaabe3719b0;
//
// (* and	x27, x11, x23                               #! PC = 0xaaaabe3719b4 *)
// and x27@uint64 x11 x23;
//
// (* and	x28, x12, x24                               #! PC = 0xaaaabe3719b8 *)
// and x28@uint64 x12 x24;
//
// (* add	x15, x27, x28                               #! PC = 0xaaaabe3719bc *)
// add x15 x27 x28;
//
// (* eor	x27, x4, x23                                #! PC = 0xaaaabe3719c0 *)
// xor x27@uint64 x4 x23;
//
// (* mul	x9, x27, x11                                #! PC = 0xaaaabe3719c4 *)
// mull dcH x9 x27 x11;
//
// (* umulh	x10, x27, x11                             #! PC = 0xaaaabe3719c8 *)
// mull x10 dcL x27 x11;
//
// (* adds	x15, x9, x15                               #! PC = 0xaaaabe3719cc *)
// adds carry x15 x9 x15;
//
// (* adc	x16, x10, xzr                               #! PC = 0xaaaabe3719d0 *)
// adc x16 x10 0@uint64 carry;
//
// (* eor	x27, x21, x23                               #! PC = 0xaaaabe3719d4 *)
// xor x27@uint64 x21 x23;
//
// (* mul	x9, x27, x11                                #! PC = 0xaaaabe3719d8 *)
// mull dcH x9 x27 x11;
//
// (* add	x16, x16, x9                                #! PC = 0xaaaabe3719dc *)
// add x16 x16 x9;
//
// (* eor	x27, x5, x24                                #! PC = 0xaaaabe3719e0 *)
// xor x27@uint64 x5 x24;
//
// (* mul	x9, x27, x12                                #! PC = 0xaaaabe3719e4 *)
// mull dcH x9 x27 x12;
//
// (* umulh	x10, x27, x12                             #! PC = 0xaaaabe3719e8 *)
// mull x10 dcL x27 x12;
//
// (* adds	x15, x9, x15                               #! PC = 0xaaaabe3719ec *)
// adds carry x15 x9 x15;
//
// (* adc	x16, x10, x16                               #! PC = 0xaaaabe3719f0 *)
// adc x16 x10 x16 carry;
//
// (* eor	x27, x22, x24                               #! PC = 0xaaaabe3719f4 *)
// xor x27@uint64 x22 x24;
//
// (* mul	x9, x27, x12                                #! PC = 0xaaaabe3719f8 *)
// mull dcH x9 x27 x12;
//
// (* add	x16, x16, x9                                #! PC = 0xaaaabe3719fc *)
// add x16 x16 x9;
//
// (* extr	x1, x16, x15, #60                          #! PC = 0xaaaabe371a00 *)
// spl dc extr_H x16 60; spl extr_L dc x15 60; join x1 extr_H extr_L;
//
// (* and	x27, x13, x25                               #! PC = 0xaaaabe371a04 *)
// and x27@uint64 x13 x25;
//
// (* and	x28, x14, x26                               #! PC = 0xaaaabe371a08 *)
// and x28@uint64 x14 x26;
//
// (* add	x17, x27, x28                               #! PC = 0xaaaabe371a0c *)
// add x17 x27 x28;
//
// (* eor	x27, x4, x25                                #! PC = 0xaaaabe371a10 *)
// xor x27@uint64 x4 x25;
//
// (* mul	x9, x27, x13                                #! PC = 0xaaaabe371a14 *)
// mull dcH x9 x27 x13;
//
// (* umulh	x10, x27, x13                             #! PC = 0xaaaabe371a18 *)
// mull x10 dcL x27 x13;
//
// (* adds	x17, x9, x17                               #! PC = 0xaaaabe371a1c *)
// adds carry x17 x9 x17;
//
// (* adc	x20, x10, xzr                               #! PC = 0xaaaabe371a20 *)
// adc x20 x10 0@uint64 carry;
//
// (* eor	x27, x21, x25                               #! PC = 0xaaaabe371a24 *)
// xor x27@uint64 x21 x25;
//
// (* mul	x9, x27, x13                                #! PC = 0xaaaabe371a28 *)
// mull dcH x9 x27 x13;
//
// (* add	x20, x20, x9                                #! PC = 0xaaaabe371a2c *)
// add x20 x20 x9;
//
// (* eor	x27, x5, x26                                #! PC = 0xaaaabe371a30 *)
// xor x27@uint64 x5 x26;
//
// (* mul	x9, x27, x14                                #! PC = 0xaaaabe371a34 *)
// mull dcH x9 x27 x14;
//
// (* umulh	x10, x27, x14                             #! PC = 0xaaaabe371a38 *)
// mull x10 dcL x27 x14;
//
// (* adds	x17, x9, x17                               #! PC = 0xaaaabe371a3c *)
// adds carry x17 x9 x17;
//
// (* adc	x20, x10, x20                               #! PC = 0xaaaabe371a40 *)
// adc x20 x10 x20 carry;
//
// (* eor	x27, x22, x26                               #! PC = 0xaaaabe371a44 *)
// xor x27@uint64 x22 x26;
//
// (* mul	x9, x27, x14                                #! PC = 0xaaaabe371a48 *)
// mull dcH x9 x27 x14;
//
// (* add	x20, x20, x9                                #! PC = 0xaaaabe371a4c *)
// add x20 x20 x9;
//
// (* extr	x2, x20, x17, #60                          #! PC = 0xaaaabe371a50 *)
// spl dc extr_H x20 60; spl extr_L dc x17 60; join x2 extr_H extr_L;

(* smull	v16.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaabe371a54 *)

(* smlal2	v16.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaabe371a58 *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a5c *)

(* smlal	v16.2d, v14.2s, v3.s[0]                   #! PC = 0xaaaabe371a60 *)

(* smlal2	v16.2d, v14.4s, v3.s[2]                  #! PC = 0xaaaabe371a64 *)

(* smlal	v16.2d, v13.2s, v3.s[1]                   #! PC = 0xaaaabe371a68 *)

(* smlal2	v16.2d, v13.4s, v3.s[3]                  #! PC = 0xaaaabe371a6c *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a70 *)

(* smlal	v16.2d, v14.2s, v3.s[1]                   #! PC = 0xaaaabe371a74 *)

(* smlal2	v16.2d, v14.4s, v3.s[3]                  #! PC = 0xaaaabe371a78 *)

(* smlal	v16.2d, v13.2s, v4.s[0]                   #! PC = 0xaaaabe371a7c *)

(* smlal2	v16.2d, v13.4s, v4.s[2]                  #! PC = 0xaaaabe371a80 *)

(* and	v3.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371a84 *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a88 *)

(* smlal	v16.2d, v14.2s, v4.s[0]                   #! PC = 0xaaaabe371a8c *)

(* smlal2	v16.2d, v14.4s, v4.s[2]                  #! PC = 0xaaaabe371a90 *)

(* smlal	v16.2d, v13.2s, v4.s[1]                   #! PC = 0xaaaabe371a94 *)

(* smlal2	v16.2d, v13.4s, v4.s[3]                  #! PC = 0xaaaabe371a98 *)

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371a9c *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371aa0 *)

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371aa4 *)

(* orr	v3.16b, v3.16b, v17.16b                     #! PC = 0xaaaabe371aa8 *)

(* smlal	v16.2d, v14.2s, v4.s[1]                   #! PC = 0xaaaabe371aac *)

(* smlal2	v16.2d, v14.4s, v4.s[3]                  #! PC = 0xaaaabe371ab0 *)

(* smlal	v16.2d, v13.2s, v5.s[0]                   #! PC = 0xaaaabe371ab4 *)

(* smlal2	v16.2d, v13.4s, v5.s[2]                  #! PC = 0xaaaabe371ab8 *)

(* and	v4.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371abc *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371ac0 *)

(* smlal	v16.2d, v14.2s, v5.s[0]                   #! PC = 0xaaaabe371ac4 *)

(* smlal2	v16.2d, v14.4s, v5.s[2]                  #! PC = 0xaaaabe371ac8 *)

(* smlal	v16.2d, v13.2s, v5.s[1]                   #! PC = 0xaaaabe371acc *)

(* smlal2	v16.2d, v13.4s, v5.s[3]                  #! PC = 0xaaaabe371ad0 *)

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371ad4 *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371ad8 *)

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371adc *)

(* orr	v4.16b, v4.16b, v17.16b                     #! PC = 0xaaaabe371ae0 *)

(* smlal	v16.2d, v14.2s, v5.s[1]                   #! PC = 0xaaaabe371ae4 *)

(* smlal2	v16.2d, v14.4s, v5.s[3]                  #! PC = 0xaaaabe371ae8 *)

(* smlal	v16.2d, v13.2s, v6.s[0]                   #! PC = 0xaaaabe371aec *)

(* smlal2	v16.2d, v13.4s, v6.s[2]                  #! PC = 0xaaaabe371af0 *)

(* and	v5.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371af4 *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371af8 *)

(* smlal	v16.2d, v14.2s, v6.s[0]                   #! PC = 0xaaaabe371afc *)

(* smlal2	v16.2d, v14.4s, v6.s[2]                  #! PC = 0xaaaabe371b00 *)

(* smlal	v16.2d, v13.2s, v6.s[1]                   #! PC = 0xaaaabe371b04 *)

(* smlal2	v16.2d, v13.4s, v6.s[3]                  #! PC = 0xaaaabe371b08 *)

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371b0c *)

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371b10 *)

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371b14 *)

(* orr	v5.16b, v5.16b, v17.16b                     #! PC = 0xaaaabe371b18 *)

(* smlal	v16.2d, v14.2s, v6.s[1]                   #! PC = 0xaaaabe371b1c *)

(* smlal2	v16.2d, v14.4s, v6.s[3]                  #! PC = 0xaaaabe371b20 *)
