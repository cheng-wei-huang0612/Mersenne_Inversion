proc main() = {true && true}

// nondet V@sint320;
// nondet S@sint320;
// nondet uu@sint64;
// nondet vv@sint64;
// nondet rr@sint64;
// nondet ss@sint64;
// nondet l@sint64;
//
// nondet result_l@sint320;
//
// mov P@sint320 ((2**255) - 19)@sint320;
//
// assume
// (-(2**255)-38) <= V, V <= ((2**255) - 1),
// (-(2**255)-38) <= S, S <= ((2**255) - 1),
// (-(2**60))<= uu, uu <= ((2**60)-1),
// (-(2**60))<= vv, vv <= ((2**60)-1),
// (-(2**60))<= rr, rr <= ((2**60)-1),
// (-(2**60))<= ss, ss <= ((2**60)-1),
// uu + vv <= (2**60),
// uu - vv <= (2**60),
// -uu + vv <= (2**60),
// -uu - vv <= (2**60),
//
// 0 <= l, l <= ((2**60)-1),
//
//
// result_l * (2**60) = uu * V + vv * S + l * P
// && true;
//
//
// assert and [
// uu * V + vv * S + l * P >= (-(2**315) - (2**60)*38) ,
// result_l >= -1*P-57,
// result_l <= (2*P)-1
// ] prove with [algebra solver smt:z3]
// && true;
// // assume and [
// // uu * V + vv * S >= (-(2**315)),
// // uu * V + vv * S <= (2**315),
// //
// // uu * V + vv * S + l * P >= (-(2**315)),
// // uu * V + vv * S + l * P <= (2**316) - (2**255) - 19*(2**60) + 19,
// // ((2**316) - (2**255) - 19*(2**60) + 19) <= 2*(2**60)*P
// // ]
// // && true;
// //
// //
// //
// // assume
// // result_l * (2**60) = uu * V + vv * S + l * P
// // && true;
// //
// //
// // assert and [
// // result_l >= (-(2**255))
// // ,
// // result_l <= (2**256) - (2**195) - 19
// // ]
// // prove with [algebra solver smt:z3]
// // && true;
//


nondet %v12@sint64[2];
nondet %v11@sint32[4];
nondet %v10@sint32[4];
nondet %v9@sint32[4];
nondet %v8@sint32[4];
nondet %vec_uu0_rr0_vv0_ss0@sint32[4];
nondet %vec_uu1_rr1_vv1_ss1@sint32[4];
nondet %vec_V0_V1_S0_S1@sint32[4];
nondet %vec_V2_V3_S2_S3@sint32[4];
nondet %vec_V4_V5_S4_S5@sint32[4];
nondet %vec_V6_V7_S6_S7@sint32[4];
nondet %vec_V8_V9_S8_S9@sint32[4];
nondet %vec_V0_V1_S0_S1_expected@sint32[4];
nondet %vec_V2_V3_S2_S3_expected@sint32[4];
nondet %vec_V4_V5_S4_S5_expected@sint32[4];
nondet %vec_V6_V7_S6_S7_expected@sint32[4];
nondet %vec_V8_V9_S8_S9_expected@sint32[4];
// nondet %vec_2x_2p30m1@sint64[2];
// nondet %vec_4x_M@sint32[4];
nondet %vec_l0@sint32[4];
nondet %vec_l1@sint32[4];


assume
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
[0, 0, 0, 0] <= %vec_l0, %vec_l0 <= [(2**30)-1,(2**30)-1,(2**30)-1,(2**30)-1],
[0, 0, 0, 0] <= %vec_l1, %vec_l1 <= [(2**30)-1,(2**30)-1,(2**30)-1,(2**30)-1],
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
&& true;



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
&&
true;

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
]
&& true;

assert and [
%v12[0] <= (2**16)-1,
%v12[0] >= -(2**16) + (2**15 - 1)
]
prove with [algebra solver isl]
&& true;



{true && true}
