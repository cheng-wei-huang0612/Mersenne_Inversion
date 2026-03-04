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
