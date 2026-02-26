
proc lemma_B (

    sint32[4] %vec_uu0_rr0_vv0_ss0, sint32[4] %vec_uu1_rr1_vv1_ss1,
    sint32[4] %vec_F0_F1_G0_G1, sint32[4] %vec_F2_F3_G2_G3,
    sint32[4] %vec_F4_F5_G4_G5, sint32[4] %vec_F6_F7_G6_G7,
    sint32[4] %vec_F8_F9_G8_G9, sint64[2] %vec_2x_2p30m1,
    sint32[4] %vec_F0_F1_G0_G1_expected, sint32[4] %vec_F2_F3_G2_G3_expected,
    sint32[4] %vec_F4_F5_G4_G5_expected, sint32[4] %vec_F6_F7_G6_G7_expected,
    sint32[4] %vec_F8_F9_G8_G9_expected,
    sint64[2] %v7,
    sint32[4] %v6,
    sint32[4] %v5,
    sint32[4] %v4,
    sint32[4] %v3

) = 
{
and [
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[2], %vec_F0_F1_G0_G1_expected[3],
        %vec_F2_F3_G2_G3_expected[2], %vec_F2_F3_G2_G3_expected[3],
        %vec_F4_F5_G4_G5_expected[2], %vec_F4_F5_G4_G5_expected[3],
        %vec_F6_F7_G6_G7_expected[2], %vec_F6_F7_G6_G7_expected[3],
        %vec_F8_F9_G8_G9_expected[2], %vec_F8_F9_G8_G9_expected[3]
    ] * ((2**60))
    = 
   %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
   ) * (2**30) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
   ) * (2**60) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F2_F3_G2_G3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F2_F3_G2_G3[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[3]
   ) * (2**90) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F2_F3_G2_G3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F2_F3_G2_G3[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F4_F5_G4_G5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F4_F5_G4_G5[2]
   ) * (2**120) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F4_F5_G4_G5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F4_F5_G4_G5[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F4_F5_G4_G5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F4_F5_G4_G5[3]
   ) * (2**150) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F4_F5_G4_G5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F4_F5_G4_G5[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F6_F7_G6_G7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F6_F7_G6_G7[2]
   ) * (2**180) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F6_F7_G6_G7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F6_F7_G6_G7[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F6_F7_G6_G7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F6_F7_G6_G7[3]
   ) * (2**210) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F6_F7_G6_G7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F6_F7_G6_G7[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F8_F9_G8_G9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F8_F9_G8_G9[2]
   ) * (2**240) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F8_F9_G8_G9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F8_F9_G8_G9[2]
   ) * (2**270)
   ,
%v7[1] * (2**300) + %v6[3] * (2**270) + %v6[2] * (2**240) + %v5[3] * (2**210) + %v5[2] * (2**180) + %v4[3] * (2**150) + %v4[2] * (2**120) + %v3[3] * (2**90) + %v3[2] * (2**60)  =
   %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
   ) * (2**30) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
   ) * (2**60) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F2_F3_G2_G3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F2_F3_G2_G3[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[3]
   ) * (2**90) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F2_F3_G2_G3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F2_F3_G2_G3[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F4_F5_G4_G5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F4_F5_G4_G5[2]
   ) * (2**120) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F4_F5_G4_G5[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F4_F5_G4_G5[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F4_F5_G4_G5[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F4_F5_G4_G5[3]
   ) * (2**150) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F4_F5_G4_G5[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F4_F5_G4_G5[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F6_F7_G6_G7[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F6_F7_G6_G7[2]
   ) * (2**180) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F6_F7_G6_G7[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F6_F7_G6_G7[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F6_F7_G6_G7[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F6_F7_G6_G7[3]
   ) * (2**210) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F6_F7_G6_G7[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F6_F7_G6_G7[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F8_F9_G8_G9[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F8_F9_G8_G9[2]
   ) * (2**240) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F8_F9_G8_G9[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F8_F9_G8_G9[2]
   ) * (2**270)
   ]    && true}

nop;

{
%v7[1] * (2**300) +
%v6[3] * (2**270) + 
%v6[2] * (2**240) + 
%v5[3] * (2**210) + 
%v5[2] * (2**180) + 
%v4[3] * (2**150) + 
%v4[2] * (2**120) +
%v3[3] * (2**90) + 
%v3[2] * (2**60)
    = 
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[2], %vec_F0_F1_G0_G1_expected[3],
        %vec_F2_F3_G2_G3_expected[2], %vec_F2_F3_G2_G3_expected[3],
        %vec_F4_F5_G4_G5_expected[2], %vec_F4_F5_G4_G5_expected[3],
        %vec_F6_F7_G6_G7_expected[2], %vec_F6_F7_G6_G7_expected[3],
        %vec_F8_F9_G8_G9_expected[2], %vec_F8_F9_G8_G9_expected[3]
    ] * ((2**60))
   && true}
