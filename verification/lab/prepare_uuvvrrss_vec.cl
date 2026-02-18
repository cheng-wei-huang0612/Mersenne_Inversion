proc main (
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
