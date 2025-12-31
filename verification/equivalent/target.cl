(*
cv_cec -ov x11,x12,x13,x14,x3,x4,x5,x21,x22,VEC_v3_0,VEC_v3_1,VEC_v4_0,VEC_v4_1,VEC_v5_0,VEC_v5_1,VEC_v6_0,VEC_v6_1,VEC_v7_0,VEC_v7_1,VEC_v8_0,VEC_v8_1,VEC_v9_0,VEC_v9_1,VEC_v10_0,VEC_v10_1,VEC_v11_0,VEC_v11_1,VEC_v12_0,VEC_v12_1 reference.cl target.cl
Final result:					[OK]		7.9959 seconds
*)
proc main (
x11@int64, x12@int64, x13@int64, x14@int64,
x3@int64, // detla
x4@int64, // f_low128_0
x5@int64, // g_low128_0
x6@int64, // const_2p41a2p20
x21@int64, // f_low128_1
x22@int64, // g_low128_1
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

nondet %v13@int64[2];
nondet %v24@int64[2];

	# interleave

(* 	cmp	x13, xzr                                    #! PC = 0xaaaad4bb1918 *)
spl mi dc x13 63;
cast mi@bit mi;
(* 	cneg	x10, x13, mi	// mi = first                 #! PC = 0xaaaad4bb191c *)
subs dc x13_neg 0@int64 x13;
cmov x10 mi x13_neg x13;
vpc x10@uint64 x10;
(* 	csetm	x15, mi	// mi = first                     #! PC = 0xaaaad4bb1920 *)
cmov x15 mi (-1)@int64 0@int64;
(* 	and	x29, x10, x15                               #! PC = 0xaaaad4bb1924 *)
and x29@uint64 x10 x15;
(* 	eor	x17, x4, x15                                #! PC = 0xaaaad4bb1928 *)
xor x17@uint64 x4 x15;
(* 	cmp	x12, xzr                                    #! PC = 0xaaaad4bb192c *)
spl mi dc x12 63;
cast mi@bit mi;
(* 	eor	x15, x21, x15                               #! PC = 0xaaaad4bb1930 *)
xor x15@uint64 x21 x15;
(* 	cneg	x1, x12, mi	// mi = first                  #! PC = 0xaaaad4bb1934 *)
subs dc x12_neg 0@int64 x12;
cmov x1 mi x12_neg x12;
vpc x1@uint64 x1;
(* 	csetm	x23, mi	// mi = first                     #! PC = 0xaaaad4bb1938 *)
cmov x23 mi (-1)@int64 0@int64;
(* 	mov	v13.d[0], x11                               #! PC = 0xaaaad4bb193c *)
mov %v13@int64[2] [x11, %v13[1]];
(* 	cmp	x14, xzr                                    #! PC = 0xaaaad4bb1940 *)
spl mi dc x14 63;
cast mi@bit mi;
(* 	mov	v24.d[0], x12                               #! PC = 0xaaaad4bb1944 *)
mov %v24@int64[2] [x12, %v24[1]];
(* 	and	x16, x1, x23                                #! PC = 0xaaaad4bb1948 *)
and x16@uint64 x1 x23;
(* 	csetm	x28, mi	// mi = first                     #! PC = 0xaaaad4bb194c *)
cmov x28 mi (-1)@int64 0@int64;
(* 	cneg	x26, x14, mi	// mi = first                 #! PC = 0xaaaad4bb1950 *)
subs dc x14_neg 0@int64 x14;
cmov x26 mi x14_neg x14;
vpc x26@uint64 x26;
(* 	cmp	x11, xzr                                    #! PC = 0xaaaad4bb1954 *)
spl mi dc x11 63;
cast mi@bit mi;
(* 	eor	x9, x5, x28                                 #! PC = 0xaaaad4bb1958 *)
xor x9@uint64 x5 x28;
(* 	mul	x8, x9, x26                                 #! PC = 0xaaaad4bb195c *)
mull dc x8 x9 x26;
(* 	mul	x27, x17, x10                               #! PC = 0xaaaad4bb1960 *)
mull dc x27 x17 x10;
(* 	eor	x25, x5, x23                                #! PC = 0xaaaad4bb1964 *)
xor x25@uint64 x5 x23;
(* 	cneg	x12, x11, mi	// mi = first                 #! PC = 0xaaaad4bb1968 *)
subs dc x11_neg 0@int64 x11;
cmov x12 mi x11_neg x11;
vpc x12@uint64 x12;
(* 	csetm	x11, mi	// mi = first                     #! PC = 0xaaaad4bb196c *)
cmov x11 mi (-1)@int64 0@int64;
(* 	mov	v13.d[1], x13                               #! PC = 0xaaaad4bb1970 *)
mov %v13@int64[2] [%v13[0], x13];
(* 	and	x2, x26, x28                                #! PC = 0xaaaad4bb1974 *)
and x2@uint64 x26 x28;
(* 	eor	x20, x4, x11                                #! PC = 0xaaaad4bb1978 *)
xor x20@uint64 x4 x11;
(* 	add	x24, x29, x2                                #! PC = 0xaaaad4bb197c *)
add x24 x29 x2;
(* 	and	x29, x12, x11                               #! PC = 0xaaaad4bb1980 *)
and x29@uint64 x12 x11;
(* 	umulh	x7, x17, x10                              #! PC = 0xaaaad4bb1984 *)
mull x7 dc x17 x10;
(* 	mov	v24.d[1], x14                               #! PC = 0xaaaad4bb1988 *)
mov %v24@int64[2] [%v24[0], x14];
(* 	umulh	x17, x9, x26                              #! PC = 0xaaaad4bb198c *)
mull x17 dc x9 x26;
(* 	sshr	v22.2d, v13.2d, #30                        #! PC = 0xaaaad4bb1990 *)
cast %v13@int64[2] %v13;
split %v22 %dc %v13 30;
(* 	uzp1	v13.4s, v13.4s, v24.4s                     #! PC = 0xaaaad4bb1994 *)
cast %v13@int32[4] %v13;
cast %v24@int32[4] %v24;
mov %v13 [%v13[0], %v13[2], %v24[0], %v24[2]];
(* 	sshr	v26.2d, v24.2d, #30                        #! PC = 0xaaaad4bb1998 *)
cast %v24@int64[2] %v24;
split %v26 %dc %v24 30;
(* 	mul	x13, x20, x12                               #! PC = 0xaaaad4bb199c *)
mull dc x13 x20 x12;
(* 	add	x14, x29, x16                               #! PC = 0xaaaad4bb19a0 *)
add x14 x29 x16;
(* 	eor	x16, x21, x11                               #! PC = 0xaaaad4bb19a4 *)
xor x16@uint64 x21 x11;
(* 	adds	x2, x27, x24                               #! PC = 0xaaaad4bb19a8 *)
adds carry x2 x27 x24;
(* 	mul	x24, x16, x12                               #! PC = 0xaaaad4bb19ac *)
mull dc x24 x16 x12;
(* 	adc	x27, x7, xzr                                #! PC = 0xaaaad4bb19b0 *)
adc x27 x7 0@uint64 carry;
(* 	adds	x29, x13, x14                              #! PC = 0xaaaad4bb19b4 *)
adds carry x29 x13 x14;
(* 	mul	x14, x15, x10                               #! PC = 0xaaaad4bb19b8 *)
mull dc x14 x15 x10;
(* 	umulh	x10, x20, x12                             #! PC = 0xaaaad4bb19bc *)
mull x10 dc x20 x12;
(* 	mul	x7, x25, x1                                 #! PC = 0xaaaad4bb19c0 *)
mull dc x7 x25 x1;
(* 	and	v13.16b, v13.16b, v2.16b                    #! PC = 0xaaaad4bb19c4 *)
and %v13@int32[4] %v13 %v2;
(* 	umulh	x13, x25, x1                              #! PC = 0xaaaad4bb19c8 *)
mull x13 dc x25 x1;
(* 	smull	v29.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaad4bb19cc *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %v29@int64[2] %tmp1 %tmp2;
(* 	eor	x12, x22, x28                               #! PC = 0xaaaad4bb19d0 *)
xor x12@uint64 x22 x28;
(* 	adc	x16, x10, xzr                               #! PC = 0xaaaad4bb19d4 *)
adc x16 x10 0@uint64 carry;
(* 	add	x9, x27, x14                                #! PC = 0xaaaad4bb19d8 *)
adds dc x9 x27 x14;
(* 	mul	x25, x12, x26                               #! PC = 0xaaaad4bb19dc *)
mull dc x25 x12 x26;
(* 	adds	x20, x8, x2                                #! PC = 0xaaaad4bb19e0 *)
adds carry x20 x8 x2;
(* 	add	x24, x16, x24                               #! PC = 0xaaaad4bb19e4 *)
adds dc x24 x16 x24;
(* 	eor	x16, x22, x23                               #! PC = 0xaaaad4bb19e8 *)
xor x16@uint64 x22 x23;
(* 	mul	x27, x16, x1                                #! PC = 0xaaaad4bb19ec *)
mull dc x27 x16 x1;
(* 	adc	x12, x17, x9                                #! PC = 0xaaaad4bb19f0 *)
adcs dc x12 x17 x9 carry;
(* 	adds	x2, x7, x29                                #! PC = 0xaaaad4bb19f4 *)
adds carry x2 x7 x29;
(* 	add	x9, x12, x25                                #! PC = 0xaaaad4bb19f8 *)
adds dc x9 x12 x25;
(* 	adc	x25, x13, x24                               #! PC = 0xaaaad4bb19fc *)
adcs dc x25 x13 x24 carry;
(* 	smlal2	v29.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaad4bb1a00 *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v29@int64[2] %v29 %tmp3;
(* 	add	x30, x25, x27                               #! PC = 0xaaaad4bb1a04 *)
adds dc x30 x25 x27;
(* 	extr	x10, x9, x20, #60                          #! PC = 0xaaaad4bb1a08 *)
spl dc extr_H x9 60;
spl extr_L dc x20 60;
join x10 extr_H extr_L;
(* 	extr	x28, x30, x2, #60                          #! PC = 0xaaaad4bb1a0c *)
spl dc extr_H x30 60;
spl extr_L dc x2 60;
join x28 extr_H extr_L;

(*
reference: PC = 0xaaaae76b1a10
cv_cec -ov1 x2,x1 -ov2 x10,x28 reference.cl target.cl
Final result:					[OK]		0.3433 seconds
*)

(* 	and	x12, x10, #0xfffff                          #! PC = 0xaaaad4bb1a10 *)
and x12@int64 x10 1048575@int64;
(* 	sshr	v23.2d, v29.2d, #30                        #! PC = 0xaaaad4bb1a14 *)
cast %v29@int64[2] %v29;
split %v23 %dc %v29 30;
(* 	orr	x8, x12, #0xc000000000000000                #! PC = 0xaaaad4bb1a18 *)
or x8@int64 x12 (-4611686018427387904)@int64;
(* 	and	x11, x28, #0xfffff                          #! PC = 0xaaaad4bb1a1c *)
and x11@int64 x28 1048575@int64;
(* 	tst	x8, #0x1                                    #! PC = 0xaaaad4bb1a20 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* 	orr	x20, x11, #0xfffffe0000000000               #! PC = 0xaaaad4bb1a24 *)
or x20@int64 x11 (-2199023255552)@int64;

(*
reference: PC = 0xaaaae76b1b10
cv_cec -ov1 x7,x8 -ov2 x20,x8 reference.cl target.cl
Final result:					[OK]		0.2132 seconds
*)


(* 	csel	x12, x20, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1a28 *)
cmov x12 ne x20 0@sint64;	// ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1a2c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x15, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1a30 *)
subs dc x12_neg 0@sint64 x12;
cmov x15 ge x12_neg x12;	// ge = tcont;
(* 	add	x23, x8, x15                                #! PC = 0xaaaad4bb1a34 *)
adds dc x23 x8 x15;
(* 	cneg	x12, x3, ge	// ge = tcont                  #! PC = 0xaaaad4bb1a38 *)
subs dc x3_neg 0@sint64 x3;
cmov x12 ge x3_neg x3;	// ge = tcont;
(* 	add	x15, x12, #0x2                              #! PC = 0xaaaad4bb1a3c *)
add x15 x12 0x2@sint64;
(* 	csel	x9, x8, x20, ge	// ge = tcont              #! PC = 0xaaaad4bb1a40 *)
cmov x9 ge x8 x20;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1b30
cv_cec -ov1 x3,x7,x8 -ov2 x15,x9,x23 reference.cl target.cl
Final result:					[OK]		0.1991 seconds
*)

(* 	tst	x23, #0x2                                   #! PC = 0xaaaad4bb1a44 *)
spl dc x23_lo x23 2;
spl x23_target dc x23_lo 1;
and ne@bit x23_target 1@bit;
(* 	csel	x24, x9, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1a48 *)
cmov x24 ne x9 0@sint64;	// ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1a4c *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x12, x24, ge	// ge = tcont                 #! PC = 0xaaaad4bb1a50 *)
subs dc x24_neg 0@sint64 x24;
cmov x12 ge x24_neg x24;	// ge = tcont;
(* 	asr	x11, x23, #1                                #! PC = 0xaaaad4bb1a54 *)
split x11 dc x23 1;
(* 	add	x7, x11, x12                                #! PC = 0xaaaad4bb1a58 *)
adds dc x7 x11 x12;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1a5c *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;	// ge = tcont;
(* 	add	x29, x15, #0x2                              #! PC = 0xaaaad4bb1a60 *)
add x29 x15 0x2@sint64;
(* 	csel	x25, x11, x9, ge	// ge = tcont             #! PC = 0xaaaad4bb1a64 *)
cmov x25 ge x11 x9;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1b54
cv_cec -ov1 x3,x7,x8 -ov2 x29,x25,x7 reference.cl target.cl
Final result:					[OK]		0.2070 seconds
*)


(* 	tst	x7, #0x2                                    #! PC = 0xaaaad4bb1a68 *)
spl dc x7_lo x7 2;
spl x7_target dc x7_lo 1;
and ne@bit x7_target 1@bit;
(* 	csel	x12, x25, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1a6c *)
cmov x12 ne x25 0@sint64;	// ne = any;
(* 	ccmp	x29, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1a70 *)
spl ge dc x29 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x24, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1a74 *)
subs dc x12_neg 0@sint64 x12;
cmov x24 ge x12_neg x12;	// ge = tcont;
(* 	asr	x9, x7, #1                                  #! PC = 0xaaaad4bb1a78 *)
split x9 dc x7 1;
(* 	add	x7, x9, x24                                 #! PC = 0xaaaad4bb1a7c *)
adds dc x7 x9 x24;
(* 	cneg	x15, x29, ge	// ge = tcont                 #! PC = 0xaaaad4bb1a80 *)
subs dc x29_neg 0@sint64 x29;
cmov x15 ge x29_neg x29;	// ge = tcont;
(* 	add	x20, x15, #0x2                              #! PC = 0xaaaad4bb1a84 *)
add x20 x15 0x2@sint64;
(* 	csel	x29, x9, x25, ge	// ge = tcont             #! PC = 0xaaaad4bb1a88 *)
cmov x29 ge x9 x25;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1b78
cv_cec -ov1 x3,x7,x8 -ov2 x20,x29,x7 reference.cl target.cl
Final result:					[OK]		0.2167 seconds
*)


(* 	tst	x7, #0x2                                    #! PC = 0xaaaad4bb1a8c *)
spl dc x7_lo x7 2;
spl x7_target dc x7_lo 1;
and ne@bit x7_target 1@bit;
(* 	csel	x12, x29, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1a90 *)
cmov x12 ne x29 0@sint64;	// ne = any;
(* 	ccmp	x20, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1a94 *)
spl ge dc x20 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1a98 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;	// ge = tcont;
(* 	asr	x25, x7, #1                                 #! PC = 0xaaaad4bb1a9c *)
split x25 dc x7 1;
(* 	add	x15, x25, x12                               #! PC = 0xaaaad4bb1aa0 *)
adds dc x15 x25 x12;
(* 	cneg	x12, x20, ge	// ge = tcont                 #! PC = 0xaaaad4bb1aa4 *)
subs dc x20_neg 0@sint64 x20;
cmov x12 ge x20_neg x20;	// ge = tcont;
(* 	uzp1	v14.4s, v22.4s, v26.4s                     #! PC = 0xaaaad4bb1aa8 *)
cast %v22@int32[4] %v22;
cast %v26@int32[4] %v26;
mov %v14@int32[4] [%v22[0], %v22[2], %v26[0], %v26[2]];
(* 	add	x12, x12, #0x2                              #! PC = 0xaaaad4bb1aac *)
add x12 x12 0x2@sint64;
(* 	csel	x9, x25, x29, ge	// ge = tcont             #! PC = 0xaaaad4bb1ab0 *)
cmov x9 ge x25 x29;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1b9c
cv_cec -ov1 x3,x7,x8 -ov2 x12,x9,x15 reference.cl target.cl
Final result:					[OK]		0.1999 seconds
*)

(* 	tst	x15, #0x2                                   #! PC = 0xaaaad4bb1ab4 *)
spl dc x15_lo x15 2;
spl x15_target dc x15_lo 1;
and ne@bit x15_target 1@bit;
(* 	csel	x7, x9, xzr, ne	// ne = any                #! PC = 0xaaaad4bb1ab8 *)
cmov x7 ne x9 0@sint64;	// ne = any;
(* 	ccmp	x12, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1abc *)
spl ge dc x12 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	smlal	v23.2d, v14.2s, v3.s[0]                   #! PC = 0xaaaad4bb1ac0 *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;
(* 	cneg	x25, x7, ge	// ge = tcont                  #! PC = 0xaaaad4bb1ac4 *)
subs dc x7_neg 0@sint64 x7;
cmov x25 ge x7_neg x7;	// ge = tcont;
(* 	asr	x8, x15, #1                                 #! PC = 0xaaaad4bb1ac8 *)
split x8 dc x15 1;
(* 	smlal2	v23.2d, v14.4s, v3.s[2]                  #! PC = 0xaaaad4bb1acc *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;
(* 	add	x7, x8, x25                                 #! PC = 0xaaaad4bb1ad0 *)
adds dc x7 x8 x25;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1ad4 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;	// ge = tcont;
(* 	add	x25, x12, #0x2                              #! PC = 0xaaaad4bb1ad8 *)
add x25 x12 2@int64;
(* 	smlal	v23.2d, v13.2s, v3.s[1]                   #! PC = 0xaaaad4bb1adc *)
broadcast %tmp1@int32[2] 2 [%v3[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;
(* 	smlal2	v23.2d, v13.4s, v3.s[3]                  #! PC = 0xaaaad4bb1ae0 *)
broadcast %tmp1@int32[2] 2 [%v3[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;

(*
reference: PC = 0xaaaae76b1a24
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v23_0,VEC_v23_1  reference.cl target.cl
Final result:					[OK]		0.2570 seconds
*)

(* 	csel	x9, x8, x9, ge	// ge = tcont               #! PC = 0xaaaad4bb1ae4 *)
cmov x9 ge x8 x9;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1bc0
cv_cec -ov1 x3,x7,x8 -ov2 x25,x9,x7 reference.cl target.cl
Final result:					[OK]		0.2212 seconds
*)

(* 	tst	x7, #0x2                                    #! PC = 0xaaaad4bb1ae8 *)
spl dc x7_lo x7 2;
spl x7_target dc x7_lo 1;
and ne@bit x7_target 1@bit;
(* 	csel	x17, x9, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1aec *)
cmov x17 ne x9 0@sint64;	// ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1af0 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x12, x17, ge	// ge = tcont                 #! PC = 0xaaaad4bb1af4 *)
subs dc x17_neg 0@sint64 x17;
cmov x12 ge x17_neg x17;	// ge = tcont;
(* 	asr	x15, x7, #1                                 #! PC = 0xaaaad4bb1af8 *)
split x15 dc x7 1;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1afc *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;	// ge = tcont;
(* 	add	x7, x15, x12                                #! PC = 0xaaaad4bb1b00 *)
adds dc x7 x15 x12;
(* 	sshr	v23.2d, v23.2d, #30                        #! PC = 0xaaaad4bb1b04 *)
cast %v23@int64[2] %v23;
split %v23 %dc %v23 30;

(*
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v23_0,VEC_v23_1  reference.cl target.cl
Final result:					[OK]		0.2676 seconds
*)

(* 	csel	x24, x15, x9, ge	// ge = tcont             #! PC = 0xaaaad4bb1b08 *)
cmov x24 ge x15 x9;	// ge = tcont;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb1b0c *)
add x25 x25 0x2@sint64;

(*
reference: PC = 0xaaaae76b1be4
cv_cec -ov1 x3,x7,x8 -ov2 x25,x24,x7 reference.cl target.cl
Final result:					[OK]		0.2085 seconds
*)

(* 	tst	x7, #0x2                                    #! PC = 0xaaaad4bb1b10 *)
spl dc x7_lo x7 2;
spl x7_target dc x7_lo 1;
and ne@bit x7_target 1@bit;
(* 	csel	x15, x24, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1b14 *)
cmov x15 ne x24 0@sint64;	// ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1b18 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	smlal	v23.2d, v14.2s, v3.s[1]                   #! PC = 0xaaaad4bb1b1c *)
broadcast %tmp1@int32[2] 2 [%v3[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;
(* 	cneg	x12, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1b20 *)
subs dc x15_neg 0@sint64 x15;
cmov x12 ge x15_neg x15;	// ge = tcont;
(* 	asr	x15, x7, #1                                 #! PC = 0xaaaad4bb1b24 *)
split x15 dc x7 1;
(* 	smlal2	v23.2d, v14.4s, v3.s[3]                  #! PC = 0xaaaad4bb1b28 *)
broadcast %tmp1@int32[2] 2 [%v3[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;
(* 	add	x7, x15, x12                                #! PC = 0xaaaad4bb1b2c *)
adds dc x7 x15 x12;
(* 	cneg	x12, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1b30 *)
subs dc x25_neg 0@sint64 x25;
cmov x12 ge x25_neg x25;	// ge = tcont;
(* 	add	x8, x12, #0x2                               #! PC = 0xaaaad4bb1b34 *)
add x8 x12 0x2@sint64;
(* 	smlal	v23.2d, v13.2s, v4.s[0]                   #! PC = 0xaaaad4bb1b38 *)
broadcast %tmp1@int32[2] 2 [%v4[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;
(* 	csel	x24, x15, x24, ge	// ge = tcont            #! PC = 0xaaaad4bb1b3c *)
cmov x24 ge x15 x24;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1c08
cv_cec -ov1 x3,x7,x8 -ov2 x8,x24,x7 reference.cl target.cl
Final result:					[OK]		0.2085 seconds
*)

(* 	tst	x7, #0x2                                    #! PC = 0xaaaad4bb1b40 *)
spl dc x7_lo x7 2;
spl x7_target dc x7_lo 1;
and ne@bit x7_target 1@bit;
(* 	smlal2	v23.2d, v13.4s, v4.s[2]                  #! PC = 0xaaaad4bb1b44 *)
broadcast %tmp1@int32[2] 2 [%v4[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v23@int64[2] %v23 %tmp3;

(*
reference: PC = 0xaaaae76b1a38
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v23_0,VEC_v23_1  reference.cl target.cl
Final result:					[OK]		0.5781 seconds
*)

(* 	csel	x12, x24, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1b48 *)
cmov x12 ne x24 0@sint64;	// ne = any;
(* 	ccmp	x8, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1b4c *)
spl ge dc x8 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x9, x12, ge	// ge = tcont                  #! PC = 0xaaaad4bb1b50 *)
subs dc x12_neg 0@sint64 x12;
cmov x9 ge x12_neg x12;	// ge = tcont;
(* 	asr	x7, x7, #1                                  #! PC = 0xaaaad4bb1b54 *)
split x7 dc x7 1;
(* 	add	x25, x7, x9                                 #! PC = 0xaaaad4bb1b58 *)
adds dc x25 x7 x9;
(* 	cneg	x12, x8, ge	// ge = tcont                  #! PC = 0xaaaad4bb1b5c *)
subs dc x8_neg 0@sint64 x8;
cmov x12 ge x8_neg x8;	// ge = tcont;
(* 	add	x15, x12, #0x2                              #! PC = 0xaaaad4bb1b60 *)
add x15 x12 0x2@sint64;
(* 	sshr	v3.2d, v23.2d, #30                         #! PC = 0xaaaad4bb1b64 *)
cast %v23@int64[2] %v23;
split %v3 %dc %v23 30;

(*
reference: PC = 0xaaaae76b1a40
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v3_0,VEC_v3_1  reference.cl target.cl
Final result:					[OK]		0.3977 seconds
*)

(* 	csel	x23, x7, x24, ge	// ge = tcont             #! PC = 0xaaaad4bb1b68 *)
cmov x23 ge x7 x24;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1c2c
cv_cec -ov1 x3,x7,x8 -ov2 x15,x23,x25 reference.cl target.cl
Final result:					[OK]		0.2596 seconds
*)

(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb1b6c *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x20, x23, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1b70 *)
cmov x20 ne x23 0@sint64;	// ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1b74 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	smlal	v3.2d, v14.2s, v4.s[0]                    #! PC = 0xaaaad4bb1b78 *)
broadcast %tmp1@int32[2] 2 [%v4[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v3@int64[2] %v3 %tmp3;
(* 	asr	x29, x25, #1                                #! PC = 0xaaaad4bb1b7c *)
split x29 dc x25 1;
(* 	cneg	x1, x20, ge	// ge = tcont                  #! PC = 0xaaaad4bb1b80 *)
subs dc x20_neg 0@sint64 x20;
cmov x1 ge x20_neg x20;	// ge = tcont;
(* 	smlal2	v3.2d, v14.4s, v4.s[2]                   #! PC = 0xaaaad4bb1b84 *)
broadcast %tmp1@int32[2] 2 [%v4[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v3@int64[2] %v3 %tmp3;
(* 	add	x9, x29, x1                                 #! PC = 0xaaaad4bb1b88 *)
adds dc x9 x29 x1;
(* 	cneg	x1, x15, ge	// ge = tcont                  #! PC = 0xaaaad4bb1b8c *)
subs dc x15_neg 0@sint64 x15;
cmov x1 ge x15_neg x15;	// ge = tcont;
(* 	add	x26, x1, #0x2                               #! PC = 0xaaaad4bb1b90 *)
add x26 x1 0x2@sint64;
(* 	smlal	v3.2d, v13.2s, v4.s[1]                    #! PC = 0xaaaad4bb1b94 *)
broadcast %tmp1@int32[2] 2 [%v4[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v3@int64[2] %v3 %tmp3;
(* 	smlal2	v3.2d, v13.4s, v4.s[3]                   #! PC = 0xaaaad4bb1b98 *)
broadcast %tmp1@int32[2] 2 [%v4[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v3@int64[2] %v3 %tmp3;

(*
reference: PC = 0xaaaae76b1a50
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v3_0,VEC_v3_1  reference.cl target.cl
Final result:					[OK]		0.6640 seconds
*)

(* 	csel	x29, x29, x23, ge	// ge = tcont            #! PC = 0xaaaad4bb1b9c *)
cmov x29 ge x29 x23;	// ge = tcont;

(*
cv_cec -ov1 x3,x7,x8 -ov2 x26,x29,x9 reference.cl target.cl
Final result:					[OK]		0.2259 seconds
*)

(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1ba0 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x17, x29, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1ba4 *)
cmov x17 ne x29 0@sint64;	// ne = any;
(* 	ccmp	x26, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1ba8 *)
spl ge dc x26 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x12, x17, ge	// ge = tcont                 #! PC = 0xaaaad4bb1bac *)
subs dc x17_neg 0@sint64 x17;
cmov x12 ge x17_neg x17;	// ge = tcont;
(* 	asr	x8, x9, #1                                  #! PC = 0xaaaad4bb1bb0 *)
split x8 dc x9 1;
(* 	add	x25, x8, x12                                #! PC = 0xaaaad4bb1bb4 *)
adds dc x25 x8 x12;
(* 	cneg	x3, x26, ge	// ge = tcont                  #! PC = 0xaaaad4bb1bb8 *)
subs dc x26_neg 0@sint64 x26;
cmov x3 ge x26_neg x26;	// ge = tcont;
(* 	sshr	v31.2d, v3.2d, #30                         #! PC = 0xaaaad4bb1bbc *)
cast %v3@int64[2] %v3;
split %v31 %dc %v3 30;

(*
reference: PC = 0xaaaae76b1a58
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v31_0,VEC_v31_1  reference.cl target.cl
Final result:					[OK]		0.6181 seconds
*)

(* 	add	x15, x3, #0x2                               #! PC = 0xaaaad4bb1bc0 *)
add x15 x3 0x2@sint64;
(* 	csel	x20, x8, x29, ge	// ge = tcont             #! PC = 0xaaaad4bb1bc4 *)
cmov x20 ge x8 x29;	// ge = tcont;

(*
cv_cec -ov1 x3,x7,x8 -ov2 x15,x20,x25 reference.cl target.cl
Final result:					[OK]		0.2478 seconds
*)

(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb1bc8 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x3, x20, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1bcc *)
cmov x3 ne x20 0@sint64;	// ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1bd0 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	smlal	v31.2d, v14.2s, v4.s[1]                   #! PC = 0xaaaad4bb1bd4 *)
broadcast %tmp1@int32[2] 2 [%v4[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v31@int64[2] %v31 %tmp3;
(* 	asr	x25, x25, #1                                #! PC = 0xaaaad4bb1bd8 *)
split x25 dc x25 1;
(* 	cneg	x12, x3, ge	// ge = tcont                  #! PC = 0xaaaad4bb1bdc *)
subs dc x3_neg 0@sint64 x3;
cmov x12 ge x3_neg x3;	// ge = tcont;
(* 	smlal2	v31.2d, v14.4s, v4.s[3]                  #! PC = 0xaaaad4bb1be0 *)
broadcast %tmp1@int32[2] 2 [%v4[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v31@int64[2] %v31 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1be4 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;	// ge = tcont;
(* 	add	x24, x25, x12                               #! PC = 0xaaaad4bb1be8 *)
adds dc x24 x25 x12;
(* 	smlal	v31.2d, v13.2s, v5.s[0]                   #! PC = 0xaaaad4bb1bec *)
broadcast %tmp1@int32[2] 2 [%v5[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v31@int64[2] %v31 %tmp3;
(* 	add	x7, x15, #0x2                               #! PC = 0xaaaad4bb1bf0 *)
add x7 x15 0x2@sint64;
(* 	smlal2	v31.2d, v13.4s, v5.s[2]                  #! PC = 0xaaaad4bb1bf4 *)
broadcast %tmp1@int32[2] 2 [%v5[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v31@int64[2] %v31 %tmp3;

(*
reference: PC = 0xaaaae76b1a70
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v31_0,VEC_v31_1  reference.cl target.cl
Final result:					[OK]		0.9105 seconds
*)

(* 	csel	x15, x25, x20, ge	// ge = tcont            #! PC = 0xaaaad4bb1bf8 *)
cmov x15 ge x25 x20;	// ge = tcont;

(*
cv_cec -ov1 x3,x7,x8 -ov2 x7,x15,x24 reference.cl target.cl
Final result:					[OK]		0.2597 seconds
*)

(* 	tst	x24, #0x2                                   #! PC = 0xaaaad4bb1bfc *)
spl dc x24_lo x24 2;
spl x24_target dc x24_lo 1;
and ne@bit x24_target 1@bit;
(* 	csel	x12, x15, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1c00 *)
cmov x12 ne x15 0@sint64;	// ne = any;
(* 	ccmp	x7, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1c04 *)
spl ge dc x7 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x25, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1c08 *)
subs dc x12_neg 0@sint64 x12;
cmov x25 ge x12_neg x12;	// ge = tcont;
(* 	asr	x12, x24, #1                                #! PC = 0xaaaad4bb1c0c *)
split x12 dc x24 1;
(* 	add	x25, x12, x25                               #! PC = 0xaaaad4bb1c10 *)
adds dc x25 x12 x25;
(* 	cneg	x23, x7, ge	// ge = tcont                  #! PC = 0xaaaad4bb1c14 *)
subs dc x7_neg 0@sint64 x7;
cmov x23 ge x7_neg x7;	// ge = tcont;
(* 	sshr	v4.2d, v31.2d, #30                         #! PC = 0xaaaad4bb1c18 *)
split %v4 %dc %v31 30;

(*
reference: PC = 0xaaaae76b1a78
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v4_0,VEC_v4_1  reference.cl target.cl
Final result:					[OK]		0.9293 seconds
*)

(* 	add	x9, x23, #0x2                               #! PC = 0xaaaad4bb1c1c *)
add x9 x23 0x2@sint64;
(* 	csel	x24, x12, x15, ge	// ge = tcont            #! PC = 0xaaaad4bb1c20 *)
cmov x24 ge x12 x15;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1cbc
cv_cec -ov1 x3,x7,x8 -ov2 x9,x24,x25 reference.cl target.cl
Final result:					[OK]		0.2542 seconds
*)

(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb1c24 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x15, x24, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1c28 *)
cmov x15 ne x24 0@sint64;	// ne = any;
(* 	ccmp	x9, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1c2c *)
spl ge dc x9 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	smlal	v4.2d, v14.2s, v5.s[0]                    #! PC = 0xaaaad4bb1c30 *)
broadcast %tmp1@int32[2] 2 [%v5[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v4@int64[2] %v4 %tmp3;
(* 	cneg	x12, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1c34 *)
subs dc x15_neg 0@sint64 x15;
cmov x12 ge x15_neg x15;	// ge = tcont;
(* 	asr	x25, x25, #1                                #! PC = 0xaaaad4bb1c38 *)
split x25 dc x25 1;
(* 	add	x7, x25, x12                                #! PC = 0xaaaad4bb1c3c *)
adds dc x7 x25 x12;
(* 	cneg	x30, x9, ge	// ge = tcont                  #! PC = 0xaaaad4bb1c40 *)
subs dc x9_neg 0@sint64 x9;
cmov x30 ge x9_neg x9;	// ge = tcont;
(* 	smlal2	v4.2d, v14.4s, v5.s[2]                   #! PC = 0xaaaad4bb1c44 *)
broadcast %tmp1@int32[2] 2 [%v5[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v4@int64[2] %v4 %tmp3;
(* 	smlal	v4.2d, v13.2s, v5.s[1]                    #! PC = 0xaaaad4bb1c48 *)
broadcast %tmp1@int32[2] 2 [%v5[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v4@int64[2] %v4 %tmp3;
(* 	add	x15, x30, #0x2                              #! PC = 0xaaaad4bb1c4c *)
add x15 x30 0x2@sint64;
(* 	csel	x27, x25, x24, ge	// ge = tcont            #! PC = 0xaaaad4bb1c50 *)
cmov x27 ge x25 x24;	// ge = tcont;

(*
cv_cec -ov1 x3,x7,x8 -ov2 x15,x27,x7 reference.cl target.cl
Final result:					[OK]		0.2426 seconds
*)

(* 	smlal2	v4.2d, v13.4s, v5.s[3]                   #! PC = 0xaaaad4bb1c54 *)
broadcast %tmp1@int32[2] 2 [%v5[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v4@int64[2] %v4 %tmp3;

(*
reference: PC = 0xaaaae76b1a88
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v4_0,VEC_v4_1  reference.cl target.cl
Final result:					[OK]		1.1150 seconds
*)

(* 	tst	x7, #0x2                                    #! PC = 0xaaaad4bb1c58 *)
spl dc x7_lo x7 2;
spl x7_target dc x7_lo 1;
and ne@bit x7_target 1@bit;
(* 	csel	x12, x27, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1c5c *)
cmov x12 ne x27 0@sint64;	// ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1c60 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x14, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1c64 *)
subs dc x12_neg 0@sint64 x12;
cmov x14 ge x12_neg x12;	// ge = tcont;
(* 	asr	x7, x7, #1                                  #! PC = 0xaaaad4bb1c68 *)
split x7 dc x7 1;
(* 	add	x25, x7, x14                                #! PC = 0xaaaad4bb1c6c *)
adds dc x25 x7 x14;
(* 	cneg	x12, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1c70 *)
subs dc x15_neg 0@sint64 x15;
cmov x12 ge x15_neg x15;	// ge = tcont;
(* 	add	x15, x12, #0x2                              #! PC = 0xaaaad4bb1c74 *)
add x15 x12 0x2@sint64;
(* 	csel	x7, x7, x27, ge	// ge = tcont              #! PC = 0xaaaad4bb1c78 *)
cmov x7 ge x7 x27;	// ge = tcont;

(*
cv_cec -ov1 x3,x7,x8 -ov2 x15,x7,x25 reference.cl target.cl
Final result:					[OK]		0.2330 seconds
*)

(* 	sshr	v28.2d, v4.2d, #30                         #! PC = 0xaaaad4bb1c7c *)
split %v28 %dc %v4 30;

(*
reference: PC = 0xaaaae76b1a90
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v28_0,VEC_v28_1  reference.cl target.cl
Final result:					[OK]		1.0976 seconds
*)

(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb1c80 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1c84 *)
cmov x12 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1c88 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1c8c *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;	// ge = tcont;
(* 	asr	x25, x25, #1                                #! PC = 0xaaaad4bb1c90 *)
split x25 dc x25 1;
(* 	smlal	v28.2d, v14.2s, v5.s[1]                   #! PC = 0xaaaad4bb1c94 *)
broadcast %tmp1@int32[2] 2 [%v5[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v28@int64[2] %v28 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1c98 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;	// ge = tcont;
(* 	add	x12, x25, x12                               #! PC = 0xaaaad4bb1c9c *)
adds dc x12 x25 x12;
(* 	smlal2	v28.2d, v14.4s, v5.s[3]                  #! PC = 0xaaaad4bb1ca0 *)
broadcast %tmp1@int32[2] 2 [%v5[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v28@int64[2] %v28 %tmp3;
(* 	smlal	v28.2d, v13.2s, v6.s[0]                   #! PC = 0xaaaad4bb1ca4 *)
broadcast %tmp1@int32[2] 2 [%v6[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v28@int64[2] %v28 %tmp3;
(* 	add	x16, x15, #0x2                              #! PC = 0xaaaad4bb1ca8 *)
add x16 x15 0x2@sint64;
(* 	smlal2	v28.2d, v13.4s, v6.s[2]                  #! PC = 0xaaaad4bb1cac *)
broadcast %tmp1@int32[2] 2 [%v6[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v28@int64[2] %v28 %tmp3;

(*
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v28_0,VEC_v28_1  reference.cl target.cl
Final result:					[OK]		1.4970 seconds
*)

(* 	csel	x15, x25, x7, ge	// ge = tcont             #! PC = 0xaaaad4bb1cb0 *)
cmov x15 ge x25 x7;	// ge = tcont;

(*
reference: PC = 0xaaaae76b1d28
cv_cec -ov1 x3,x7,x8 -ov2 x16,x15,x12 reference.cl target.cl
Final result:					[OK]		0.2383 seconds
*)

(* 	tst	x12, #0x2                                   #! PC = 0xaaaad4bb1cb4 *)
spl dc x12_lo x12 2;
spl x12_target dc x12_lo 1;
and ne@bit x12_target 1@bit;
(* 	csel	x25, x15, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1cb8 *)
cmov x25 ne x15 0@sint64;	// ne = any;
(* 	ccmp	x16, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1cbc *)
spl ge dc x16 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x7, x25, ge	// ge = tcont                  #! PC = 0xaaaad4bb1cc0 *)
subs dc x25_neg 0@sint64 x25;
cmov x7 ge x25_neg x25;	// ge = tcont;
(* 	asr	x27, x12, #1                                #! PC = 0xaaaad4bb1cc4 *)
split x27 dc x12 1;
(* 	add	x26, x27, x7                                #! PC = 0xaaaad4bb1cc8 *)
adds dc x26 x27 x7;
(* 	cneg	x12, x16, ge	// ge = tcont                 #! PC = 0xaaaad4bb1ccc *)
subs dc x16_neg 0@sint64 x16;
cmov x12 ge x16_neg x16;	// ge = tcont;
(* 	add	x25, x12, #0x2                              #! PC = 0xaaaad4bb1cd0 *)
add x25 x12 0x2@sint64;
(* 	sshr	v5.2d, v28.2d, #30                         #! PC = 0xaaaad4bb1cd4 *)
split %v5 %dc %v28 30;

(*
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v5_0,VEC_v5_1  reference.cl target.cl
Final result:					[OK]		1.5201 seconds
*)

(* 	csel	x7, x27, x15, ge	// ge = tcont             #! PC = 0xaaaad4bb1cd8 *)
cmov x7 ge x27 x15;	// ge = tcont;

(*
cv_cec -ov1 x3,x7,x8 -ov2 x25,x7,x26 reference.cl target.cl
Final result:					[OK]		0.2627 seconds
*)

(* 	tst	x26, #0x2                                   #! PC = 0xaaaad4bb1cdc *)
spl dc x26_lo x26 2;
spl x26_target dc x26_lo 1;
and ne@bit x26_target 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1ce0 *)
cmov x12 ne x7 0@sint64;	// ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1ce4 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	asr	x9, x26, #1                                 #! PC = 0xaaaad4bb1ce8 *)
split x9 dc x26 1;
(* 	smlal	v5.2d, v14.2s, v6.s[0]                    #! PC = 0xaaaad4bb1cec *)
broadcast %tmp1@int32[2] 2 [%v6[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v5@int64[2] %v5 %tmp3;
(* 	cneg	x15, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1cf0 *)
subs dc x12_neg 0@sint64 x12;
cmov x15 ge x12_neg x12;	// ge = tcont;
(* 	cneg	x12, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1cf4 *)
subs dc x25_neg 0@sint64 x25;
cmov x12 ge x25_neg x25;	// ge = tcont;
(* 	add	x8, x9, x15                                 #! PC = 0xaaaad4bb1cf8 *)
adds dc x8 x9 x15;
(* 	smlal2	v5.2d, v14.4s, v6.s[2]                   #! PC = 0xaaaad4bb1cfc *)
broadcast %tmp1@int32[2] 2 [%v6[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v5@int64[2] %v5 %tmp3;
(* 	add	x25, x12, #0x2                              #! PC = 0xaaaad4bb1d00 *)
add x25 x12 0x2@sint64;
(* 	and	v0.16b, v4.16b, v1.16b                      #! PC = 0xaaaad4bb1d04 *)
cast %v1@int64[2] %v1;
and %v0@int64[2] %v4 %v1;

(*
reference PC = 0xaaaae76b1a8c
cv_cec -ov1 VEC_v17_0,VEC_v17_1 -ov2 VEC_v0_0,VEC_v0_1  reference.cl target.cl
Final result:					[OK]		1.1618 seconds
*)

(* 	smlal	v5.2d, v13.2s, v6.s[1]                    #! PC = 0xaaaad4bb1d08 *)
broadcast %tmp1@int32[2] 2 [%v6[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v5@int64[2] %v5 %tmp3;
(* 	smlal2	v5.2d, v13.4s, v6.s[3]                   #! PC = 0xaaaad4bb1d0c *)
broadcast %tmp1@int32[2] 2 [%v6[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v5@int64[2] %v5 %tmp3;

(*
reference PC = 0xaaaae76b1ac4
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v5_0,VEC_v5_1  reference.cl target.cl
Final result:					[OK]		1.9107 seconds
*)

(* 	csel	x9, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb1d10 *)
cmov x9 ge x9 x7;	// ge = tcont;

(*
reference PC = 0xaaaae76b1d70
cv_cec -ov1 x3,x7,x8 -ov2 x25,x9,x8 reference.cl target.cl
Final result:					[OK]		0.2635 seconds
*)

(* 	tst	x8, #0x2                                    #! PC = 0xaaaad4bb1d14 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* 	asr	x8, x8, #1                                  #! PC = 0xaaaad4bb1d18 *)
split x8 dc x8 1;
(* 	csel	x7, x9, xzr, ne	// ne = any                #! PC = 0xaaaad4bb1d1c *)
cmov x7 ne x9 0@sint64;	// ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1d20 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x12, x7, ge	// ge = tcont                  #! PC = 0xaaaad4bb1d24 *)
subs dc x7_neg 0@sint64 x7;
cmov x12 ge x7_neg x7;	// ge = tcont;
(* 	cneg	x15, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1d28 *)
subs dc x25_neg 0@sint64 x25;
cmov x15 ge x25_neg x25;	// ge = tcont;
(* 	add	x12, x8, x12                                #! PC = 0xaaaad4bb1d2c *)
adds dc x12 x8 x12;
(* 	add	x7, x15, #0x2                               #! PC = 0xaaaad4bb1d30 *)
add x7 x15 0x2@sint64;
(* 	sshr	v19.2d, v5.2d, #30                         #! PC = 0xaaaad4bb1d34 *)
split %v19 %dc %v5 30;

(*
reference PC = 0xaaaae76b1ac8
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v19_0,VEC_v19_1  reference.cl target.cl
Final result:					[OK]		1.7106 seconds
*)

(* 	asr	x25, x12, #1                                #! PC = 0xaaaad4bb1d38 *)
split x25 dc x12 1;
(* 	csel	x9, x8, x9, ge	// ge = tcont               #! PC = 0xaaaad4bb1d3c *)
cmov x9 ge x8 x9;	// ge = tcont;

(*
reference PC = 0xaaaae76b1d94
cv_cec -ov1 x3,x7,x8 -ov2 x7,x9,x12 reference.cl target.cl
Final result:					[OK]		0.3022 seconds
*)

(* 	tst	x12, #0x2                                   #! PC = 0xaaaad4bb1d40 *)
spl dc x12_lo x12 2;
spl x12_target dc x12_lo 1;
and ne@bit x12_target 1@bit;
(* 	and	v21.16b, v3.16b, v1.16b                     #! PC = 0xaaaad4bb1d44 *)
and %v21@int64[2] %v3 %v1;

(*
reference PC = 0xaaaae76b1a54
cv_cec -ov1 VEC_v17_0,VEC_v17_1 -ov2 VEC_v21_0,VEC_v21_1  reference.cl target.cl
Final result:					[OK]		0.6758 seconds
*)

(* 	csel	x12, x9, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1d48 *)
cmov x12 ne x9 0@sint64;	// ne = any;
(* 	ccmp	x7, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1d4c *)
spl ge dc x7 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	shl	v29.2d, v0.2d, #32                          #! PC = 0xaaaad4bb1d50 *)
mov [v0_sint64_0, v0_sint64_1] %v0;
shl v0_sint64_0 v0_sint64_0 32;
shl v0_sint64_1 v0_sint64_1 32;
mov %v29@int64[2] [v0_sint64_0, v0_sint64_1];

(*
reference PC = 0xaaaae76b1a94
cv_cec -ov1 VEC_v17_0,VEC_v17_1 -ov2 VEC_v29_0,VEC_v29_1  reference.cl target.cl
Final result:					[OK]		1.0039 seconds
*)

(* 	smlal	v19.2d, v14.2s, v6.s[1]                   #! PC = 0xaaaad4bb1d54 *)
broadcast %tmp1@int32[2] 2 [%v6[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v19@int64[2] %v19 %tmp3;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1d58 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;	// ge = tcont;
(* 	smlal2	v19.2d, v14.4s, v6.s[3]                  #! PC = 0xaaaad4bb1d5c *)
broadcast %tmp1@int32[2] 2 [%v6[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v19@int64[2] %v19 %tmp3;
(* 	add	x12, x25, x12                               #! PC = 0xaaaad4bb1d60 *)
adds dc x12 x25 x12;
(* 	cneg	x15, x7, ge	// ge = tcont                  #! PC = 0xaaaad4bb1d64 *)
subs dc x7_neg 0@sint64 x7;
cmov x15 ge x7_neg x7;	// ge = tcont;
(* 	smlal	v19.2d, v13.2s, v7.s[0]                   #! PC = 0xaaaad4bb1d68 *)
broadcast %tmp1@int32[2] 2 [%v7[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v19@int64[2] %v19 %tmp3;
(* 	add	x27, x15, #0x2                              #! PC = 0xaaaad4bb1d6c *)
add x27 x15 0x2@sint64;
(* 	and	v18.16b, v31.16b, v1.16b                    #! PC = 0xaaaad4bb1d70 *)
and %v18@int64[2] %v31 %v1;

(*
reference PC = 0xaaaae76b1a74
cv_cec -ov1 VEC_v4_0,VEC_v4_1 -ov2 VEC_v18_0,VEC_v18_1  reference.cl target.cl
Final result:					[OK]		0.9230 seconds
*)

(* 	smlal2	v19.2d, v13.4s, v7.s[2]                  #! PC = 0xaaaad4bb1d74 *)
broadcast %tmp1@int32[2] 2 [%v7[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v19@int64[2] %v19 %tmp3;

(*
reference PC = 0xaaaae76b1ae0
cv_cec -ov1 VEC_v16_0,VEC_v16_1 -ov2 VEC_v19_0,VEC_v19_1  reference.cl target.cl
Final result:					[OK]		1.9490 seconds
*)

(* 	csel	x15, x25, x9, ge	// ge = tcont             #! PC = 0xaaaad4bb1d78 *)
cmov x15 ge x25 x9;	// ge = tcont;

(*
reference PC = 0xaaaae76b1db8
cv_cec -ov1 x3,x7,x8 -ov2 x27,x15,x12 reference.cl target.cl
Final result:					[OK]		0.2519 seconds
*)

(* 	tst	x12, #0x2                                   #! PC = 0xaaaad4bb1d7c *)
spl dc x12_lo x12 2;
spl x12_target dc x12_lo 1;
and ne@bit x12_target 1@bit;
(* 	asr	x25, x12, #1                                #! PC = 0xaaaad4bb1d80 *)
split x25 dc x12 1;
(* 	csel	x12, x15, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1d84 *)
cmov x12 ne x15 0@sint64;	// ne = any;
(* 	ccmp	x27, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1d88 *)
spl ge dc x27 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* 	cneg	x24, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb1d8c *)
subs dc x12_neg 0@sint64 x12;
cmov x24 ge x12_neg x12;	// ge = tcont;
(* 	csel	x12, x25, x15, ge	// ge = tcont            #! PC = 0xaaaad4bb1d90 *)
cmov x12 ge x25 x15;	// ge = tcont;
(* 	add	x15, x25, x24                               #! PC = 0xaaaad4bb1d94 *)
adds dc x15 x25 x24;
(* 	add	x7, x12, #0x100, lsl #12                    #! PC = 0xaaaad4bb1d98 *)
add x7 x12 1048576@int64;
(* 	add	x12, x12, x6                                #! PC = 0xaaaad4bb1d9c *)
add x12 x12 x6;
(* 	and	v6.16b, v5.16b, v1.16b                      #! PC = 0xaaaad4bb1da0 *)
and %v6@int64[2] %v5 %v1;
(* 	sshr	v16.2d, v19.2d, #30                        #! PC = 0xaaaad4bb1da4 *)
split %v16 %dc %v19 30;
(* 	asr	x12, x12, #42                               #! PC = 0xaaaad4bb1da8 *)
sars x12 dc x12 42;
(* 	asr	x16, x15, #1                                #! PC = 0xaaaad4bb1dac *)
split x16 dc x15 1;
(* 	lsl	x25, x7, #22                                #! PC = 0xaaaad4bb1db0 *)
shls dc x25 x7 22;
(* 	add	x8, x16, x6                                 #! PC = 0xaaaad4bb1db4 *)
add x8 x16 x6;
(* 	add	x15, x16, #0x100, lsl #12                   #! PC = 0xaaaad4bb1db8 *)
add x15 x16 1048576@int64;
(* 	asr	x11, x25, #43                               #! PC = 0xaaaad4bb1dbc *)
sars x11 dc x25 43;
(* 	mul	x7, x11, x28                                #! PC = 0xaaaad4bb1dc0 *)
cast x28@int64 x28;
mull dc x7 x11 x28;
(* 	smlal	v16.2d, v14.2s, v7.s[0]                   #! PC = 0xaaaad4bb1dc4 *)
broadcast %tmp1@int32[2] 2 [%v7[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	lsl	x25, x15, #22                               #! PC = 0xaaaad4bb1dc8 *)
shls dc x25 x15 22;
(* 	smlal2	v16.2d, v14.4s, v7.s[2]                  #! PC = 0xaaaad4bb1dcc *)
broadcast %tmp1@int32[2] 2 [%v7[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj  %tmp3@int64[2] %tmp1 %tmp2;
adds   %dc %v16@int64[2] %v16 %tmp3;
(* 	asr	x13, x25, #43                               #! PC = 0xaaaad4bb1dd0 *)
sars x13 dc x25 43;
(* 	shl	v5.2d, v21.2d, #32                          #! PC = 0xaaaad4bb1dd4 *)
mov [v21_sint64_0, v21_sint64_1] %v21;
shl v21_sint64_0 v21_sint64_0 32;
shl v21_sint64_1 v21_sint64_1 32;
mov %v5@int64[2] [v21_sint64_0, v21_sint64_1];
(* 	shl	v22.2d, v6.2d, #32                          #! PC = 0xaaaad4bb1dd8 *)
mov [v6_sint64_0, v6_sint64_1] %v6;
shl v6_sint64_0 v6_sint64_0 32;
shl v6_sint64_1 v6_sint64_1 32;
mov %v22@int64[2] [v6_sint64_0, v6_sint64_1];
(* 	mul	x15, x13, x28                               #! PC = 0xaaaad4bb1ddc *)
mull dc x15 x13 x28;
(* 	and	v27.16b, v23.16b, v1.16b                    #! PC = 0xaaaad4bb1de0 *)
and %v27@int64[2] %v23@int64[2] %v1@int64[2];
(* 	and	v7.16b, v28.16b, v1.16b                     #! PC = 0xaaaad4bb1de4 *)
and %v7@int64[2] %v28@int64[2] %v1@int64[2];
(* 	madd	x9, x12, x10, x7                           #! PC = 0xaaaad4bb1de8 *)
cast x10@int64 x10;
mull dc tmp x12 x10;
adds dc x9 tmp x7;
(* 	and	v0.16b, v16.16b, v1.16b                     #! PC = 0xaaaad4bb1dec *)
and %v0@int64[2] %v16@int64[2] %v1@int64[2];
(* 	asr	x14, x8, #42                                #! PC = 0xaaaad4bb1df0 *)
sars x14 dc x8 42;
(* 	madd	x15, x14, x10, x15                         #! PC = 0xaaaad4bb1df4 *)
mull dc tmp x14 x10;
adds dc x15 tmp x15;
(* 	and	v17.16b, v19.16b, v1.16b                    #! PC = 0xaaaad4bb1df8 *)
and %v17@int64[2] %v19@int64[2] %v1@int64[2];
(* 	shl	v26.2d, v0.2d, #32                          #! PC = 0xaaaad4bb1dfc *)
mov [v0_sint64_0, v0_sint64_1] %v0;
shl v0_sint64_0 v0_sint64_0 32;
shl v0_sint64_1 v0_sint64_1 32;
mov %v26@int64[2] [v0_sint64_0, v0_sint64_1];
(* 	orr	v3.16b, v27.16b, v5.16b                     #! PC = 0xaaaad4bb1e00 *)
or %v3@int64[2] %v27@int64[2] %v5@int64[2];
(* 	asr	x25, x9, #20                                #! PC = 0xaaaad4bb1e04 *)
sars x25 dc x9 20;
(* 	orr	v4.16b, v18.16b, v29.16b                    #! PC = 0xaaaad4bb1e08 *)
or %v4@int64[2] %v18@int64[2] %v29@int64[2];
(* 	cneg	x9, x27, ge	// ge = tcont                  #! PC = 0xaaaad4bb1e0c *)
subs dc x27_neg 0@sint64 x27;
cmov x9 ge x27_neg x27;	// ge = tcont;
(* 	mov	x1, x25                                     #! PC = 0xaaaad4bb1e10 *)
mov x1 x25;
(* 	orr	v5.16b, v7.16b, v22.16b                     #! PC = 0xaaaad4bb1e14 *)
or %v5@int64[2] %v7@int64[2] %v22@int64[2];
(* 	add	x3, x9, #0x2                                #! PC = 0xaaaad4bb1e18 *)
add x3 x9 0x2@sint64;
(* 	orr	v6.16b, v17.16b, v26.16b                    #! PC = 0xaaaad4bb1e1c *)
or %v6@int64[2] %v17@int64[2] %v26@int64[2];
(* 	sshr	v7.2d, v16.2d, #30                         #! PC = 0xaaaad4bb1e20 *)
split %v7 %dc %v16 30;
(* 	asr	x2, x15, #20                                #! PC = 0xaaaad4bb1e24 *)
sars x2 dc x15 20;

    # interleave intermediate
(*
cv_cec -ov x1,x2,x3,VEC_v3_0,VEC_v3_1,VEC_v4_0,VEC_v4_1,VEC_v5_0,VEC_v5_1,VEC_v6_0,VEC_v6_1,VEC_v7_0,VEC_v7_1  reference.cl target.cl
Final result:					[OK]		3.2774 seconds
*)

(* 	mov	w30, v4.s[0]                                #! PC = 0xaaaad4bb1e28 *)
cast %v4@uint32[4] %v4;
mov x30 %v4[0];
cast x30@uint64 x30;
(* 	and	x22, x2, #0xfffff                           #! PC = 0xaaaad4bb1e2c *)
and x22@int64 x2 1048575@int64;
(* 	and	x5, x1, #0xfffff                            #! PC = 0xaaaad4bb1e30 *)
and x5@int64 x1 1048575@int64;
(* 	orr	x16, x22, #0xc000000000000000               #! PC = 0xaaaad4bb1e34 *)
or x16@int64 x22 (-4611686018427387904)@int64;
(* 	tst	x16, #0x1                                   #! PC = 0xaaaad4bb1e38 *)
spl dc x16_lo x16 1;
and ne@bit x16_lo 1@bit;
(* 	orr	x4, x5, #0xfffffe0000000000                 #! PC = 0xaaaad4bb1e3c *)
or x4@int64 x5 (-2199023255552)@int64;
(* 	smull	v30.2d, v13.2s, v8.s[0]                   #! PC = 0xaaaad4bb1e40 *)
cast %v13@int32[4] %v13;
cast %v8@int32[4] %v8;
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v30@int64[2] %tmp1 %tmp2;
(* 	csel	x26, x4, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1e44 *)
cmov x26 ne x4 0@sint64;    // ne = any;
(* 	ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1e48 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;        // ne = any;
(* 	smlal2	v30.2d, v13.4s, v8.s[2]                  #! PC = 0xaaaad4bb1e4c *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v30@int64[2] %v30 %tmp3;
(* 	mov	w23, v3.s[0]                                #! PC = 0xaaaad4bb1e50 *)
cast %v3@uint32[4] %v3;
mov x23 %v3[0];
cast x23@uint64 x23;
(* 	mov	w21, v3.s[1]                                #! PC = 0xaaaad4bb1e54 *)
mov x21 %v3[1];
cast x21@uint64 x21;
(* 	cneg	x5, x26, ge	// ge = tcont                  #! PC = 0xaaaad4bb1e58 *)
subs dc x5_neg 0@sint64 x26;
cmov x5 ge x5_neg x26;      // ge = tcont;
(* 	add	x17, xzr, x30, lsr #4                       #! PC = 0xaaaad4bb1e5c *)
shrs x30_shr4 dc x30 4;
adds dc x17 0@uint64 x30_shr4;
(* 	cneg	x27, x3, ge	// ge = tcont                  #! PC = 0xaaaad4bb1e60 *)
subs dc x27_neg 0@sint64 x3;
cmov x27 ge x27_neg x3;     // ge = tcont;
(* 	add	x29, x16, x5                                #! PC = 0xaaaad4bb1e64 *)
adds dc x29 x16 x5;
(* 	mov	w28, v3.s[2]                                #! PC = 0xaaaad4bb1e68 *)
mov x28 %v3[2];
cast x28@uint64 x28;
(* 	mov	w20, v3.s[3]                                #! PC = 0xaaaad4bb1e6c *)
mov x20 %v3[3];
cast x20@uint64 x20;
(* 	add	x7, x27, #0x2                               #! PC = 0xaaaad4bb1e70 *)
add x7 x27 0x2@sint64;
(* 	csel	x8, x16, x4, ge	// ge = tcont              #! PC = 0xaaaad4bb1e74 *)
cmov x8 ge x16 x4;          // ge = tcont;
(* 	tst	x29, #0x2                                   #! PC = 0xaaaad4bb1e78 *)
spl dc x29_lo x29 2;
spl x29_target dc x29_lo 1;
and ne@bit x29_target 1@bit;
(* 	mul	v17.4s, v30.4s, v15.4s                      #! PC = 0xaaaad4bb1e7c *)
cast %v30@uint32[4] %v30;
cast %v15@uint32[4] %v15;
mull %dc %v17@uint32[4] %v30 %v15;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1e80 *)
cmov x15 ne x8 0@sint64;    // ne = any;
(* 	ccmp	x7, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1e84 *)
spl ge dc x7 63;
not ge@bit ge;
cmov ge ne ge 0@bit;        // ne = any;
(* 	mov	w26, v4.s[2]                                #! PC = 0xaaaad4bb1e88 *)
cast %v4@uint32[4] %v4;
mov x26 %v4[2];
cast x26@uint64 x26;
(* 	cneg	x25, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1e8c *)
subs dc x25_neg 0@sint64 x15;
cmov x25 ge x25_neg x15;    // ge = tcont;
(* 	asr	x9, x29, #1                                 #! PC = 0xaaaad4bb1e90 *)
split x9 dc x29 1;
(* 	mov	x15, #0x13                  	// #19         #! PC = 0xaaaad4bb1e94 *)
mov x15 19@int64;
(* 	add	x5, x9, x25                                 #! PC = 0xaaaad4bb1e98 *)
adds dc x5 x9 x25;
(* 	cneg	x25, x7, ge	// ge = tcont                  #! PC = 0xaaaad4bb1e9c *)
subs dc x25_neg 0@sint64 x7;
cmov x25 ge x25_neg x7;     // ge = tcont;
(* 	dup	v24.2d, x15                                 #! PC = 0xaaaad4bb1ea0 *)
broadcast %v24@int64[2] 2 [x15];
(* 	mov	w3, v4.s[1]                                 #! PC = 0xaaaad4bb1ea4 *)
cast %v4@uint32[4] %v4;
mov x3 %v4[1];
cast x3@uint64 x3;
(* 	mov	w24, v4.s[3]                                #! PC = 0xaaaad4bb1ea8 *)
mov x24 %v4[3];
cast x24@uint64 x24;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb1eac *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x9, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb1eb0 *)
cmov x8 ge x9 x8;           // ge = tcont;
(* 	tst	x5, #0x2                                    #! PC = 0xaaaad4bb1eb4 *)
spl dc x5_lo x5 2;
spl x5_target dc x5_lo 1;
and ne@bit x5_target 1@bit;
(* 	and	v26.16b, v17.16b, v1.16b                    #! PC = 0xaaaad4bb1eb8 *)
cast %v17@int64[2] %v17;
cast %v1@int64[2] %v1;
and %v26@int64[2] %v17 %v1;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1ebc *)
cmov x15 ne x8 0@sint64;    // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1ec0 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;        // ne = any;
(* 	add	x29, x28, x20, lsl #30                      #! PC = 0xaaaad4bb1ec4 *)
shls dc x20_shl30@uint64 x20 30;
adds dc x29 x28 x20_shl30;
(* 	add	x22, xzr, x26, lsr #4                       #! PC = 0xaaaad4bb1ec8 *)
shrs x26_shr4 dc x26 4;
adds dc x22 0@uint64 x26_shr4;
(* 	asr	x7, x5, #1                                  #! PC = 0xaaaad4bb1ecc *)
split x7 dc x5 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1ed0 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb1ed4 *)
adds dc x9 x7 x15;
(* 	cneg	x15, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1ed8 *)
subs dc x15_neg 0@sint64 x25;
cmov x15 ge x15_neg x25;        // ge = tcont;
(* 	uzp1	v25.4s, v26.4s, v26.4s                     #! PC = 0xaaaad4bb1edc *)
cast %v26@int32[4] %v26;
mov %v25 [%v26[0], %v26[2], %v26[0], %v26[2]];
(* 	add	x5, x29, x26, lsl #60                       #! PC = 0xaaaad4bb1ee0 *)
shls dc x26_shl60@uint64 x26 60;
adds dc x5 x29 x26_shl60;
(* 	add	x25, x15, #0x2                              #! PC = 0xaaaad4bb1ee4 *)
add x25 x15 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb1ee8 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1eec *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1ef0 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1ef4 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	smlsl	v30.2d, v25.2s, v24.s[0]                  #! PC = 0xaaaad4bb1ef8 *)
cast %v30@int64[2] %v30;
cast %v25@int32[4] %v25;
cast %v24@int32[4] %v24;
broadcast %tmp1@int32[2] 2 [%v24[0]];
mov %tmp2@int32[2] [%v25[0], %v25[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
subs %dc %v30@int64[2] %v30 %tmp3;
(* 	ushll	v22.2d, v25.2s, #15                       #! PC = 0xaaaad4bb1efc *)
cast %v25@uint32[4] %v25;
cast t22_0@uint64 %v25[0];
cast t22_1@uint64 %v25[1];
shls dc t22_0 t22_0 15;
shls dc t22_1 t22_1 15;
mov %v22@uint64[2] [t22_0, t22_1];
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb1f00 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f04 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x21, x23, x21, lsl #30                      #! PC = 0xaaaad4bb1f08 *)
shls dc x21_shl30@uint64 x21 30;
adds dc x21 x23 x21_shl30;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f0c *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb1f10 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb1f14 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb1f18 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1f1c *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1f20 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1f24 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb1f28 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f2c *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f30 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x15, x7, x15                                #! PC = 0xaaaad4bb1f34 *)
adds dc x15 x7 x15;
(* 	add	x9, x25, #0x2                               #! PC = 0xaaaad4bb1f38 *)
add x9 x25 0x2@sint64;
(* 	csel	x29, x7, x8, ge	// ge = tcont              #! PC = 0xaaaad4bb1f3c *)
cmov x29 ge x7 x8;              // ge = tcont;
(* 	tst	x15, #0x2                                   #! PC = 0xaaaad4bb1f40 *)
spl dc x15_lo x15 2;
spl x15_target dc x15_lo 1;
and ne@bit x15_target 1@bit;
(* 	csel	x25, x29, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1f44 *)
cmov x25 ne x29 0@sint64;       // ne = any;
(* 	ccmp	x9, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1f48 *)
spl ge dc x9 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x15, #1                                 #! PC = 0xaaaad4bb1f4c *)
split x7 dc x15 1;
(* 	cneg	x15, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f50 *)
subs dc x15_neg 0@sint64 x25;
cmov x15 ge x15_neg x25;        // ge = tcont;
(* 	cneg	x25, x9, ge	// ge = tcont                  #! PC = 0xaaaad4bb1f54 *)
subs dc x25_neg 0@sint64 x9;
cmov x25 ge x25_neg x9;         // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb1f58 *)
adds dc x9 x7 x15;
(* 	add	x8, x25, #0x2                               #! PC = 0xaaaad4bb1f5c *)
add x8 x25 0x2@sint64;
(* 	csel	x29, x7, x29, ge	// ge = tcont             #! PC = 0xaaaad4bb1f60 *)
cmov x29 ge x7 x29;             // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1f64 *)
spl dc x9_lo2 x9 2;
spl x9_target2 dc x9_lo2 1;
and ne@bit x9_target2 1@bit;
(* 	csel	x15, x29, xzr, ne	// ne = any              #! PC = 0xaaaad4bb1f68 *)
cmov x15 ne x29 0@sint64;       // ne = any;
(* 	ccmp	x8, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1f6c *)
spl ge dc x8 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb1f70 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f74 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x8, ge	// ge = tcont                  #! PC = 0xaaaad4bb1f78 *)
subs dc x25_neg 0@sint64 x8;
cmov x25 ge x25_neg x8;         // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb1f7c *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb1f80 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x29, ge	// ge = tcont              #! PC = 0xaaaad4bb1f84 *)
cmov x8 ge x7 x29;              // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1f88 *)
spl dc x9_lo3 x9 2;
spl x9_target3 dc x9_lo3 1;
and ne@bit x9_target3 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1f8c *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1f90 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb1f94 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f98 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1f9c *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb1fa0 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb1fa4 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb1fa8 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1fac *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1fb0 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1fb4 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb1fb8 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1fbc *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb1fc0 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb1fc4 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb1fc8 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb1fcc *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb1fd0 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1fd4 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb1fd8 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb1fdc *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb1fe0 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x9, x25, ge	// ge = tcont                  #! PC = 0xaaaad4bb1fe4 *)
subs dc x9_neg 0@sint64 x25;
cmov x9 ge x9_neg x25;          // ge = tcont;
(* 	add	x25, x7, x15                                #! PC = 0xaaaad4bb1fe8 *)
adds dc x25 x7 x15;
(* 	add	x9, x9, #0x2                                #! PC = 0xaaaad4bb1fec *)
add x9 x9 0x2@sint64;
(* 	csel	x7, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb1ff0 *)
cmov x7 ge x7 x8;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb1ff4 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x15, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb1ff8 *)
cmov x15 ne x7 0@sint64;        // ne = any;
(* 	ccmp	x9, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb1ffc *)
spl ge dc x9 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x8, x25, #1                                 #! PC = 0xaaaad4bb2000 *)
split x8 dc x25 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2004 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x9, x9, ge	// ge = tcont                   #! PC = 0xaaaad4bb2008 *)
subs dc x9_neg 0@sint64 x9;
cmov x9 ge x9_neg x9;           // ge = tcont;
(* 	add	x25, x8, x15                                #! PC = 0xaaaad4bb200c *)
adds dc x25 x8 x15;
(* 	add	x9, x9, #0x2                                #! PC = 0xaaaad4bb2010 *)
add x9 x9 0x2@sint64;
(* 	csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2014 *)
cmov x7 ge x8 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2018 *)
spl dc x25_lo2 x25 2;
spl x25_target2 dc x25_lo2 1;
and ne@bit x25_target2 1@bit;
(* 	csel	x15, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb201c *)
cmov x15 ne x7 0@sint64;        // ne = any;
(* 	ccmp	x9, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb2020 *)
spl ge dc x9 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x8, x25, #1                                 #! PC = 0xaaaad4bb2024 *)
split x8 dc x25 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2028 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x9, ge	// ge = tcont                  #! PC = 0xaaaad4bb202c *)
subs dc x25_neg 0@sint64 x9;
cmov x25 ge x25_neg x9;         // ge = tcont;
(* 	add	x9, x8, x15                                 #! PC = 0xaaaad4bb2030 *)
adds dc x9 x8 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb2034 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x8, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2038 *)
cmov x8 ge x8 x7;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb203c *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2040 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2044 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb2048 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb204c *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb2050 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb2054 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb2058 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb205c *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb2060 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2064 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2068 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb206c *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2070 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb2074 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb2078 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb207c *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb2080 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb2084 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2088 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb208c *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb2090 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2094 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb2098 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb209c *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb20a0 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb20a4 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb20a8 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb20ac *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb20b0 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb20b4 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb20b8 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb20bc *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb20c0 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb20c4 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb20c8 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb20cc *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb20d0 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb20d4 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb20d8 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb20dc *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb20e0 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb20e4 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb20e8 *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb20ec *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb20f0 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb20f4 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb20f8 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb20fc *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2100 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x25, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb2104 *)
subs dc x25_neg 0@sint64 x25;
cmov x25 ge x25_neg x25;        // ge = tcont;
(* 	add	x9, x7, x15                                 #! PC = 0xaaaad4bb2108 *)
adds dc x9 x7 x15;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb210c *)
add x25 x25 0x2@sint64;
(* 	csel	x8, x7, x8,; ge	// ge = tcont               #! PC = 0xaaaad4bb2110 *)
cmov x8 ge x7 x8;               // ge = tcont;
(* 	tst	x9, #0x2                                    #! PC = 0xaaaad4bb2114 *)
spl dc x9_lo x9 2;
spl x9_target dc x9_lo 1;
and ne@bit x9_target 1@bit;
(* 	csel	x15, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2118 *)
cmov x15 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb211c *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x7, x9, #1                                  #! PC = 0xaaaad4bb2120 *)
split x7 dc x9 1;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2124 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	cneg	x9, x25, ge	// ge = tcont                  #! PC = 0xaaaad4bb2128 *)
subs dc x9_neg 0@sint64 x25;
cmov x9 ge x9_neg x25;          // ge = tcont;
(* 	add	x25, x7, x15                                #! PC = 0xaaaad4bb212c *)
adds dc x25 x7 x15;
(* 	add	x27, x9, #0x2                               #! PC = 0xaaaad4bb2130 *)
add x27 x9 0x2@sint64;
(* 	csel	x9, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb2134 *)
cmov x9 ge x7 x8;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2138 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x15, x9, xzr, ne	// ne = any               #! PC = 0xaaaad4bb213c *)
cmov x15 ne x9 0@sint64;        // ne = any;
(* 	asr	x7, x25, #1                                 #! PC = 0xaaaad4bb2140 *)
split x7 dc x25 1;
(* 	ccmp	x27, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2144 *)
spl ge dc x27 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	cneg	x25, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2148 *)
subs dc x25_neg 0@sint64 x15;
cmov x25 ge x25_neg x15;        // ge = tcont;
(* 	csel	x15, x7, x9, ge	// ge = tcont              #! PC = 0xaaaad4bb214c *)
cmov x15 ge x7 x9;              // ge = tcont;
(* 	add	x9, x15, x6                                 #! PC = 0xaaaad4bb2150 *)
add x9 x15 x6;
(* 	add	x25, x7, x25                                #! PC = 0xaaaad4bb2154 *)
adds dc x25 x7 x25;
(* 	add	x15, x15, #0x100, lsl #12                   #! PC = 0xaaaad4bb2158 *)
add x15 x15 1048576@int64;
(* 	asr	x20, x9, #42                                #! PC = 0xaaaad4bb215c *)
sars x20 dc x9 42;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2160 *)
split x9 dc x25 1;
(* 	lsl	x15, x15, #22                               #! PC = 0xaaaad4bb2164 *)
shls dc x15 x15 22;
(* 	add	x25, x9, x6                                 #! PC = 0xaaaad4bb2168 *)
add x25 x9 x6;
(* 	asr	x8, x15, #43                                #! PC = 0xaaaad4bb216c *)
sars x8 dc x15 43;
(* 	add	x15, x9, #0x100, lsl #12                    #! PC = 0xaaaad4bb2170 *)
add x15 x9 1048576@int64;
(* 	mul	x29, x8, x1                                 #! PC = 0xaaaad4bb2174 *)
cast x1@int64 x1;
mull dc x29 x8 x1;
(* 	sshr	v23.2d, v30.2d, #30                        #! PC = 0xaaaad4bb2178 *)
cast %v30@int64[2] %v30;
split %v23 %dc %v30 30;
(* 	lsl	x15, x15, #22                               #! PC = 0xaaaad4bb217c *)
shls dc x15 x15 22;
(* 	asr	x26, x15, #43                               #! PC = 0xaaaad4bb2180 *)
sars x26 dc x15 43;
(* 	asr	x4, x25, #42                                #! PC = 0xaaaad4bb2184 *)
sars x4 dc x25 42;
(* 	mul	x25, x26, x1                                #! PC = 0xaaaad4bb2188 *)
mull dc x25 x26 x1;
(* 	smlal	v23.2d, v14.2s, v8.s[0]                   #! PC = 0xaaaad4bb218c *)
cast %v14@int32[4] %v14;
cast %v8@int32[4] %v8;
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	mul	x9, x8, x11                                 #! PC = 0xaaaad4bb2190 *)
cast x11@int64 x11;
mull dc x9 x8 x11;
(* 	smlal2	v23.2d, v14.4s, v8.s[2]                  #! PC = 0xaaaad4bb2194 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	smlal	v23.2d, v13.2s, v8.s[1]                   #! PC = 0xaaaad4bb2198 *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	mul	x15, x8, x12                                #! PC = 0xaaaad4bb219c *)
cast x12@int64 x12;
mull dc x15 x8 x12;
(* 	madd	x7, x4, x2, x25                            #! PC = 0xaaaad4bb21a0 *)
cast x2@int64 x2;
mull dc tmp x4 x2;
adds dc x7 tmp x25;
(* 	madd	x28, x20, x2, x29                          #! PC = 0xaaaad4bb21a4 *)
mull dc tmp x20 x2;
adds dc x28 tmp x29;
(* 	smlal2	v23.2d, v13.4s, v8.s[3]                  #! PC = 0xaaaad4bb21a8 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	cneg	x27, x27, ge	// ge = tcont                 #! PC = 0xaaaad4bb21ac *)
subs dc x27_neg 0@sint64 x27;
cmov x27 ge x27_neg x27;         // ge = tcont;
(* 	add	x29, x27, #0x2                              #! PC = 0xaaaad4bb21b0 *)
add x29 x27 0x2@sint64;
(* 	mul	x25, x26, x12                               #! PC = 0xaaaad4bb21b4 *)
cast x12@int64 x12;
mull dc x25 x26 x12;
(* 	madd	x8, x20, x13, x9                           #! PC = 0xaaaad4bb21b8 *)
cast x20@int64 x20;
cast x13@int64 x13;
mull dc tmp x20 x13;
adds dc x8 tmp x9;
(* 	madd	x20, x20, x14, x15                         #! PC = 0xaaaad4bb21bc *)
cast x14@int64 x14;
mull dc tmp x20 x14;
adds dc x20 tmp x15;
(* 	mul	v0.4s, v23.4s, v15.4s                       #! PC = 0xaaaad4bb21c0 *)
cast %v23@uint32[4] %v23;
cast %v15@uint32[4] %v15;
mull %dc %v0@uint32[4] %v23 %v15;
(* 	asr	x2, x7, #20                                 #! PC = 0xaaaad4bb21c4 *)
sars x2 dc x7 20;
(* 	asr	x12, x28, #20                               #! PC = 0xaaaad4bb21c8 *)
sars x12 dc x28 20;
(* 	mov	x1, x12                                     #! PC = 0xaaaad4bb21cc *)
mov x1 x12;
(* 	and	x12, x2, #0xfffff                           #! PC = 0xaaaad4bb21d0 *)
and x12@int64 x2 1048575@int64;
(* 	and	x15, x1, #0xfffff                           #! PC = 0xaaaad4bb21d4 *)
and x15@int64 x1 1048575@int64;
(* 	orr	x9, x12, #0xc000000000000000                #! PC = 0xaaaad4bb21d8 *)
or x9@int64 x12 (-4611686018427387904)@int64;
(* 	madd	x14, x4, x14, x25                          #! PC = 0xaaaad4bb21dc *)
cast x4@int64 x4;
mull dc tmp x4 x14;
adds dc x14 tmp x25;
(* 	orr	x7, x15, #0xfffffe0000000000                #! PC = 0xaaaad4bb21e0 *)
or x7@int64 x15 (-2199023255552)@int64;
(* 	tst	x9, #0x1                                    #! PC = 0xaaaad4bb21e4 *)
spl dc x9_lo x9 1;
and ne@bit x9_lo 1@bit;
(* 	mov	x27, x20                                    #! PC = 0xaaaad4bb21e8 *)
mov x27 x20;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb21ec *)
cmov x12 ne x7 0@sint64;         // ne = any;
(* 	ccmp	x29, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb21f0 *)
spl ge dc x29 63;
not ge@bit ge;
cmov ge ne ge 0@bit;             // ne = any;
(* 	and	v29.16b, v0.16b, v1.16b                     #! PC = 0xaaaad4bb21f4 *)
cast %v0@int64[2] %v0;
cast %v1@int64[2] %v1;
and %v29@int64[2] %v0 %v1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb21f8 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;         // ge = tcont;
(* 	mov	x28, x8                                     #! PC = 0xaaaad4bb21fc *)
mov x28 x8;
(* 	cneg	x25, x29, ge	// ge = tcont                 #! PC = 0xaaaad4bb2200 *)
subs dc x25_neg 0@sint64 x29;
cmov x25 ge x25_neg x29;         // ge = tcont;
(* 	add	x15, x9, x12                                #! PC = 0xaaaad4bb2204 *)
adds dc x15 x9 x12;
(* 	add	x25, x25, #0x2                              #! PC = 0xaaaad4bb2208 *)
add x25 x25 0x2@sint64;
(* 	uzp1	v0.4s, v29.4s, v29.4s                      #! PC = 0xaaaad4bb220c *)
cast %v29@int32[4] %v29;
mov %v0 [%v29[0], %v29[2], %v29[0], %v29[2]];
(* 	csel	x8, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2210 *)
cmov x8 ge x9 x7;               // ge = tcont;
(* 	tst	x15, #0x2                                   #! PC = 0xaaaad4bb2214 *)
spl dc x15_lo x15 2;
spl x15_target dc x15_lo 1;
and ne@bit x15_target 1@bit;
(* 	csel	x12, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2218 *)
cmov x12 ne x8 0@sint64;         // ne = any;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb221c *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;             // ne = any;
(* 	asr	x7, x15, #1                                 #! PC = 0xaaaad4bb2220 *)
split x7 dc x15 1;
(* 	cneg	x9, x12, ge	// ge = tcont                  #! PC = 0xaaaad4bb2224 *)
subs dc x9_neg 0@sint64 x12;
cmov x9 ge x9_neg x12;            // ge = tcont;
(* 	smlsl	v23.2d, v0.2s, v24.s[0]                   #! PC = 0xaaaad4bb2228 *)
cast %v23@int64[2] %v23;
cast %v0@int32[4] %v0;
cast %v24@int32[4] %v24;
broadcast %tmp1@int32[2] 2 [%v24[0]];
mov %tmp2@int32[2] [%v0[0], %v0[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
subs %dc %v23@int64[2] %v23 %tmp3;
(* 	cneg	x12, x25, ge	// ge = tcont                 #! PC = 0xaaaad4bb222c *)
subs dc x12_neg 0@sint64 x25;
cmov x12 ge x12_neg x25;          // ge = tcont;
(* 	add	x25, x7, x9                                 #! PC = 0xaaaad4bb2230 *)
adds dc x25 x7 x9;
(* 	add	x15, x12, #0x2                              #! PC = 0xaaaad4bb2234 *)
add x15 x12 0x2@sint64;
(* 	csel	x7, x7, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb2238 *)
cmov x7 ge x7 x8;                 // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb223c *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2240 *)
cmov x12 ne x7 0@sint64;          // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2244 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;              // ne = any;
(* 	sshr	v23.2d, v23.2d, #30                        #! PC = 0xaaaad4bb2248 *)
cast %v23@int64[2] %v23;
split %v23 %dc %v23 30;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb224c *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb2250 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;          // ge = tcont;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2254 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;          // ge = tcont;
(* 	add	x12, x9, x12                                #! PC = 0xaaaad4bb2258 *)
adds dc x12 x9 x12;
(* 	add	x25, x15, #0x2                              #! PC = 0xaaaad4bb225c *)
add x25 x15 0x2@sint64;
(* 	smlal	v23.2d, v14.2s, v8.s[1]                   #! PC = 0xaaaad4bb2260 *)
cast %v14@int32[4] %v14;
cast %v8@int32[4] %v8;
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	csel	x8, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2264 *)
cmov x8 ge x9 x7;                 // ge = tcont;
(* 	tst	x12, #0x2                                   #! PC = 0xaaaad4bb2268 *)
spl dc x12_lo x12 2;
spl x12_target dc x12_lo 1;
and ne@bit x12_target 1@bit;
(* 	csel	x16, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb226c *)
cmov x16 ne x8 0@sint64;          // ne = any;
(* 	smlal2	v23.2d, v14.4s, v8.s[3]                  #! PC = 0xaaaad4bb2270 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	ccmp	x25, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2274 *)
spl ge dc x25 63;
not ge@bit ge;
cmov ge ne ge 0@bit;              // ne = any;
(* 	smlal	v23.2d, v13.2s, v9.s[0]                   #! PC = 0xaaaad4bb2278 *)
cast %v13@int32[4] %v13;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	asr	x15, x12, #1                                #! PC = 0xaaaad4bb227c *)
split x15 dc x12 1;
(* 	cneg	x12, x16, ge	// ge = tcont                 #! PC = 0xaaaad4bb2280 *)
subs dc x12_neg 0@sint64 x16;
cmov x12 ge x12_neg x16;          // ge = tcont;
(* 	smlal2	v23.2d, v13.4s, v9.s[2]                  #! PC = 0xaaaad4bb2284 *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v23@int64[2] %v23 %tmp3;
(* 	cneg	x9, x25, ge	// ge = tcont                  #! PC = 0xaaaad4bb2288 *)
subs dc x9_neg 0@sint64 x25;
cmov x9 ge x9_neg x25;            // ge = tcont;
(* 	add	x25, x15, x12                               #! PC = 0xaaaad4bb228c *)
adds dc x25 x15 x12;
(* 	add	x7, x9, #0x2                                #! PC = 0xaaaad4bb2290 *)
add x7 x9 0x2@sint64;
(* 	csel	x8, x15, x8, ge	// ge = tcont              #! PC = 0xaaaad4bb2294 *)
cmov x8 ge x15 x8;                // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2298 *)
spl dc x25_lo2 x25 2;
spl x25_target2 dc x25_lo2 1;
and ne@bit x25_target2 1@bit;
(* 	csel	x12, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb229c *)
cmov x12 ne x8 0@sint64;          // ne = any;
(* 	ccmp	x7, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb22a0 *)
spl ge dc x7 63;
not ge@bit ge;
cmov ge ne ge 0@bit;              // ne = any;
(* 	sshr	v20.2d, v23.2d, #30                        #! PC = 0xaaaad4bb22a4 *)
cast %v23@int64[2] %v23;
split %v20 %dc %v23 30;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb22a8 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb22ac *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;          // ge = tcont;
(* 	cneg	x15, x7, ge	// ge = tcont                  #! PC = 0xaaaad4bb22b0 *)
subs dc x15_neg 0@sint64 x7;
cmov x15 ge x15_neg x7;           // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb22b4 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb22b8 *)
add x15 x15 0x2@sint64;
(* 	smlal	v20.2d, v14.2s, v9.s[0]                   #! PC = 0xaaaad4bb22bc *)
cast %v14@int32[4] %v14;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v20@int64[2] %v20 %tmp3;
(* 	csel	x7, x9, x8, ge	// ge = tcont               #! PC = 0xaaaad4bb22c0 *)
cmov x7 ge x9 x8;                 // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb22c4 *)
spl dc x25_lo3 x25 2;
spl x25_target3 dc x25_lo3 1;
and ne@bit x25_target3 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb22c8 *)
cmov x12 ne x7 0@sint64;          // ne = any;
(* 	smlal2	v20.2d, v14.4s, v9.s[2]                  #! PC = 0xaaaad4bb22cc *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v20@int64[2] %v20 %tmp3;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb22d0 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;              // ne = any;
(* 	smlal	v20.2d, v13.2s, v9.s[1]                   #! PC = 0xaaaad4bb22d4 *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v20@int64[2] %v20 %tmp3;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb22d8 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb22dc *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;          // ge = tcont;
(* 	smlal2	v20.2d, v13.4s, v9.s[3]                  #! PC = 0xaaaad4bb22e0 *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v20@int64[2] %v20 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb22e4 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;          // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb22e8 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb22ec *)
add x15 x15 0x2@sint64;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb22f0 *)
cmov x7 ge x9 x7;                 // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb22f4 *)
spl dc x25_lo4 x25 2;
spl x25_target4 dc x25_lo4 1;
and ne@bit x25_target4 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb22f8 *)
cmov x12 ne x7 0@sint64;          // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb22fc *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;              // ne = any;
(* 	sshr	v31.2d, v20.2d, #30                        #! PC = 0xaaaad4bb2300 *)
cast %v20@int64[2] %v20;
split %v31 %dc %v20 30;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2304 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb2308 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;          // ge = tcont;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb230c *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;          // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb2310 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb2314 *)
add x15 x15 0x2@sint64;
(* 	smlal	v31.2d, v14.2s, v9.s[1]                   #! PC = 0xaaaad4bb2318 *)
cast %v14@int32[4] %v14;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v31@int64[2] %v31 %tmp3;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb231c *)
cmov x7 ge x9 x7;                 // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2320 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2324 *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	smlal2	v31.2d, v14.4s, v9.s[3]                  #! PC = 0xaaaad4bb2328 *)
cast %v14@int32[4] %v14;
cast %v9@int32[4] %v9;
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v31@int64[2] %v31 %tmp3;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb232c *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	smlal	v31.2d, v13.2s, v10.s[0]                  #! PC = 0xaaaad4bb2330 *)
cast %v13@int32[4] %v13;
cast %v10@int32[4] %v10;
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v31@int64[2] %v31 %tmp3;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2334 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb2338 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	smlal2	v31.2d, v13.4s, v10.s[2]                 #! PC = 0xaaaad4bb233c *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v31@int64[2] %v31 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2340 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb2344 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb2348 *)
add x15 x15 0x2@sint64;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb234c *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2350 *)
spl dc x25_lo2 x25 2;
spl x25_target2 dc x25_lo2 1;
and ne@bit x25_target2 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2354 *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2358 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb235c *)
split x9 dc x25 1;
(* 	sshr	v21.2d, v31.2d, #30                        #! PC = 0xaaaad4bb2360 *)
cast %v31@int64[2] %v31;
split %v21 %dc %v31 30;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb2364 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2368 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb236c *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb2370 *)
add x15 x15 0x2@sint64;
(* 	smlal	v21.2d, v14.2s, v10.s[0]                  #! PC = 0xaaaad4bb2374 *)
cast %v14@int32[4] %v14;
cast %v10@int32[4] %v10;
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v21@int64[2] %v21 %tmp3;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2378 *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb237c *)
spl dc x25_lo3 x25 2;
spl x25_target3 dc x25_lo3 1;
and ne@bit x25_target3 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2380 *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	smlal2	v21.2d, v14.4s, v10.s[2]                 #! PC = 0xaaaad4bb2384 *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v21@int64[2] %v21 %tmp3;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2388 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	smlal	v21.2d, v13.2s, v10.s[1]                  #! PC = 0xaaaad4bb238c *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v21@int64[2] %v21 %tmp3;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2390 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb2394 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	smlal2	v21.2d, v13.4s, v10.s[3]                 #! PC = 0xaaaad4bb2398 *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v21@int64[2] %v21 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb239c *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb23a0 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb23a4 *)
add x15 x15 0x2@sint64;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb23a8 *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb23ac *)
spl dc x25_lo4 x25 2;
spl x25_target4 dc x25_lo4 1;
and ne@bit x25_target4 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb23b0 *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb23b4 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	sshr	v28.2d, v21.2d, #30                        #! PC = 0xaaaad4bb23b8 *)
cast %v21@int64[2] %v21;
split %v28 %dc %v21 30;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb23bc *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb23c0 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb23c4 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb23c8 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb23cc *)
add x15 x15 0x2@sint64;
(* 	smlal	v28.2d, v14.2s, v10.s[1]                  #! PC = 0xaaaad4bb23d0 *)
cast %v14@int32[4] %v14;
cast %v10@int32[4] %v10;
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v28@int64[2] %v28 %tmp3;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb23d4 *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb23d8 *)
spl dc x25_lo5 x25 2;
spl x25_target5 dc x25_lo5 1;
and ne@bit x25_target5 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb23dc *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	smlal2	v28.2d, v14.4s, v10.s[3]                 #! PC = 0xaaaad4bb23e0 *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v28@int64[2] %v28 %tmp3;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb23e4 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb23e8 *)
split x9 dc x25 1;
(* 	smlal	v28.2d, v13.2s, v11.s[0]                  #! PC = 0xaaaad4bb23ec *)
cast %v11@int32[4] %v11;
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v28@int64[2] %v28 %tmp3;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb23f0 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	smlal2	v28.2d, v13.4s, v11.s[2]                 #! PC = 0xaaaad4bb23f4 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v28@int64[2] %v28 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb23f8 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb23fc *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb2400 *)
add x15 x15 0x2@sint64;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2404 *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2408 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb240c *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2410 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	sshr	v16.2d, v28.2d, #30                        #! PC = 0xaaaad4bb2414 *)
cast %v28@int64[2] %v28;
split %v16 %dc %v28 30;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2418 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb241c *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2420 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb2424 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb2428 *)
add x15 x15 0x2@sint64;
(* 	smlal	v16.2d, v14.2s, v11.s[0]                  #! PC = 0xaaaad4bb242c *)
cast %v16@int64[2] %v16;
cast %v14@int32[4] %v14;
cast %v11@int32[4] %v11;
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2430 *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2434 *)
spl dc x25_lo2 x25 2;
spl x25_target2 dc x25_lo2 1;
and ne@bit x25_target2 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2438 *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	smlal2	v16.2d, v14.4s, v11.s[2]                 #! PC = 0xaaaad4bb243c *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2440 *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	smlal	v16.2d, v13.2s, v11.s[1]                  #! PC = 0xaaaad4bb2444 *)
cast %v13@int32[4] %v13;
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2448 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb244c *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	smlal2	v16.2d, v13.4s, v11.s[3]                 #! PC = 0xaaaad4bb2450 *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb2454 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb2458 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb245c *)
add x15 x15 0x2@sint64;
(* 	csel	x7, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb2460 *)
cmov x7 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2464 *)
spl dc x25_lo x25 2;
spl x25_target dc x25_lo 1;
and ne@bit x25_target 1@bit;
(* 	csel	x12, x7, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2468 *)
cmov x12 ne x7 0@sint64;        // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb246c *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	sshr	v19.2d, v16.2d, #30                        #! PC = 0xaaaad4bb2470 *)
cast %v16@int64[2] %v16;
split %v19 %dc %v16 30;
(* 	asr	x9, x25, #1                                 #! PC = 0xaaaad4bb2474 *)
split x9 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb2478 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb247c *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x25, x9, x12                                #! PC = 0xaaaad4bb2480 *)
adds dc x25 x9 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb2484 *)
add x15 x15 0x2@sint64;
(* 	smlal	v19.2d, v14.2s, v11.s[1]                  #! PC = 0xaaaad4bb2488 *)
cast %v19@int64[2] %v19;
cast %v14@int32[4] %v14;
cast %v11@int32[4] %v11;
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v19@int64[2] %v19 %tmp3;
(* 	csel	x9, x9, x7, ge	// ge = tcont               #! PC = 0xaaaad4bb248c *)
cmov x9 ge x9 x7;               // ge = tcont;
(* 	tst	x25, #0x2                                   #! PC = 0xaaaad4bb2490 *)
spl dc x25_lo2 x25 2;
spl x25_target2 dc x25_lo2 1;
and ne@bit x25_target2 1@bit;
(* 	csel	x12, x9, xzr, ne	// ne = any               #! PC = 0xaaaad4bb2494 *)
cmov x12 ne x9 0@sint64;        // ne = any;
(* 	smlal2	v19.2d, v14.4s, v11.s[3]                 #! PC = 0xaaaad4bb2498 *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v19@int64[2] %v19 %tmp3;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb249c *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	smlal	v19.2d, v13.2s, v12.s[0]                  #! PC = 0xaaaad4bb24a0 *)
cast %v13@int32[4] %v13;
cast %v12@int32[4] %v12;
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v19@int64[2] %v19 %tmp3;
(* 	asr	x25, x25, #1                                #! PC = 0xaaaad4bb24a4 *)
split x25 dc x25 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb24a8 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	smlal2	v19.2d, v13.4s, v12.s[2]                 #! PC = 0xaaaad4bb24ac *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v19@int64[2] %v19 %tmp3;
(* 	cneg	x15, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb24b0 *)
subs dc x15_neg 0@sint64 x15;
cmov x15 ge x15_neg x15;        // ge = tcont;
(* 	add	x12, x25, x12                               #! PC = 0xaaaad4bb24b4 *)
adds dc x12 x25 x12;
(* 	add	x15, x15, #0x2                              #! PC = 0xaaaad4bb24b8 *)
add x15 x15 0x2@sint64;
(* 	asr	x7, x12, #1                                 #! PC = 0xaaaad4bb24bc *)
split x7 dc x12 1;
(* 	csel	x8, x25, x9, ge	// ge = tcont              #! PC = 0xaaaad4bb24c0 *)
cmov x8 ge x25 x9;              // ge = tcont;
(* 	tst	x12, #0x2                                   #! PC = 0xaaaad4bb24c4 *)
spl dc x12_lo x12 2;
spl x12_target dc x12_lo 1;
and ne@bit x12_target 1@bit;
(* 	csel	x12, x8, xzr, ne	// ne = any               #! PC = 0xaaaad4bb24c8 *)
cmov x12 ne x8 0@sint64;        // ne = any;
(* 	ccmp	x15, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb24cc *)
spl ge dc x15 63;
not ge@bit ge;
cmov ge ne ge 0@bit;            // ne = any;
(* 	add	v18.2d, v19.2d, v22.2d                      #! PC = 0xaaaad4bb24d0 *)
cast %v19@int64[2] %v19;
cast %v22@int64[2] %v22;
adds %dc %v18@int64[2] %v19 %v22;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb24d4 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;        // ge = tcont;
(* 	cneg	x25, x15, ge	// ge = tcont                 #! PC = 0xaaaad4bb24d8 *)
subs dc x25_neg 0@sint64 x15;
cmov x25 ge x25_neg x15;        // ge = tcont;
(* 	add	x15, x7, x12                                #! PC = 0xaaaad4bb24dc *)
adds dc x15 x7 x12;
(* 	and	v8.16b, v23.16b, v1.16b                     #! PC = 0xaaaad4bb24e0 *)
cast %v23@int64[2] %v23;
cast %v1@int64[2] %v1;
and %v8@int64[2] %v23 %v1;
(* 	add	x9, x25, #0x2                               #! PC = 0xaaaad4bb24e4 *)
add x9 x25 0x2@sint64;
(* 	mul	x25, x26, x11                               #! PC = 0xaaaad4bb24e8 *)
cast x11@int64 x11;
mull dc x25 x26 x11;
(* 	and	v17.16b, v20.16b, v1.16b                    #! PC = 0xaaaad4bb24ec *)
cast %v20@int64[2] %v20;
cast %v1@int64[2] %v1;
and %v17@int64[2] %v20 %v1;
(* 	sshr	v29.2d, v18.2d, #30                        #! PC = 0xaaaad4bb24f0 *)
cast %v18@int64[2] %v18;
split %v29 %dc %v18 30;
(* 	csel	x29, x7, x8, ge	// ge = tcont              #! PC = 0xaaaad4bb24f4 *)
cmov x29 ge x7 x8;              // ge = tcont;
(* 	tst	x15, #0x2                                   #! PC = 0xaaaad4bb24f8 *)
spl dc x15_lo x15 2;
spl x15_target dc x15_lo 1;
and ne@bit x15_target 1@bit;
(* 	csel	x12, x29, xzr, ne	// ne = any              #! PC = 0xaaaad4bb24fc *)
cmov x12 ne x29 0@sint64;        // ne = any;
(* 	ccmp	x9, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaad4bb2500 *)
spl ge dc x9 63;
not ge@bit ge;
cmov ge ne ge 0@bit;             // ne = any;
(* 	madd	x11, x4, x13, x25                          #! PC = 0xaaaad4bb2504 *)
cast x4@int64 x4;
cast x13@int64 x13;
mull dc tmp x4 x13;
adds dc x11 tmp x25;
(* 	asr	x25, x15, #1                                #! PC = 0xaaaad4bb2508 *)
split x25 dc x15 1;
(* 	cneg	x12, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb250c *)
subs dc x12_neg 0@sint64 x12;
cmov x12 ge x12_neg x12;         // ge = tcont;
(* 	smlal	v29.2d, v14.2s, v12.s[0]                  #! PC = 0xaaaad4bb2510 *)
cast %v29@int64[2] %v29;
cast %v14@int32[4] %v14;
cast %v12@int32[4] %v12;
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v29@int64[2] %v29 %tmp3;
(* 	cneg	x15, x9, ge	// ge = tcont                  #! PC = 0xaaaad4bb2514 *)
subs dc x15_neg 0@sint64 x9;
cmov x15 ge x15_neg x9;          // ge = tcont;
(* 	add	x12, x25, x12                               #! PC = 0xaaaad4bb2518 *)
adds dc x12 x25 x12;
(* 	add	x20, x15, #0x2                              #! PC = 0xaaaad4bb251c *)
add x20 x15 0x2@sint64;
(* 	smlal2	v29.2d, v14.4s, v12.s[2]                 #! PC = 0xaaaad4bb2520 *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v29@int64[2] %v29 %tmp3;
(* 	csel	x15, x25, x29, ge	// ge = tcont            #! PC = 0xaaaad4bb2524 *)
cmov x15 ge x25 x29;             // ge = tcont;
(* 	tst	x12, #0x2                                   #! PC = 0xaaaad4bb2528 *)
spl dc x12_lo x12 2;
spl x12_target dc x12_lo 1;
and ne@bit x12_target 1@bit;
(* 	ushll	v22.2d, v0.2s, #15                        #! PC = 0xaaaad4bb252c *)
cast %v0@uint32[4] %v0;
cast t22_0@uint64 %v0[0];
cast t22_1@uint64 %v0[1];
shls dc t22_0 t22_0 15;
shls dc t22_1 t22_1 15;
mov %v22@uint64[2] [t22_0, t22_1];
(* 	asr	x9, x12, #1                                 #! PC = 0xaaaad4bb2530 *)
split x9 dc x12 1;
(* 	csel	x12, x15, xzr, ne	// ne = any              #! PC = 0xaaaad4bb2534 *)
cmov x12 ne x15 0@sint64;        // ne = any;
(* 	ccmp	x20, xzr, #0x8, ne	// ne = any             #! PC = 0xaaaad4bb2538 *)
spl ge dc x20 63;
not ge@bit ge;
cmov ge ne ge 0@bit;             // ne = any;
(* 	cneg	x25, x12, ge	// ge = tcont                 #! PC = 0xaaaad4bb253c *)
subs dc x25_neg 0@sint64 x12;
cmov x25 ge x25_neg x12;         // ge = tcont;
(* 	csel	x12, x9, x15, ge	// ge = tcont             #! PC = 0xaaaad4bb2540 *)
cmov x12 ge x9 x15;              // ge = tcont;
(* 	add	x15, x12, x6                                #! PC = 0xaaaad4bb2544 *)
add x15 x12 x6;
(* 	add	x25, x9, x25                                #! PC = 0xaaaad4bb2548 *)
adds dc x25 x9 x25;
(* 	add	x12, x12, #0x100, lsl #12                   #! PC = 0xaaaad4bb254c *)
add x12 x12 1048576@int64;
(* 	add	v0.2d, v29.2d, v22.2d                       #! PC = 0xaaaad4bb2550 *)
cast %v22@int64[2] %v22;
adds %dc %v0@int64[2] %v29 %v22;
(* 	asr	x29, x15, #42                               #! PC = 0xaaaad4bb2554 *)
sars x29 dc x15 42;
(* 	asr	x25, x25, #1                                #! PC = 0xaaaad4bb2558 *)
split x25 dc x25 1;
(* 	lsl	x15, x12, #22                               #! PC = 0xaaaad4bb255c *)
shls dc x15 x12 22;
(* 	add	x12, x25, #0x100, lsl #12                   #! PC = 0xaaaad4bb2560 *)
add x12 x25 1048576@int64;
(* 	asr	x15, x15, #43                               #! PC = 0xaaaad4bb2564 *)
sars x15 dc x15 43;
(* 	sshr	v12.2d, v0.2d, #30                         #! PC = 0xaaaad4bb2568 *)
cast %v0@int64[2] %v0;
split %v12 %dc %v0 30;
(* 	mul	x9, x15, x28                                #! PC = 0xaaaad4bb256c *)
cast x28@int64 x28;
mull dc x9 x15 x28;
(* 	add	x4, x21, x30, lsl #60                       #! PC = 0xaaaad4bb2570 *)
shls dc x30_shl60@uint64 x30 60;
adds dc x4 x21 x30_shl60;
(* 	lsl	x12, x12, #22                               #! PC = 0xaaaad4bb2574 *)
shls dc x12 x12 22;
(* 	and	v9.16b, v31.16b, v1.16b                     #! PC = 0xaaaad4bb2578 *)
cast %v31@int64[2] %v31;
cast %v1@int64[2] %v1;
and %v9@int64[2] %v31 %v1;
(* 	mul	x15, x15, x27                               #! PC = 0xaaaad4bb257c *)
cast x27@int64 x27;
mull dc x15 x15 x27;
(* 	and	v22.16b, v21.16b, v1.16b                    #! PC = 0xaaaad4bb2580 *)
cast %v21@int64[2] %v21;
cast %v1@int64[2] %v1;
and %v22@int64[2] %v21 %v1;
(* 	add	x8, x25, x6                                 #! PC = 0xaaaad4bb2584 *)
add x8 x25 x6;
(* 	and	v11.16b, v18.16b, v1.16b                    #! PC = 0xaaaad4bb2588 *)
cast %v18@int64[2] %v18;
cast %v1@int64[2] %v1;
and %v11@int64[2] %v18 %v1;
(* 	asr	x7, x12, #43                                #! PC = 0xaaaad4bb258c *)
sars x7 dc x12 43;
(* 	sshr	v18.2d, v12.2d, #15                        #! PC = 0xaaaad4bb2590 *)
cast %v12@int64[2] %v12;
split %v18 %dc %v12 15;
(* 	mul	x12, x7, x27                                #! PC = 0xaaaad4bb2594 *)
mull dc x12 x7 x27;
(* 	and	v10.16b, v28.16b, v1.16b                    #! PC = 0xaaaad4bb2598 *)
cast %v28@int64[2] %v28;
cast %v1@int64[2] %v1;
and %v10@int64[2] %v28 %v1;
(* 	sli	v8.2d, v17.2d, #32                          #! PC = 0xaaaad4bb259c *)
mov [v17_s0, v17_s1] %v17;
shls dc v17_s0 v17_s0 32;
shls dc v17_s1 v17_s1 32;
mov %tmp17@int64[2] [v17_s0, v17_s1];
or %v8@int64[2] %v8 %tmp17;
(* 	mul	x25, x7, x28                                #! PC = 0xaaaad4bb25a0 *)
mull dc x25 x7 x28;
(* 	and	v25.16b, v16.16b, v1.16b                    #! PC = 0xaaaad4bb25a4 *)
cast %v16@int64[2] %v16;
cast %v1@int64[2] %v1;
and %v25@int64[2] %v16 %v1;
(* 	madd	x9, x29, x11, x9                           #! PC = 0xaaaad4bb25a8 *)
cast x11@int64 x11;
mull dc tmp x29 x11;
adds dc x9 tmp x9;
(* 	madd	x15, x29, x14, x15                         #! PC = 0xaaaad4bb25ac *)
cast x14@int64 x14;
mull dc tmp x29 x14;
adds dc x15 tmp x15;
(* 	sli	v9.2d, v22.2d, #32                          #! PC = 0xaaaad4bb25b0 *)
mov [v22_s0, v22_s1] %v22;
shls dc v22_s0 v22_s0 32;
shls dc v22_s1 v22_s1 32;
mov %tmp22@int64[2] [v22_s0, v22_s1];
or %v9@int64[2] %v9 %tmp22;
(* 	shl	v22.2d, v18.2d, #15                         #! PC = 0xaaaad4bb25b4 *)
mov [v18_t0, v18_t1] %v18;
shls dc v18_t0 v18_t0 15;
shls dc v18_t1 v18_t1 15;
mov %v22@int64[2] [v18_t0, v18_t1];
(* 	add	x21, x17, x3, lsl #26                       #! PC = 0xaaaad4bb25b8 *)
shls dc x3_shl26@uint64 x3 26;
adds dc x21 x17 x3_shl26;
(* 	and	v0.16b, v0.16b, v1.16b                      #! PC = 0xaaaad4bb25bc *)
cast %v0@int64[2] %v0;
cast %v1@int64[2] %v1;
and %v0@int64[2] %v0 %v1;
(* 	add	x22, x22, x24, lsl #26                      #! PC = 0xaaaad4bb25c0 *)
shls dc x24_shl26@uint64 x24 26;
adds dc x22 x22 x24_shl26;
(* 	sli	v10.2d, v25.2d, #32                         #! PC = 0xaaaad4bb25c4 *)
mov [v25_s0, v25_s1] %v25;
shls dc v25_s0 v25_s0 32;
shls dc v25_s1 v25_s1 32;
mov %tmp25@int64[2] [v25_s0, v25_s1];
or %v10@int64[2] %v10 %tmp25;
(* 	cneg	x24, x20, ge	// ge = tcont                 #! PC = 0xaaaad4bb25c8 *)
subs dc x24_neg 0@sint64 x20;
cmov x24 ge x24_neg x20;         // ge = tcont;
(* 	mla	v8.4s, v18.4s, v24.4s                       #! PC = 0xaaaad4bb25cc *)
cast %v8@uint32[4]  %v8;
cast %v18@uint32[4] %v18;
cast %v24@uint32[4] %v24;
mull %dc %tmp_prod@uint32[4] %v18 %v24;
adds %dc %v8@uint32[4] %v8 %tmp_prod;
(* 	add	x3, x24, #0x2                               #! PC = 0xaaaad4bb25d0 *)
add x3 x24 0x2@sint64;
(* 	asr	x7, x8, #42                                 #! PC = 0xaaaad4bb25d4 *)
sars x7 dc x8 42;
(* 	madd	x13, x7, x11, x25                          #! PC = 0xaaaad4bb25d8 *)
mull dc tmp x7 x11;
adds dc x13 tmp x25;
(* 	sli	v11.2d, v0.2d, #32                          #! PC = 0xaaaad4bb25dc *)
mov [v0_s0, v0_s1] %v0;
shls dc v0_s0 v0_s0 32;
shls dc v0_s1 v0_s1 32;
mov %tmp0@int64[2] [v0_s0, v0_s1];
or %v11@int64[2] %v11 %tmp0;
(* 	madd	x14, x7, x14, x12                          #! PC = 0xaaaad4bb25e0 *)
mull dc tmp x7 x14;
adds dc x14 tmp x12;
(* 	mov	x12, x15                                    #! PC = 0xaaaad4bb25e4 *)
mov x12 x15;
(* 	mov	x11, x9                                     #! PC = 0xaaaad4bb25e8 *)
mov x11 x9;
(* 	sub	v12.2d, v12.2d, v22.2d                      #! PC = 0xaaaad4bb25ec *)
cast %v12@int64[2] %v12;
cast %v22@int64[2] %v22;
subs %dc %v12@int64[2] %v12 %v22;

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


(*
cv_cec -ov x11,x12,x13,x14,x3,x4,x5,x21,x22,VEC_v3_0,VEC_v3_1,VEC_v4_0,VEC_v4_1,VEC_v5_0,VEC_v5_1,VEC_v6_0,VEC_v6_1,VEC_v7_0,VEC_v7_1,VEC_v8_0,VEC_v8_1,VEC_v9_0,VEC_v9_1,VEC_v10_0,VEC_v10_1,VEC_v11_0,VEC_v11_1,VEC_v12_0,VEC_v12_1 reference.cl target.cl
Final result:					[OK]		7.9959 seconds
*)

{true && true}
