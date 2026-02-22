proc main (%tmp1, %v1, %v13, %v14, tmp1, tmp2) =
{
  true
  &&
  true
}

(* smull	v16.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaabe371a54 *)
broadcast %tmp1@int32[2] 2 [%v3[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v16@int64[2] %tmp1 %tmp2;
(* smlal2	v16.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaabe371a58 *)
broadcast %tmp1@int32[2] 2 [%v3[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v16@int64[2] %v16 %tmp3;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a5c *)
split %v16 %dc %v16 30;
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
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a70 *)
split %v16 %dc %v16 30;
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
(* and	v3.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371a84 *)
and %v3@sint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a88 *)
split %v16 %dc %v16 30;
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
(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371a9c *)
and %v17@sint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371aa0 *)
split %v16 %dc %v16 30;
(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371aa4 *)
mov [tmp1, tmp2] %v17;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];
(* orr	v3.16b, v3.16b, v17.16b                     #! PC = 0xaaaabe371aa8 *)
or %v3@sint64[2] %v3 %v17;
cast %v3@sint32[4] %v3;
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

