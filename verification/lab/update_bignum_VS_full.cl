
proc msl_range_lemma(

%v12@sint64[2],
%v11@sint32[4],
%v10@sint32[4],
%v9@sint32[4],
%v8@sint32[4],
%vec_uu0_rr0_vv0_ss0@sint32[4],
%vec_uu1_rr1_vv1_ss1@sint32[4],
%vec_V0_V1_S0_S1@sint32[4],
%vec_V2_V3_S2_S3@sint32[4],
%vec_V4_V5_S4_S5@sint32[4],
%vec_V6_V7_S6_S7@sint32[4],
%vec_V8_V9_S8_S9@sint32[4],
%vec_l0@sint32[4],
%vec_l1@sint32[4]

) = 
{

%v12[0] * (2**300) +
%v11[1] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
,
%v12[1] * (2**300) +
%v11[3] * (2**270) +
%v11[2] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
&&
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v8, %v8 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v9, %v9 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v10, %v10 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v11, %v11 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l0[0], %vec_l0[0] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l0[1], %vec_l0[1] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l1[0], %vec_l1[0] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l1[1], %vec_l1[1] <=s ((2**30)-1)@sint32,
// norm condition
// |u| + |v| <= 2**60
limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
// |r| + |s| <= 2**60
limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
%vec_V0_V1_S0_S1 <=s [(((2**30)-1)+19)@sint32, ((2**30)-1)@sint32, (((2**30)-1)+19)@sint32, ((2**30)-1)@sint32],
%vec_V0_V1_S0_S1 >=s [(-38)@sint32, 0@sint32, (-38)@sint32, 0@sint32],
%vec_V2_V3_S2_S3 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V2_V3_S2_S3 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V4_V5_S4_S5 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V4_V5_S4_S5 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V6_V7_S6_S7 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V6_V7_S6_S7 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V8_V9_S8_S9 <=s [((2**15)-1)@sint32, 0@sint32, ((2**15)-1)@sint32, 0@sint32],
%vec_V8_V9_S8_S9 >=s [(-(2**15))@sint32, (-1)@sint32, (-(2**15))@sint32, (-1)@sint32]
}


assert true &&
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v8, %v8 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v9, %v9 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v10, %v10 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v11, %v11 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l0[0], %vec_l0[0] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l0[1], %vec_l0[1] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l1[0], %vec_l1[0] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l1[1], %vec_l1[1] <=s ((2**30)-1)@sint32,
// norm condition
// |u| + |v| <= 2**60
limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
// |r| + |s| <= 2**60
limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
%vec_V0_V1_S0_S1 <=s [(((2**30)-1)+19)@sint32, ((2**30)-1)@sint32, (((2**30)-1)+19)@sint32, ((2**30)-1)@sint32],
%vec_V0_V1_S0_S1 >=s [(-38)@sint32, 0@sint32, (-38)@sint32, 0@sint32],
%vec_V2_V3_S2_S3 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V2_V3_S2_S3 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V4_V5_S4_S5 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V4_V5_S4_S5 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V6_V7_S6_S7 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V6_V7_S6_S7 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V8_V9_S8_S9 <=s [((2**15)-1)@sint32, 0@sint32, ((2**15)-1)@sint32, 0@sint32],
%vec_V8_V9_S8_S9 >=s [(-(2**15))@sint32, (-1)@sint32, (-(2**15))@sint32, (-1)@sint32]
;


assume and [
[0,0,0,0] <= %v8, %v8 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v9, %v9 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v10, %v10 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v11, %v11 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
(0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1),
0 <= %vec_l0[0], %vec_l0[0] <= ((2**30)-1),
0 <= %vec_l0[1], %vec_l0[1] <= ((2**30)-1),
0 <= %vec_l1[0], %vec_l1[0] <= ((2**30)-1),
0 <= %vec_l1[1], %vec_l1[1] <= ((2**30)-1),
// norm condition
// |u| + |v| < 2**60
-(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
-(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
// |r| + |s| < 2**60
-(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
-(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
%vec_V0_V1_S0_S1 <= [((2**30)-1)+19, ((2**30)-1), ((2**30)-1)+19, ((2**30)-1)],
%vec_V0_V1_S0_S1 >= [-38, 0, -38, 0],
%vec_V2_V3_S2_S3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V2_V3_S2_S3 >= [0, 0, 0, 0],
%vec_V4_V5_S4_S5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V4_V5_S4_S5 >= [0, 0, 0, 0],
%vec_V6_V7_S6_S7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V6_V7_S6_S7 >= [0, 0, 0, 0],
%vec_V8_V9_S8_S9 <= [((2**15)-1), 0, ((2**15)-1), 0],
%vec_V8_V9_S8_S9 >= [(-(2**15)), (-1), (-(2**15)), (-1)]
]
&& true;





assert 
%v12[0] * (2**300) +
%v11[1] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[0], %vec_l1[0]
    ] * (2**255 - 19)
    ,
%v12[1] * (2**300) +
%v11[3] * (2**270) +
%v11[2] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[1], %vec_l1[1]
    ] * (2**255 - 19)
&& true;

assert and [
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[0], %vec_l1[0]
    ] * (2**255 - 19)
    >= (-(2**60)) * ((2**255) + 38)
    ,
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[0], %vec_l1[0]
    ] * (2**255 - 19)
    <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
    ,
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[1], %vec_l1[1]
    ] * (2**255 - 19)
    >= (-(2**60)) * ((2**255) + 38)
    ,
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[1], %vec_l1[1]
    ] * (2**255 - 19)
    <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[0], %vec_l1[0]
    ] * (2**255 - 19)
    >= (-(2**60)) * ((2**255) + 38)
    ,
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[0], %vec_l1[0]
    ] * (2**255 - 19)
    <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
    ,
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[1], %vec_l1[1]
    ] * (2**255 - 19)
    >= (-(2**60)) * ((2**255) + 38)
    ,
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
    +
    limbs 30 [
        %vec_l0[1], %vec_l1[1]
    ] * (2**255 - 19)
    <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
]
&& true;

assert and [
(
    %v12[0] * (2**300) +
    %v11[1] * (2**270) +
    %v11[0] * (2**240) +
    %v10[1] * (2**210) +
    %v10[0] * (2**180) +
    %v9[1] * (2**150) +
    %v9[0] * (2**120) +
    %v8[1] * (2**90) +
    %v8[0] * (2**60)
) >= (-(2**60)) * ((2**255) + 38)
,
(
    %v12[0] * (2**300) +
    %v11[1] * (2**270) +
    %v11[0] * (2**240) +
    %v10[1] * (2**210) +
    %v10[0] * (2**180) +
    %v9[1] * (2**150) +
    %v9[0] * (2**120) +
    %v8[1] * (2**90) +
    %v8[0] * (2**60)
) <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
,
(
    %v12[1] * (2**300) +
    %v11[3] * (2**270) +
    %v11[2] * (2**240) +
    %v10[3] * (2**210) +
    %v10[2] * (2**180) +
    %v9[3] * (2**150) +
    %v9[2] * (2**120) +
    %v8[3] * (2**90) +
    %v8[2] * (2**60)
) >= (-(2**60)) * ((2**255) + 38)
,
(
    %v12[1] * (2**300) +
    %v11[3] * (2**270) +
    %v11[2] * (2**240) +
    %v10[3] * (2**210) +
    %v10[2] * (2**180) +
    %v9[3] * (2**150) +
    %v9[2] * (2**120) +
    %v8[3] * (2**90) +
    %v8[2] * (2**60)
) <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
(
    %v12[0] * (2**300) +
    %v11[1] * (2**270) +
    %v11[0] * (2**240) +
    %v10[1] * (2**210) +
    %v10[0] * (2**180) +
    %v9[1] * (2**150) +
    %v9[0] * (2**120) +
    %v8[1] * (2**90) +
    %v8[0] * (2**60)
) >= (-(2**60)) * ((2**255) + 38)
,
(
    %v12[0] * (2**300) +
    %v11[1] * (2**270) +
    %v11[0] * (2**240) +
    %v10[1] * (2**210) +
    %v10[0] * (2**180) +
    %v9[1] * (2**150) +
    %v9[0] * (2**120) +
    %v8[1] * (2**90) +
    %v8[0] * (2**60)
) <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
,
(
    %v12[1] * (2**300) +
    %v11[3] * (2**270) +
    %v11[2] * (2**240) +
    %v10[3] * (2**210) +
    %v10[2] * (2**180) +
    %v9[3] * (2**150) +
    %v9[2] * (2**120) +
    %v8[3] * (2**90) +
    %v8[2] * (2**60)
) >= (-(2**60)) * ((2**255) + 38)
,
(
    %v12[1] * (2**300) +
    %v11[3] * (2**270) +
    %v11[2] * (2**240) +
    %v10[3] * (2**210) +
    %v10[2] * (2**180) +
    %v9[3] * (2**150) +
    %v9[2] * (2**120) +
    %v8[3] * (2**90) +
    %v8[2] * (2**60)
) <= ((2**60)) * ((2**255) + 38) + ((2**60)-1) * ((2**255)-19)
]
&& true;

assert and [
%v12[0] <= (2**16)-1,
%v12[0] >= -(2**16) + (2**15 - 1),
%v12[1] <= (2**16)-1,
%v12[1] >= -(2**16) + (2**15 - 1)
]
prove with [algebra solver isl]
&& true;

assume and [
%v12[0] <= (2**16)-1,
%v12[0] >= -(2**16) + (2**15 - 1),
%v12[1] <= (2**16)-1,
%v12[1] >= -(2**16) + (2**15 - 1)
]
&&
%v12[0] <=s (const 64 ((2**16)-1)),
%v12[0] >=s (const 64 (-(2**16) + (2**15 - 1))),
%v12[1] <=s (const 64 ((2**16)-1)),
%v12[1] >=s (const 64 (-(2**16) + (2**15 - 1)))
;


{ true
&&
%v12[0] <=s (const 64 ((2**16)-1)),
%v12[0] >=s (const 64 (-(2**16) + (2**15 - 1))),
%v12[1] <=s (const 64 ((2**16)-1)),
%v12[1] >=s (const 64 (-(2**16) + (2**15 - 1)))
}

proc insert_high(%vec_target@sint64[2], %vec_insertant@sint64[2]; %vec_out@sint32[4]) = 
{true &&
%vec_target >=s [0@sint64, 0@sint64],
%vec_target <=s [((2**30)-1)@sint64, ((2**30)-1)@sint64],
%vec_insertant >=s [0@sint64, 0@sint64],
%vec_insertant <=s [((2**30)-1)@sint64, ((2**30)-1)@sint64]
}

mov %v8 %vec_target;
mov %v18 %vec_insertant;


(* sli	v8.2d, v18.2d, #32                          #! PC = 0xaaaabe372274 *)
shl %slih %v18 [32@int64, 32@int64];
split %dc %v8 %v8 32;
cast %v8@sint64[2] %v8;
or %v8@int64[2] %slih %v8;

cast %v8@sint32[4] %v8;


mov %vec_out %v8;

assert true &&
(sext (%vec_out[0]) 32) = %vec_target[0] (mod ((2**30)@64))
,
(sext (%vec_out[1]) 32) = %vec_insertant[0] (mod ((2**30)@64))
,
(sext (%vec_out[2]) 32) = %vec_target[1] (mod ((2**30)@64))
,
(sext (%vec_out[3]) 32) = %vec_insertant[1] (mod ((2**30)@64))
;

assume 
%vec_out[0] = %vec_target[0],
%vec_out[1] = %vec_insertant[0],
%vec_out[2] = %vec_target[1],
%vec_out[3] = %vec_insertant[1]
&& true;

assert true &&
(const 32 0) <=s %vec_out[0], %vec_out[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %vec_out[1], %vec_out[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %vec_out[2], %vec_out[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %vec_out[3], %vec_out[3] <=s (const 32 ((2**30) -1));


{
%vec_out[0] = %vec_target[0],
%vec_out[1] = %vec_insertant[0],
%vec_out[2] = %vec_target[1],
%vec_out[3] = %vec_insertant[1]
&& 
(sext (%vec_out[0]) 32) = %vec_target[0] (mod ((2**30)@64)),
(sext (%vec_out[1]) 32) = %vec_insertant[0] (mod ((2**30)@64)),
(sext (%vec_out[2]) 32) = %vec_target[1] (mod ((2**30)@64)),
(sext (%vec_out[3]) 32) = %vec_insertant[1] (mod ((2**30)@64)),
(const 32 0) <=s %vec_out[0], %vec_out[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %vec_out[1], %vec_out[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %vec_out[2], %vec_out[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %vec_out[3], %vec_out[3] <=s (const 32 ((2**30) -1))
}



proc get_l(
%vec_accu@sint64[2], %vec_4x_M@sint32[4], %vec_2x_2p30m1@sint64[2];
%vec_l@sint32[4]
) = 
{
    %vec_2x_2p30m1 = [((2**30)-1), ((2**30)-1)],
    %vec_4x_M = [678152731, 678152731, 678152731, 678152731]
&&
    %vec_2x_2p30m1 = [(2**30 - 1)@sint64, (2**30 - 1)@sint64]
}

mov %v17 %vec_accu;
mov %v15 %vec_4x_M;
mov %v1 %vec_2x_2p30m1;

(* mul	v19.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe37220c *)
cast %v17@sint32[4] %v17;
mull %dc %v19 %v17 %v15;
cast %v19@sint64[2] %v19;
cast %v17@sint64[2] %v17;

assert
%v19[0] = %vec_accu[0] * 678152731 (mod (2**32)),
%v19[1] = %vec_accu[1] * 678152731 (mod (2**32))
&& true;
assume
%v19[0] = %vec_accu[0] * 678152731 (mod (2**32)),
%v19[1] = %vec_accu[1] * 678152731 (mod (2**32))
&&
%v19[0] = %vec_accu[0] * 678152731@64 (mod ((2**32)@64)),
%v19[1] = %vec_accu[1] * 678152731@64 (mod ((2**32)@64))
;

ghost %v19old@sint64[2]:
%v19old = %v19
&&
%v19old = %v19
;

(* and	v19.16b, v19.16b, v1.16b                    #! PC = 0xaaaabe372210 *)
and %v19@sint64[2] %v19 %v1;

assert true &&
(const 64 0) <=s %v19[0], %v19[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v19[1], %v19[1] <=s (const 64 ((2**30)-1)),
%v19[0] = %v19old[0] (mod (const 64 (2**30))),
%v19[1] = %v19old[1] (mod (const 64 (2**30)));
assume
%v19[0] = %v19old[0] (mod (2**30)),
%v19[1] = %v19old[1] (mod (2**30))
&&
%v19[0] = %v19old[0] (mod (const 64 (2**30))),
%v19[1] = %v19old[1] (mod (const 64 (2**30)));


assert
%v19[0] = %vec_accu[0] * 678152731 (mod (2**30)),
%v19[1] = %vec_accu[1] * 678152731 (mod (2**30))
&& true;

(* uzp1	v19.4s, v19.4s, v19.4s                     #! PC = 0xaaaabe372214 *)
cast %v19@sint32[4] %v19;
mov %v19 [%v19[0], %v19[2], %v19[0], %v19[2]];



mov %vec_l %v19;

{
%vec_l[0] = %vec_accu[0] * 678152731 (mod (2**30)),
%vec_l[1] = %vec_accu[1] * 678152731 (mod (2**30))
&&
(const 32 0) <=s %vec_l[0], %vec_l[0] <=s (const 32 ((2**30)-1)),
(const 32 0) <=s %vec_l[1], %vec_l[1] <=s (const 32 ((2**30)-1))
}



proc update_bignum_VS (
%vec_uu0_rr0_vv0_ss0@sint32[4],
%vec_uu1_rr1_vv1_ss1@sint32[4],
%vec_V0_V1_S0_S1@sint32[4],
%vec_V2_V3_S2_S3@sint32[4],
%vec_V4_V5_S4_S5@sint32[4],
%vec_V6_V7_S6_S7@sint32[4],
%vec_V8_V9_S8_S9@sint32[4],
%vec_2x_2p30m1@sint64[2],
%vec_4x_M@sint32[4]
;
%vec_V0_V1_S0_S1_out@sint32[4],
%vec_V2_V3_S2_S3_out@sint32[4],
%vec_V4_V5_S4_S5_out@sint32[4],
%vec_V6_V7_S6_S7_out@sint32[4],
%vec_V8_V9_S8_S9_out@sint32[4]
) =
{
    %vec_2x_2p30m1 = [((2**30)-1), ((2**30)-1)],
    %vec_4x_M = [678152731, 678152731, 678152731, 678152731],
    (0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1),

    %vec_V0_V1_S0_S1 <= [((2**30)-1)+19, ((2**30)-1), ((2**30)-1)+19, ((2**30)-1)],
    %vec_V0_V1_S0_S1 >= [-38, 0, -38, 0],
    %vec_V2_V3_S2_S3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V2_V3_S2_S3 >= [0, 0, 0, 0],
    %vec_V4_V5_S4_S5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V4_V5_S4_S5 >= [0, 0, 0, 0],
    %vec_V6_V7_S6_S7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V6_V7_S6_S7 >= [0, 0, 0, 0],
    // %vec_V8_V9_S8_S9 <= [((2**15)-1), 0, ((2**15)-1), 0],
    // %vec_V8_V9_S8_S9 >= [(-(2**15)), (-1), (-(2**15)), (-1)],
    (0) <= %vec_V8_V9_S8_S9[0], %vec_V8_V9_S8_S9[0] <= (((2**15)-1)),
    (-1) <= %vec_V8_V9_S8_S9[1], %vec_V8_V9_S8_S9[1] <= (0),
    (0) <= %vec_V8_V9_S8_S9[2], %vec_V8_V9_S8_S9[2] <= (((2**15)-1)),
    (-1) <= %vec_V8_V9_S8_S9[3], %vec_V8_V9_S8_S9[3] <= (0),


    // norm condition
    // |u| + |v| < 2**60
    -(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    -(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    // |r| + |s| < 2**60
    -(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
    -(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60)
&&
    %vec_2x_2p30m1 = [(2**30 - 1)@sint64, (2**30 - 1)@sint64],
    %vec_4x_M = [678152731@sint32, 678152731@sint32, 678152731@sint32, 678152731@sint32]
}

mov %v8 %vec_V0_V1_S0_S1;
mov %v9 %vec_V2_V3_S2_S3;
mov %v10 %vec_V4_V5_S4_S5;
mov %v11 %vec_V6_V7_S6_S7;
mov %v12 %vec_V8_V9_S8_S9;
mov %v13 %vec_uu0_rr0_vv0_ss0;
mov %v14 %vec_uu1_rr1_vv1_ss1;
mov %v15 %vec_4x_M;
mov %v1 %vec_2x_2p30m1;


(* mov	x9, #0x13                  	// #19          #! PC = 0xaaaabe3721fc *)
mov x9 19@int64;
(* dup	v16.2d, x9                                  #! PC = 0xaaaabe372200 *)
mov %v16 [x9,x9];
cast %v16@sint32[4] %v16;

assert true &&
%v16[0] = (const 32 19),
%v16[1] = (const 32 0),
%v16[2] = (const 32 19),
%v16[3] = (const 32 0)
;
assume
%v16[0] = 19,
%v16[1] = 0,
%v16[2] = 19,
%v16[3] = 0
&&
%v16[0] = (const 32 19),
%v16[1] = (const 32 0),
%v16[2] = (const 32 19),
%v16[3] = (const 32 0)
;

(* smull	v17.2d, v13.2s, v8.s[0]                   #! PC = 0xaaaabe372204 *)
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v17@int64[2] %tmp1 %tmp2;
(* smlal2	v17.2d, v13.4s, v8.s[2]                  #! PC = 0xaaaabe372208 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert
%v17[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
(mod (2**64))
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
(mod (2**64))
&& true;
assume
%v17[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
(mod (2**64))
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
(mod (2**64))
&& true;
assert and [
%v17[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
]
&& true;





(* mul	v19.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe37220c *)
(* and	v19.16b, v19.16b, v1.16b                    #! PC = 0xaaaabe372210 *)
(* uzp1	v19.4s, v19.4s, v19.4s                     #! PC = 0xaaaabe372214 *)
nondet %v19@sint32[4];
call get_l(%v17, %v15, %v1; %v19);

// ghost %vec_l0@sint32[4]:
// %vec_l0 = %v19
// &&
// %vec_l0 = %v19;
mov %vec_l0 %v19;

assert true &&
(const 32 0) <=s %vec_l0[0], %vec_l0[0] <=s (const 32 ((2**30)-1)),
(const 32 0) <=s %vec_l0[1], %vec_l0[1] <=s (const 32 ((2**30)-1));
assume
0 <= %vec_l0[0], %vec_l0[0] <= ((2**30)-1),
0 <= %vec_l0[1], %vec_l0[1] <= ((2**30)-1)
&&
(const 32 0) <=s %vec_l0[0], %vec_l0[0] <=s (const 32 ((2**30)-1)),
(const 32 0) <=s %vec_l0[1], %vec_l0[1] <=s (const 32 ((2**30)-1));



(* smlsl	v17.2d, v19.2s, v16.s[0]                  #! PC = 0xaaaabe372218 *)
broadcast %tmp1@int32[2] 2 [%v16[0]];
mov %tmp2@int32[2] [%v19[0], %v19[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
subs %dc %v17@int64[2] %v17 %tmp3;


assert
%v17[0] =
%vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[0]
(mod (2**64))
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[1]
(mod (2**64))
&& true;
assume
%v17[0] =
%vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[0]
(mod (2**64))
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[1]
(mod (2**64))
&& true;
assert and [
%v17[0] =
%vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[0]
,
%v17[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[1]
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] =
%vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[0]
,
%v17[1] =
%vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[1]
]
&& true;

assert and [
%v17[0] = 0 (mod (2**30)),
%v17[1] = 0 (mod (2**30))
]
&& true;
assume and [
%v17[0] = 0 (mod (2**30)),
%v17[1] = 0 (mod (2**30))
]
&& 
%v17[0] = (const 64 0) (mod (const 64 (2**30))),
%v17[1] = (const 64 0) (mod (const 64 (2**30)))
;

ghost %v17_old0@sint64[2]:
%v17_old0 = %v17
&&
%v17_old0 = %v17
;


(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37221c *)
split %v17 %dc %v17 30;


assert true &&
%v17[0] * (const 64 (2**30)) = %v17_old0[0],
%v17[1] * (const 64 (2**30)) = %v17_old0[1]
;
assume
%v17[0] * (2**30) = %v17_old0[0],
%v17[1] * (2**30) = %v17_old0[1]
&&
%v17[0] * (const 64 (2**30)) = %v17_old0[0],
%v17[1] * (const 64 (2**30)) = %v17_old0[1]
;

assert and [
%v17[0] * (2**30) =
%vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[0]
,
%v17[1] * (2**30) =
%vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[1]
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**30) =
%vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[0]
,
%v17[1] * (2**30) =
%vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
- 19 * %vec_l0[1]
]
&& true;


(* smlal	v17.2d, v14.2s, v8.s[0]                   #! PC = 0xaaaabe372220 *)
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v8.s[2]                  #! PC = 0xaaaabe372224 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v8.s[1]                   #! PC = 0xaaaabe372228 *)
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v8.s[3]                  #! PC = 0xaaaabe37222c *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30)
(mod (2**94))
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30)
(mod (2**94))
]
&& true;
assume and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30)
(mod (2**94))
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30)
(mod (2**94))
]
&& true;
assert and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30)
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30)
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30)
]
&& true;



(* mul	v20.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe372230 *)
(* and	v20.16b, v20.16b, v1.16b                    #! PC = 0xaaaabe372234 *)
(* uzp1	v20.4s, v20.4s, v20.4s                     #! PC = 0xaaaabe372238 *)
nondet %v20@sint32[4];
call get_l(%v17, %v15, %v1; %v20);

// ghost %vec_l1@sint32[4]:
// %vec_l1 = %v20
// &&
// %vec_l1 = %v20;
mov %vec_l1 %v20;

assert true &&
(const 32 0) <=s %vec_l1[0], %vec_l1[0] <=s (const 32 ((2**30)-1)),
(const 32 0) <=s %vec_l1[1], %vec_l1[1] <=s (const 32 ((2**30)-1));
assume
0 <= %vec_l1[0], %vec_l1[0] <= ((2**30)-1),
0 <= %vec_l1[1], %vec_l1[1] <= ((2**30)-1)
&&
(const 32 0) <=s %vec_l1[0], %vec_l1[0] <=s (const 32 ((2**30)-1)),
(const 32 0) <=s %vec_l1[1], %vec_l1[1] <=s (const 32 ((2**30)-1));

(* smlsl	v17.2d, v20.2s, v16.s[0]                  #! PC = 0xaaaabe37223c *)
broadcast %tmp1@int32[2] 2 [%v16[0]];
mov %tmp2@int32[2] [%v20[0], %v20[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
subs %dc %v17@int64[2] %v17 %tmp3;

assert and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30)
(mod (2**94))
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30)
(mod (2**94))
]
&& true;
assume and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30)
(mod (2**94))
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30)
(mod (2**94))
]
&& true;
assert and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30)
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30)
,
%v17[1] * (2**30) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30)
]
&& true;


assert and [
%v17[0] = 0 (mod (2**30)),
%v17[1] = 0 (mod (2**30))
]
&& true;
assume and [
%v17[0] = 0 (mod (2**30)),
%v17[1] = 0 (mod (2**30))
]
&& 
%v17[0] = (const 64 0) (mod (const 64 (2**30))),
%v17[1] = (const 64 0) (mod (const 64 (2**30)))
;


ghost %v17_old1@sint64[2]:
%v17_old1 = %v17
&&
%v17_old1 = %v17
;

(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372240 *)
split %v17 %dc %v17 30;



assert true &&
%v17[0] * (const 64 (2**30)) = %v17_old1[0],
%v17[1] * (const 64 (2**30)) = %v17_old1[1]
;
assume
%v17[0] * (2**30) = %v17_old1[0],
%v17[1] * (2**30) = %v17_old1[1]
&&
%v17[0] * (const 64 (2**30)) = %v17_old1[0],
%v17[1] * (const 64 (2**30)) = %v17_old1[1]
;


assert and [
%v17[0] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30)
,
%v17[1] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30)
,
%v17[1] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30)
]
&& true;




(* smlal	v17.2d, v14.2s, v8.s[1]                   #! PC = 0xaaaabe372244 *)
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v8.s[3]                  #! PC = 0xaaaabe372248 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v9.s[0]                   #! PC = 0xaaaabe37224c *)
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v9.s[2]                  #! PC = 0xaaaabe372250 *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert and [
%v17[0] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
(mod (2**124))
,
%v17[1] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
(mod (2**124))
]
&& true;
assume and [
%v17[0] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
(mod (2**124))
,
%v17[1] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
(mod (2**124))
]
&& true;
assert and [
%v17[0] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
,
%v17[1] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
,
%v17[1] * (2**60) =
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
]
&& true;


ghost %v17_old2@sint64[2]:
%v17_old2 = %v17
&&
%v17_old2 = %v17
;

(* and	v8.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe372254 *)
and %v8@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372258 *)
split %v17 %dc %v17 30;


assert true &&
%v17[0] * (const 64 (2**30)) + %v8[0] = %v17_old2[0],
%v17[1] * (const 64 (2**30)) + %v8[1] = %v17_old2[1],
(const 64 0) <=s %v8[0], %v8[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v8[1], %v8[1] <=s (const 64 ((2**30)-1))
;

assume
%v17[0] * (2**30) + %v8[0] = %v17_old2[0],
%v17[1] * (2**30) + %v8[1] = %v17_old2[1],
0 <= %v8[0], %v8[0] <= ((2**30)-1),
0 <= %v8[1], %v8[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v8[0] = %v17_old2[0],
%v17[1] * (const 64 (2**30)) + %v8[1] = %v17_old2[1],
(const 64 0) <=s %v8[0], %v8[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v8[1], %v8[1] <=s (const 64 ((2**30)-1))
;

assert and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
]
&& true;
assume and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
]
&& true;
cut and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60)
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60)
]
,
0 <= %v8[0], %v8[0] <= ((2**30)-1),
0 <= %v8[1], %v8[1] <= ((2**30)-1),
0 <= %vec_l0[0], %vec_l0[0] <= ((2**30)-1),
0 <= %vec_l0[1], %vec_l0[1] <= ((2**30)-1),
0 <= %vec_l1[0], %vec_l1[0] <= ((2**30)-1),
0 <= %vec_l1[1], %vec_l1[1] <= ((2**30)-1),
%v16[0] = 19,
%v16[1] = 0,
%v16[2] = 19,
%v16[3] = 0
&&
%v16[0] = (const 32 19),
%v16[1] = (const 32 0),
%v16[2] = (const 32 19),
%v16[3] = (const 32 0),
(const 64 0) <=s %v8[0], %v8[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v8[1], %v8[1] <=s (const 64 ((2**30)-1)),
true prove with [precondition, all ghosts];



(* smlal	v17.2d, v14.2s, v9.s[0]                   #! PC = 0xaaaabe37225c *)
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v9.s[2]                  #! PC = 0xaaaabe372260 *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v9.s[1]                   #! PC = 0xaaaabe372264 *)
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v9.s[3]                  #! PC = 0xaaaabe372268 *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;

assert and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
(mod (2**154))
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
(mod (2**154))
]
&& true;
assume and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
(mod (2**154))
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
(mod (2**154))
]
&& true;
assert and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
,
%v17[1] * (2**90) +
%v8[1] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
]
&& true;



ghost %v17_old3@sint64[2]:
%v17_old3 = %v17
&&
%v17_old3 = %v17
;


(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe37226c *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372270 *)
split %v17 %dc %v17 30;

assert true &&
%v17[0] * (const 64 (2**30)) + %v18[0] = %v17_old3[0],
%v17[1] * (const 64 (2**30)) + %v18[1] = %v17_old3[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;

assume
%v17[0] * (2**30) + %v18[0] = %v17_old3[0],
%v17[1] * (2**30) + %v18[1] = %v17_old3[1],
0 <= %v18[0], %v18[0] <= ((2**30)-1),
0 <= %v18[1], %v18[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v18[0] = %v17_old3[0],
%v17[1] * (const 64 (2**30)) + %v18[1] = %v17_old3[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;


(* sli	v8.2d, v18.2d, #32                          #! PC = 0xaaaabe372274 *)
mov %v8_in %v8;
nondet %v8@sint32[4];
call insert_high(%v8_in, %v18; %v8);

assert 
%v17[0] * (2**30) + %v8[1] = %v17_old3[0]
,
%v17[1] * (2**30) + %v8[3] = %v17_old3[1]
&&
(const 32 0) <=s %v8[0], %v8[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[1], %v8[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[2], %v8[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[3], %v8[3] <=s (const 32 ((2**30) -1))
;
assume
%v17[0] * (2**30) + %v8[1] = %v17_old3[0]
,
%v17[1] * (2**30) + %v8[3] = %v17_old3[1]
,
0 <= %v8[0], %v8[0] <= ((2**30) -1),
0 <= %v8[1], %v8[1] <= ((2**30) -1),
0 <= %v8[2], %v8[2] <= ((2**30) -1),
0 <= %v8[3], %v8[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v8[0], %v8[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[1], %v8[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[2], %v8[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[3], %v8[3] <=s (const 32 ((2**30) -1))
;

assert and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
]
&& true;
assume and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
]
&& true;
cut and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) 
]
,
0 <= %v8[0], %v8[0] <= ((2**30) -1),
0 <= %v8[1], %v8[1] <= ((2**30) -1),
0 <= %v8[2], %v8[2] <= ((2**30) -1),
0 <= %v8[3], %v8[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v8[0], %v8[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[1], %v8[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[2], %v8[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v8[3], %v8[3] <=s (const 32 ((2**30) -1)),
true prove with [all cuts, precondition, all ghosts];



(* smlal	v17.2d, v14.2s, v9.s[1]                   #! PC = 0xaaaabe372278 *)
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v9.s[3]                  #! PC = 0xaaaabe37227c *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v10.s[0]                  #! PC = 0xaaaabe372280 *)
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v10.s[2]                 #! PC = 0xaaaabe372284 *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
(mod (2**184))
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
(mod (2**184))
]
&& true;
assume and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
(mod (2**184))
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
(mod (2**184))
]
&& true;
assert and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
,
%v17[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
]
&& true;


ghost %v17_old4@sint64[2]:
	%v17_old4 = %v17
	&&
	%v17_old4 = %v17
	;



(* and	v9.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe372288 *)
and %v9@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37228c *)
split %v17 %dc %v17 30;


assert true &&
%v17[0] * (const 64 (2**30)) + %v9[0] = %v17_old4[0],
%v17[1] * (const 64 (2**30)) + %v9[1] = %v17_old4[1],
(const 64 0) <=s %v9[0], %v9[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v9[1], %v9[1] <=s (const 64 ((2**30)-1))
;
assume
%v17[0] * (2**30) + %v9[0] = %v17_old4[0],
%v17[1] * (2**30) + %v9[1] = %v17_old4[1],
0 <= %v9[0], %v9[0] <= ((2**30)-1),
0 <= %v9[1], %v9[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v9[0] = %v17_old4[0],
%v17[1] * (const 64 (2**30)) + %v9[1] = %v17_old4[1],
(const 64 0) <=s %v9[0], %v9[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v9[1], %v9[1] <=s (const 64 ((2**30)-1))
;

assert and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
]
&& true;
assume and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
]
&& true;
cut and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) 
]
,
0 <= %v9[0], %v9[0] <= ((2**30)-1),
0 <= %v9[1], %v9[1] <= ((2**30)-1)
&&
(const 64 0) <=s %v9[0], %v9[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v9[1], %v9[1] <=s (const 64 ((2**30)-1)),
true prove with [all cuts, precondition]
;

(* smlal	v17.2d, v14.2s, v10.s[0]                  #! PC = 0xaaaabe372290 *)
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v10.s[2]                 #! PC = 0xaaaabe372294 *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v10.s[1]                  #! PC = 0xaaaabe372298 *)
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v10.s[3]                 #! PC = 0xaaaabe37229c *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;

assert and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
(mod (2**214))
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
(mod (2**214))
]
&& true;
assume and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
(mod (2**214))
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
(mod (2**214))
]
&& true;
assert and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
,
%v17[1] * (2**150) +
%v9[1] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
]
&& true;


ghost %v17_old5@sint64[2]:
	%v17_old5 = %v17
	&&
	%v17_old5 = %v17
	;


(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722a0 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722a4 *)
split %v17 %dc %v17 30;


assert true &&
%v17[0] * (const 64 (2**30)) + %v18[0] = %v17_old5[0],
%v17[1] * (const 64 (2**30)) + %v18[1] = %v17_old5[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;

assume 
%v17[0] * (2**30) + %v18[0] = %v17_old5[0],
%v17[1] * (2**30) + %v18[1] = %v17_old5[1],
0 <= %v18[0], %v18[0] <= ((2**30)-1),
0 <= %v18[1], %v18[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v18[0] = %v17_old5[0],
%v17[1] * (const 64 (2**30)) + %v18[1] = %v17_old5[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;

(* sli	v9.2d, v18.2d, #32                          #! PC = 0xaaaabe3722a8 *)
mov %v9_in %v9;
nondet %v9@sint32[4];
call insert_high(%v9_in, %v18; %v9);

assert true &&
(const 32 0) <=s %v9[0], %v9[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[1], %v9[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[2], %v9[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[3], %v9[3] <=s (const 32 ((2**30) -1))
;

assume
0 <= %v9[0], %v9[0] <= ((2**30) -1),
0 <= %v9[1], %v9[1] <= ((2**30) -1),
0 <= %v9[2], %v9[2] <= ((2**30) -1),
0 <= %v9[3], %v9[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v9[0], %v9[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[1], %v9[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[2], %v9[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[3], %v9[3] <=s (const 32 ((2**30) -1))
;

assert and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
]
&& true;
assume and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
]
&& true;
cut and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) 
]
,
0 <= %v9[0], %v9[0] <= ((2**30) -1),
0 <= %v9[1], %v9[1] <= ((2**30) -1),
0 <= %v9[2], %v9[2] <= ((2**30) -1),
0 <= %v9[3], %v9[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v9[0], %v9[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[1], %v9[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[2], %v9[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v9[3], %v9[3] <=s (const 32 ((2**30) -1)),
true prove with [all cuts, precondition]
;

(* smlal	v17.2d, v14.2s, v10.s[1]                  #! PC = 0xaaaabe3722ac *)
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v10.s[3]                 #! PC = 0xaaaabe3722b0 *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v11.s[0]                  #! PC = 0xaaaabe3722b4 *)
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v11.s[2]                 #! PC = 0xaaaabe3722b8 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180)
(mod (2**244))
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180)
(mod (2**244))
]
&&
true;
assume and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180)
(mod (2**244))
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180)
(mod (2**244))
]
&&
true;
assert and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180)
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180)
]
prove with [algebra solver smt:z3]
&&
true;
assume and [
%v17[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180)
,
%v17[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180)
]
&&
true;

ghost %v17_old6@sint64[2]:
	%v17_old6 = %v17
	&&
	%v17_old6 = %v17
	;

(* and	v10.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722bc *)
and %v10@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722c0 *)
split %v17 %dc %v17 30;

assert true &&
%v17[0] * (const 64 (2**30)) + %v10[0] = %v17_old6[0],
%v17[1] * (const 64 (2**30)) + %v10[1] = %v17_old6[1],
(const 64 0) <=s %v10[0], %v10[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v10[1], %v10[1] <=s (const 64 ((2**30)-1))
;

assume 
%v17[0] * (2**30) + %v10[0] = %v17_old6[0],
%v17[1] * (2**30) + %v10[1] = %v17_old6[1],
0 <= %v10[0], %v10[0] <= ((2**30)-1),
0 <= %v10[1], %v10[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v10[0] = %v17_old6[0],
%v17[1] * (const 64 (2**30)) + %v10[1] = %v17_old6[1],
(const 64 0) <=s %v10[0], %v10[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v10[1], %v10[1] <=s (const 64 ((2**30)-1))
;

cut and [
%v17[0] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180)
,
%v17[1] * (2**210) +
%v10[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180)
]
,
0 <= %v10[0], %v10[0] <= ((2**30)-1),
0 <= %v10[1], %v10[1] <= ((2**30)-1)
&&
(const 64 0) <=s %v10[0], %v10[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v10[1], %v10[1] <=s (const 64 ((2**30)-1)),
true prove with [all cuts, precondition];

(* smlal	v17.2d, v14.2s, v11.s[0]                  #! PC = 0xaaaabe3722c4 *)
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v11.s[2]                 #! PC = 0xaaaabe3722c8 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v11.s[1]                  #! PC = 0xaaaabe3722cc *)
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v11.s[3]                 #! PC = 0xaaaabe3722d0 *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert and [
%v17[0] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210)
(mod (2**274))
,
%v17[1] * (2**210) +
%v10[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210)
(mod (2**274))
]
&& true;
assume and [
%v17[0] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210)
(mod (2**274))
,
%v17[1] * (2**210) +
%v10[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210)
(mod (2**274))
]
&& true;
assert and [
%v17[0] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210)
,
%v17[1] * (2**210) +
%v10[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210)
,
%v17[1] * (2**210) +
%v10[1] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210)
]
&& true;

ghost %v17_old7@sint64[2]:
	%v17_old7 = %v17
	&&
	%v17_old7 = %v17
	;

(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722d4 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722d8 *)
split %v17 %dc %v17 30;

assert true &&
%v17[0] * (const 64 (2**30)) + %v18[0] = %v17_old7[0],
%v17[1] * (const 64 (2**30)) + %v18[1] = %v17_old7[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;

assume 
%v17[0] * (2**30) + %v18[0] = %v17_old7[0],
%v17[1] * (2**30) + %v18[1] = %v17_old7[1],
0 <= %v18[0], %v18[0] <= ((2**30)-1),
0 <= %v18[1], %v18[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v18[0] = %v17_old7[0],
%v17[1] * (const 64 (2**30)) + %v18[1] = %v17_old7[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;

(* sli	v10.2d, v18.2d, #32                         #! PC = 0xaaaabe3722dc *)
mov %v10_in %v10;
nondet %v10@sint32[4];
call insert_high(%v10_in, %v18; %v10);


assert 
%v17[0] * (2**30) + %v10[1] = %v17_old7[0]
,
%v17[1] * (2**30) + %v10[3] = %v17_old7[1]
&& true;

assert true &&
(const 32 0) <=s %v10[0], %v10[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[1], %v10[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[2], %v10[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[3], %v10[3] <=s (const 32 ((2**30) -1))
;

assume
0 <= %v10[0], %v10[0] <= ((2**30) -1),
0 <= %v10[1], %v10[1] <= ((2**30) -1),
0 <= %v10[2], %v10[2] <= ((2**30) -1),
0 <= %v10[3], %v10[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v10[0], %v10[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[1], %v10[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[2], %v10[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[3], %v10[3] <=s (const 32 ((2**30) -1))
;

cut and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210)
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210)
]
,
0 <= %v10[0], %v10[0] <= ((2**30) -1),
0 <= %v10[1], %v10[1] <= ((2**30) -1),
0 <= %v10[2], %v10[2] <= ((2**30) -1),
0 <= %v10[3], %v10[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v10[0], %v10[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[1], %v10[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[2], %v10[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v10[3], %v10[3] <=s (const 32 ((2**30) -1)),
true prove with [all cuts, precondition];


(* smlal	v17.2d, v14.2s, v11.s[1]                  #! PC = 0xaaaabe3722e0 *)
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v11.s[3]                 #! PC = 0xaaaabe3722e4 *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v12.s[0]                  #! PC = 0xaaaabe3722e8 *)
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v12.s[2]                 #! PC = 0xaaaabe3722ec *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;

assert and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240)
(mod (2**304))
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240)
(mod (2**304))
]
&& true;
assume and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240)
(mod (2**304))
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240)
(mod (2**304))
]
&& true;
assert and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240)
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240)
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240)
]
&& true;


(* ushll	v19.2d, v19.2s, #15                       #! PC = 0xaaaabe3722f0 *)
cast tmp0@sint64 %v19[0];
cast tmp1@sint64 %v19[1];
mov %tmp@sint64[2] [tmp0, tmp1];
shl %v19 %tmp [15@sint64, 15@sint64];
(* add	v17.2d, v17.2d, v19.2d                      #! PC = 0xaaaabe3722f4 *)
adds %dc %v17 %v17 %v19;

assert and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240)
(mod (2**304))
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240)
(mod (2**304))
]
prove with [all ghosts]
&& true;
assume and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240)
(mod (2**304))
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240)
(mod (2**304))
]
&& true;
assert and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240)
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240)
,
%v17[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240)
]
&& true;

ghost %v17_old8@sint64[2]:
	%v17_old8 = %v17
	&&
	%v17_old8 = %v17
	;

(* and	v11.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722f8 *)
and %v11@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722fc *)
split %v17 %dc %v17 30;

assert true &&
%v17[0] * (const 64 (2**30)) + %v11[0] = %v17_old8[0],
%v17[1] * (const 64 (2**30)) + %v11[1] = %v17_old8[1],
(const 64 0) <=s %v11[0], %v11[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v11[1], %v11[1] <=s (const 64 ((2**30)-1))
;

assume 
%v17[0] * (2**30) + %v11[0] = %v17_old8[0],
%v17[1] * (2**30) + %v11[1] = %v17_old8[1],
0 <= %v11[0], %v11[0] <= ((2**30)-1),
0 <= %v11[1], %v11[1] <= ((2**30)-1)
&&
%v17[0] * (const 64 (2**30)) + %v11[0] = %v17_old8[0],
%v17[1] * (const 64 (2**30)) + %v11[1] = %v17_old8[1],
(const 64 0) <=s %v11[0], %v11[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v11[1], %v11[1] <=s (const 64 ((2**30)-1))
;



cut and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240)
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240)
]
,
0 <= %v11[0], %v11[0] <= ((2**30)-1),
0 <= %v11[1], %v11[1] <= ((2**30)-1)
&&
(const 64 0) <=s %v11[0], %v11[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v11[1], %v11[1] <=s (const 64 ((2**30)-1)),
true prove with [all cuts, precondition, all ghosts];


(* smlal	v17.2d, v14.2s, v12.s[0]                  #! PC = 0xaaaabe372300 *)
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v12.s[2]                 #! PC = 0xaaaabe372304 *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;


assert and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod (2**334))
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod (2**334))
]
&& true;
assume and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod (2**334))
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod (2**334))
]
&& true;
assert and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
]
&& true;




(* ushll	v20.2d, v20.2s, #15                       #! PC = 0xaaaabe372308 *)
cast tmp0@sint64 %v20[0];
cast tmp1@sint64 %v20[1];
mov %tmp@sint64[2] [tmp0, tmp1];
shl %v20 %tmp [15@sint64, 15@sint64];
(* add	v17.2d, v17.2d, v20.2d                      #! PC = 0xaaaabe37230c *)
adds %dc %v17 %v17 %v20;

assert and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
(mod (2**334))
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
(mod (2**334))
]
prove with [all ghosts]
&& true;
assume and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
(mod (2**334))
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
(mod (2**334))
]
&& true;
assert and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
]
prove with [algebra solver smt:z3]
&& true;
assume and [
%v17[0] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
,
%v17[1] * (2**270) +
%v11[1] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
]
&& true;




ghost %v17_old9@sint64[2]:
	%v17_old9 = %v17
	&&
	%v17_old9 = %v17
	;




(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372310 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v12.2d, v17.2d, #30                        #! PC = 0xaaaabe372314 *)
split %v12 %dc %v17 30;

assert true &&
%v12[0] * (const 64 (2**30)) + %v18[0] = %v17_old9[0],
%v12[1] * (const 64 (2**30)) + %v18[1] = %v17_old9[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;

assume 
%v12[0] * (2**30) + %v18[0] = %v17_old9[0],
%v12[1] * (2**30) + %v18[1] = %v17_old9[1],
0 <= %v18[0], %v18[0] <= ((2**30)-1),
0 <= %v18[1], %v18[1] <= ((2**30)-1)
&&
%v12[0] * (const 64 (2**30)) + %v18[0] = %v17_old9[0],
%v12[1] * (const 64 (2**30)) + %v18[1] = %v17_old9[1],
(const 64 0) <=s %v18[0], %v18[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v18[1], %v18[1] <=s (const 64 ((2**30)-1))
;


(* sli	v11.2d, v18.2d, #32                         #! PC = 0xaaaabe372318 *)
mov %v11_in %v11;
nondet %v11@sint32[4];
call insert_high(%v11_in, %v18; %v11);

assert true &&
(const 32 0) <=s %v11[0], %v11[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[1], %v11[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[2], %v11[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[3], %v11[3] <=s (const 32 ((2**30) -1))
;

assume
0 <= %v11[0], %v11[0] <= ((2**30) -1),
0 <= %v11[1], %v11[1] <= ((2**30) -1),
0 <= %v11[2], %v11[2] <= ((2**30) -1),
0 <= %v11[3], %v11[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v11[0], %v11[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[1], %v11[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[2], %v11[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[3], %v11[3] <=s (const 32 ((2**30) -1))
;


cut and [
%v12[0] * (2**300) +
%v11[1] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
,
%v12[1] * (2**300) +
%v11[3] * (2**270) +
%v11[2] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
]
,
0 <= %v11[0], %v11[0] <= ((2**30) -1),
0 <= %v11[1], %v11[1] <= ((2**30) -1),
0 <= %v11[2], %v11[2] <= ((2**30) -1),
0 <= %v11[3], %v11[3] <= ((2**30) -1)
&&
(const 32 0) <=s %v11[0], %v11[0] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[1], %v11[1] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[2], %v11[2] <=s (const 32 ((2**30) -1)),
(const 32 0) <=s %v11[3], %v11[3] <=s (const 32 ((2**30) -1)),
true prove with [all cuts, all ghosts, precondition];



assert and [
[0,0,0,0] <= %v8, %v8 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v9, %v9 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v10, %v10 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v11, %v11 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
(0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1),
0 <= %vec_l0[0], %vec_l0[0] <= ((2**30)-1),
0 <= %vec_l0[1], %vec_l0[1] <= ((2**30)-1),
0 <= %vec_l1[0], %vec_l1[0] <= ((2**30)-1),
0 <= %vec_l1[1], %vec_l1[1] <= ((2**30)-1),
// norm condition
// |u| + |v| < 2**60
-(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
-(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
// |r| + |s| < 2**60
-(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
-(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
%vec_V0_V1_S0_S1 <= [((2**30)-1)+19, ((2**30)-1), ((2**30)-1)+19, ((2**30)-1)],
%vec_V0_V1_S0_S1 >= [-38, 0, -38, 0],
%vec_V2_V3_S2_S3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V2_V3_S2_S3 >= [0, 0, 0, 0],
%vec_V4_V5_S4_S5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V4_V5_S4_S5 >= [0, 0, 0, 0],
%vec_V6_V7_S6_S7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V6_V7_S6_S7 >= [0, 0, 0, 0],
%vec_V8_V9_S8_S9 <= [((2**15)-1), 0, ((2**15)-1), 0],
%vec_V8_V9_S8_S9 >= [(-(2**15)), (-1), (-(2**15)), (-1)]
]
prove with [all cuts, precondition, algebra solver smt:z3]
&& true;
assume and [
[0,0,0,0] <= %v8, %v8 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v9, %v9 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v10, %v10 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
[0,0,0,0] <= %v11, %v11 <= [(2**30)-1, (2**30)-1, (2**30)-1, (2**30)-1],
(0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
(0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
(-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1),
0 <= %vec_l0[0], %vec_l0[0] <= ((2**30)-1),
0 <= %vec_l0[1], %vec_l0[1] <= ((2**30)-1),
0 <= %vec_l1[0], %vec_l1[0] <= ((2**30)-1),
0 <= %vec_l1[1], %vec_l1[1] <= ((2**30)-1),
// norm condition
// |u| + |v| < 2**60
-(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
-(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) <= (2**60),
// |r| + |s| < 2**60
-(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
-(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
-(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) <= (2**60),
%vec_V0_V1_S0_S1 <= [((2**30)-1)+19, ((2**30)-1), ((2**30)-1)+19, ((2**30)-1)],
%vec_V0_V1_S0_S1 >= [-38, 0, -38, 0],
%vec_V2_V3_S2_S3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V2_V3_S2_S3 >= [0, 0, 0, 0],
%vec_V4_V5_S4_S5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V4_V5_S4_S5 >= [0, 0, 0, 0],
%vec_V6_V7_S6_S7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
%vec_V6_V7_S6_S7 >= [0, 0, 0, 0],
%vec_V8_V9_S8_S9 <= [((2**15)-1), 0, ((2**15)-1), 0],
%vec_V8_V9_S8_S9 >= [(-(2**15)), (-1), (-(2**15)), (-1)]
]
&&
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v8, %v8 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v9, %v9 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v10, %v10 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %v11, %v11 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <=s ((2**30)-1)@sint32,
(0@sint32) <=s %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <=s ((2**30)-1)@sint32,
(-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l0[0], %vec_l0[0] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l0[1], %vec_l0[1] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l1[0], %vec_l1[0] <=s ((2**30)-1)@sint32,
0@sint32 <=s %vec_l1[1], %vec_l1[1] <=s ((2**30)-1)@sint32,
// norm condition
// |u| + |v| <= 2**60
limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]] <=s (const 62 (2**60)),
// |r| + |s| <= 2**60
limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] +
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
0@62 - limbs 30 [%vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]] -
limbs 30 [%vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]] <=s (const 62 (2**60)),
%vec_V0_V1_S0_S1 <=s [(((2**30)-1)+19)@sint32, ((2**30)-1)@sint32, (((2**30)-1)+19)@sint32, ((2**30)-1)@sint32],
%vec_V0_V1_S0_S1 >=s [(-38)@sint32, 0@sint32, (-38)@sint32, 0@sint32],
%vec_V2_V3_S2_S3 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V2_V3_S2_S3 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V4_V5_S4_S5 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V4_V5_S4_S5 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V6_V7_S6_S7 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
%vec_V6_V7_S6_S7 >=s [0@sint32, 0@sint32, 0@sint32, 0@sint32],
%vec_V8_V9_S8_S9 <=s [((2**15)-1)@sint32, 0@sint32, ((2**15)-1)@sint32, 0@sint32],
%vec_V8_V9_S8_S9 >=s [(-(2**15))@sint32, (-1)@sint32, (-(2**15))@sint32, (-1)@sint32]
;

call msl_range_lemma(
    %v12, %v11, %v10, %v9, %v8,
    %vec_uu0_rr0_vv0_ss0, %vec_uu1_rr1_vv1_ss1,
    %vec_V0_V1_S0_S1,
    %vec_V2_V3_S2_S3,
    %vec_V4_V5_S4_S5,
    %vec_V6_V7_S6_S7,
    %vec_V8_V9_S8_S9,
    %vec_l0, %vec_l1
);

assert
true
&&
%v12[0] <=s (const 64 ((2**16)-1)),
%v12[0] >=s (const 64 (-(2**16) + (2**15 - 1))),
%v12[1] <=s (const 64 ((2**16)-1)),
%v12[1] >=s (const 64 (-(2**16) + (2**15 - 1)))
;
assume and [
%v12[0] <= (2**16)-1,
%v12[0] >= -(2**16) + (2**15 - 1),
%v12[1] <= (2**16)-1,
%v12[1] >= -(2**16) + (2**15 - 1)
]
&&
%v12[0] <=s (const 64 ((2**16)-1)),
%v12[0] >=s (const 64 (-(2**16) + (2**15 - 1))),
%v12[1] <=s (const 64 ((2**16)-1)),
%v12[1] >=s (const 64 (-(2**16) + (2**15 - 1)))
;


cast %v12@sint32[4] %v12;

assert and [
%v12[0] * (2**300) +
%v11[1] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
,
%v12[2] * (2**300) +
%v11[3] * (2**270) +
%v11[2] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
]
prove with [algebra solver smt:z3]
&&
true;
assume and [
%v12[0] * (2**300) +
%v11[1] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[0]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[0]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[0]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[0]
) * (2**270)
,
%v12[2] * (2**300) +
%v11[3] * (2**270) +
%v11[2] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
    - 19 * %vec_l0[1]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
    - 19 * %vec_l1[1]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l0[1]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
    + (2**15) * %vec_l1[1]
) * (2**270)
]
&&
true;



ghost %v8_old@sint32[4], %v9_old@sint32[4], %v10_old@sint32[4], %v11_old@sint32[4], %v12_old@sint32[4]:
%v8_old = %v8,
%v9_old = %v9,
%v10_old = %v10,
%v11_old = %v11,
%v12_old = %v12
&&
%v8_old = %v8,
%v9_old = %v9,
%v10_old = %v10,
%v11_old = %v11,
%v12_old = %v12;


cast %v12@sint64[2] %v12;
(* sshr	v18.2d, v12.2d, #15                        #! PC = 0xaaaabe37231c *)
split %v18 %dc %v12 15;
(* shl	v17.2d, v18.2d, #15                         #! PC = 0xaaaabe372320 *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 15;
shl tmp2 tmp2 15;
mov %v17 [tmp1, tmp2];

assert true &&
or [
    and [ %v18[0] = (-2)@sint64, %v17[0] = (-(2**16))@sint64, %v12_old[0] = ((-(2**15)-1))@sint32 ],
    and [ %v18[0] = (-1)@sint64, %v17[0] = (-(2**15))@sint64 ],
    and [ %v18[0] = (0)@sint64, %v17[0] = (0)@sint64 ],
    and [ %v18[0] = (1)@sint64, %v17[0] = ((2**15))@sint64 ]
]
,
or [
    and [ %v18[1] = (-2)@sint64, %v17[1] = (-(2**16))@sint64 ],
    and [ %v18[1] = (-1)@sint64, %v17[1] = (-(2**15))@sint64 ],
    and [ %v18[1] = (0)@sint64, %v17[1] = (0)@sint64 ],
    and [ %v18[1] = (1)@sint64, %v17[1] = ((2**15))@sint64 ]
]
;

assert true
&& and [
%v16 = [19@sint32, 0@sint32, 19@sint32, 0@sint32]
]
prove with [all cuts]
;


(* sub	v12.2d, v12.2d, v17.2d                      #! PC = 0xaaaabe372324 *)
subs %dc %v12 %v12 %v17;
(* mla	v8.4s, v18.4s, v16.4s                       #! PC = 0xaaaabe372328 *)
cast %v18@sint32[4] %v18;
mull %dc %mla %v18 %v16;
cast %mla@sint32[4] %mla;
cast %v8@sint32[4] %v8;
adds %dc %v8 %v8 %mla;

cast %v12@sint32[4] %v12;


assert true &&
or [
    and [
        %v12[0] = %v12_old[0] - (((-2)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((-2)@sint32) * (19@sint32)
    ],
    and [
        %v12[0] = %v12_old[0] - (((-1)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((-1)@sint32) * (19@sint32)
    ],
    and [
        %v12[0] = %v12_old[0] - (((0)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((0)@sint32) * (19@sint32)
    ],
    and [
        %v12[0] = %v12_old[0] - (((1)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((1)@sint32) * (19@sint32)
    ]
]
,
or [
    and [
        %v12[2] = %v12_old[2] - (((-2)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((-2)@sint32) * (19@sint32)
    ],
    and [
        %v12[2] = %v12_old[2] - (((-1)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((-1)@sint32) * (19@sint32)
    ],
    and [
        %v12[2] = %v12_old[2] - (((0)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((0)@sint32) * (19@sint32)
    ],
    and [
        %v12[2] = %v12_old[2] - (((1)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((1)@sint32) * (19@sint32)
    ]
]
,
(0@sint32) <=s %v12[0], %v12[0] <=s (((2**15)-1)@sint32),
(0@sint32) <=s %v12[2], %v12[2] <=s (((2**15)-1)@sint32);
assume true &&
or [
    and [
        %v12[0] = %v12_old[0] - (((-2)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((-2)@sint32) * (19@sint32)
    ],
    and [
        %v12[0] = %v12_old[0] - (((-1)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((-1)@sint32) * (19@sint32)
    ],
    and [
        %v12[0] = %v12_old[0] - (((0)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((0)@sint32) * (19@sint32)
    ],
    and [
        %v12[0] = %v12_old[0] - (((1)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((1)@sint32) * (19@sint32)
    ]
]
,
or [
    and [
        %v12[2] = %v12_old[2] - (((-2)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((-2)@sint32) * (19@sint32)
    ],
    and [
        %v12[2] = %v12_old[2] - (((-1)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((-1)@sint32) * (19@sint32)
    ],
    and [
        %v12[2] = %v12_old[2] - (((0)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((0)@sint32) * (19@sint32)
    ],
    and [
        %v12[2] = %v12_old[2] - (((1)@sint32) * ((2**15)@sint32)),
        %v8[2] = %v8_old[2] + ((1)@sint32) * (19@sint32)
    ]
]
,
(0@sint32) <=s %v12[0], %v12[0] <=s (((2**15)-1)@sint32),
((-1)@sint32) <=s %v12[1], %v12[1] <=s (0@sint32),
(0@sint32) <=s %v12[2], %v12[2] <=s (((2**15)-1)@sint32),
((-1)@sint32) <=s %v12[3], %v12[3] <=s (0@sint32),
(((-38)@sint32)) <=s %v8[0], %v8[0] <=s (((2**30)-1 + 19)@sint32),
(((0)@sint32)) <=s %v8[1], %v8[1] <=s (((2**30)-1)@sint32),
(((-38)@sint32)) <=s %v8[2], %v8[2] <=s (((2**30)-1 + 19)@sint32),
(((0)@sint32)) <=s %v8[3], %v8[3] <=s (((2**30)-1)@sint32)

;




assert true &&
        (sext (%v8[0]) 240) * ((2**(30*0))@272) + (sext (%v8[1]) 240) * ((2**(30*1))@272) +
        (sext (%v9[0]) 240) * ((2**(30*2))@272) + (sext (%v9[1]) 240) * ((2**(30*3))@272) +
        (sext (%v10[0]) 240) * ((2**(30*4))@272) + (sext (%v10[1]) 240) * ((2**(30*5))@272) +
        (sext (%v11[0]) 240) * ((2**(30*6))@272) + (sext (%v11[1]) 240) * ((2**(30*7))@272) +
        (sext (%v12[0]) 240) * ((2**(30*8))@272)
        = 
        (sext (%v8_old[0]) 240) * ((2**(30*0))@272) + (sext (%v8_old[1]) 240) * ((2**(30*1))@272) +
        (sext (%v9_old[0]) 240) * ((2**(30*2))@272) + (sext (%v9_old[1]) 240) * ((2**(30*3))@272) +
        (sext (%v10_old[0]) 240) * ((2**(30*4))@272) + (sext (%v10_old[1]) 240) * ((2**(30*5))@272) +
        (sext (%v11_old[0]) 240) * ((2**(30*6))@272) + (sext (%v11_old[1]) 240) * ((2**(30*7))@272) +
        (sext (%v12_old[0]) 240) * ((2**(30*8))@272)
        (smod (const 272 ((2**255)-19)))
        ,
        (sext (%v8[2]) 240) * ((2**(30*0))@272) + (sext (%v8[3]) 240) * ((2**(30*1))@272) +
        (sext (%v9[2]) 240) * ((2**(30*2))@272) + (sext (%v9[3]) 240) * ((2**(30*3))@272) +
        (sext (%v10[2]) 240) * ((2**(30*4))@272) + (sext (%v10[3]) 240) * ((2**(30*5))@272) +
        (sext (%v11[2]) 240) * ((2**(30*6))@272) + (sext (%v11[3]) 240) * ((2**(30*7))@272) +
        (sext (%v12[2]) 240) * ((2**(30*8))@272)
        = 
        (sext (%v8_old[2]) 240) * ((2**(30*0))@272) + (sext (%v8_old[3]) 240) * ((2**(30*1))@272) +
        (sext (%v9_old[2]) 240) * ((2**(30*2))@272) + (sext (%v9_old[3]) 240) * ((2**(30*3))@272) +
        (sext (%v10_old[2]) 240) * ((2**(30*4))@272) + (sext (%v10_old[3]) 240) * ((2**(30*5))@272) +
        (sext (%v11_old[2]) 240) * ((2**(30*6))@272) + (sext (%v11_old[3]) 240) * ((2**(30*7))@272) +
        (sext (%v12_old[2]) 240) * ((2**(30*8))@272)
        (smod (const 272 ((2**255)-19)))
;
assume 
        limbs 30 [%v8[0], %v8[1], %v9[0], %v9[1], %v10[0], %v10[1], %v11[0], %v11[1], %v12[0]]
        =
        limbs 30 [%v8_old[0], %v8_old[1], %v9_old[0], %v9_old[1], %v10_old[0], %v10_old[1], %v11_old[0], %v11_old[1], %v12_old[0]]
        (mod ((2**255)-19))
        ,
        limbs 30 [%v8[2], %v8[3], %v9[2], %v9[3], %v10[2], %v10[3], %v11[2], %v11[3], %v12[2]]
        =
        limbs 30 [%v8_old[2], %v8_old[3], %v9_old[2], %v9_old[3], %v10_old[2], %v10_old[3], %v11_old[2], %v11_old[3], %v12_old[2]]
        (mod ((2**255)-19))
        && true;

assert and [
%v12[0] * (2**300) +
%v11[1] * (2**270) +
%v11[0] * (2**240) +
%v10[1] * (2**210) +
%v10[0] * (2**180) +
%v9[1] * (2**150) +
%v9[0] * (2**120) +
%v8[1] * (2**90) +
%v8[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%v12[2] * (2**300) +
%v11[3] * (2**270) +
%v11[2] * (2**240) +
%v10[3] * (2**210) +
%v10[2] * (2**180) +
%v9[3] * (2**150) +
%v9[2] * (2**120) +
%v8[3] * (2**90) +
%v8[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
]
&& true;


mov %vec_V0_V1_S0_S1_out %v8;
mov %vec_V2_V3_S2_S3_out %v9;
mov %vec_V4_V5_S4_S5_out %v10;
mov %vec_V6_V7_S6_S7_out %v11;
mov %vec_V8_V9_S8_S9_out %v12;


{

and [
%vec_V8_V9_S8_S9_out[0] * (2**300) +
%vec_V6_V7_S6_S7_out[1] * (2**270) +
%vec_V6_V7_S6_S7_out[0] * (2**240) +
%vec_V4_V5_S4_S5_out[1] * (2**210) +
%vec_V4_V5_S4_S5_out[0] * (2**180) +
%vec_V2_V3_S2_S3_out[1] * (2**150) +
%vec_V2_V3_S2_S3_out[0] * (2**120) +
%vec_V0_V1_S0_S1_out[1] * (2**90) +
%vec_V0_V1_S0_S1_out[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[0] * (2**300) +
%vec_V6_V7_S6_S7_out[1] * (2**270) +
%vec_V6_V7_S6_S7_out[0] * (2**240) +
%vec_V4_V5_S4_S5_out[1] * (2**210) +
%vec_V4_V5_S4_S5_out[0] * (2**180) +
%vec_V2_V3_S2_S3_out[1] * (2**150) +
%vec_V2_V3_S2_S3_out[0] * (2**120) +
%vec_V0_V1_S0_S1_out[1] * (2**90) +
%vec_V0_V1_S0_S1_out[0] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[2] * (2**300) +
%vec_V6_V7_S6_S7_out[3] * (2**270) +
%vec_V6_V7_S6_S7_out[2] * (2**240) +
%vec_V4_V5_S4_S5_out[3] * (2**210) +
%vec_V4_V5_S4_S5_out[2] * (2**180) +
%vec_V2_V3_S2_S3_out[3] * (2**150) +
%vec_V2_V3_S2_S3_out[2] * (2**120) +
%vec_V0_V1_S0_S1_out[3] * (2**90) +
%vec_V0_V1_S0_S1_out[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[2] * (2**300) +
%vec_V6_V7_S6_S7_out[3] * (2**270) +
%vec_V6_V7_S6_S7_out[2] * (2**240) +
%vec_V4_V5_S4_S5_out[3] * (2**210) +
%vec_V4_V5_S4_S5_out[2] * (2**180) +
%vec_V2_V3_S2_S3_out[3] * (2**150) +
%vec_V2_V3_S2_S3_out[2] * (2**120) +
%vec_V0_V1_S0_S1_out[3] * (2**90) +
%vec_V0_V1_S0_S1_out[2] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
(mod ((2**255)-19))
]

&&
(((-38)@sint32)) <=s %vec_V0_V1_S0_S1_out[0], %vec_V0_V1_S0_S1_out[0] <=s (((2**30)-1 + 19)@sint32),
(((0)@sint32)) <=s %vec_V0_V1_S0_S1_out[1], %vec_V0_V1_S0_S1_out[1] <=s (((2**30)-1)@sint32),
(((-38)@sint32)) <=s %vec_V0_V1_S0_S1_out[2], %vec_V0_V1_S0_S1_out[2] <=s (((2**30)-1 + 19)@sint32),
(((0)@sint32)) <=s %vec_V0_V1_S0_S1_out[3], %vec_V0_V1_S0_S1_out[3] <=s (((2**30)-1)@sint32),
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %vec_V2_V3_S2_S3_out, %vec_V2_V3_S2_S3_out <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %vec_V4_V5_S4_S5_out, %vec_V4_V5_S4_S5_out <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %vec_V6_V7_S6_S7_out, %vec_V6_V7_S6_S7_out <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],

(0@sint32) <=s %vec_V8_V9_S8_S9_out[0], %vec_V8_V9_S8_S9_out[0] <=s (((2**15)-1)@sint32),
(0@sint32) <=s %vec_V8_V9_S8_S9_out[2], %vec_V8_V9_S8_S9_out[2] <=s (((2**15)-1)@sint32),


// ((-1)@sint32) <=s %vec_V8_V9_S8_S9[1], %vec_V8_V9_S8_S9[1] <=s (0@sint32),
// ((-1)@sint32) <=s %vec_V8_V9_S8_S9[3], %vec_V8_V9_S8_S9[3] <=s (0@sint32),
true prove with [all cuts, precondition, all ghosts]
}



proc main (
%vec_uu0_rr0_vv0_ss0@sint32[4],
%vec_uu1_rr1_vv1_ss1@sint32[4],
%vec_V0_V1_S0_S1@sint32[4],
%vec_V2_V3_S2_S3@sint32[4],
%vec_V4_V5_S4_S5@sint32[4],
%vec_V6_V7_S6_S7@sint32[4],
%vec_V8_V9_S8_S9@sint32[4],
%vec_V0_V1_S0_S1_expected@sint32[4],
%vec_V2_V3_S2_S3_expected@sint32[4],
%vec_V4_V5_S4_S5_expected@sint32[4],
%vec_V6_V7_S6_S7_expected@sint32[4],
%vec_V8_V9_S8_S9_expected@sint32[4],
%vec_2x_2p30m1@sint64[2],
%vec_4x_M@sint32[4],
%vec_2x_19@sint64[2]
;
%vec_V0_V1_S0_S1_out@sint32[4],
%vec_V2_V3_S2_S3_out@sint32[4],
%vec_V4_V5_S4_S5_out@sint32[4],
%vec_V6_V7_S6_S7_out@sint32[4],
%vec_V8_V9_S8_S9_out@sint32[4]
) =
{
    %vec_2x_2p30m1 = [((2**30)-1), ((2**30)-1)],
    %vec_2x_19 = [19, 19],
    %vec_4x_M = [678152731, 678152731, 678152731, 678152731],
    (0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1),

    %vec_V0_V1_S0_S1 <= [((2**30)-1)+19, ((2**30)-1), ((2**30)-1)+19, ((2**30)-1)],
    %vec_V0_V1_S0_S1 >= [-38, 0, -38, 0],
    %vec_V2_V3_S2_S3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V2_V3_S2_S3 >= [0, 0, 0, 0],
    %vec_V4_V5_S4_S5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V4_V5_S4_S5 >= [0, 0, 0, 0],
    %vec_V6_V7_S6_S7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V6_V7_S6_S7 >= [0, 0, 0, 0],
    %vec_V8_V9_S8_S9 <= [((2**15)-1), 0, ((2**15)-1), 0],
    %vec_V8_V9_S8_S9 >= [(-(2**15)), (-1), (-(2**15)), (-1)],
    %vec_V0_V1_S0_S1_expected <= [((2**30)-1)+19, ((2**30)-1), ((2**30)-1)+19, ((2**30)-1)],
    %vec_V0_V1_S0_S1_expected >= [-38, 0, -38, 0],
    %vec_V2_V3_S2_S3_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V2_V3_S2_S3_expected >= [0, 0, 0, 0],
    %vec_V4_V5_S4_S5_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V4_V5_S4_S5_expected >= [0, 0, 0, 0],
    %vec_V6_V7_S6_S7_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_V6_V7_S6_S7_expected >= [0, 0, 0, 0],
    %vec_V8_V9_S8_S9_expected <= [((2**15)-1), 0, ((2**15)-1), 0],
    %vec_V8_V9_S8_S9_expected >= [(-(2**15)), (-1), (-(2**15)), (-1)],
    // norm condition
    // |u| + |v| < 2**60
    -(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    -(%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2] * (2**30)) < (2**60),
    // |r| + |s| < 2**60
    -(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    -(%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
    -(%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60),
    (%vec_uu0_rr0_vv0_ss0[1] + %vec_uu1_rr1_vv1_ss1[1] * (2**30)) +
    (%vec_uu0_rr0_vv0_ss0[3] + %vec_uu1_rr1_vv1_ss1[3] * (2**30)) < (2**60)
&&
    %vec_2x_19 = [19@sint64, 19@sint64],
    %vec_2x_2p30m1 = [(2**30 - 1)@sint64, (2**30 - 1)@sint64],
    %vec_4x_M = [678152731@sint32, 678152731@sint32, 678152731@sint32, 678152731@sint32]
}

mov %v8 %vec_V0_V1_S0_S1;
mov %v9 %vec_V2_V3_S2_S3;
mov %v10 %vec_V4_V5_S4_S5;
mov %v11 %vec_V6_V7_S6_S7;
mov %v12 %vec_V8_V9_S8_S9;
mov %v13 %vec_uu0_rr0_vv0_ss0;
mov %v14 %vec_uu1_rr1_vv1_ss1;
mov %v15 %vec_4x_M;
mov %v16 %vec_2x_19;
mov %v1 %vec_2x_2p30m1;


(* mov	x9, #0x13                  	// #19          #! PC = 0xaaaabe372698 *)
(* dup	v16.2d, x9                                  #! PC = 0xaaaabe37269c *)
(* smull	v17.2d, v13.2s, v8.s[0]                   #! PC = 0xaaaabe3726a0 *)
(* smlal2	v17.2d, v13.4s, v8.s[2]                  #! PC = 0xaaaabe3726a4 *)
(* mul	v19.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe3726a8 *)
(* and	v19.16b, v19.16b, v1.16b                    #! PC = 0xaaaabe3726ac *)
(* uzp1	v19.4s, v19.4s, v19.4s                     #! PC = 0xaaaabe3726b0 *)
(* smlsl	v17.2d, v19.2s, v16.s[0]                  #! PC = 0xaaaabe3726b4 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3726b8 *)
(* smlal	v17.2d, v14.2s, v8.s[0]                   #! PC = 0xaaaabe3726bc *)
(* smlal2	v17.2d, v14.4s, v8.s[2]                  #! PC = 0xaaaabe3726c0 *)
(* smlal	v17.2d, v13.2s, v8.s[1]                   #! PC = 0xaaaabe3726c4 *)
(* smlal2	v17.2d, v13.4s, v8.s[3]                  #! PC = 0xaaaabe3726c8 *)
(* mul	v20.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe3726cc *)
(* and	v20.16b, v20.16b, v1.16b                    #! PC = 0xaaaabe3726d0 *)
(* uzp1	v20.4s, v20.4s, v20.4s                     #! PC = 0xaaaabe3726d4 *)
(* smlsl	v17.2d, v20.2s, v16.s[0]                  #! PC = 0xaaaabe3726d8 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3726dc *)
(* smlal	v17.2d, v14.2s, v8.s[1]                   #! PC = 0xaaaabe3726e0 *)
(* smlal2	v17.2d, v14.4s, v8.s[3]                  #! PC = 0xaaaabe3726e4 *)
(* smlal	v17.2d, v13.2s, v9.s[0]                   #! PC = 0xaaaabe3726e8 *)
(* smlal2	v17.2d, v13.4s, v9.s[2]                  #! PC = 0xaaaabe3726ec *)
(* and	v8.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe3726f0 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3726f4 *)
(* smlal	v17.2d, v14.2s, v9.s[0]                   #! PC = 0xaaaabe3726f8 *)
(* smlal2	v17.2d, v14.4s, v9.s[2]                  #! PC = 0xaaaabe3726fc *)
(* smlal	v17.2d, v13.2s, v9.s[1]                   #! PC = 0xaaaabe372700 *)
(* smlal2	v17.2d, v13.4s, v9.s[3]                  #! PC = 0xaaaabe372704 *)
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372708 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37270c *)
(* sli	v8.2d, v18.2d, #32                          #! PC = 0xaaaabe372710 *)
(* smlal	v17.2d, v14.2s, v9.s[1]                   #! PC = 0xaaaabe372714 *)
(* smlal2	v17.2d, v14.4s, v9.s[3]                  #! PC = 0xaaaabe372718 *)
(* smlal	v17.2d, v13.2s, v10.s[0]                  #! PC = 0xaaaabe37271c *)
(* smlal2	v17.2d, v13.4s, v10.s[2]                 #! PC = 0xaaaabe372720 *)
(* and	v9.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe372724 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372728 *)
(* smlal	v17.2d, v14.2s, v10.s[0]                  #! PC = 0xaaaabe37272c *)
(* smlal2	v17.2d, v14.4s, v10.s[2]                 #! PC = 0xaaaabe372730 *)
(* smlal	v17.2d, v13.2s, v10.s[1]                  #! PC = 0xaaaabe372734 *)
(* smlal2	v17.2d, v13.4s, v10.s[3]                 #! PC = 0xaaaabe372738 *)
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe37273c *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372740 *)
(* sli	v9.2d, v18.2d, #32                          #! PC = 0xaaaabe372744 *)
(* smlal	v17.2d, v14.2s, v10.s[1]                  #! PC = 0xaaaabe372748 *)
(* smlal2	v17.2d, v14.4s, v10.s[3]                 #! PC = 0xaaaabe37274c *)
(* smlal	v17.2d, v13.2s, v11.s[0]                  #! PC = 0xaaaabe372750 *)
(* smlal2	v17.2d, v13.4s, v11.s[2]                 #! PC = 0xaaaabe372754 *)
(* and	v10.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372758 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37275c *)
(* smlal	v17.2d, v14.2s, v11.s[0]                  #! PC = 0xaaaabe372760 *)
(* smlal2	v17.2d, v14.4s, v11.s[2]                 #! PC = 0xaaaabe372764 *)
(* smlal	v17.2d, v13.2s, v11.s[1]                  #! PC = 0xaaaabe372768 *)
(* smlal2	v17.2d, v13.4s, v11.s[3]                 #! PC = 0xaaaabe37276c *)
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372770 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372774 *)
(* sli	v10.2d, v18.2d, #32                         #! PC = 0xaaaabe372778 *)
(* smlal	v17.2d, v14.2s, v11.s[1]                  #! PC = 0xaaaabe37277c *)
(* smlal2	v17.2d, v14.4s, v11.s[3]                 #! PC = 0xaaaabe372780 *)
(* smlal	v17.2d, v13.2s, v12.s[0]                  #! PC = 0xaaaabe372784 *)
(* smlal2	v17.2d, v13.4s, v12.s[2]                 #! PC = 0xaaaabe372788 *)
(* ushll	v19.2d, v19.2s, #15                       #! PC = 0xaaaabe37278c *)
(* add	v17.2d, v17.2d, v19.2d                      #! PC = 0xaaaabe372790 *)
(* and	v11.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372794 *)
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372798 *)
(* smlal	v17.2d, v14.2s, v12.s[0]                  #! PC = 0xaaaabe37279c *)
(* smlal2	v17.2d, v14.4s, v12.s[2]                 #! PC = 0xaaaabe3727a0 *)
(* ushll	v20.2d, v20.2s, #15                       #! PC = 0xaaaabe3727a4 *)
(* add	v17.2d, v17.2d, v20.2d                      #! PC = 0xaaaabe3727a8 *)
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3727ac *)
(* sshr	v12.2d, v17.2d, #30                        #! PC = 0xaaaabe3727b0 *)
(* sli	v11.2d, v18.2d, #32                         #! PC = 0xaaaabe3727b4 *)
(* sshr	v18.2d, v12.2d, #15                        #! PC = 0xaaaabe3727b8 *)
(* shl	v17.2d, v18.2d, #15                         #! PC = 0xaaaabe3727bc *)
(* sub	v12.2d, v12.2d, v17.2d                      #! PC = 0xaaaabe3727c0 *)
(* mla	v8.4s, v18.4s, v16.4s                       #! PC = 0xaaaabe3727c4 *)



// call update_bignum_VS(
//     %v13, %v14,
//     %v8, %v9, %v10, %v11, %v12,
//     %v1, %v15;
//     %v8, %v9, %v10, %v11, %v12
// );

nondet %vec_V0_V1_S0_S1_out@sint32[4];
nondet %vec_V2_V3_S2_S3_out@sint32[4];
nondet %vec_V4_V5_S4_S5_out@sint32[4];
nondet %vec_V6_V7_S6_S7_out@sint32[4];
nondet %vec_V8_V9_S8_S9_out@sint32[4];

assume
and [
%vec_V8_V9_S8_S9_out[0] * (2**300) +
%vec_V6_V7_S6_S7_out[1] * (2**270) +
%vec_V6_V7_S6_S7_out[0] * (2**240) +
%vec_V4_V5_S4_S5_out[1] * (2**210) +
%vec_V4_V5_S4_S5_out[0] * (2**180) +
%vec_V2_V3_S2_S3_out[1] * (2**150) +
%vec_V2_V3_S2_S3_out[0] * (2**120) +
%vec_V0_V1_S0_S1_out[1] * (2**90) +
%vec_V0_V1_S0_S1_out[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[0] * (2**300) +
%vec_V6_V7_S6_S7_out[1] * (2**270) +
%vec_V6_V7_S6_S7_out[0] * (2**240) +
%vec_V4_V5_S4_S5_out[1] * (2**210) +
%vec_V4_V5_S4_S5_out[0] * (2**180) +
%vec_V2_V3_S2_S3_out[1] * (2**150) +
%vec_V2_V3_S2_S3_out[0] * (2**120) +
%vec_V0_V1_S0_S1_out[1] * (2**90) +
%vec_V0_V1_S0_S1_out[0] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[2] * (2**300) +
%vec_V6_V7_S6_S7_out[3] * (2**270) +
%vec_V6_V7_S6_S7_out[2] * (2**240) +
%vec_V4_V5_S4_S5_out[3] * (2**210) +
%vec_V4_V5_S4_S5_out[2] * (2**180) +
%vec_V2_V3_S2_S3_out[3] * (2**150) +
%vec_V2_V3_S2_S3_out[2] * (2**120) +
%vec_V0_V1_S0_S1_out[3] * (2**90) +
%vec_V0_V1_S0_S1_out[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[2] * (2**300) +
%vec_V6_V7_S6_S7_out[3] * (2**270) +
%vec_V6_V7_S6_S7_out[2] * (2**240) +
%vec_V4_V5_S4_S5_out[3] * (2**210) +
%vec_V4_V5_S4_S5_out[2] * (2**180) +
%vec_V2_V3_S2_S3_out[3] * (2**150) +
%vec_V2_V3_S2_S3_out[2] * (2**120) +
%vec_V0_V1_S0_S1_out[3] * (2**90) +
%vec_V0_V1_S0_S1_out[2] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
(mod ((2**255)-19))
]

&&
(((-38)@sint32)) <=s %vec_V0_V1_S0_S1_out[0], %vec_V0_V1_S0_S1_out[0] <=s (((2**30)-1 + 19)@sint32),
(((0)@sint32)) <=s %vec_V0_V1_S0_S1_out[1], %vec_V0_V1_S0_S1_out[1] <=s (((2**30)-1)@sint32),
(((-38)@sint32)) <=s %vec_V0_V1_S0_S1_out[2], %vec_V0_V1_S0_S1_out[2] <=s (((2**30)-1 + 19)@sint32),
(((0)@sint32)) <=s %vec_V0_V1_S0_S1_out[3], %vec_V0_V1_S0_S1_out[3] <=s (((2**30)-1)@sint32),
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %vec_V2_V3_S2_S3_out, %vec_V2_V3_S2_S3_out <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %vec_V4_V5_S4_S5_out, %vec_V4_V5_S4_S5_out <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
[(0@sint32),(0@sint32),(0@sint32),(0@sint32)] <=s %vec_V6_V7_S6_S7_out, %vec_V6_V7_S6_S7_out <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],

(0@sint32) <=s %vec_V8_V9_S8_S9_out[0], %vec_V8_V9_S8_S9_out[0] <=s (((2**15)-1)@sint32),
(0@sint32) <=s %vec_V8_V9_S8_S9_out[2], %vec_V8_V9_S8_S9_out[2] <=s (((2**15)-1)@sint32),
((-1)@sint32) <=s %vec_V8_V9_S8_S9_out[1], %vec_V8_V9_S8_S9_out[1] <=s (0@sint32),
((-1)@sint32) <=s %vec_V8_V9_S8_S9_out[3], %vec_V8_V9_S8_S9_out[3] <=s (0@sint32)
;


mov %v8 %vec_V0_V1_S0_S1_out;
mov %v9 %vec_V2_V3_S2_S3_out;
mov %v10 %vec_V4_V5_S4_S5_out;
mov %v11 %vec_V6_V7_S6_S7_out;
mov %v12 %vec_V8_V9_S8_S9_out;


(* dup	v17.4s, v1.s[0]                             #! PC = 0xaaaabe3727c8 *)
cast %v1@sint32[4] %v1;
broadcast %v17@sint32[4] 4 [%v1[0]];
(* mvn	v17.16b, v17.16b                            #! PC = 0xaaaabe3727cc *)
not tmp0@sint32 %v17[0];
not tmp1@sint32 %v17[1];
not tmp2@sint32 %v17[2];
not tmp3@sint32 %v17[3];
mov %v17@sint32[4] [tmp0, tmp1, tmp2, tmp3];


ghost %v8_old@sint32[4], %v9_old@sint32[4], %v10_old@sint32[4], %v11_old@sint32[4], %v12_old@sint32[4]:
%v8_old = %v8,
%v9_old = %v9,
%v10_old = %v10,
%v11_old = %v11,
%v12_old = %v12
&&
%v8_old = %v8,
%v9_old = %v9,
%v10_old = %v10,
%v11_old = %v11,
%v12_old = %v12;


(* sshr	v18.4s, v8.4s, #30                         #! PC = 0xaaaabe3727d0 *)
split %v18 %dc %v8 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe3727d4 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v8.4s, v8.4s, v18.4s                        #! PC = 0xaaaabe3727d8 *)
cast %v18@sint32[4] %v18;
add %v8 %v8 %v18;
(* sshr	v18.2d, v8.2d, #30                         #! PC = 0xaaaabe3727dc *)
cast %v8@sint64[2] %v8;
split %v18 %dc %v8 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe3727e0 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v9.4s, v9.4s, v18.4s                        #! PC = 0xaaaabe3727e4 *)
cast %v18@sint32[4] %v18;
add %v9 %v9 %v18;
(* bic	v8.16b, v8.16b, v17.16b                     #! PC = 0xaaaabe3727e8 *)
cast %v8@sint32[4] %v8;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v8@sint32[4] %v8 %tmp;
(* sshr	v18.4s, v9.4s, #30                         #! PC = 0xaaaabe3727ec *)
split %v18 %dc %v9 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe3727f0 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v9.4s, v9.4s, v18.4s                        #! PC = 0xaaaabe3727f4 *)
cast %v18@sint32[4] %v18;
add %v9 %v9 %v18;
(* sshr	v18.2d, v9.2d, #30                         #! PC = 0xaaaabe3727f8 *)
cast %v9@sint64[2] %v9;
split %v18 %dc %v9 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe3727fc *)
shrs %v18 %dc %v18 [32, 32];
(* add	v10.4s, v10.4s, v18.4s                      #! PC = 0xaaaabe372800 *)
cast %v18@sint32[4] %v18;
add %v10 %v10 %v18;
(* bic	v9.16b, v9.16b, v17.16b                     #! PC = 0xaaaabe372804 *)
cast %v9@sint32[4] %v9;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v9@sint32[4] %v9 %tmp;
(* sshr	v18.4s, v10.4s, #30                        #! PC = 0xaaaabe372808 *)
split %v18 %dc %v10 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe37280c *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v10.4s, v10.4s, v18.4s                      #! PC = 0xaaaabe372810 *)
cast %v18@sint32[4] %v18;
add %v10 %v10 %v18;
(* sshr	v18.2d, v10.2d, #30                        #! PC = 0xaaaabe372814 *)
cast %v10@sint64[2] %v10;
split %v18 %dc %v10 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe372818 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v11.4s, v11.4s, v18.4s                      #! PC = 0xaaaabe37281c *)
cast %v18@sint32[4] %v18;
add %v11 %v11 %v18;
(* bic	v10.16b, v10.16b, v17.16b                   #! PC = 0xaaaabe372820 *)
cast %v10@sint32[4] %v10;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v10@sint32[4] %v10 %tmp;
(* sshr	v18.4s, v11.4s, #30                        #! PC = 0xaaaabe372824 *)
split %v18 %dc %v11 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe372828 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v11.4s, v11.4s, v18.4s                      #! PC = 0xaaaabe37282c *)
cast %v18@sint32[4] %v18;
add %v11 %v11 %v18;
(* sshr	v18.2d, v11.2d, #30                        #! PC = 0xaaaabe372830 *)
cast %v11@sint64[2] %v11;
split %v18 %dc %v11 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe372834 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v12.4s, v12.4s, v18.4s                      #! PC = 0xaaaabe372838 *)
cast %v18@sint32[4] %v18;
add %v12 %v12 %v18;
(* bic	v11.16b, v11.16b, v17.16b                   #! PC = 0xaaaabe37283c *)
cast %v11@sint32[4] %v11;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v11@sint32[4] %v11 %tmp;


assert true &&
        (sext (%v8[0]) 240) * ((2**(30*0))@272) + (sext (%v8[1]) 240) * ((2**(30*1))@272) +
        (sext (%v9[0]) 240) * ((2**(30*2))@272) + (sext (%v9[1]) 240) * ((2**(30*3))@272) +
        (sext (%v10[0]) 240) * ((2**(30*4))@272) + (sext (%v10[1]) 240) * ((2**(30*5))@272) +
        (sext (%v11[0]) 240) * ((2**(30*6))@272) + (sext (%v11[1]) 240) * ((2**(30*7))@272) +
        (sext (%v12[0]) 240) * ((2**(30*8))@272)
        = 
        (sext (%v8_old[0]) 240) * ((2**(30*0))@272) + (sext (%v8_old[1]) 240) * ((2**(30*1))@272) +
        (sext (%v9_old[0]) 240) * ((2**(30*2))@272) + (sext (%v9_old[1]) 240) * ((2**(30*3))@272) +
        (sext (%v10_old[0]) 240) * ((2**(30*4))@272) + (sext (%v10_old[1]) 240) * ((2**(30*5))@272) +
        (sext (%v11_old[0]) 240) * ((2**(30*6))@272) + (sext (%v11_old[1]) 240) * ((2**(30*7))@272) +
        (sext (%v12_old[0]) 240) * ((2**(30*8))@272)
        ,
        (sext (%v8[2]) 240) * ((2**(30*0))@272) + (sext (%v8[3]) 240) * ((2**(30*1))@272) +
        (sext (%v9[2]) 240) * ((2**(30*2))@272) + (sext (%v9[3]) 240) * ((2**(30*3))@272) +
        (sext (%v10[2]) 240) * ((2**(30*4))@272) + (sext (%v10[3]) 240) * ((2**(30*5))@272) +
        (sext (%v11[2]) 240) * ((2**(30*6))@272) + (sext (%v11[3]) 240) * ((2**(30*7))@272) +
        (sext (%v12[2]) 240) * ((2**(30*8))@272)
        = 
        (sext (%v8_old[2]) 240) * ((2**(30*0))@272) + (sext (%v8_old[3]) 240) * ((2**(30*1))@272) +
        (sext (%v9_old[2]) 240) * ((2**(30*2))@272) + (sext (%v9_old[3]) 240) * ((2**(30*3))@272) +
        (sext (%v10_old[2]) 240) * ((2**(30*4))@272) + (sext (%v10_old[3]) 240) * ((2**(30*5))@272) +
        (sext (%v11_old[2]) 240) * ((2**(30*6))@272) + (sext (%v11_old[3]) 240) * ((2**(30*7))@272) +
        (sext (%v12_old[2]) 240) * ((2**(30*8))@272)
        ,
        [0@32, 0@32, 0@32, 0@32] <=s %v8, %v8 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v9, %v9 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v10, %v10 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v11, %v11 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [(-1)@32, (-1)@32, (-1)@32, (-1)@32] <=s %v12, %v12 <=s [((2**15))@32, (0)@32, ((2**15))@32, (0)@32]
;
assume 
        limbs 30 [%v8[0], %v8[1], %v9[0], %v9[1], %v10[0], %v10[1], %v11[0], %v11[1], %v12[0]]
        =
        limbs 30 [%v8_old[0], %v8_old[1], %v9_old[0], %v9_old[1], %v10_old[0], %v10_old[1], %v11_old[0], %v11_old[1], %v12_old[0]]
        ,
        limbs 30 [%v8[2], %v8[3], %v9[2], %v9[3], %v10[2], %v10[3], %v11[2], %v11[3], %v12[2]]
        =
        limbs 30 [%v8_old[2], %v8_old[3], %v9_old[2], %v9_old[3], %v10_old[2], %v10_old[3], %v11_old[2], %v11_old[3], %v12_old[2]]
        &&
        [0@32, 0@32, 0@32, 0@32] <=s %v8, %v8 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v9, %v9 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v10, %v10 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v11, %v11 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [(-1)@32, (-1)@32, (-1)@32, (-1)@32] <=s %v12, %v12 <=s [((2**15))@32, (0)@32, ((2**15))@32, (0)@32];


assert true && 
%v16[0] = 19@64,
%v16[1] = 19@64
;

(* sshr	v18.4s, v12.4s, #15                        #! PC = 0xaaaabe37231c *)
split %v18 %dc %v12 15;

assert true && or [
%v18[0] = (-1)@sint32,
%v18[0] = (0)@sint32,
%v18[0] = (1)@sint32
];

(* mla	v8.4s, v18.4s, v16.4s                       #! PC = 0xaaaabe372328 *)
cast %v18@sint32[4] %v18;
cast %v16@sint32[4] %v16;
mull %dc %mla %v18 %v16;
cast %mla@sint32[4] %mla;
cast %v8@sint32[4] %v8;
adds %dc %v8 %v8 %mla;
(* shl	v16.2d, v18.2d, #15                         #! PC = 0xaaaabe372320 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 15;
shl tmp2 tmp2 15;
mov %v16 [tmp1, tmp2];
(* sub	v12.4s, v12.4s, v16.4s                      #! PC = 0xaaaabe372324 *)
cast %v16@sint32[4] %v16;
subs %dc %v12 %v12 %v16;
cast %v12@sint32[4] %v12;


assert true &&
        [(-19)@32, 0@32, (-19)@32, 0@32] <=s %v8, %v8 <=s [((2**30)-1+19)@32, ((2**30)-1)@32, ((2**30)-1+19)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v9, %v9 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v10, %v10 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v11, %v11 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        0@32 <=s %v12[0], %v12[0] <=s ((2**15) - 1)@32
;

(* sshr	v18.4s, v8.4s, #30                         #! PC = 0xaaaabe3727d0 *)
split %v18 %dc %v8 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe3727d4 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v8.4s, v8.4s, v18.4s                        #! PC = 0xaaaabe3727d8 *)
cast %v18@sint32[4] %v18;
add %v8 %v8 %v18;
(* sshr	v18.2d, v8.2d, #30                         #! PC = 0xaaaabe3727dc *)
cast %v8@sint64[2] %v8;
split %v18 %dc %v8 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe3727e0 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v9.4s, v9.4s, v18.4s                        #! PC = 0xaaaabe3727e4 *)
cast %v18@sint32[4] %v18;
add %v9 %v9 %v18;
(* bic	v8.16b, v8.16b, v17.16b                     #! PC = 0xaaaabe3727e8 *)
cast %v8@sint32[4] %v8;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v8@sint32[4] %v8 %tmp;
(* sshr	v18.4s, v9.4s, #30                         #! PC = 0xaaaabe3727ec *)
split %v18 %dc %v9 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe3727f0 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v9.4s, v9.4s, v18.4s                        #! PC = 0xaaaabe3727f4 *)
cast %v18@sint32[4] %v18;
add %v9 %v9 %v18;
(* sshr	v18.2d, v9.2d, #30                         #! PC = 0xaaaabe3727f8 *)
cast %v9@sint64[2] %v9;
split %v18 %dc %v9 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe3727fc *)
shrs %v18 %dc %v18 [32, 32];
(* add	v10.4s, v10.4s, v18.4s                      #! PC = 0xaaaabe372800 *)
cast %v18@sint32[4] %v18;
add %v10 %v10 %v18;
(* bic	v9.16b, v9.16b, v17.16b                     #! PC = 0xaaaabe372804 *)
cast %v9@sint32[4] %v9;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v9@sint32[4] %v9 %tmp;
(* sshr	v18.4s, v10.4s, #30                        #! PC = 0xaaaabe372808 *)
split %v18 %dc %v10 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe37280c *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v10.4s, v10.4s, v18.4s                      #! PC = 0xaaaabe372810 *)
cast %v18@sint32[4] %v18;
add %v10 %v10 %v18;
(* sshr	v18.2d, v10.2d, #30                        #! PC = 0xaaaabe372814 *)
cast %v10@sint64[2] %v10;
split %v18 %dc %v10 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe372818 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v11.4s, v11.4s, v18.4s                      #! PC = 0xaaaabe37281c *)
cast %v18@sint32[4] %v18;
add %v11 %v11 %v18;
(* bic	v10.16b, v10.16b, v17.16b                   #! PC = 0xaaaabe372820 *)
cast %v10@sint32[4] %v10;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v10@sint32[4] %v10 %tmp;
(* sshr	v18.4s, v11.4s, #30                        #! PC = 0xaaaabe372824 *)
split %v18 %dc %v11 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe372828 *)
cast %v18@sint64[2] %v18;
mov [tmp1, tmp2] %v18;
shls dc tmp1 tmp1 32;
shls dc tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v11.4s, v11.4s, v18.4s                      #! PC = 0xaaaabe37282c *)
cast %v18@sint32[4] %v18;
add %v11 %v11 %v18;
(* sshr	v18.2d, v11.2d, #30                        #! PC = 0xaaaabe372830 *)
cast %v11@sint64[2] %v11;
split %v18 %dc %v11 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe372834 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v12.4s, v12.4s, v18.4s                      #! PC = 0xaaaabe372838 *)
cast %v18@sint32[4] %v18;
add %v12 %v12 %v18;
(* bic	v11.16b, v11.16b, v17.16b                   #! PC = 0xaaaabe37283c *)
cast %v11@sint32[4] %v11;
mov [tmp0, tmp1, tmp2, tmp3] %v17;
not tmp0@sint32 tmp0;
not tmp1@sint32 tmp1;
not tmp2@sint32 tmp2;
not tmp3@sint32 tmp3;
mov %tmp [tmp0, tmp1, tmp2, tmp3];
and %v11@sint32[4] %v11 %tmp;

assert true &&
        (sext (%v8[0]) 240) * ((2**(30*0))@272) + (sext (%v8[1]) 240) * ((2**(30*1))@272) +
        (sext (%v9[0]) 240) * ((2**(30*2))@272) + (sext (%v9[1]) 240) * ((2**(30*3))@272) +
        (sext (%v10[0]) 240) * ((2**(30*4))@272) + (sext (%v10[1]) 240) * ((2**(30*5))@272) +
        (sext (%v11[0]) 240) * ((2**(30*6))@272) + (sext (%v11[1]) 240) * ((2**(30*7))@272) +
        (sext (%v12[0]) 240) * ((2**(30*8))@272)
        = 
        (sext (%v8_old[0]) 240) * ((2**(30*0))@272) + (sext (%v8_old[1]) 240) * ((2**(30*1))@272) +
        (sext (%v9_old[0]) 240) * ((2**(30*2))@272) + (sext (%v9_old[1]) 240) * ((2**(30*3))@272) +
        (sext (%v10_old[0]) 240) * ((2**(30*4))@272) + (sext (%v10_old[1]) 240) * ((2**(30*5))@272) +
        (sext (%v11_old[0]) 240) * ((2**(30*6))@272) + (sext (%v11_old[1]) 240) * ((2**(30*7))@272) +
        (sext (%v12_old[0]) 240) * ((2**(30*8))@272)
        (smod (const 272 ((2**255)-19)))
        ,
        (sext (%v8[2]) 240) * ((2**(30*0))@272) + (sext (%v8[3]) 240) * ((2**(30*1))@272) +
        (sext (%v9[2]) 240) * ((2**(30*2))@272) + (sext (%v9[3]) 240) * ((2**(30*3))@272) +
        (sext (%v10[2]) 240) * ((2**(30*4))@272) + (sext (%v10[3]) 240) * ((2**(30*5))@272) +
        (sext (%v11[2]) 240) * ((2**(30*6))@272) + (sext (%v11[3]) 240) * ((2**(30*7))@272) +
        (sext (%v12[2]) 240) * ((2**(30*8))@272)
        = 
        (sext (%v8_old[2]) 240) * ((2**(30*0))@272) + (sext (%v8_old[3]) 240) * ((2**(30*1))@272) +
        (sext (%v9_old[2]) 240) * ((2**(30*2))@272) + (sext (%v9_old[3]) 240) * ((2**(30*3))@272) +
        (sext (%v10_old[2]) 240) * ((2**(30*4))@272) + (sext (%v10_old[3]) 240) * ((2**(30*5))@272) +
        (sext (%v11_old[2]) 240) * ((2**(30*6))@272) + (sext (%v11_old[3]) 240) * ((2**(30*7))@272) +
        (sext (%v12_old[2]) 240) * ((2**(30*8))@272)
        (smod (const 272 ((2**255)-19)))
        ,
        [0@32, 0@32, 0@32, 0@32] <=s %v8, %v8 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v9, %v9 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v10, %v10 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v11, %v11 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        // [(0)@32, (-1)@32, (0)@32, (-1)@32] <=s %v12, %v12 <=s [((2**15)-1)@32, (0)@32, ((2**15)-1)@32, (0)@32],
        0@32 <=s %v12[0] , %v12[0] <=s ((2**15) - 1)@32,
        0@32 <=s %v12[2] , %v12[2] <=s ((2**15) - 1)@32
;
assume 
        limbs 30 [%v8[0], %v8[1], %v9[0], %v9[1], %v10[0], %v10[1], %v11[0], %v11[1], %v12[0]]
        =
        limbs 30 [%v8_old[0], %v8_old[1], %v9_old[0], %v9_old[1], %v10_old[0], %v10_old[1], %v11_old[0], %v11_old[1], %v12_old[0]]
        (mod ((2**255)-19))
        ,
        limbs 30 [%v8[2], %v8[3], %v9[2], %v9[3], %v10[2], %v10[3], %v11[2], %v11[3], %v12[2]]
        =
        limbs 30 [%v8_old[2], %v8_old[3], %v9_old[2], %v9_old[3], %v10_old[2], %v10_old[3], %v11_old[2], %v11_old[3], %v12_old[2]]
        (mod ((2**255)-19))
        &&
        [0@32, 0@32, 0@32, 0@32] <=s %v8, %v8 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v9, %v9 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v10, %v10 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        [0@32, 0@32, 0@32, 0@32] <=s %v11, %v11 <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
        0@32 <=s %v12[0] , %v12[0] <=s ((2**15) - 1)@32,
        0@32 <=s %v12[2] , %v12[2] <=s ((2**15) - 1)@32;

mov %vec_V0_V1_S0_S1_out %v8;
mov %vec_V2_V3_S2_S3_out %v9;
mov %vec_V4_V5_S4_S5_out %v10;
mov %vec_V6_V7_S6_S7_out %v11;
mov %vec_V8_V9_S8_S9_out %v12;


{
and [
%vec_V8_V9_S8_S9_out[0] * (2**300) +
%vec_V6_V7_S6_S7_out[1] * (2**270) +
%vec_V6_V7_S6_S7_out[0] * (2**240) +
%vec_V4_V5_S4_S5_out[1] * (2**210) +
%vec_V4_V5_S4_S5_out[0] * (2**180) +
%vec_V2_V3_S2_S3_out[1] * (2**150) +
%vec_V2_V3_S2_S3_out[0] * (2**120) +
%vec_V0_V1_S0_S1_out[1] * (2**90) +
%vec_V0_V1_S0_S1_out[0] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[0] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[0] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[0] * (2**300) +
%vec_V6_V7_S6_S7_out[1] * (2**270) +
%vec_V6_V7_S6_S7_out[0] * (2**240) +
%vec_V4_V5_S4_S5_out[1] * (2**210) +
%vec_V4_V5_S4_S5_out[0] * (2**180) +
%vec_V2_V3_S2_S3_out[1] * (2**150) +
%vec_V2_V3_S2_S3_out[0] * (2**120) +
%vec_V0_V1_S0_S1_out[1] * (2**90) +
%vec_V0_V1_S0_S1_out[0] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[2] * (2**300) +
%vec_V6_V7_S6_S7_out[3] * (2**270) +
%vec_V6_V7_S6_S7_out[2] * (2**240) +
%vec_V4_V5_S4_S5_out[3] * (2**210) +
%vec_V4_V5_S4_S5_out[2] * (2**180) +
%vec_V2_V3_S2_S3_out[3] * (2**150) +
%vec_V2_V3_S2_S3_out[2] * (2**120) +
%vec_V0_V1_S0_S1_out[3] * (2**90) +
%vec_V0_V1_S0_S1_out[2] * (2**60)
=
(
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[2]
) + 
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V0_V1_S0_S1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V0_V1_S0_S1[3]
) * (2**30) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V0_V1_S0_S1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V0_V1_S0_S1[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[2]
) * (2**60) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V2_V3_S2_S3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V2_V3_S2_S3[3]
) * (2**90) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V2_V3_S2_S3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V2_V3_S2_S3[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[2]
) * (2**120) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V4_V5_S4_S5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V4_V5_S4_S5[3]
) * (2**150) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V4_V5_S4_S5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V4_V5_S4_S5[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[2]
) * (2**180) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[2] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V6_V7_S6_S7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V6_V7_S6_S7[3]
) * (2**210) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V6_V7_S6_S7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V6_V7_S6_S7[3] +
    %vec_uu0_rr0_vv0_ss0[1] * %vec_V8_V9_S8_S9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_V8_V9_S8_S9[2]
) * (2**240) +
(
    %vec_uu1_rr1_vv1_ss1[1] * %vec_V8_V9_S8_S9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_V8_V9_S8_S9[2]
) * (2**270)
(mod ((2**255)-19))
,
%vec_V8_V9_S8_S9_out[2] * (2**300) +
%vec_V6_V7_S6_S7_out[3] * (2**270) +
%vec_V6_V7_S6_S7_out[2] * (2**240) +
%vec_V4_V5_S4_S5_out[3] * (2**210) +
%vec_V4_V5_S4_S5_out[2] * (2**180) +
%vec_V2_V3_S2_S3_out[3] * (2**150) +
%vec_V2_V3_S2_S3_out[2] * (2**120) +
%vec_V0_V1_S0_S1_out[3] * (2**90) +
%vec_V0_V1_S0_S1_out[2] * (2**60)
=
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[0], %vec_V0_V1_S0_S1[1],
        %vec_V2_V3_S2_S3[0], %vec_V2_V3_S2_S3[1],
        %vec_V4_V5_S4_S5[0], %vec_V4_V5_S4_S5[1],
        %vec_V6_V7_S6_S7[0], %vec_V6_V7_S6_S7[1],
        %vec_V8_V9_S8_S9[0]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_V0_V1_S0_S1[2], %vec_V0_V1_S0_S1[3],
        %vec_V2_V3_S2_S3[2], %vec_V2_V3_S2_S3[3],
        %vec_V4_V5_S4_S5[2], %vec_V4_V5_S4_S5[3],
        %vec_V6_V7_S6_S7[2], %vec_V6_V7_S6_S7[3],
        %vec_V8_V9_S8_S9[2]
    ] 
(mod ((2**255)-19))
]
&&
[0@32, 0@32, 0@32, 0@32] <=s %vec_V0_V1_S0_S1_out, %vec_V0_V1_S0_S1_out <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
[0@32, 0@32, 0@32, 0@32] <=s %vec_V2_V3_S2_S3_out, %vec_V2_V3_S2_S3_out <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
[0@32, 0@32, 0@32, 0@32] <=s %vec_V4_V5_S4_S5_out, %vec_V4_V5_S4_S5_out <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
[0@32, 0@32, 0@32, 0@32] <=s %vec_V6_V7_S6_S7_out, %vec_V6_V7_S6_S7_out <=s [((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32, ((2**30)-1)@32],
0@32 <=s %vec_V8_V9_S8_S9_out[0], %vec_V8_V9_S8_S9_out[0] <=s ((2**15)-1)@32,
0@32 <=s %vec_V8_V9_S8_S9_out[2], %vec_V8_V9_S8_S9_out[2] <=s ((2**15)-1)@32
}



