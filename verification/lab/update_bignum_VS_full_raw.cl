proc main (%tmp1, %v1, %v13, %v14, %v15, tmp1, tmp2, x9) =
{
  true
  &&
  true
}

(* mov	x9, #0x13                  	// #19          #! PC = 0xaaaabe372698 *)
mov x9 0x13@uint64;
(* dup	v16.2d, x9                                  #! PC = 0xaaaabe37269c *)
mov %v16 [x9,x9];
(* smull	v17.2d, v13.2s, v8.s[0]                   #! PC = 0xaaaabe3726a0 *)
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v17@int64[2] %tmp1 %tmp2;
(* smlal2	v17.2d, v13.4s, v8.s[2]                  #! PC = 0xaaaabe3726a4 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* mul	v19.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe3726a8 *)
mul %v19 %v17 %v15;
(* and	v19.16b, v19.16b, v1.16b                    #! PC = 0xaaaabe3726ac *)
and %v19@sint64[2] %v19 %v1;
(* uzp1	v19.4s, v19.4s, v19.4s                     #! PC = 0xaaaabe3726b0 *)
mov %v19 [%v19[0], %v19[2], %v19[0], %v19[2]];
(* smlsl	v17.2d, v19.2s, v16.s[0]                  #! PC = 0xaaaabe3726b4 *)
smlsl	%%v17.2d, %%v19.2s, %%v16.s[0]                  #! 0xaaaabe3726b4 = 0xaaaabe3726b4;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3726b8 *)
split %v17 %dc %v17 30;
(* smlal	v17.2d, v14.2s, v8.s[0]                   #! PC = 0xaaaabe3726bc *)
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v8.s[2]                  #! PC = 0xaaaabe3726c0 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v8.s[1]                   #! PC = 0xaaaabe3726c4 *)
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v8.s[3]                  #! PC = 0xaaaabe3726c8 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* mul	v20.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe3726cc *)
mul %v20 %v17 %v15;
(* and	v20.16b, v20.16b, v1.16b                    #! PC = 0xaaaabe3726d0 *)
and %v20@sint64[2] %v20 %v1;
(* uzp1	v20.4s, v20.4s, v20.4s                     #! PC = 0xaaaabe3726d4 *)
mov %v20 [%v20[0], %v20[2], %v20[0], %v20[2]];
(* smlsl	v17.2d, v20.2s, v16.s[0]                  #! PC = 0xaaaabe3726d8 *)
smlsl	%%v17.2d, %%v20.2s, %%v16.s[0]                  #! 0xaaaabe3726d8 = 0xaaaabe3726d8;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3726dc *)
split %v17 %dc %v17 30;
(* smlal	v17.2d, v14.2s, v8.s[1]                   #! PC = 0xaaaabe3726e0 *)
broadcast %tmp1@int32[2] 2 [%v8[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v8.s[3]                  #! PC = 0xaaaabe3726e4 *)
broadcast %tmp1@int32[2] 2 [%v8[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v9.s[0]                   #! PC = 0xaaaabe3726e8 *)
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v9.s[2]                  #! PC = 0xaaaabe3726ec *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* and	v8.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe3726f0 *)
and %v8@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3726f4 *)
split %v17 %dc %v17 30;
(* smlal	v17.2d, v14.2s, v9.s[0]                   #! PC = 0xaaaabe3726f8 *)
broadcast %tmp1@int32[2] 2 [%v9[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v9.s[2]                  #! PC = 0xaaaabe3726fc *)
broadcast %tmp1@int32[2] 2 [%v9[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v9.s[1]                   #! PC = 0xaaaabe372700 *)
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v9.s[3]                  #! PC = 0xaaaabe372704 *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372708 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37270c *)
split %v17 %dc %v17 30;
(* sli	v8.2d, v18.2d, #32                          #! PC = 0xaaaabe372710 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v8 %v8 32; or %v8@uint64[2] %slih %v8;
(* smlal	v17.2d, v14.2s, v9.s[1]                   #! PC = 0xaaaabe372714 *)
broadcast %tmp1@int32[2] 2 [%v9[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v9.s[3]                  #! PC = 0xaaaabe372718 *)
broadcast %tmp1@int32[2] 2 [%v9[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v10.s[0]                  #! PC = 0xaaaabe37271c *)
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v10.s[2]                 #! PC = 0xaaaabe372720 *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* and	v9.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe372724 *)
and %v9@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372728 *)
split %v17 %dc %v17 30;
(* smlal	v17.2d, v14.2s, v10.s[0]                  #! PC = 0xaaaabe37272c *)
broadcast %tmp1@int32[2] 2 [%v10[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v10.s[2]                 #! PC = 0xaaaabe372730 *)
broadcast %tmp1@int32[2] 2 [%v10[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v10.s[1]                  #! PC = 0xaaaabe372734 *)
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v10.s[3]                 #! PC = 0xaaaabe372738 *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe37273c *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372740 *)
split %v17 %dc %v17 30;
(* sli	v9.2d, v18.2d, #32                          #! PC = 0xaaaabe372744 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v9 %v9 32; or %v9@uint64[2] %slih %v9;
(* smlal	v17.2d, v14.2s, v10.s[1]                  #! PC = 0xaaaabe372748 *)
broadcast %tmp1@int32[2] 2 [%v10[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v10.s[3]                 #! PC = 0xaaaabe37274c *)
broadcast %tmp1@int32[2] 2 [%v10[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v11.s[0]                  #! PC = 0xaaaabe372750 *)
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v11.s[2]                 #! PC = 0xaaaabe372754 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* and	v10.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372758 *)
and %v10@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37275c *)
split %v17 %dc %v17 30;
(* smlal	v17.2d, v14.2s, v11.s[0]                  #! PC = 0xaaaabe372760 *)
broadcast %tmp1@int32[2] 2 [%v11[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v11.s[2]                 #! PC = 0xaaaabe372764 *)
broadcast %tmp1@int32[2] 2 [%v11[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v11.s[1]                  #! PC = 0xaaaabe372768 *)
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v11.s[3]                 #! PC = 0xaaaabe37276c *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372770 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372774 *)
split %v17 %dc %v17 30;
(* sli	v10.2d, v18.2d, #32                         #! PC = 0xaaaabe372778 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v10 %v10 32; or %v10@uint64[2] %slih %v10;
(* smlal	v17.2d, v14.2s, v11.s[1]                  #! PC = 0xaaaabe37277c *)
broadcast %tmp1@int32[2] 2 [%v11[1]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v11.s[3]                 #! PC = 0xaaaabe372780 *)
broadcast %tmp1@int32[2] 2 [%v11[3]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal	v17.2d, v13.2s, v12.s[0]                  #! PC = 0xaaaabe372784 *)
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v13.4s, v12.s[2]                 #! PC = 0xaaaabe372788 *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* ushll	v19.2d, v19.2s, #15                       #! PC = 0xaaaabe37278c *)
ushll	%%v19.2d, %%v19.2s, #15                       #! 0xaaaabe37278c = 0xaaaabe37278c;
(* add	v17.2d, v17.2d, v19.2d                      #! PC = 0xaaaabe372790 *)
add	%%v17.2d, %%v17.2d, %%v19.2d                      #! 0xaaaabe372790 = 0xaaaabe372790;
(* and	v11.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372794 *)
and %v11@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372798 *)
split %v17 %dc %v17 30;
(* smlal	v17.2d, v14.2s, v12.s[0]                  #! PC = 0xaaaabe37279c *)
broadcast %tmp1@int32[2] 2 [%v12[0]];
mov %tmp2@int32[2] [%v14[0], %v14[1]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* smlal2	v17.2d, v14.4s, v12.s[2]                 #! PC = 0xaaaabe3727a0 *)
broadcast %tmp1@int32[2] 2 [%v12[2]];
mov %tmp2@int32[2] [%v14[2], %v14[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* ushll	v20.2d, v20.2s, #15                       #! PC = 0xaaaabe3727a4 *)
ushll	%%v20.2d, %%v20.2s, #15                       #! 0xaaaabe3727a4 = 0xaaaabe3727a4;
(* add	v17.2d, v17.2d, v20.2d                      #! PC = 0xaaaabe3727a8 *)
add	%%v17.2d, %%v17.2d, %%v20.2d                      #! 0xaaaabe3727a8 = 0xaaaabe3727a8;
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3727ac *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v12.2d, v17.2d, #30                        #! PC = 0xaaaabe3727b0 *)
split %v12 %dc %v17 30;
(* sli	v11.2d, v18.2d, #32                         #! PC = 0xaaaabe3727b4 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v11 %v11 32; or %v11@uint64[2] %slih %v11;
(* sshr	v18.2d, v12.2d, #15                        #! PC = 0xaaaabe3727b8 *)
split %v18 %dc %v12 15;
(* shl	v17.2d, v18.2d, #15                         #! PC = 0xaaaabe3727bc *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];
(* sub	v12.2d, v12.2d, v17.2d                      #! PC = 0xaaaabe3727c0 *)
sub	%%v12.2d, %%v12.2d, %%v17.2d                      #! 0xaaaabe3727c0 = 0xaaaabe3727c0;
(* mla	v8.4s, v18.4s, v16.4s                       #! PC = 0xaaaabe3727c4 *)
mull %dc %mla %v18 %v16; add %v8 %v8 %mla;
(* dup	v17.4s, v1.s[0]                             #! PC = 0xaaaabe3727c8 *)
dup	%%v17.4s, %%v1.s[0]                             #! 0xaaaabe3727c8 = 0xaaaabe3727c8;
(* mvn	v17.16b, v17.16b                            #! PC = 0xaaaabe3727cc *)
mvn	%%v17.16b, %%v17.16b                            #! 0xaaaabe3727cc = 0xaaaabe3727cc;
(* sshr	v18.4s, v8.4s, #30                         #! PC = 0xaaaabe3727d0 *)
split %v18 %dc %v8 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe3727d4 *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v8.4s, v8.4s, v18.4s                        #! PC = 0xaaaabe3727d8 *)
add %v8 %v8 %v18;
(* sshr	v18.2d, v8.2d, #30                         #! PC = 0xaaaabe3727dc *)
split %v18 %dc %v8 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe3727e0 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v9.4s, v9.4s, v18.4s                        #! PC = 0xaaaabe3727e4 *)
add %v9 %v9 %v18;
(* bic	v8.16b, v8.16b, v17.16b                     #! PC = 0xaaaabe3727e8 *)
bic	%%v8.16b, %%v8.16b, %%v17.16b                     #! 0xaaaabe3727e8 = 0xaaaabe3727e8;
(* sshr	v18.4s, v9.4s, #30                         #! PC = 0xaaaabe3727ec *)
split %v18 %dc %v9 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe3727f0 *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v9.4s, v9.4s, v18.4s                        #! PC = 0xaaaabe3727f4 *)
add %v9 %v9 %v18;
(* sshr	v18.2d, v9.2d, #30                         #! PC = 0xaaaabe3727f8 *)
split %v18 %dc %v9 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe3727fc *)
shrs %v18 %dc %v18 [32, 32];
(* add	v10.4s, v10.4s, v18.4s                      #! PC = 0xaaaabe372800 *)
add %v10 %v10 %v18;
(* bic	v9.16b, v9.16b, v17.16b                     #! PC = 0xaaaabe372804 *)
bic	%%v9.16b, %%v9.16b, %%v17.16b                     #! 0xaaaabe372804 = 0xaaaabe372804;
(* sshr	v18.4s, v10.4s, #30                        #! PC = 0xaaaabe372808 *)
split %v18 %dc %v10 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe37280c *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v10.4s, v10.4s, v18.4s                      #! PC = 0xaaaabe372810 *)
add %v10 %v10 %v18;
(* sshr	v18.2d, v10.2d, #30                        #! PC = 0xaaaabe372814 *)
split %v18 %dc %v10 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe372818 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v11.4s, v11.4s, v18.4s                      #! PC = 0xaaaabe37281c *)
add %v11 %v11 %v18;
(* bic	v10.16b, v10.16b, v17.16b                   #! PC = 0xaaaabe372820 *)
bic	%%v10.16b, %%v10.16b, %%v17.16b                   #! 0xaaaabe372820 = 0xaaaabe372820;
(* sshr	v18.4s, v11.4s, #30                        #! PC = 0xaaaabe372824 *)
split %v18 %dc %v11 30;
(* shl	v18.2d, v18.2d, #32                         #! PC = 0xaaaabe372828 *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v18 [tmp1, tmp2];
(* add	v11.4s, v11.4s, v18.4s                      #! PC = 0xaaaabe37282c *)
add %v11 %v11 %v18;
(* sshr	v18.2d, v11.2d, #30                        #! PC = 0xaaaabe372830 *)
split %v18 %dc %v11 30;
(* ushr	v18.2d, v18.2d, #32                        #! PC = 0xaaaabe372834 *)
shrs %v18 %dc %v18 [32, 32];
(* add	v12.4s, v12.4s, v18.4s                      #! PC = 0xaaaabe372838 *)
add %v12 %v12 %v18;
(* bic	v11.16b, v11.16b, v17.16b                   #! PC = 0xaaaabe37283c *)
bic	%%v11.16b, %%v11.16b, %%v17.16b                   #! 0xaaaabe37283c = 0xaaaabe37283c;

