proc main () =
{
  true
  &&
  true
}

(* mov	x9, #0x13                  	// #19          #! PC = 0xaaaabe3721fc *)
mov x9 0x13@uint64;
(* dup	v16.2d, x9                                  #! PC = 0xaaaabe372200 *)
mov %v16 [x9,x9];
(* smull	v17.2d, v13.2s, v8.s[0]                   #! PC = 0xaaaabe372204 *)
broadcast %tmp1@int32[2] 2 [%v8[0]];
mov %tmp2@int32[2] [%v13[0], %v13[1]];
smulj %v17@int64[2] %tmp1 %tmp2;
(* smlal2	v17.2d, v13.4s, v8.s[2]                  #! PC = 0xaaaabe372208 *)
broadcast %tmp1@int32[2] 2 [%v8[2]];
mov %tmp2@int32[2] [%v13[2], %v13[3]];
smulj %tmp3@int64[2] %tmp1 %tmp2;
adds %dc %v17@int64[2] %v17 %tmp3;
(* mul	v19.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe37220c *)
mul %v19 %v17 %v15;
(* and	v19.16b, v19.16b, v1.16b                    #! PC = 0xaaaabe372210 *)
and %v19@sint64[2] %v19 %v1;
(* uzp1	v19.4s, v19.4s, v19.4s                     #! PC = 0xaaaabe372214 *)
mov %v19 [%v19[0], %v19[2], %v19[0], %v19[2]];
(* smlsl	v17.2d, v19.2s, v16.s[0]                  #! PC = 0xaaaabe372218 *)
smlsl	%%v17.2d, %%v19.2s, %%v16.s[0]                  #! 0xaaaabe372218 = 0xaaaabe372218;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37221c *)
split %v17 %dc %v17 30;
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
(* mul	v20.4s, v17.4s, v15.4s                      #! PC = 0xaaaabe372230 *)
mul %v20 %v17 %v15;
(* and	v20.16b, v20.16b, v1.16b                    #! PC = 0xaaaabe372234 *)
and %v20@sint64[2] %v20 %v1;
(* uzp1	v20.4s, v20.4s, v20.4s                     #! PC = 0xaaaabe372238 *)
mov %v20 [%v20[0], %v20[2], %v20[0], %v20[2]];
(* smlsl	v17.2d, v20.2s, v16.s[0]                  #! PC = 0xaaaabe37223c *)
smlsl	%%v17.2d, %%v20.2s, %%v16.s[0]                  #! 0xaaaabe37223c = 0xaaaabe37223c;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372240 *)
split %v17 %dc %v17 30;
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
(* and	v8.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe372254 *)
and %v8@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372258 *)
split %v17 %dc %v17 30;
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
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe37226c *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe372270 *)
split %v17 %dc %v17 30;
(* sli	v8.2d, v18.2d, #32                          #! PC = 0xaaaabe372274 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v8 %v8 32; or %v8@uint64[2] %slih %v8;
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
(* and	v9.16b, v17.16b, v1.16b                     #! PC = 0xaaaabe372288 *)
and %v9@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe37228c *)
split %v17 %dc %v17 30;
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
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722a0 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722a4 *)
split %v17 %dc %v17 30;
(* sli	v9.2d, v18.2d, #32                          #! PC = 0xaaaabe3722a8 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v9 %v9 32; or %v9@uint64[2] %slih %v9;
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
(* and	v10.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722bc *)
and %v10@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722c0 *)
split %v17 %dc %v17 30;
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
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722d4 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722d8 *)
split %v17 %dc %v17 30;
(* sli	v10.2d, v18.2d, #32                         #! PC = 0xaaaabe3722dc *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v10 %v10 32; or %v10@uint64[2] %slih %v10;
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
(* ushll	v19.2d, v19.2s, #15                       #! PC = 0xaaaabe3722f0 *)
ushll	%%v19.2d, %%v19.2s, #15                       #! 0xaaaabe3722f0 = 0xaaaabe3722f0;
(* add	v17.2d, v17.2d, v19.2d                      #! PC = 0xaaaabe3722f4 *)
add	%%v17.2d, %%v17.2d, %%v19.2d                      #! 0xaaaabe3722f4 = 0xaaaabe3722f4;
(* and	v11.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe3722f8 *)
and %v11@sint64[2] %v17 %v1;
(* sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaabe3722fc *)
split %v17 %dc %v17 30;
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
(* ushll	v20.2d, v20.2s, #15                       #! PC = 0xaaaabe372308 *)
ushll	%%v20.2d, %%v20.2s, #15                       #! 0xaaaabe372308 = 0xaaaabe372308;
(* add	v17.2d, v17.2d, v20.2d                      #! PC = 0xaaaabe37230c *)
add	%%v17.2d, %%v17.2d, %%v20.2d                      #! 0xaaaabe37230c = 0xaaaabe37230c;
(* and	v18.16b, v17.16b, v1.16b                    #! PC = 0xaaaabe372310 *)
and %v18@sint64[2] %v17 %v1;
(* sshr	v12.2d, v17.2d, #30                        #! PC = 0xaaaabe372314 *)
split %v12 %dc %v17 30;
(* sli	v11.2d, v18.2d, #32                         #! PC = 0xaaaabe372318 *)
split %dc %slil %v18 (64-32); shl %slih %v18 [32@uint64, 32@uint64];
split %dc %v11 %v11 32; or %v11@uint64[2] %slih %v11;
(* sshr	v18.2d, v12.2d, #15                        #! PC = 0xaaaabe37231c *)
split %v18 %dc %v12 15;
(* shl	v17.2d, v18.2d, #15                         #! PC = 0xaaaabe372320 *)
mov [tmp1, tmp2] %v18;
shl tmp1 tmp1 32;
shl tmp2 tmp2 32;
mov %v17 [tmp1, tmp2];
(* sub	v12.2d, v12.2d, v17.2d                      #! PC = 0xaaaabe372324 *)
sub	%%v12.2d, %%v12.2d, %%v17.2d                      #! 0xaaaabe372324 = 0xaaaabe372324;
(* mla	v8.4s, v18.4s, v16.4s                       #! PC = 0xaaaabe372328 *)
mull %dc %mla %v18 %v16; add %v8 %v8 %mla;

