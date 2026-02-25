
proc insert_high(%vec_target@sint64[2], %vec_insertant@sint64[2]; %vec_out@sint32[4]) = 
{true &&
%vec_target >=s [0@sint64, 0@sint64],
%vec_target <=s [((2**30)-1)@sint64, ((2**30)-1)@sint64],
%vec_insertant >=s [0@sint64, 0@sint64],
%vec_insertant <=s [((2**30)-1)@sint64, ((2**30)-1)@sint64]
}

mov %v3 %vec_target;
mov %v17 %vec_insertant;



(* shl	v17.2d, v17.2d, #32 *)
mov [tmp1, tmp2] %v17;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];

(* orr	v3.16b, v3.16b, v17.16b *)
or %v3@sint64[2] %v3 %v17;
cast %v3@sint32[4] %v3;


mov %vec_out %v3;

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


{
%vec_out[0] = %vec_target[0],
%vec_out[1] = %vec_insertant[0],
%vec_out[2] = %vec_target[1],
%vec_out[3] = %vec_insertant[1]
&& 
(sext (%vec_out[0]) 32) = %vec_target[0] (mod ((2**30)@64)),
(sext (%vec_out[1]) 32) = %vec_insertant[0] (mod ((2**30)@64)),
(sext (%vec_out[2]) 32) = %vec_target[1] (mod ((2**30)@64)),
(sext (%vec_out[3]) 32) = %vec_insertant[1] (mod ((2**30)@64))
}






proc main (
    sint32[4] %vec_uu0_rr0_vv0_ss0, sint32[4] %vec_uu1_rr1_vv1_ss1,
    sint32[4] %vec_F0_F1_G0_G1, sint32[4] %vec_F2_F3_G2_G3,
    sint32[4] %vec_F4_F5_G4_G5, sint32[4] %vec_F6_F7_G6_G7,
    sint32[4] %vec_F8_F9_G8_G9, sint64[2] %vec_2x_2p30m1,
    sint32[4] %vec_F0_F1_G0_G1_expected, sint32[4] %vec_F2_F3_G2_G3_expected,
    sint32[4] %vec_F4_F5_G4_G5_expected, sint32[4] %vec_F6_F7_G6_G7_expected,
    sint32[4] %vec_F8_F9_G8_G9_expected

;
    sint32[4] %vec_F0_F1_G0_G1_out, sint32[4] %vec_F2_F3_G2_G3_out,
    sint32[4] %vec_F4_F5_G4_G5_out, sint32[4] %vec_F6_F7_G6_G7_out,
    sint32[4] %vec_F8_F9_G8_G9_out

)={
    
    // u * F + v * G  
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[0], %vec_uu1_rr1_vv1_ss1[0]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[0], %vec_F0_F1_G0_G1[1],
        %vec_F2_F3_G2_G3[0], %vec_F2_F3_G2_G3[1],
        %vec_F4_F5_G4_G5[0], %vec_F4_F5_G4_G5[1],
        %vec_F6_F7_G6_G7[0], %vec_F6_F7_G6_G7[1],
        %vec_F8_F9_G8_G9[0], %vec_F8_F9_G8_G9[1]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[2], %vec_uu1_rr1_vv1_ss1[2]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[2], %vec_F0_F1_G0_G1[3],
        %vec_F2_F3_G2_G3[2], %vec_F2_F3_G2_G3[3],
        %vec_F4_F5_G4_G5[2], %vec_F4_F5_G4_G5[3],
        %vec_F6_F7_G6_G7[2], %vec_F6_F7_G6_G7[3],
        %vec_F8_F9_G8_G9[2], %vec_F8_F9_G8_G9[3]
    ] = 
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[0], %vec_F0_F1_G0_G1_expected[1],
        %vec_F2_F3_G2_G3_expected[0], %vec_F2_F3_G2_G3_expected[1],
        %vec_F4_F5_G4_G5_expected[0], %vec_F4_F5_G4_G5_expected[1],
        %vec_F6_F7_G6_G7_expected[0], %vec_F6_F7_G6_G7_expected[1],
        %vec_F8_F9_G8_G9_expected[0], %vec_F8_F9_G8_G9_expected[1]
    ] * ((2**60))
    ,
    
    // r * F + s * G  
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[1], %vec_uu1_rr1_vv1_ss1[1]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[0], %vec_F0_F1_G0_G1[1],
        %vec_F2_F3_G2_G3[0], %vec_F2_F3_G2_G3[1],
        %vec_F4_F5_G4_G5[0], %vec_F4_F5_G4_G5[1],
        %vec_F6_F7_G6_G7[0], %vec_F6_F7_G6_G7[1],
        %vec_F8_F9_G8_G9[0], %vec_F8_F9_G8_G9[1]
    ]
    +
    limbs 30 [
        %vec_uu0_rr0_vv0_ss0[3], %vec_uu1_rr1_vv1_ss1[3]
    ] *
    limbs 30 [
        %vec_F0_F1_G0_G1[2], %vec_F0_F1_G0_G1[3],
        %vec_F2_F3_G2_G3[2], %vec_F2_F3_G2_G3[3],
        %vec_F4_F5_G4_G5[2], %vec_F4_F5_G4_G5[3],
        %vec_F6_F7_G6_G7[2], %vec_F6_F7_G6_G7[3],
        %vec_F8_F9_G8_G9[2], %vec_F8_F9_G8_G9[3]
    ] = 
    limbs 30 [
        %vec_F0_F1_G0_G1_expected[2], %vec_F0_F1_G0_G1_expected[3],
        %vec_F2_F3_G2_G3_expected[2], %vec_F2_F3_G2_G3_expected[3],
        %vec_F4_F5_G4_G5_expected[2], %vec_F4_F5_G4_G5_expected[3],
        %vec_F6_F7_G6_G7_expected[2], %vec_F6_F7_G6_G7_expected[3],
        %vec_F8_F9_G8_G9_expected[2], %vec_F8_F9_G8_G9_expected[3]
    ] * ((2**60))

    ,
    %vec_2x_2p30m1 = [((2**30)-1), ((2**30)-1)],
    %vec_F0_F1_G0_G1 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F0_F1_G0_G1 >= [0, 0, 0, 0],
    %vec_F2_F3_G2_G3 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F2_F3_G2_G3 >= [0, 0, 0, 0],
    %vec_F4_F5_G4_G5 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F4_F5_G4_G5 >= [0, 0, 0, 0],
    %vec_F6_F7_G6_G7 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F6_F7_G6_G7 >= [0, 0, 0, 0],
    %vec_F8_F9_G8_G9 <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F8_F9_G8_G9 >= [0, 0, 0, 0],
    %vec_F0_F1_G0_G1_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F0_F1_G0_G1_expected >= [0, 0, 0, 0],
    %vec_F2_F3_G2_G3_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F2_F3_G2_G3_expected >= [0, 0, 0, 0],
    %vec_F4_F5_G4_G5_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F4_F5_G4_G5_expected >= [0, 0, 0, 0],
    %vec_F6_F7_G6_G7_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F6_F7_G6_G7_expected >= [0, 0, 0, 0],
    %vec_F8_F9_G8_G9_expected <= [((2**30)-1), ((2**30)-1), ((2**30)-1), ((2**30)-1)],
    %vec_F8_F9_G8_G9_expected >= [0, 0, 0, 0],
    
    (0) <= %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <= ((2**30)-1),
    (0) <= %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <= ((2**30)-1),
    (-(2**30)) <= %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <= ((2**30)-1)

    // norm condition
    // |u| + |v| < 2**60
    # (%vec_uu0_rr0_vv0_ss0[0] + %vec_uu1_rr1_vv1_ss1[0]) +
    # (%vec_uu0_rr0_vv0_ss0[2] + %vec_uu1_rr1_vv1_ss1[2]) 
    
&&
    %vec_2x_2p30m1 = [(2**30 - 1)@sint64, (2**30 - 1)@sint64],
    [0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F0_F1_G0_G1,
    %vec_F0_F1_G0_G1 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
    [0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F2_F3_G2_G3,
    %vec_F2_F3_G2_G3 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
    [0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F4_F5_G4_G5,
    %vec_F4_F5_G4_G5 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
    [0@sint32, 0@sint32, 0@sint32, 0@sint32] <=s %vec_F6_F7_G6_G7,
    %vec_F6_F7_G6_G7 <=s [((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32, ((2**30)-1)@sint32],
    [(-(2**15))@sint32, (0)@sint32, (-(2**15))@sint32, (0)@sint32] <=s %vec_F8_F9_G8_G9,
    %vec_F8_F9_G8_G9 <=s [((2**15)-1)@sint32, (0)@sint32, ((2**15)-1)@sint32, (0)@sint32],
    
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[0], %vec_uu0_rr0_vv0_ss0[0] <=s ((2**30)-1)@sint32,
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[1], %vec_uu0_rr0_vv0_ss0[1] <=s ((2**30)-1)@sint32,
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[2], %vec_uu0_rr0_vv0_ss0[2] <=s ((2**30)-1)@sint32,
    (0)@sint32 <=s %vec_uu0_rr0_vv0_ss0[3], %vec_uu0_rr0_vv0_ss0[3] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[0], %vec_uu1_rr1_vv1_ss1[0] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[1], %vec_uu1_rr1_vv1_ss1[1] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[2], %vec_uu1_rr1_vv1_ss1[2] <=s ((2**30)-1)@sint32,
    (-(2**30))@sint32 <=s %vec_uu1_rr1_vv1_ss1[3], %vec_uu1_rr1_vv1_ss1[3] <=s ((2**30)-1)@sint32
    
}


mov %v3 %vec_F0_F1_G0_G1;
mov %v4 %vec_F2_F3_G2_G3;
mov %v5 %vec_F4_F5_G4_G5;
mov %v6 %vec_F6_F7_G6_G7;
mov %v7 %vec_F8_F9_G8_G9;
mov %v13 %vec_uu0_rr0_vv0_ss0;
mov %v14 %vec_uu1_rr1_vv1_ss1;
mov %v1 %vec_2x_2p30m1;

nondet %v16@sint32[4];

(* smull	v16.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaabe371a54 *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v16@int64[2] %tmp1 %tmp2;

(* smlal2	v16.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaabe371a58 *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

assert
    and [
        %v16[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2],
        %v16[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2]
    ]

 prove with [algebra solver smt:z3],
    %v16[0] = 0 (mod (2**30)),
    %v16[1] = 0 (mod (2**30))
&&
    true
;


assume
    %v16[0] = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2],
    %v16[1] = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2],
    %v16[0] = 0 (mod (2**30)),
    %v16[1] = 0 (mod (2**30))
&&
    %v16[0] = 0@64 (mod ((2**30)@sint64)),
    %v16[1] = 0@64 (mod ((2**30)@sint64))
;



ghost %v16_old0@sint64[2]:
%v16_old0 = %v16 &&
%v16_old0 = %v16 ;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a5c *)
split %v16 %dc %v16 30;


assert true &&
%v16[0] * ((2**30)@sint64) = %v16_old0[0],
%v16[1] * ((2**30)@sint64) = %v16_old0[1];

assume
%v16[0] * ((2**30)) = %v16_old0[0],
%v16[1] * ((2**30)) = %v16_old0[1]
&&
%v16[0] * ((2**30)@sint64) = %v16_old0[0],
%v16[1] * ((2**30)@sint64) = %v16_old0[1];

assert
    %v16[0] * (2**30) = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] prove with [algebra solver smt:z3],
    %v16[1] * (2**30) = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] prove with [algebra solver smt:z3]
&& true;

assume
    %v16[0] * (2**30) = %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2],
    %v16[1] * (2**30) = %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2]
&& true;


(* smlal	v16.2d, v14.2s, v3.s[0]                   #! PC = 0xaaaabe371a60 *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v3.s[2]                  #! PC = 0xaaaabe371a64 *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v3.s[1]                   #! PC = 0xaaaabe371a68 *)
broadcast %tmp1@int32[2] 2 [%v3[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v3.s[3]                  #! PC = 0xaaaabe371a6c *)
broadcast %tmp1@int32[2] 2 [%v3[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;


assert 
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
] && true;

assume
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) (mod (2**94))
] && true;

assert 
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
] prove with [algebra solver smt:z3] && true;


assume
and [
    %v16[0] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**30) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
] && true;

assert 
%v16[0] * (2**30) = 0 (mod (2**60)),
%v16[1] * (2**30) = 0 (mod (2**60))
&& true;

assume 
%v16[0] * (2**30) = 0 (mod (2**60)),
%v16[1] * (2**30) = 0 (mod (2**60))
&& true;

assert 
%v16[0] = 0 (mod (2**30)) prove with [algebra solver smt:z3],
%v16[1] = 0 (mod (2**30)) prove with [algebra solver smt:z3]
&& true;

assume 
%v16[0] = 0 (mod (2**30)),
%v16[1] = 0 (mod (2**30))
&&
%v16[0] = 0@64 (mod ((2**30)@sint64)),
%v16[1] = 0@64 (mod ((2**30)@sint64));

ghost %v16_old1@sint64[2]:
%v16_old1 = %v16 &&
%v16_old1 = %v16 ;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a70 *)
split %v16 %dc %v16 30;


assert true &&
%v16[0] * ((2**30)@sint64) = %v16_old1[0],
%v16[1] * ((2**30)@sint64) = %v16_old1[1];

assume
%v16[0] * ((2**30)) = %v16_old1[0],
%v16[1] * ((2**30)) = %v16_old1[1]
&&
%v16[0] * ((2**30)@sint64) = %v16_old1[0],
%v16[1] * ((2**30)@sint64) = %v16_old1[1];



assert and[
    %v16[0] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ]
    prove with [algebra solver smt:z3]
    && true;

assume and[
    %v16[0] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ]
    && true;

cut and[
    %v16[0] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ,
    %v16[1] * (2**60)  =
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30)
    ]
    && true;

(* smlal	v16.2d, v14.2s, v3.s[1]                   #! PC = 0xaaaabe371a74 *)
broadcast %tmp1@int32[2] 2 [%v3[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v3.s[3]                  #! PC = 0xaaaabe371a78 *)
broadcast %tmp1@int32[2] 2 [%v3[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v4.s[0]                   #! PC = 0xaaaabe371a7c *)
broadcast %tmp1@int32[2] 2 [%v4[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v4.s[2]                  #! PC = 0xaaaabe371a80 *)
broadcast %tmp1@int32[2] 2 [%v4[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;


assert 
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
] prove with [all cuts, precondition]
&& true;
assume
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    (mod (2**124))
]
&& true;



assert 
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
] prove with [algebra solver smt:z3, all cuts, precondition]
&& true;


assume
and [
    %v16[0] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
    ,
    %v16[1] * (2**60) = 
    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
    ) * (2**30) +
    (
        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
    ) * (2**60)
]
&& true;

cut
and [
   %v16[0] * (2**60) = 
   %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[2] +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[2] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F0_F1_G0_G1[3]
   ) * (2**30) +
   (
       %vec_uu1_rr1_vv1_ss1[0] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[2] * %vec_F0_F1_G0_G1[3] +
       %vec_uu0_rr0_vv0_ss0[0] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[2] * %vec_F2_F3_G2_G3[2]
   ) * (2**60)
   ,
   %v16[1] * (2**60) = 
   %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
   ) * (2**30) +
   (
       %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
       %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
   ) * (2**60)
] prove with [all cuts, precondition]
&& true prove with [all cuts, precondition];


ghost %v16_old2@sint64[2]:
	%v16_old2 = %v16
	&&
	%v16_old2 = %v16
	;

(* and	v3.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371a84 *)
and %v3@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a88 *)
split %v16 %dc %v16 30;

assert true &&
%v16[0] * (const 64 (2**30)) + %v3[0] = %v16_old2[0],
%v16[1] * (const 64 (2**30)) + %v3[1] = %v16_old2[1],
(const 64 0) <=s %v3[0], %v3[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v3[1], %v3[1] <=s (const 64 ((2**30)-1))
;

assume 
%v16[0] * (2**30) + %v3[0] = %v16_old2[0],
%v16[1] * (2**30) + %v3[1] = %v16_old2[1],
0 <= %v3[0], %v3[0] <= ((2**30)-1),
0 <= %v3[1], %v3[1] <= ((2**30)-1)
&&
%v16[0] * (const 64 (2**30)) + %v3[0] = %v16_old2[0],
%v16[1] * (const 64 (2**30)) + %v3[1] = %v16_old2[1],
(const 64 0) <=s %v3[0], %v3[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v3[1], %v3[1] <=s (const 64 ((2**30)-1))
;






(* smlal	v16.2d, v14.2s, v4.s[0]                   #! PC = 0xaaaabe371a8c *)
broadcast %tmp1@int32[2] 2 [%v4[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v4.s[2]                  #! PC = 0xaaaabe371a90 *)
broadcast %tmp1@int32[2] 2 [%v4[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v4.s[1]                   #! PC = 0xaaaabe371a94 *)
broadcast %tmp1@int32[2] 2 [%v4[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v4.s[3]                  #! PC = 0xaaaabe371a98 *)
broadcast %tmp1@int32[2] 2 [%v4[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

assert 
and [
%v16[0] * (2**90) + %v3[0] * (2**60) = 
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
    ) * (2**90)
(mod (2**154))
,
%v16[1] * (2**90) + %v3[1] * (2**60) = 
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
    ) * (2**90)
(mod (2**154))
]
&& true;


assert and [
%v3[0] * (2**60) = %vec_F0_F1_G0_G1_expected[0] * ((2**60)) (mod (2**90)),
%v3[1] * (2**60) = %vec_F0_F1_G0_G1_expected[2] * ((2**60)) (mod (2**90))
]
prove with [precondition]
&& true;

assume 
%v3[0] * (2**60) = %vec_F0_F1_G0_G1_expected[0] * ((2**60)) (mod (2**90)),
%v3[1] * (2**60) = %vec_F0_F1_G0_G1_expected[2] * ((2**60)) (mod (2**90))
&& true;


assert and [
%v3[0] = (%vec_F0_F1_G0_G1_expected[0] * (1)) (mod (2**30)),
%v3[1] = (%vec_F0_F1_G0_G1_expected[2] * (1)) (mod (2**30))
]
prove with [precondition, algebra solver smt:z3]
&& true;

assume and [
%v3[0] = (%vec_F0_F1_G0_G1_expected[0] * (1)) (mod (2**30)),
%v3[1] = (%vec_F0_F1_G0_G1_expected[2] * (1)) (mod (2**30))
]
&& true;


ghost %v16_old3@sint64[2]:
	%v16_old3 = %v16
	&&
	%v16_old3 = %v16
	;


(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371a9c *)
and %v17@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371aa0 *)
split %v16 %dc %v16 30;

assert true &&
%v16[0] * (const 64 (2**30)) + %v17[0] = %v16_old3[0],
%v16[1] * (const 64 (2**30)) + %v17[1] = %v16_old3[1],
(const 64 0) <=s %v17[0], %v17[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v17[1], %v17[1] <=s (const 64 ((2**30)-1))
;

assume
%v16[0] * (2**30) + %v17[0] = %v16_old3[0],
%v16[1] * (2**30) + %v17[1] = %v16_old3[1],
0 <= %v17[0], %v17[0] <= ((2**30)-1),
0 <= %v17[1], %v17[1] <= ((2**30)-1)
&&
%v16[0] * (const 64 (2**30)) + %v17[0] = %v16_old3[0],
%v16[1] * (const 64 (2**30)) + %v17[1] = %v16_old3[1],
(const 64 0) <=s %v17[0], %v17[0] <=s (const 64 ((2**30)-1)),
(const 64 0) <=s %v17[1], %v17[1] <=s (const 64 ((2**30)-1))
;


(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371aa4 *)
(* orr	v3.16b, v3.16b, v17.16b                     #! PC = 0xaaaabe371aa8 *)
mov %v3_in %v3;
nondet %v3@sint32[4];
call insert_high(%v3_in, %v17; %v3);

assert 
%v16[0] * (2**30) + %v3[1] = %v16_old3[0]
,
%v16[1] * (2**30) + %v3[3] = %v16_old3[1]
&& true;


assert
%v16[0] * (2**120) + %v3[1] * (2**90) + %v3[0] * (2**60)  =
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
    ) * (2**90)
(mod (2**154))
,
%v16[1] * (2**120) + %v3[3] * (2**90) + %v3[2] * (2**60)  =
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
    ) * (2**90)
(mod (2**154))
&& true;





assert and [
%v3[1] * (2**90) + %v3[0] * (2**60)  =
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
    ) * (2**90)
    (mod (2**120))
    ,
%v3[3] * (2**90) + %v3[2] * (2**60)  =
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
    ) * (2**90)
    (mod (2**120))
]
,
and [
%v3[1] * (2**90) + %v3[0] * (2**60)  = 
        (1) * ( %vec_F0_F1_G0_G1_expected[0] * (2**60) + %vec_F0_F1_G0_G1_expected[1] * (2**90) )
    (mod (2**120))
,
%v3[3] * (2**90) + %v3[2] * (2**60)  = 
        (1) * ( %vec_F0_F1_G0_G1_expected[2] * (2**60) + %vec_F0_F1_G0_G1_expected[3] * (2**90) )
    (mod (2**120))
] prove with [precondition, all cuts]

&& true;

assume
%v3[1] * (2**90) + %v3[0] * (2**60)  = 
        (1) * ( %vec_F0_F1_G0_G1_expected[0] * (2**60) + %vec_F0_F1_G0_G1_expected[1] * (2**90) )
    (mod (2**120))
    ,
%v3[3] * (2**90) + %v3[2] * (2**60)  = 
        (1) * ( %vec_F0_F1_G0_G1_expected[2] * (2**60) + %vec_F0_F1_G0_G1_expected[3] * (2**90) )
    (mod (2**120))
    && true;

assert and [
%v3 = %vec_F0_F1_G0_G1_expected
] prove with [algebra solver smt:z3, precondition]
&& true;








cut
%v16[0] * (2**120) + %v3[1] * (2**90) + %v3[0] * (2**60)  =
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
    ) * (2**90)
(mod (2**154))
,
%v16[1] * (2**120) + %v3[3] * (2**90) + %v3[2] * (2**60)  =
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
    ) * (2**90)
(mod (2**154))
&& true prove with [all cuts, precondition];



(* smlal	v16.2d, v14.2s, v4.s[1]                   #! PC = 0xaaaabe371aac *)
broadcast %tmp1@int32[2] 2 [%v4[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v4.s[3]                  #! PC = 0xaaaabe371ab0 *)
broadcast %tmp1@int32[2] 2 [%v4[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v5.s[0]                   #! PC = 0xaaaabe371ab4 *)
broadcast %tmp1@int32[2] 2 [%v5[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v5.s[2]                  #! PC = 0xaaaabe371ab8 *)
broadcast %tmp1@int32[2] 2 [%v5[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

assert
%v16[0] * (2**120) + %v3[1] * (2**90) + %v3[0] * (2**60)  =
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
    ) * (2**120)
(mod (2**184))
// ,
// %v16[1] * (2**120) + %v3[3] * (2**90) + %v3[2] * (2**60)  =
//    %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[2] +
//    (
//        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[2] +
//        %vec_uu0_rr0_vv0_ss0[1] * %vec_F0_F1_G0_G1[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F0_F1_G0_G1[3]
//    ) * (2**30) +
//    (
//        %vec_uu1_rr1_vv1_ss1[1] * %vec_F0_F1_G0_G1[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F0_F1_G0_G1[3] +
//        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[2]
//    ) * (2**60) +
//    (
//        %vec_uu1_rr1_vv1_ss1[1] * %vec_F2_F3_G2_G3[0] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F2_F3_G2_G3[2] +
//        %vec_uu0_rr0_vv0_ss0[1] * %vec_F2_F3_G2_G3[1] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F2_F3_G2_G3[3]
//     ) * (2**90) +
//    (
//        %vec_uu1_rr1_vv1_ss1[1] * %vec_F2_F3_G2_G3[1] + %vec_uu1_rr1_vv1_ss1[3] * %vec_F2_F3_G2_G3[3] +
//        %vec_uu0_rr0_vv0_ss0[1] * %vec_F4_F5_G4_G5[0] + %vec_uu0_rr0_vv0_ss0[3] * %vec_F4_F5_G4_G5[2]
//     ) * (2**120)
// (mod (2**184))
&& true;

ghost %v16_old4@sint64[2]:
	%v16_old4 = %v16
	&&
	%v16_old4 = %v16
	;


(* and	v4.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371abc *)
and %v4@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371ac0 *)
split %v16 %dc %v16 30;

(* smlal	v16.2d, v14.2s, v5.s[0]                   #! PC = 0xaaaabe371ac4 *)
broadcast %tmp1@int32[2] 2 [%v5[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v5.s[2]                  #! PC = 0xaaaabe371ac8 *)
broadcast %tmp1@int32[2] 2 [%v5[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v5.s[1]                   #! PC = 0xaaaabe371acc *)
broadcast %tmp1@int32[2] 2 [%v5[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v5.s[3]                  #! PC = 0xaaaabe371ad0 *)
broadcast %tmp1@int32[2] 2 [%v5[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371ad4 *)
and %v17@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371ad8 *)
split %v16 %dc %v16 30;

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371adc *)
mov [tmp1, tmp2] %v17;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];

(* orr	v4.16b, v4.16b, v17.16b                     #! PC = 0xaaaabe371ae0 *)
or %v4@sint64[2] %v4 %v17;
cast %v4@sint32[4] %v4;

(* smlal	v16.2d, v14.2s, v5.s[1]                   #! PC = 0xaaaabe371ae4 *)
broadcast %tmp1@int32[2] 2 [%v5[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v5.s[3]                  #! PC = 0xaaaabe371ae8 *)
broadcast %tmp1@int32[2] 2 [%v5[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v6.s[0]                   #! PC = 0xaaaabe371aec *)
broadcast %tmp1@int32[2] 2 [%v6[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v6.s[2]                  #! PC = 0xaaaabe371af0 *)
broadcast %tmp1@int32[2] 2 [%v6[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* and	v5.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371af4 *)
and %v5@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371af8 *)
split %v16 %dc %v16 30;

(* smlal	v16.2d, v14.2s, v6.s[0]                   #! PC = 0xaaaabe371afc *)
broadcast %tmp1@int32[2] 2 [%v6[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v6.s[2]                  #! PC = 0xaaaabe371b00 *)
broadcast %tmp1@int32[2] 2 [%v6[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v6.s[1]                   #! PC = 0xaaaabe371b04 *)
broadcast %tmp1@int32[2] 2 [%v6[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v6.s[3]                  #! PC = 0xaaaabe371b08 *)
broadcast %tmp1@int32[2] 2 [%v6[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371b0c *)
and %v17@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371b10 *)
split %v16 %dc %v16 30;

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371b14 *)
mov [tmp1, tmp2] %v17;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];

(* orr	v5.16b, v5.16b, v17.16b                     #! PC = 0xaaaabe371b18 *)
or %v5@sint64[2] %v5 %v17;
cast %v5@sint32[4] %v5;

(* smlal	v16.2d, v14.2s, v6.s[1]                   #! PC = 0xaaaabe371b1c *)
broadcast %tmp1@int32[2] 2 [%v6[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v6.s[3]                  #! PC = 0xaaaabe371b20 *)
broadcast %tmp1@int32[2] 2 [%v6[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal	v16.2d, v13.2s, v7.s[0]                   #! PC = 0xaaaabe371b24 *)
broadcast %tmp1@int32[2] 2 [%v7[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v13.4s, v7.s[2]                  #! PC = 0xaaaabe371b28 *)
broadcast %tmp1@int32[2] 2 [%v7[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* and	v6.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371b2c *)
and %v6@sint64[2] %v16 %v1;

(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371b30 *)
split %v16 %dc %v16 30;

(* smlal	v16.2d, v14.2s, v7.s[0]                   #! PC = 0xaaaabe371b34 *)
broadcast %tmp1@int32[2] 2 [%v7[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* smlal2	v16.2d, v14.4s, v7.s[2]                  #! PC = 0xaaaabe371b38 *)
broadcast %tmp1@int32[2] 2 [%v7[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;

(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371b3c *)
and %v17@sint64[2] %v16 %v1;

(* sshr	v7.2d, v16.2d, #30                         #! PC = 0xaaaabe371b40 *)
split %v7 %dc %v16 30;

(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371b44 *)
mov [tmp1, tmp2] %v17;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];

(* orr	v6.16b, v6.16b, v17.16b                     #! PC = 0xaaaabe371b48 *)
or %v6@sint64[2] %v6 %v17;
cast %v6@sint32[4] %v6;



cut true && true prove with [all cuts, precondition];
