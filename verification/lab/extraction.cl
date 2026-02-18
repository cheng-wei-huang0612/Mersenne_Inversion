proc main (
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

    // u_0_20 + v_0_20 <=s (const 64 (2**20)),
    // u_0_20 - v_0_20 <=s (const 64 (2**20)),
    // (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
    // (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
    // r_0_20 + s_0_20 <=s (const 64 (2**20)),
    // r_0_20 - s_0_20 <=s (const 64 (2**20)),
    // (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
    // (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20)),

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
