
proc main (

    sint32[4] %vec_uu0_rr0_vv0_ss0, sint32[4] %vec_uu1_rr1_vv1_ss1,
    sint32[4] %vec_F0_F1_G0_G1, sint32[4] %vec_F2_F3_G2_G3,
    sint32[4] %vec_F4_F5_G4_G5, sint32[4] %vec_F6_F7_G6_G7,
    sint32[4] %vec_F8_F9_G8_G9, sint64[2] %vec_2x_2p30m1,
    sint32[4] %vec_F0_F1_G0_G1_expected, sint32[4] %vec_F2_F3_G2_G3_expected,
    sint32[4] %vec_F4_F5_G4_G5_expected, sint32[4] %vec_F6_F7_G6_G7_expected,
    sint32[4] %vec_F8_F9_G8_G9_expected

) = {true && true}

nondet %v7@sint64[2];
nondet %v6@sint32[4];
nondet %v5@sint32[4];
nondet %v4@sint32[4];
nondet %v3@sint32[4];

assume and [
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[0], %vec_F0_F1_G0_G1_expected[1],
        %vec_F2_F3_G2_G3_expected[0], %vec_F2_F3_G2_G3_expected[1],
        %vec_F4_F5_G4_G5_expected[0], %vec_F4_F5_G4_G5_expected[1],
        %vec_F6_F7_G6_G7_expected[0], %vec_F6_F7_G6_G7_expected[1],
        %vec_F8_F9_G8_G9_expected[0], %vec_F8_F9_G8_G9_expected[1]
    ] * ((2**60))
    = 
   %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
   ) * (2**30) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
   ) * (2**60) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F2_F3_G2_G3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F2_F3_G2_G3[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[3]
   ) * (2**90) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F2_F3_G2_G3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F2_F3_G2_G3[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F4_F5_G4_G5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F4_F5_G4_G5[2]
   ) * (2**120) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F4_F5_G4_G5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F4_F5_G4_G5[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F4_F5_G4_G5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F4_F5_G4_G5[3]
   ) * (2**150) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F4_F5_G4_G5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F4_F5_G4_G5[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F6_F7_G6_G7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F6_F7_G6_G7[2]
   ) * (2**180) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F6_F7_G6_G7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F6_F7_G6_G7[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F6_F7_G6_G7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F6_F7_G6_G7[3]
   ) * (2**210) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F6_F7_G6_G7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F6_F7_G6_G7[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F8_F9_G8_G9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F8_F9_G8_G9[2]
   ) * (2**240) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F8_F9_G8_G9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F8_F9_G8_G9[2]
   ) * (2**270)
   ,
%v7[0] * (2**300) + %v6[1] * (2**270) + %v6[0] * (2**240) + %v5[1] * (2**210) + %v5[0] * (2**180) + %v4[1] * (2**150) + %v4[0] * (2**120) + %v3[1] * (2**90) + %v3[0] * (2**60)  =
   %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
   ) * (2**30) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
   ) * (2**60) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F2_F3_G2_G3[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F2_F3_G2_G3[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[3]
   ) * (2**90) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F2_F3_G2_G3[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F2_F3_G2_G3[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F4_F5_G4_G5[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F4_F5_G4_G5[2]
   ) * (2**120) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F4_F5_G4_G5[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F4_F5_G4_G5[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F4_F5_G4_G5[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F4_F5_G4_G5[3]
   ) * (2**150) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F4_F5_G4_G5[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F4_F5_G4_G5[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F6_F7_G6_G7[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F6_F7_G6_G7[2]
   ) * (2**180) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F6_F7_G6_G7[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F6_F7_G6_G7[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F6_F7_G6_G7[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F6_F7_G6_G7[3]
   ) * (2**210) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F6_F7_G6_G7[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F6_F7_G6_G7[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F8_F9_G8_G9[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F8_F9_G8_G9[2]
   ) * (2**240) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F8_F9_G8_G9[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F8_F9_G8_G9[2]
   ) * (2**270)
   ]    && true;

assert 
%v7[0] * (2**300) + %v6[1] * (2**270) + %v6[0] * (2**240) + %v5[1] * (2**210) + %v5[0] * (2**180) + %v4[1] * (2**150) + %v4[0] * (2**120) + %v3[1] * (2**90) + %v3[0] * (2**60) 
    = 
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[0], %vec_F0_F1_G0_G1_expected[1],
        %vec_F2_F3_G2_G3_expected[0], %vec_F2_F3_G2_G3_expected[1],
        %vec_F4_F5_G4_G5_expected[0], %vec_F4_F5_G4_G5_expected[1],
        %vec_F6_F7_G6_G7_expected[0], %vec_F6_F7_G6_G7_expected[1],
        %vec_F8_F9_G8_G9_expected[0], %vec_F8_F9_G8_G9_expected[1]
    ] * ((2**60))
   && true;

