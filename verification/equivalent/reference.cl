proc main (
x11@int64, x12@int64, x13@int64, x14@int64,
x3@int64, // detla
x4@uint64, // f_low128_0
x5@uint64, // g_low128_0
x6@int64, // const_2p41a2p20
x21@uint64, // f_low128_1
x22@uint64, // g_low128_1
%v1@int32[4], // vec_2x_2p30m1
%v2@int32[4], // vec_4x_2p30m1
%v3@int32[4], // vec_F0_F1_G0_G1
%v4@int32[4], // vec_F2_F3_G2_G3
%v5@int32[4], // vec_F4_F5_G4_G5
%v6@int32[4], // vec_F6_F7_G6_G7
%v7@int32[4], // vec_F8_F9_G8_G9
%v8@int32[4], // vec_V0_V1_S0_S1
%v9@int32[4], // vec_V2_V3_S2_S3
%v10@int32[4],// vec_V4_V5_S4_S5
%v11@int32[4],// vec_V6_V7_S6_S7
%v12@int32[4],// vec_V8_V9_S8_S9
%v15@int32[4] // vec_4x_M
) = {true &&
%v1 = [
(const 32 (2**30 - 1)),
(const 32 0),
(const 32 (2**30 - 1)),
(const 32 0)
],
%v2 = [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v3 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v3 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v4 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v4 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v5 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v5 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v6 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v6 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v7 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v7 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v8 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v8 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v9 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v9 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v10 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v10 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v11 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v11 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
%v12 >=s [
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30))),
(const 32 (-(2**30)))
],
%v12 <=s [
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1)),
(const 32 (2**30 - 1))
],
(const 64 (-(2**60))) <=s x11, x11 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s x12, x12 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s x13, x13 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s x14, x14 <=s (const 64 ((2**60) - 1)),
(const 64 (-600)) <=s x3, x3 <=s (const 64 (600)),
x6 = (const 64 ((2**41) + (2**20)))
}

nondet %v16@int64[2];
nondet %v17@int64[2];

    # interleave 

(* 	mov	v16.d[0], x11                               #! PC = 0xaaaae76b1918 *)
mov %v16 [x11, %v16[1]];
(* 	mov	v16.d[1], x13                               #! PC = 0xaaaae76b191c *)
mov %v16 [%v16[0], x13];
(* 	mov	v17.d[0], x12                               #! PC = 0xaaaae76b1920 *)
mov %v17 [x12, %v17[1]];
(* 	mov	v17.d[1], x14                               #! PC = 0xaaaae76b1924 *)
mov %v17 [%v17[0], x14];
(* 	uzp1	v13.4s, v16.4s, v17.4s                     #! PC = 0xaaaae76b1928 *)
cast %v16@int32[4] %v16;
cast %v17@int32[4] %v17;
mov %v13 [%v16[0], %v16[2], %v17[0], %v17[2]];
(* 	and	v13.16b, v13.16b, v2.16b                    #! PC = 0xaaaae76b192c *)
and %v13@int32[4] %v13 %v2;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1930 *)
cast %v16@int64[2] %v16;
split %v16 %dc %v16 30;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b1934 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	uzp1	v14.4s, v16.4s, v17.4s                     #! PC = 0xaaaae76b1938 *)
cast %v16@int32[4] %v16;
cast %v17@int32[4] %v17;
mov %v14 [%v16[0], %v16[2], %v17[0], %v17[2]];
(* 	cmp	x11, xzr                                    #! PC = 0xaaaae76b193c *)
spl mi dc x11 63;
cast mi@bit mi;
(* 	csetm	x23, mi	// mi = first                     #! PC = 0xaaaae76b1940 *)
cmov x23 mi (-1)@int64 0@int64;
(* 	cneg	x11, x11, mi	// mi = first                 #! PC = 0xaaaae76b1944 *)
subs dc x11_neg 0@int64 x11;
cmov x11 mi x11_neg x11;
vpc x11@uint64 x11;
(* 	cmp	x12, xzr                                    #! PC = 0xaaaae76b1948 *)
spl mi dc x12 63;
cast mi@bit mi;
(* 	csetm	x24, mi	// mi = first                     #! PC = 0xaaaae76b194c *)
cmov x24 mi (-1)@int64 0@int64;
(* 	cneg	x12, x12, mi	// mi = first                 #! PC = 0xaaaae76b1950 *)
subs dc x12_neg 0@int64 x12;
cmov x12 mi x12_neg x12;
vpc x12@uint64 x12;
(* 	cmp	x13, xzr                                    #! PC = 0xaaaae76b1954 *)
spl mi dc x13 63;
cast mi@bit mi;
(* 	csetm	x25, mi	// mi = first                     #! PC = 0xaaaae76b1958 *)
cmov x25 mi (-1)@int64 0@int64;
(* 	cneg	x13, x13, mi	// mi = first                 #! PC = 0xaaaae76b195c *)
subs dc x13_neg 0@int64 x13;
cmov x13 mi x13_neg x13;
vpc x13@uint64 x13;
(* 	cmp	x14, xzr                                    #! PC = 0xaaaae76b1960 *)
spl mi dc x14 63;
cast mi@bit mi;
(* 	csetm	x26, mi	// mi = first                     #! PC = 0xaaaae76b1964 *)
cmov x26 mi (-1)@int64 0@int64;
(* 	cneg	x14, x14, mi	// mi = first                 #! PC = 0xaaaae76b1968 *)
subs dc x14_neg 0@int64 x14;
cmov x14 mi x14_neg x14;
vpc x14@uint64 x14;
(* 	and	x27, x11, x23                               #! PC = 0xaaaae76b196c *)
and x27@uint64 x11 x23;
(* 	and	x28, x12, x24                               #! PC = 0xaaaae76b1970 *)
and x28@uint64 x12 x24;
(* 	add	x15, x27, x28                               #! PC = 0xaaaae76b1974 *)
add x15 x27 x28;
(* 	eor	x27, x4, x23                                #! PC = 0xaaaae76b1978 *)
xor x27@uint64 x4 x23;
(* 	mul	x9, x27, x11                                #! PC = 0xaaaae76b197c *)
mull dc x9 x27 x11;
(* 	umulh	x10, x27, x11                             #! PC = 0xaaaae76b1980 *)
mull x10 dc x27 x11;
(* 	adds	x15, x9, x15                               #! PC = 0xaaaae76b1984 *)
adds carry x15 x9 x15;
(* 	adc	x16, x10, xzr                               #! PC = 0xaaaae76b1988 *)
adc x16 x10 0@uint64 carry;
(* 	eor	x27, x21, x23                               #! PC = 0xaaaae76b198c *)
xor x27@uint64 x21 x23;
(* 	mul	x9, x27, x11                                #! PC = 0xaaaae76b1990 *)
mull dc x9 x27 x11;
(* 	add	x16, x16, x9                                #! PC = 0xaaaae76b1994 *)
adds dc x16 x16 x9;
(* 	eor	x27, x5, x24                                #! PC = 0xaaaae76b1998 *)
xor x27@uint64 x5 x24;
(* 	mul	x9, x27, x12                                #! PC = 0xaaaae76b199c *)
mull dc x9 x27 x12;
(* 	umulh	x10, x27, x12                             #! PC = 0xaaaae76b19a0 *)
mull x10 dc x27 x12;
(* 	adds	x15, x9, x15                               #! PC = 0xaaaae76b19a4 *)
adds carry x15 x9 x15;
(* 	adc	x16, x10, x16                               #! PC = 0xaaaae76b19a8 *)
adcs dc x16 x10 x16 carry;
(* 	eor	x27, x22, x24                               #! PC = 0xaaaae76b19ac *)
xor x27@uint64 x22 x24;
(* 	mul	x9, x27, x12                                #! PC = 0xaaaae76b19b0 *)
mull dc x9 x27 x12;
(* 	add	x16, x16, x9                                #! PC = 0xaaaae76b19b4 *)
adds dc x16 x16 x9;
(* 	extr	x1, x16, x15, #60                          #! PC = 0xaaaae76b19b8 *)
spl dc extr_H x16 60;
spl extr_L dc x15 60;
join x1 extr_H extr_L;
(* 	and	x27, x13, x25                               #! PC = 0xaaaae76b19bc *)
and x27@uint64 x13 x25;
(* 	and	x28, x14, x26                               #! PC = 0xaaaae76b19c0 *)
and x28@uint64 x14 x26;
(* 	add	x17, x27, x28                               #! PC = 0xaaaae76b19c4 *)
add x17 x27 x28;
(* 	eor	x27, x4, x25                                #! PC = 0xaaaae76b19c8 *)
xor x27@uint64 x4 x25;
(* 	mul	x9, x27, x13                                #! PC = 0xaaaae76b19cc *)
mull dc x9 x27 x13;
(* 	umulh	x10, x27, x13                             #! PC = 0xaaaae76b19d0 *)
mull x10 dc x27 x13;
(* 	adds	x17, x9, x17                               #! PC = 0xaaaae76b19d4 *)
adds carry x17 x9 x17;
(* 	adc	x20, x10, xzr                               #! PC = 0xaaaae76b19d8 *)
adc  x20 x10 0@uint64 carry;
(* 	eor	x27, x21, x25                               #! PC = 0xaaaae76b19dc *)
xor  x27@uint64 x21 x25;
(* 	mul	x9, x27, x13                                #! PC = 0xaaaae76b19e0 *)
mull dc x9 x27 x13;
(* 	add	x20, x20, x9                                #! PC = 0xaaaae76b19e4 *)
adds dc x20 x20 x9;
(* 	eor	x27, x5, x26                                #! PC = 0xaaaae76b19e8 *)
xor x27@uint64 x5 x26;
(* 	mul	x9, x27, x14                                #! PC = 0xaaaae76b19ec *)
mull dc x9 x27 x14;
(* 	umulh	x10, x27, x14                             #! PC = 0xaaaae76b19f0 *)
mull x10 dc x27 x14;
(* 	adds	x17, x9, x17                               #! PC = 0xaaaae76b19f4 *)
adds carry x17 x9 x17;
(* 	adc	x20, x10, x20                               #! PC = 0xaaaae76b19f8 *)
adcs dc x20 x10 x20 carry;
(* 	eor	x27, x22, x26                               #! PC = 0xaaaae76b19fc *)
xor x27@uint64 x22 x26;
(* 	mul	x9, x27, x14                                #! PC = 0xaaaae76b1a00 *)
mull dc x9 x27 x14;
(* 	add	x20, x20, x9                                #! PC = 0xaaaae76b1a04 *)
adds dc x20 x20 x9;
(* 	extr	x2, x20, x17, #60                          #! PC = 0xaaaae76b1a08 *)
spl dc extr_H x20 60;
spl extr_L dc x17 60;
join x2 extr_H extr_L;
(* 	smull	v16.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaae76b1a0c *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %v16@int64[2] %tmp1 %tmp2;
(* 	smlal2	v16.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaae76b1a10 *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1a14 *)
cast %v16@int64[2] %v16;
split %v16 %dc %v16 30;
(* 	smlal	v16.2d, v14.2s, v3.s[0]                   #! PC = 0xaaaae76b1a18 *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v3.s[2]                  #! PC = 0xaaaae76b1a1c *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v3.s[1]                   #! PC = 0xaaaae76b1a20 *)
broadcast %tmp1@int32[2] 2 [%v3[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v3.s[3]                  #! PC = 0xaaaae76b1a24 *)
broadcast %tmp1@int32[2] 2 [%v3[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1a28 *)
cast %v16@int64[2] %v16;
split %v16 %dc %v16 30;
(* 	smlal	v16.2d, v14.2s, v3.s[1]                   #! PC = 0xaaaae76b1a2c *)
broadcast %tmp1@int32[2] 2 [%v3[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v3.s[3]                  #! PC = 0xaaaae76b1a30 *)
broadcast %tmp1@int32[2] 2 [%v3[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v4.s[0]                   #! PC = 0xaaaae76b1a34 *)
broadcast %tmp1@int32[2] 2 [%v4[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v4.s[2]                  #! PC = 0xaaaae76b1a38 *)
broadcast %tmp1@int32[2] 2 [%v4[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v3.16b, v16.16b, v1.16b                     #! PC = 0xaaaae76b1a3c *)
cast %v1@int64[2] %v1;
and %v3@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1a40 *)
cast %v16@int64[2] %v16;
split %v16 %dc %v16 30;
(* 	smlal	v16.2d, v14.2s, v4.s[0]                   #! PC = 0xaaaae76b1a44 *)
broadcast %tmp1@int32[2] 2 [%v4[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v4.s[2]                  #! PC = 0xaaaae76b1a48 *)
broadcast %tmp1@int32[2] 2 [%v4[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v4.s[1]                   #! PC = 0xaaaae76b1a4c *)
broadcast %tmp1@int32[2] 2 [%v4[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v4.s[3]                  #! PC = 0xaaaae76b1a50 *)
broadcast %tmp1@int32[2] 2 [%v4[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaae76b1a54 *)
and %v17@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1a58 *)
cast %v16@int64[2] %v16;
split %v16 %dc %v16 30;
(* 	shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaae76b1a5c *)
mov [v17_sint64_0, v17_sint64_1] %v17;
shl v17_sint64_0 v17_sint64_0 32;
shl v17_sint64_1 v17_sint64_1 32;
mov %v17@int64[2] [v17_sint64_0, v17_sint64_1];
(* 	orr	v3.16b, v3.16b, v17.16b                     #! PC = 0xaaaae76b1a60 *)
or %v3@int64[2] %v3 %v17;
(* 	smlal	v16.2d, v14.2s, v4.s[1]                   #! PC = 0xaaaae76b1a64 *)
broadcast %tmp1@int32[2] 2 [%v4[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v4.s[3]                  #! PC = 0xaaaae76b1a68 *)
broadcast %tmp1@int32[2] 2 [%v4[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v5.s[0]                   #! PC = 0xaaaae76b1a6c *)
broadcast %tmp1@int32[2] 2 [%v5[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v5.s[2]                  #! PC = 0xaaaae76b1a70 *)
broadcast %tmp1@int32[2] 2 [%v5[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v4.16b, v16.16b, v1.16b                     #! PC = 0xaaaae76b1a74 *)
and %v4@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1a78 *)
split %v16 %dc %v16 30;
(* 	smlal	v16.2d, v14.2s, v5.s[0]                   #! PC = 0xaaaae76b1a7c *)
broadcast %tmp1@int32[2] 2 [%v5[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v5.s[2]                  #! PC = 0xaaaae76b1a80 *)
broadcast %tmp1@int32[2] 2 [%v5[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v5.s[1]                   #! PC = 0xaaaae76b1a84 *)
broadcast %tmp1@int32[2] 2 [%v5[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v5.s[3]                  #! PC = 0xaaaae76b1a88 *)
broadcast %tmp1@int32[2] 2 [%v5[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaae76b1a8c *)
and %v17@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1a90 *)
split %v16 %dc %v16 30;
(* 	shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaae76b1a94 *)
mov [v17_sint64_0, v17_sint64_1] %v17;
shl v17_sint64_0 v17_sint64_0 32;
shl v17_sint64_1 v17_sint64_1 32;
mov %v17@int64[2] [v17_sint64_0, v17_sint64_1];
(* 	orr	v4.16b, v4.16b, v17.16b                     #! PC = 0xaaaae76b1a98 *)
or %v4@int64[2] %v4 %v17;
(* 	smlal	v16.2d, v14.2s, v5.s[1]                   #! PC = 0xaaaae76b1a9c *)
broadcast %tmp1@int32[2] 2 [%v5[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v5.s[3]                  #! PC = 0xaaaae76b1aa0 *)
broadcast %tmp1@int32[2] 2 [%v5[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v6.s[0]                   #! PC = 0xaaaae76b1aa4 *)
broadcast %tmp1@int32[2] 2 [%v6[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v6.s[2]                  #! PC = 0xaaaae76b1aa8 *)
broadcast %tmp1@int32[2] 2 [%v6[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v5.16b, v16.16b, v1.16b                     #! PC = 0xaaaae76b1aac *)
and %v5@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1ab0 *)
split %v16 %dc %v16 30;
(* 	smlal	v16.2d, v14.2s, v6.s[0]                   #! PC = 0xaaaae76b1ab4 *)
broadcast %tmp1@int32[2] 2 [%v6[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v6.s[2]                  #! PC = 0xaaaae76b1ab8 *)
broadcast %tmp1@int32[2] 2 [%v6[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v6.s[1]                   #! PC = 0xaaaae76b1abc *)
broadcast %tmp1@int32[2] 2 [%v6[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v6.s[3]                  #! PC = 0xaaaae76b1ac0 *)
broadcast %tmp1@int32[2] 2 [%v6[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaae76b1ac4 *)
and %v17@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1ac8 *)
split %v16 %dc %v16 30;
(* 	shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaae76b1acc *)
mov [v17_sint64_0, v17_sint64_1] %v17;
shl v17_sint64_0 v17_sint64_0 32;
shl v17_sint64_1 v17_sint64_1 32;
mov %v17@int64[2] [v17_sint64_0, v17_sint64_1];
(* 	orr	v5.16b, v5.16b, v17.16b                     #! PC = 0xaaaae76b1ad0 *)
or %v5@int64[2] %v5 %v17;
(* 	smlal	v16.2d, v14.2s, v6.s[1]                   #! PC = 0xaaaae76b1ad4 *)
broadcast %tmp1@int32[2] 2 [%v6[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v6.s[3]                  #! PC = 0xaaaae76b1ad8 *)
broadcast %tmp1@int32[2] 2 [%v6[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal	v16.2d, v13.2s, v7.s[0]                   #! PC = 0xaaaae76b1adc *)
broadcast %tmp1@int32[2] 2 [%v7[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v13.4s, v7.s[2]                  #! PC = 0xaaaae76b1ae0 *)
broadcast %tmp1@int32[2] 2 [%v7[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v6.16b, v16.16b, v1.16b                     #! PC = 0xaaaae76b1ae4 *)
and %v6@int64[2] %v16 %v1;
(* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1ae8 *)
split %v16 %dc %v16 30;
(* 	smlal	v16.2d, v14.2s, v7.s[0]                   #! PC = 0xaaaae76b1aec *)
broadcast %tmp1@int32[2] 2 [%v7[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	smlal2	v16.2d, v14.4s, v7.s[2]                  #! PC = 0xaaaae76b1af0 *)
broadcast %tmp1@int32[2] 2 [%v7[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaae76b1af4 *)
and %v17@int64[2] %v16 %v1;
(* 	sshr	v7.2d, v16.2d, #30                         #! PC = 0xaaaae76b1af8 *)
split %v7 %dc %v16 30;
(* 	shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaae76b1afc *)
mov [v17_sint64_0, v17_sint64_1] %v17;
shl v17_sint64_0 v17_sint64_0 32;
shl v17_sint64_1 v17_sint64_1 32;
mov %v17@int64[2] [v17_sint64_0, v17_sint64_1];
(* 	orr	v6.16b, v6.16b, v17.16b                     #! PC = 0xaaaae76b1b00 *)
or %v6@int64[2] %v6 %v17;
(* 	and	x7, x1, #0xfffff                            #! PC = 0xaaaae76b1b04 *)
and x7@int64 x1 1048575@int64;
(* 	and	x8, x2, #0xfffff                            #! PC = 0xaaaae76b1b08 *)
and x8@int64 x2 1048575@int64;
(* 	orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaae76b1b0c *)
or x7@int64 x7 (-2199023255552)@int64;
(* 	orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaae76b1b10 *)
or x8@int64 x8 (-4611686018427387904)@int64;
(* 	tst	x8, #0x1                                    #! PC = 0xaaaae76b1b14 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1b18 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1b1c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1b20 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1b24 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1b28 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1b2c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1b30 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1b34 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1b38 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1b3c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1b40 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1b44 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1b48 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1b4c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1b50 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1b54 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1b58 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1b5c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1b60 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1b64 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1b68 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1b6c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1b70 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1b74 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1b78 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1b7c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1b80 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1b84 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1b88 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1b8c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1b90 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1b94 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1b98 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1b9c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1ba0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1ba4 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1ba8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1bac *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1bb0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1bb4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1bb8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1bbc *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1bc0 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1bc4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1bc8 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1bcc *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1bd0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1bd4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1bd8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1bdc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1be0 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1be4 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1be8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1bec *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1bf0 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1bf4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1bf8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1bfc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1c00 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1c04 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1c08 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1c0c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1c10 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1c14 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1c18 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1c1c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1c20 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1c24 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1c28 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1c2c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1c30 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1c34 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1c38 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1c3c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1c40 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1c44 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1c48 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1c4c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1c50 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1c54 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1c58 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1c5c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1c60 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1c64 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1c68 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1c6c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1c70 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1c74 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1c78 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1c7c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1c80 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1c84 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1c88 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1c8c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1c90 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1c94 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1c98 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1c9c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1ca0 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1ca4 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1ca8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1cac *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1cb0 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1cb4 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1cb8 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1cbc *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1cc0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1cc4 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1cc8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1ccc *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1cd0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1cd4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1cd8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1cdc *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1ce0 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1ce4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1ce8 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1cec *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1cf0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1cf4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1cf8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1cfc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1d00 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1d04 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1d08 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1d0c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1d10 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1d14 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1d18 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1d1c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1d20 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1d24 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1d28 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1d2c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1d30 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1d34 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1d38 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1d3c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1d40 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1d44 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1d48 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1d4c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1d50 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1d54 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1d58 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1d5c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1d60 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1d64 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1d68 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1d6c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1d70 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1d74 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1d78 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1d7c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1d80 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1d84 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1d88 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1d8c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1d90 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1d94 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1d98 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1d9c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1da0 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1da4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1da8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1dac *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1db0 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1db4 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1db8 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1dbc *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1dc0 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1dc4 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1dc8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1dcc *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1dd0 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1dd4 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1dd8 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1ddc *)
add x3 x3 0x2@sint64;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1de0 *)
split x8 dc x8 1;
(* 	add	x12, x7, x6                                 #! PC = 0xaaaae76b1de4 *)
add x12 x7 x6;
(* 	asr	x12, x12, #42                               #! PC = 0xaaaae76b1de8 *)
sars x12 dc x12 42;
(* 	add	x11, x7, #0x100, lsl #12                    #! PC = 0xaaaae76b1dec *)
add x11 x7 1048576@int64;
(* 	lsl	x11, x11, #22                               #! PC = 0xaaaae76b1df0 *)
shls dc x11 x11 22;
(* 	asr	x11, x11, #43                               #! PC = 0xaaaae76b1df4 *)
sars x11 dc x11 43;
(* 	add	x14, x8, x6                                 #! PC = 0xaaaae76b1df8 *)
add x14 x8 x6;
(* 	asr	x14, x14, #42                               #! PC = 0xaaaae76b1dfc *)
sars x14 dc x14 42;
(* 	add	x13, x8, #0x100, lsl #12                    #! PC = 0xaaaae76b1e00 *)
add x13 x8 1048576@int64;
(* 	lsl	x13, x13, #22                               #! PC = 0xaaaae76b1e04 *)
shls dc x13 x13 22;
(* 	asr	x13, x13, #43                               #! PC = 0xaaaae76b1e08 *)
sars x13 dc x13 43;
(* 	mul	x9, x11, x1                                 #! PC = 0xaaaae76b1e0c *)
cast x1@int64 x1;
mull dc x9 x11 x1;
(* 	madd	x9, x12, x2, x9                            #! PC = 0xaaaae76b1e10 *)
cast x2@int64 x2;
mull dc tmp x12 x2;
adds dc x9 tmp x9;
(* 	asr	x9, x9, #20                                 #! PC = 0xaaaae76b1e14 *)
sars x9 dc x9 20;
(* 	mul	x10, x13, x1                                #! PC = 0xaaaae76b1e18 *)
mull dc x10 x13 x1;
(* 	madd	x10, x14, x2, x10                          #! PC = 0xaaaae76b1e1c *)
mull dc tmp x14 x2;
adds dc x10 tmp x10;
(* 	asr	x2, x10, #20                                #! PC = 0xaaaae76b1e20 *)
sars x2 dc x10 20;
(* 	mov	x1, x9                                      #! PC = 0xaaaae76b1e24 *)
mov x1 x9;

    # interleave intermediate
(*
cv_cec -ov x1,x2,x3,VEC_v3_0,VEC_v3_1,VEC_v4_0,VEC_v4_1,VEC_v5_0,VEC_v5_1,VEC_v6_0,VEC_v6_1,VEC_v7_0,VEC_v7_1  reference.cl target.cl
Final result:					[OK]		3.2774 seconds
*)

(* 	mov	w4, v3.s[0]                                 #! PC = 0xaaaae76b1e28 *)
cast %v3@uint32[4] %v3;
mov x4 %v3[0];
cast x4@uint64 x4;
(* 	mov	w27, v3.s[1]                                #! PC = 0xaaaae76b1e2c *)
mov x27 %v3[1];
cast x27@uint64 x27;
(* 	add	x4, x4, x27, lsl #30                        #! PC = 0xaaaae76b1e30 *)
shl x27_shl30@uint64 x27 30;
add x4 x4 x27_shl30;
(* 	mov	w27, v4.s[0]                                #! PC = 0xaaaae76b1e34 *)
cast %v4@uint32[4] %v4;
mov x27 %v4[0];
cast x27@uint64 x27;
(* 	add	x4, x4, x27, lsl #60                        #! PC = 0xaaaae76b1e38 *)
shls dc x27_shl60@uint64 x27 60;
adds dc x4 x4 x27_shl60;
(* 	add	x21, xzr, x27, lsr #4                       #! PC = 0xaaaae76b1e3c *)
shrs x27_shr4 dc x27 4;
add  x21 0@uint64 x27_shr4;
(* 	mov	w27, v4.s[1]                                #! PC = 0xaaaae76b1e40 *)
cast %v4@uint32[4] %v4;
mov x27 %v4[1];
cast x27@uint64 x27;
(* 	add	x21, x21, x27, lsl #26                      #! PC = 0xaaaae76b1e44 *)
shl  x27_shl26@uint64 x27 26;
adds dc x21 x21 x27_shl26;
(* 	mov	w5, v3.s[2]                                 #! PC = 0xaaaae76b1e48 *)
cast %v3@uint32[4] %v3;
mov x5 %v3[2];
cast x5@uint64 x5;
(* 	mov	w27, v3.s[3]                                #! PC = 0xaaaae76b1e4c *)
mov x27 %v3[3];
cast x27@uint64 x27;
(* 	add	x5, x5, x27, lsl #30                        #! PC = 0xaaaae76b1e50 *)
shl  x27_shl30@uint64 x27 30;
adds dc x5 x5 x27_shl30;
(* 	mov	w27, v4.s[2]                                #! PC = 0xaaaae76b1e54 *)
cast %v4@uint32[4] %v4;
mov x27 %v4[2];
cast x27@uint64 x27;
(* 	add	x5, x5, x27, lsl #60                        #! PC = 0xaaaae76b1e58 *)
shls dc x27_shl60@uint64 x27 60;
adds dc x5 x5 x27_shl60;
(* 	add	x22, xzr, x27, lsr #4                       #! PC = 0xaaaae76b1e5c *)
shrs x27_shr4 dc x27 4;
adds dc x22 0@uint64 x27_shr4;
(* 	mov	w27, v4.s[3]                                #! PC = 0xaaaae76b1e60 *)
cast %v4@uint32[4] %v4;
mov x27 %v4[3];
cast x27@uint64 x27;
(* 	add	x22, x22, x27, lsl #26                      #! PC = 0xaaaae76b1e64 *)
shl  x27_shl26@uint64 x27 26;
adds dc x22 x22 x27_shl26;
(*  and x7, x1, #0xfffff                            #! PC = 0xaaaae76b1e68 *)
and x7@int64 x1 1048575@int64;
(*  and x8, x2, #0xfffff                            #! PC = 0xaaaae76b1e6c *)
and x8@int64 x2 1048575@int64;
(*  orr x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaae76b1e70 *)
or x7@int64 x7 (-2199023255552)@int64;
(*  orr x8, x8, #0xc000000000000000                 #! PC = 0xaaaae76b1e74 *)
or x8@int64 x8 (-4611686018427387904)@int64;
(* 	tst	x8, #0x1                                    #! PC = 0xaaaae76b1e78 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1e7c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1e80 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1e84 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1e88 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1e8c *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1e90 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1e94 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1e98 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1e9c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1ea0 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1ea4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1ea8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1eac *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1eb0 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1eb4 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1eb8 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1ebc *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1ec0 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1ec4 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1ec8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1ecc *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1ed0 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1ed4 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1ed8 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1edc *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1ee0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1ee4 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1ee8 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1eec *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1ef0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1ef4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1ef8 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1efc *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1f00 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1f04 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1f08 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1f0c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1f10 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1f14 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1f18 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1f1c *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1f20 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1f24 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1f28 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1f2c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1f30 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1f34 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1f38 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1f3c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1f40 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1f44 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1f48 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1f4c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1f50 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1f54 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1f58 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1f5c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1f60 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1f64 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1f68 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1f6c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1f70 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1f74 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1f78 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1f7c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1f80 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1f84 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1f88 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1f8c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1f90 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1f94 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1f98 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1f9c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1fa0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1fa4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1fa8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1fac *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1fb0 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1fb4 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1fb8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1fbc *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1fc0 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1fc4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1fc8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1fcc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1fd0 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1fd4 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1fd8 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b1fdc *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b1fe0 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b1fe4 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b1fe8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b1fec *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b1ff0 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b1ff4 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b1ff8 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b1ffc *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2000 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2004 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2008 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b200c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2010 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2014 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2018 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b201c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2020 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2024 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2028 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b202c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2030 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2034 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2038 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b203c *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2040 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2044 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2048 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b204c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2050 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2054 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2058 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b205c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2060 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2064 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2068 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b206c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2070 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2074 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2078 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b207c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2080 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2084 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2088 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b208c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2090 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2094 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2098 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b209c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b20a0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b20a4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b20a8 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b20ac *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b20b0 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b20b4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b20b8 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b20bc *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b20c0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b20c4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b20c8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b20cc *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b20d0 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b20d4 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b20d8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b20dc *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b20e0 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b20e4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b20e8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b20ec *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b20f0 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b20f4 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b20f8 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b20fc *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2100 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2104 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2108 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b210c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2110 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2114 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2118 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b211c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2120 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2124 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2128 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b212c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2130 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2134 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2138 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b213c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2140 *)
add x3 x3 0x2@sint64;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2144 *)
split x8 dc x8 1;
(* 	add	x16, x7, x6                                 #! PC = 0xaaaae76b2148 *)
add x16 x7 x6;
(* 	asr	x16, x16, #42                               #! PC = 0xaaaae76b214c *)
sars x16 dc x16 42;
(* 	add	x15, x7, #0x100, lsl #12                    #! PC = 0xaaaae76b2150 *)
add x15 x7 1048576@int64;
(* 	lsl	x15, x15, #22                               #! PC = 0xaaaae76b2154 *)
shls dc x15 x15 22;
(* 	asr	x15, x15, #43                               #! PC = 0xaaaae76b2158 *)
sars x15 dc x15 43;
(* 	add	x20, x8, x6                                 #! PC = 0xaaaae76b215c *)
add x20 x8 x6;
(* 	asr	x20, x20, #42                               #! PC = 0xaaaae76b2160 *)
sars x20 dc x20 42;
(* 	add	x17, x8, #0x100, lsl #12                    #! PC = 0xaaaae76b2164 *)
add x17 x8 1048576@int64;
(* 	lsl	x17, x17, #22                               #! PC = 0xaaaae76b2168 *)
shls dc x17 x17 22;
(* 	asr	x17, x17, #43                               #! PC = 0xaaaae76b216c *)
sars x17 dc x17 43;
(* 	mul	x9, x15, x1                                 #! PC = 0xaaaae76b2170 *)
cast x1@int64 x1;
mull dc x9 x15 x1;
(* 	madd	x9, x16, x2, x9                            #! PC = 0xaaaae76b2174 *)
cast x2@int64 x2;
mull dc tmp x16 x2;
adds dc x9 tmp x9;
(* 	asr	x9, x9, #20                                 #! PC = 0xaaaae76b2178 *)
sars x9 dc x9 20;
(* 	mul	x10, x17, x1                                #! PC = 0xaaaae76b217c *)
mull dc x10 x17 x1;
(* 	madd	x10, x20, x2, x10                          #! PC = 0xaaaae76b2180 *)
mull dc tmp x20 x2;
adds dc x10 tmp x10;
(* 	asr	x2, x10, #20                                #! PC = 0xaaaae76b2184 *)
sars x2 dc x10 20;
(* 	mov	x1, x9                                      #! PC = 0xaaaae76b2188 *)
mov x1 x9;
(* 	mul	x9, x15, x11                                #! PC = 0xaaaae76b218c *)
cast x11@int64 x11;
mull dc x9 x15 x11;
(* 	madd	x10, x16, x13, x9                          #! PC = 0xaaaae76b2190 *)
cast x13@int64 x13;
mull dc tmp x16 x13;
adds dc x10 tmp x9;
(* 	mul	x9, x17, x11                                #! PC = 0xaaaae76b2194 *)
mull dc x9 x17 x11;
(* 	madd	x13, x20, x13, x9                          #! PC = 0xaaaae76b2198 *)
mull dc tmp x20 x13;
adds dc x13 tmp x9;
(* 	mov	x11, x10                                    #! PC = 0xaaaae76b219c *)
mov x11 x10;
(* 	mul	x9, x15, x12                                #! PC = 0xaaaae76b21a0 *)
cast x12@int64 x12;
mull dc x9 x15 x12;
(* 	madd	x10, x16, x14, x9                          #! PC = 0xaaaae76b21a4 *)
cast x14@int64 x14;
mull dc tmp x16 x14;
adds dc x10 tmp x9;
(* 	mul	x9, x17, x12                                #! PC = 0xaaaae76b21a8 *)
mull dc x9 x17 x12;
(* 	madd	x14, x20, x14, x9                          #! PC = 0xaaaae76b21ac *)
mull dc tmp x20 x14;
adds dc x14 tmp x9;
(* 	mov	x12, x10                                    #! PC = 0xaaaae76b21b0 *)
mov x12 x10;
(* 	mov	x9, #0x13                  	// #19          #! PC = 0xaaaae76b21b4 *)
mov x9 19@int64;
(* 	dup	v16.2d, x9                                  #! PC = 0xaaaae76b21b8 *)
broadcast %v16@int64[2] 2 [x9];
(* 	smull	v17.2d, v13.2s, v8.s[0]                   #! PC = 0xaaaae76b21bc *)
cast %v13@int32[4] %v13;
cast %v8@int32[4] %v8;
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v17@int64[2] %tmp1 %tmp2;
(* 	smlal2	v17.2d, v13.4s, v8.s[2]                  #! PC = 0xaaaae76b21c0 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	mul	v19.4s, v17.4s, v15.4s                      #! PC = 0xaaaae76b21c4 *)
cast %v17@uint32[4] %v17;
cast %v15@uint32[4] %v15;
mull %dc %v19@uint32[4] %v17 %v15;
(* 	and	v19.16b, v19.16b, v1.16b                    #! PC = 0xaaaae76b21c8 *)
cast %v19@int64[2] %v19;
cast %v1@int64[2] %v1;
and %v19@int64[2] %v19 %v1;
(* 	uzp1	v19.4s, v19.4s, v19.4s                     #! PC = 0xaaaae76b21cc *)
cast %v19@int32[4] %v19;
mov %v19 [%v19[0], %v19[2], %v19[0], %v19[2]];
(* 	smlsl	v17.2d, v19.2s, v16.s[0]                  #! PC = 0xaaaae76b21d0 *)
cast %v17@int64[2] %v17;
cast %v19@int32[4] %v19;
cast %v16@int32[4] %v16;
broadcast %tmp1@int32[2] 2 [%v16[0]];
mov %tmp2@int32[2] [%v19[0], %v19[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
subs %dc %v17@int64[2] %v17 %tmp3;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b21d4 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	smlal	v17.2d, v14.2s, v8.s[0]                   #! PC = 0xaaaae76b21d8 *)
cast %v14@int32[4] %v14;
cast %v8@int32[4] %v8;
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v8.s[2]                  #! PC = 0xaaaae76b21dc *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v8.s[1]                   #! PC = 0xaaaae76b21e0 *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v8.s[3]                  #! PC = 0xaaaae76b21e4 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	mul	v20.4s, v17.4s, v15.4s                      #! PC = 0xaaaae76b21e8 *)
cast %v17@uint32[4] %v17;
cast %v15@uint32[4] %v15;
mull %dc %v20@uint32[4] %v17 %v15;
(* 	and	v20.16b, v20.16b, v1.16b                    #! PC = 0xaaaae76b21ec *)
cast %v20@int64[2] %v20;
cast %v1@int64[2] %v1;
and %v20@int64[2] %v20 %v1;
(* 	uzp1	v20.4s, v20.4s, v20.4s                     #! PC = 0xaaaae76b21f0 *)
cast %v20@int32[4] %v20;
mov %v20 [%v20[0], %v20[2], %v20[0], %v20[2]];
(* 	smlsl	v17.2d, v20.2s, v16.s[0]                  #! PC = 0xaaaae76b21f4 *)
cast %v17@int64[2] %v17;
cast %v20@int32[4] %v20;
cast %v16@int32[4] %v16;
broadcast %tmp1@int32[2] 2 [%v16[0]];
mov %tmp2@int32[2] [%v20[0], %v20[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
subs %dc %v17@int64[2] %v17 %tmp3;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b21f8 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	smlal	v17.2d, v14.2s, v8.s[1]                   #! PC = 0xaaaae76b21fc *)
cast %v14@int32[4] %v14;
cast %v8@int32[4] %v8;
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v8.s[3]                  #! PC = 0xaaaae76b2200 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v9.s[0]                   #! PC = 0xaaaae76b2204 *)
cast %v13@int32[4] %v13;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v9.s[2]                  #! PC = 0xaaaae76b2208 *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	and	v8.16b, v17.16b, v1.16b                     #! PC = 0xaaaae76b220c *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v8@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b2210 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	smlal	v17.2d, v14.2s, v9.s[0]                   #! PC = 0xaaaae76b2214 *)
cast %v14@int32[4] %v14;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v9.s[2]                  #! PC = 0xaaaae76b2218 *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v9.s[1]                   #! PC = 0xaaaae76b221c *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v9.s[3]                  #! PC = 0xaaaae76b2220 *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaae76b2224 *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v18@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b2228 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	sli	v8.2d, v18.2d, #32                          #! PC = 0xaaaae76b222c *)
mov [v18_sint64_0, v18_sint64_1] %v18;
shl v18_sint64_0 v18_sint64_0 32;
shl v18_sint64_1 v18_sint64_1 32;
mov %tmp18@int64[2] [v18_sint64_0, v18_sint64_1];
or %v8@int64[2] %v8 %tmp18;
(* 	smlal	v17.2d, v14.2s, v9.s[1]                   #! PC = 0xaaaae76b2230 *)
cast %v14@int32[4] %v14;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v9.s[3]                  #! PC = 0xaaaae76b2234 *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v10.s[0]                  #! PC = 0xaaaae76b2238 *)
cast %v13@int32[4] %v13;
cast %v10@int32[4] %v10;
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v10.s[2]                 #! PC = 0xaaaae76b223c *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	and	v9.16b, v17.16b, v1.16b                     #! PC = 0xaaaae76b2240 *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v9@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b2244 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	smlal	v17.2d, v14.2s, v10.s[0]                  #! PC = 0xaaaae76b2248 *)
cast %v14@int32[4] %v14;
cast %v10@int32[4] %v10;
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v10.s[2]                 #! PC = 0xaaaae76b224c *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v10.s[1]                  #! PC = 0xaaaae76b2250 *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v10.s[3]                 #! PC = 0xaaaae76b2254 *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaae76b2258 *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v18@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b225c *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	sli	v9.2d, v18.2d, #32                          #! PC = 0xaaaae76b2260 *)
mov [v18_sint64_0, v18_sint64_1] %v18;
shl v18_sint64_0 v18_sint64_0 32;
shl v18_sint64_1 v18_sint64_1 32;
mov %tmp18@int64[2] [v18_sint64_0, v18_sint64_1];
or %v9@int64[2] %v9 %tmp18;
(* 	smlal	v17.2d, v14.2s, v10.s[1]                  #! PC = 0xaaaae76b2264 *)
cast %v14@int32[4] %v14;
cast %v10@int32[4] %v10;
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v10.s[3]                 #! PC = 0xaaaae76b2268 *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v11.s[0]                  #! PC = 0xaaaae76b226c *)
cast %v13@int32[4] %v13;
cast %v11@int32[4] %v11;
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v11.s[2]                 #! PC = 0xaaaae76b2270 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	and	v10.16b, v17.16b, v1.16b                    #! PC = 0xaaaae76b2274 *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v10@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b2278 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	smlal	v17.2d, v14.2s, v11.s[0]                  #! PC = 0xaaaae76b227c *)
cast %v14@int32[4] %v14;
cast %v11@int32[4] %v11;
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v11.s[2]                 #! PC = 0xaaaae76b2280 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v11.s[1]                  #! PC = 0xaaaae76b2284 *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v11.s[3]                 #! PC = 0xaaaae76b2288 *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaae76b228c *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v18@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b2290 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	sli	v10.2d, v18.2d, #32                         #! PC = 0xaaaae76b2294 *)
mov [v18_sint64_0, v18_sint64_1] %v18;
shl v18_sint64_0 v18_sint64_0 32;
shl v18_sint64_1 v18_sint64_1 32;
mov %tmp18@int64[2] [v18_sint64_0, v18_sint64_1];
or %v10@int64[2] %v10 %tmp18;
(* 	smlal	v17.2d, v14.2s, v11.s[1]                  #! PC = 0xaaaae76b2298 *)
cast %v14@int32[4] %v14;
cast %v11@int32[4] %v11;
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v11.s[3]                 #! PC = 0xaaaae76b229c *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal	v17.2d, v13.2s, v12.s[0]                  #! PC = 0xaaaae76b22a0 *)
cast %v12@int32[4] %v12;
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v13.4s, v12.s[2]                 #! PC = 0xaaaae76b22a4 *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	ushll	v19.2d, v19.2s, #15                       #! PC = 0xaaaae76b22a8 *)
cast %v19@uint32[4] %v19;
cast t19_0@uint64 %v19[0];
cast t19_1@uint64 %v19[1];
shls dc t19_0 t19_0 15;
shls dc t19_1 t19_1 15;
mov %v19@uint64[2] [t19_0, t19_1];
(* 	add	v17.2d, v17.2d, v19.2d                      #! PC = 0xaaaae76b22ac *)
cast %v17@int64[2] %v17;
cast %v19@int64[2] %v19;
adds %dc %v17@int64[2] %v17 %v19;
(* 	and	v11.16b, v17.16b, v1.16b                    #! PC = 0xaaaae76b22b0 *)
cast %v1@int64[2] %v1;
and %v11@int64[2] %v17 %v1;
(* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b22b4 *)
cast %v17@int64[2] %v17;
split %v17 %dc %v17 30;
(* 	smlal	v17.2d, v14.2s, v12.s[0]                  #! PC = 0xaaaae76b22b8 *)
cast %v14@int32[4] %v14;
cast %v12@int32[4] %v12;
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	smlal2	v17.2d, v14.4s, v12.s[2]                 #! PC = 0xaaaae76b22bc *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* 	ushll	v20.2d, v20.2s, #15                       #! PC = 0xaaaae76b22c0 *)
cast %v20@uint32[4] %v20;
cast t20_0@uint64 %v20[0];
cast t20_1@uint64 %v20[1];
shls dc t20_0 t20_0 15;
shls dc t20_1 t20_1 15;
mov %v20@uint64[2] [t20_0, t20_1];
(* 	add	v17.2d, v17.2d, v20.2d                      #! PC = 0xaaaae76b22c4 *)
cast %v17@int64[2] %v17;
cast %v20@int64[2] %v20;
adds %dc %v17@int64[2] %v17 %v20;
(* 	and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaae76b22c8 *)
cast %v1@int64[2] %v1;
and %v18@int64[2] %v17 %v1;
(* 	sshr	v12.2d, v17.2d, #30                        #! PC = 0xaaaae76b22cc *)
cast %v17@int64[2] %v17;
split %v12 %dc %v17 30;
(* 	sli	v11.2d, v18.2d, #32                         #! PC = 0xaaaae76b22d0 *)
mov [v18_sint64_0, v18_sint64_1] %v18;
shls dc v18_sint64_0 v18_sint64_0 32;
shls dc v18_sint64_1 v18_sint64_1 32;
mov %tmp18@int64[2] [v18_sint64_0, v18_sint64_1];
or %v11@int64[2] %v11 %tmp18;
(* 	sshr	v18.2d, v12.2d, #15                        #! PC = 0xaaaae76b22d4 *)
cast %v12@int64[2] %v12;
split %v18 %dc %v12 15;
(* 	shl	v17.2d, v18.2d, #15                         #! PC = 0xaaaae76b22d8 *)
mov [t18_0, t18_1] %v18;
shls dc t18_0 t18_0 15;
shls dc t18_1 t18_1 15;
mov %v17@int64[2] [t18_0, t18_1];
(* 	sub	v12.2d, v12.2d, v17.2d                      #! PC = 0xaaaae76b22dc *)
subs %dc %v12@int64[2] %v12 %v17;
(* 	mla	v8.4s, v18.4s, v16.4s                       #! PC = 0xaaaae76b22e0 *)
cast %v8@uint32[4]  %v8;
cast %v18@uint32[4] %v18;
cast %v16@uint32[4] %v16;
mull %dc %tmp_prod@uint32[4] %v18 %v16;
adds %dc %v8@uint32[4] %v8 %tmp_prod;
(* 	and	x7, x1, #0xfffff                            #! PC = 0xaaaae76b22e4 *)
and x7@int64 x1 1048575@int64;
(* 	and	x8, x2, #0xfffff                            #! PC = 0xaaaae76b22e8 *)
and x8@int64 x2 1048575@int64;
(* 	orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaae76b22ec *)
or x7@int64 x7 (-2199023255552)@int64;
(* 	orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaae76b22f0 *)
or x8@int64 x8 (-4611686018427387904)@int64;
(* 	tst	x8, #0x1                                    #! PC = 0xaaaae76b22f4 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b22f8 *)
cmov x10 ne x7 0@sint64;    // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b22fc *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;        // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2300 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;       // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2304 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;    // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2308 *)
cmov x7 ge x8 x7;           // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b230c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2310 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2314 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2318 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b231c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2320 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2324 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2328 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b232c *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2330 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2334 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2338 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b233c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2340 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2344 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2348 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b234c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2350 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2354 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2358 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b235c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2360 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2364 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2368 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b236c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2370 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2374 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2378 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b237c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2380 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2384 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2388 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b238c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2390 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2394 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2398 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b239c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b23a0 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b23a4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b23a8 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b23ac *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b23b0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b23b4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b23b8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b23bc *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b23c0 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b23c4 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b23c8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b23cc *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b23d0 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b23d4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b23d8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b23dc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b23e0 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b23e4 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b23e8 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b23ec *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b23f0 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b23f4 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b23f8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b23fc *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2400 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2404 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2408 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b240c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2410 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2414 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2418 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b241c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2420 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2424 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2428 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b242c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2430 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2434 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2438 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b243c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2440 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2444 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2448 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b244c *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2450 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2454 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2458 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b245c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2460 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2464 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2468 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b246c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2470 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2474 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2478 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b247c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2480 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2484 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2488 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b248c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2490 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2494 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2498 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b249c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b24a0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b24a4 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b24a8 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b24ac *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b24b0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b24b4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b24b8 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b24bc *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b24c0 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b24c4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b24c8 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b24cc *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b24d0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b24d4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b24d8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b24dc *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b24e0 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b24e4 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b24e8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b24ec *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b24f0 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b24f4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b24f8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b24fc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2500 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2504 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2508 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b250c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2510 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2514 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2518 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b251c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2520 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2524 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2528 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b252c *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2530 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2534 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2538 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b253c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2540 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2544 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2548 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b254c *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2550 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2554 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b2558 *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b255c *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2560 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2564 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b2568 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b256c *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2570 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2574 *)
add x3 x3 0x2@sint64;
(* 	tst	x8, #0x2                                    #! PC = 0xaaaae76b2578 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b257c *)
split x8 dc x8 1;
(* 	csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaae76b2580 *)
cmov x10 ne x7 0@sint64;  // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaae76b2584 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;      // ne = any;
(* 	cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaae76b2588 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;     // ge = tcont;
(* 	cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaae76b258c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;  // ge = tcont;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaae76b2590 *)
cmov x7 ge x8 x7;         // ge = tcont;
(* 	add	x8, x8, x10                                 #! PC = 0xaaaae76b2594 *)
adds dc x8 x8 x10;
(* 	add	x3, x3, #0x2                                #! PC = 0xaaaae76b2598 *)
add x3 x3 0x2@sint64;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaae76b259c *)
split x8 dc x8 1;
(* 	add	x16, x7, x6                                 #! PC = 0xaaaae76b25a0 *)
add x16 x7 x6;
(* 	asr	x16, x16, #42                               #! PC = 0xaaaae76b25a4 *)
sars x16 dc x16 42;
(* 	add	x15, x7, #0x100, lsl #12                    #! PC = 0xaaaae76b25a8 *)
add x15 x7 1048576@int64;
(* 	lsl	x15, x15, #22                               #! PC = 0xaaaae76b25ac *)
shls dc x15 x15 22;
(* 	asr	x15, x15, #43                               #! PC = 0xaaaae76b25b0 *)
sars x15 dc x15 43;
(* 	add	x20, x8, x6                                 #! PC = 0xaaaae76b25b4 *)
add x20 x8 x6;
(* 	asr	x20, x20, #42                               #! PC = 0xaaaae76b25b8 *)
sars x20 dc x20 42;
(* 	add	x17, x8, #0x100, lsl #12                    #! PC = 0xaaaae76b25bc *)
add x17 x8 1048576@int64;
(* 	lsl	x17, x17, #22                               #! PC = 0xaaaae76b25c0 *)
shls dc x17 x17 22;
(* 	asr	x17, x17, #43                               #! PC = 0xaaaae76b25c4 *)
sars x17 dc x17 43;
(* 	mul	x9, x15, x11                                #! PC = 0xaaaae76b25c8 *)
cast x11@int64 x11;
mull dc x9 x15 x11;
(* 	madd	x10, x16, x13, x9                          #! PC = 0xaaaae76b25cc *)
cast x13@int64 x13;
mull dc tmp x16 x13;
adds dc x10 tmp x9;
(* 	mul	x9, x17, x11                                #! PC = 0xaaaae76b25d0 *)
mull dc x9 x17 x11;
(* 	madd	x13, x20, x13, x9                          #! PC = 0xaaaae76b25d4 *)
mull dc tmp x20 x13;
adds dc x13 tmp x9;
(* 	mov	x11, x10                                    #! PC = 0xaaaae76b25d8 *)
mov x11 x10;
(* 	mul	x9, x15, x12                                #! PC = 0xaaaae76b25dc *)
cast x12@int64 x12;
mull dc x9 x15 x12;
(* 	madd	x10, x16, x14, x9                          #! PC = 0xaaaae76b25e0 *)
cast x14@int64 x14;
mull dc tmp x16 x14;
adds dc x10 tmp x9;
(* 	mul	x9, x17, x12                                #! PC = 0xaaaae76b25e4 *)
mull dc x9 x17 x12;
(* 	madd	x14, x20, x14, x9                          #! PC = 0xaaaae76b25e8 *)
mull dc tmp x20 x14;
adds dc x14 tmp x9;
(* 	mov	x12, x10                                    #! PC = 0xaaaae76b25ec *)
mov x12 x10;

    # interleave end
cast %v3@int64[2] %v3;
cast %v4@int64[2] %v4;
cast %v5@int64[2] %v5;
cast %v6@int64[2] %v6;
cast %v7@int64[2] %v7;
cast %v8@int64[2] %v8;
cast %v9@int64[2] %v9;
cast %v10@int64[2] %v10;
cast %v11@int64[2] %v11;
cast %v12@int64[2] %v12;

{true && true}
