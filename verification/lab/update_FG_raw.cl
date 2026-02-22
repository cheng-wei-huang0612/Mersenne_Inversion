proc main (%v1, %v16) =
{
  true
  &&
  true
}

(* smull	v16.2d, v13.2s, v3.s[0]                   #! PC = 0xaaaabe371a54 *)
smull	%%v16.2d, %%v13.2s, %%v3.s[0]                   #! 0xaaaabe371a54 = 0xaaaabe371a54;
(* smlal2	v16.2d, v13.4s, v3.s[2]                  #! PC = 0xaaaabe371a58 *)
smlal2	%%v16.2d, %%v13.4s, %%v3.s[2]                  #! 0xaaaabe371a58 = 0xaaaabe371a58;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a5c *)
split %v16 %dc %v16 30;
(* smlal	v16.2d, v14.2s, v3.s[0]                   #! PC = 0xaaaabe371a60 *)
smlal	%%v16.2d, %%v14.2s, %%v3.s[0]                   #! 0xaaaabe371a60 = 0xaaaabe371a60;
(* smlal2	v16.2d, v14.4s, v3.s[2]                  #! PC = 0xaaaabe371a64 *)
smlal2	%%v16.2d, %%v14.4s, %%v3.s[2]                  #! 0xaaaabe371a64 = 0xaaaabe371a64;
(* smlal	v16.2d, v13.2s, v3.s[1]                   #! PC = 0xaaaabe371a68 *)
smlal	%%v16.2d, %%v13.2s, %%v3.s[1]                   #! 0xaaaabe371a68 = 0xaaaabe371a68;
(* smlal2	v16.2d, v13.4s, v3.s[3]                  #! PC = 0xaaaabe371a6c *)
smlal2	%%v16.2d, %%v13.4s, %%v3.s[3]                  #! 0xaaaabe371a6c = 0xaaaabe371a6c;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a70 *)
split %v16 %dc %v16 30;
(* smlal	v16.2d, v14.2s, v3.s[1]                   #! PC = 0xaaaabe371a74 *)
smlal	%%v16.2d, %%v14.2s, %%v3.s[1]                   #! 0xaaaabe371a74 = 0xaaaabe371a74;
(* smlal2	v16.2d, v14.4s, v3.s[3]                  #! PC = 0xaaaabe371a78 *)
smlal2	%%v16.2d, %%v14.4s, %%v3.s[3]                  #! 0xaaaabe371a78 = 0xaaaabe371a78;
(* smlal	v16.2d, v13.2s, v4.s[0]                   #! PC = 0xaaaabe371a7c *)
smlal	%%v16.2d, %%v13.2s, %%v4.s[0]                   #! 0xaaaabe371a7c = 0xaaaabe371a7c;
(* smlal2	v16.2d, v13.4s, v4.s[2]                  #! PC = 0xaaaabe371a80 *)
smlal2	%%v16.2d, %%v13.4s, %%v4.s[2]                  #! 0xaaaabe371a80 = 0xaaaabe371a80;
(* and	v3.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371a84 *)
and %v3@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371a88 *)
split %v16 %dc %v16 30;
(* smlal	v16.2d, v14.2s, v4.s[0]                   #! PC = 0xaaaabe371a8c *)
smlal	%%v16.2d, %%v14.2s, %%v4.s[0]                   #! 0xaaaabe371a8c = 0xaaaabe371a8c;
(* smlal2	v16.2d, v14.4s, v4.s[2]                  #! PC = 0xaaaabe371a90 *)
smlal2	%%v16.2d, %%v14.4s, %%v4.s[2]                  #! 0xaaaabe371a90 = 0xaaaabe371a90;
(* smlal	v16.2d, v13.2s, v4.s[1]                   #! PC = 0xaaaabe371a94 *)
smlal	%%v16.2d, %%v13.2s, %%v4.s[1]                   #! 0xaaaabe371a94 = 0xaaaabe371a94;
(* smlal2	v16.2d, v13.4s, v4.s[3]                  #! PC = 0xaaaabe371a98 *)
smlal2	%%v16.2d, %%v13.4s, %%v4.s[3]                  #! 0xaaaabe371a98 = 0xaaaabe371a98;
(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371a9c *)
and %v17@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371aa0 *)
split %v16 %dc %v16 30;
(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371aa4 *)
shls %dc %v17 %v17 [32, 32];
(* orr	v3.16b, v3.16b, v17.16b                     #! PC = 0xaaaabe371aa8 *)
or %v3@uint64[2] %v3 %v17;
(* smlal	v16.2d, v14.2s, v4.s[1]                   #! PC = 0xaaaabe371aac *)
smlal	%%v16.2d, %%v14.2s, %%v4.s[1]                   #! 0xaaaabe371aac = 0xaaaabe371aac;
(* smlal2	v16.2d, v14.4s, v4.s[3]                  #! PC = 0xaaaabe371ab0 *)
smlal2	%%v16.2d, %%v14.4s, %%v4.s[3]                  #! 0xaaaabe371ab0 = 0xaaaabe371ab0;
(* smlal	v16.2d, v13.2s, v5.s[0]                   #! PC = 0xaaaabe371ab4 *)
smlal	%%v16.2d, %%v13.2s, %%v5.s[0]                   #! 0xaaaabe371ab4 = 0xaaaabe371ab4;
(* smlal2	v16.2d, v13.4s, v5.s[2]                  #! PC = 0xaaaabe371ab8 *)
smlal2	%%v16.2d, %%v13.4s, %%v5.s[2]                  #! 0xaaaabe371ab8 = 0xaaaabe371ab8;
(* and	v4.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371abc *)
and %v4@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371ac0 *)
split %v16 %dc %v16 30;
(* smlal	v16.2d, v14.2s, v5.s[0]                   #! PC = 0xaaaabe371ac4 *)
smlal	%%v16.2d, %%v14.2s, %%v5.s[0]                   #! 0xaaaabe371ac4 = 0xaaaabe371ac4;
(* smlal2	v16.2d, v14.4s, v5.s[2]                  #! PC = 0xaaaabe371ac8 *)
smlal2	%%v16.2d, %%v14.4s, %%v5.s[2]                  #! 0xaaaabe371ac8 = 0xaaaabe371ac8;
(* smlal	v16.2d, v13.2s, v5.s[1]                   #! PC = 0xaaaabe371acc *)
smlal	%%v16.2d, %%v13.2s, %%v5.s[1]                   #! 0xaaaabe371acc = 0xaaaabe371acc;
(* smlal2	v16.2d, v13.4s, v5.s[3]                  #! PC = 0xaaaabe371ad0 *)
smlal2	%%v16.2d, %%v13.4s, %%v5.s[3]                  #! 0xaaaabe371ad0 = 0xaaaabe371ad0;
(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371ad4 *)
and %v17@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371ad8 *)
split %v16 %dc %v16 30;
(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371adc *)
shls %dc %v17 %v17 [32, 32];
(* orr	v4.16b, v4.16b, v17.16b                     #! PC = 0xaaaabe371ae0 *)
or %v4@uint64[2] %v4 %v17;
(* smlal	v16.2d, v14.2s, v5.s[1]                   #! PC = 0xaaaabe371ae4 *)
smlal	%%v16.2d, %%v14.2s, %%v5.s[1]                   #! 0xaaaabe371ae4 = 0xaaaabe371ae4;
(* smlal2	v16.2d, v14.4s, v5.s[3]                  #! PC = 0xaaaabe371ae8 *)
smlal2	%%v16.2d, %%v14.4s, %%v5.s[3]                  #! 0xaaaabe371ae8 = 0xaaaabe371ae8;
(* smlal	v16.2d, v13.2s, v6.s[0]                   #! PC = 0xaaaabe371aec *)
smlal	%%v16.2d, %%v13.2s, %%v6.s[0]                   #! 0xaaaabe371aec = 0xaaaabe371aec;
(* smlal2	v16.2d, v13.4s, v6.s[2]                  #! PC = 0xaaaabe371af0 *)
smlal2	%%v16.2d, %%v13.4s, %%v6.s[2]                  #! 0xaaaabe371af0 = 0xaaaabe371af0;
(* and	v5.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371af4 *)
and %v5@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371af8 *)
split %v16 %dc %v16 30;
(* smlal	v16.2d, v14.2s, v6.s[0]                   #! PC = 0xaaaabe371afc *)
smlal	%%v16.2d, %%v14.2s, %%v6.s[0]                   #! 0xaaaabe371afc = 0xaaaabe371afc;
(* smlal2	v16.2d, v14.4s, v6.s[2]                  #! PC = 0xaaaabe371b00 *)
smlal2	%%v16.2d, %%v14.4s, %%v6.s[2]                  #! 0xaaaabe371b00 = 0xaaaabe371b00;
(* smlal	v16.2d, v13.2s, v6.s[1]                   #! PC = 0xaaaabe371b04 *)
smlal	%%v16.2d, %%v13.2s, %%v6.s[1]                   #! 0xaaaabe371b04 = 0xaaaabe371b04;
(* smlal2	v16.2d, v13.4s, v6.s[3]                  #! PC = 0xaaaabe371b08 *)
smlal2	%%v16.2d, %%v13.4s, %%v6.s[3]                  #! 0xaaaabe371b08 = 0xaaaabe371b08;
(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371b0c *)
and %v17@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371b10 *)
split %v16 %dc %v16 30;
(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371b14 *)
shls %dc %v17 %v17 [32, 32];
(* orr	v5.16b, v5.16b, v17.16b                     #! PC = 0xaaaabe371b18 *)
or %v5@uint64[2] %v5 %v17;
(* smlal	v16.2d, v14.2s, v6.s[1]                   #! PC = 0xaaaabe371b1c *)
smlal	%%v16.2d, %%v14.2s, %%v6.s[1]                   #! 0xaaaabe371b1c = 0xaaaabe371b1c;
(* smlal2	v16.2d, v14.4s, v6.s[3]                  #! PC = 0xaaaabe371b20 *)
smlal2	%%v16.2d, %%v14.4s, %%v6.s[3]                  #! 0xaaaabe371b20 = 0xaaaabe371b20;
(* smlal	v16.2d, v13.2s, v7.s[0]                   #! PC = 0xaaaabe371b24 *)
smlal	%%v16.2d, %%v13.2s, %%v7.s[0]                   #! 0xaaaabe371b24 = 0xaaaabe371b24;
(* smlal2	v16.2d, v13.4s, v7.s[2]                  #! PC = 0xaaaabe371b28 *)
smlal2	%%v16.2d, %%v13.4s, %%v7.s[2]                  #! 0xaaaabe371b28 = 0xaaaabe371b28;
(* and	v6.16b, v16.16b, v1.16b                     #! PC = 0xaaaabe371b2c *)
and %v6@uint64[2] %v16 %v1;
(* sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaabe371b30 *)
split %v16 %dc %v16 30;
(* smlal	v16.2d, v14.2s, v7.s[0]                   #! PC = 0xaaaabe371b34 *)
smlal	%%v16.2d, %%v14.2s, %%v7.s[0]                   #! 0xaaaabe371b34 = 0xaaaabe371b34;
(* smlal2	v16.2d, v14.4s, v7.s[2]                  #! PC = 0xaaaabe371b38 *)
smlal2	%%v16.2d, %%v14.4s, %%v7.s[2]                  #! 0xaaaabe371b38 = 0xaaaabe371b38;
(* and	v17.16b, v16.16b, v1.16b                    #! PC = 0xaaaabe371b3c *)
and %v17@uint64[2] %v16 %v1;
(* sshr	v7.2d, v16.2d, #30                         #! PC = 0xaaaabe371b40 *)
split %v7 %dc %v16 30;
(* shl	v17.2d, v17.2d, #32                         #! PC = 0xaaaabe371b44 *)
shls %dc %v17 %v17 [32, 32];
(* orr	v6.16b, v6.16b, v17.16b                     #! PC = 0xaaaabe371b48 *)
or %v6@uint64[2] %v6 %v17;

