proc main (%v1, %v12, %v3, %v4, %v5, %v6, L0xffffc68e1808, L0xffffc68e1810, L0xffffc68e1818, L0xffffc68e1820, carry, tmp, x2, x6, x7) =
{
  true
  &&
  true
}

(* ldp	x5, x22, [x1]                               #! EA = L0xffffc68e1808; Value = 0x0000000000000000; PC = 0xaaaabe370eb4 *)
mov x5 L0xffffc68e1808; mov x22 L0xffffc68e1810;
(* ldp	x4, x21, [x1, #16]                          #! EA = L0xffffc68e1818; Value = 0x0000000000000000; PC = 0xaaaabe370eb8 *)
mov x4 L0xffffc68e1818; mov x21 L0xffffc68e1820;
(* mov	x2, #0x13                  	// #19          #! PC = 0xaaaabe370ebc *)
mov x2 0x13@uint64;
(* lsr	x3, x21, #63                                #! PC = 0xaaaabe370ec0 *)
split x3 dcL x21 63;
(* madd	x3, x2, x3, x2                             #! PC = 0xaaaabe370ec4 *)
mull dcH mul_tmp x2 x3;
adds dc x3 mul_tmp x2;
(* adds	x5, x5, x3                                 #! PC = 0xaaaabe370ec8 *)
adds carry x5 x5 x3;
(* adcs	x22, x22, xzr                              #! PC = 0xaaaabe370ecc *)
adcs carry x22 x22 0@uint64 carry;
(* adcs	x4, x4, xzr                                #! PC = 0xaaaabe370ed0 *)
adcs carry x4 x4 0@uint64 carry;
(* orr	x21, x21, #0x8000000000000000               #! PC = 0xaaaabe370ed4 *)
or x21@uint64 x21 0x8000000000000000@uint64;
(* adcs	x21, x21, xzr                              #! PC = 0xaaaabe370ed8 *)
adcs carry x21 x21 0@uint64 carry;
(* csel	x3, x2, xzr, cc	// cc = lo, ul, last       #! PC = 0xaaaabe370edc *)
cmov x3 carry 0@uint64 x2;
(* subs	x5, x5, x3                                 #! PC = 0xaaaabe370ee0 *)
subc carry x5 x5 x3;
(* sbcs	x22, x22, xzr                              #! PC = 0xaaaabe370ee4 *)
sbcs carry x22 x22 0@uint64 carry;
(* sbcs	x4, x4, xzr                                #! PC = 0xaaaabe370ee8 *)
sbcs carry x4 x4 0@uint64 carry;
(* sbc	x21, x21, xzr                               #! PC = 0xaaaabe370eec *)
sbc x21 x21 0@uint64 carry;
(* and	x21, x21, #0x7fffffffffffffff               #! PC = 0xaaaabe370ef0 *)
and x21@uint64 x21 0x7fffffffffffffff@uint64;
(* mov	v5.d[0], x5                                 #! PC = 0xaaaabe370ef4 *)
mov %v5 [x5, %v5[1]];
(* mov	v5.d[1], x22                                #! PC = 0xaaaabe370ef8 *)
mov %v5 [%v5[0], x22];
(* mov	v6.d[0], x4                                 #! PC = 0xaaaabe370efc *)
mov %v6 [x4, %v6[1]];
(* mov	v6.d[1], x21                                #! PC = 0xaaaabe370f00 *)
mov %v6 [%v6[0], x21];
(* movi	v4.2d, #0xffffffffffffffff                 #! PC = 0xaaaabe370f04 *)
broadcast %v4 2 [0xffffffffffffffff@uint64];
(* mov	x2, #0xffffffffffffffff    	// #-1          #! PC = 0xaaaabe370f08 *)
mov x2 0xffffffffffffffff@uint64;
(* lsr	x2, x2, #1                                  #! PC = 0xaaaabe370f0c *)
split x2 dcL x2 1;
(* mov	v3.d[1], x2                                 #! PC = 0xaaaabe370f10 *)
mov %v3 [%v3[0], x2];
(* mov	x2, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaabe370f14 *)
mov x2 0xffffffffffffffed@uint64;
(* mov	v3.d[0], x2                                 #! PC = 0xaaaabe370f18 *)
mov %v3 [x2, %v3[1]];
(* zip1	v8.2d, v3.2d, v5.2d                        #! PC = 0xaaaabe370f1c *)
mov %v8 [%v3[0], %v5[0]];
(* zip2	v9.2d, v4.2d, v5.2d                        #! PC = 0xaaaabe370f20 *)
mov %v9 [%v4[1], %v5[1]];
(* zip1	v10.2d, v4.2d, v6.2d                       #! PC = 0xaaaabe370f24 *)
mov %v10 [%v4[0], %v6[0]];
(* zip2	v11.2d, v3.2d, v6.2d                       #! PC = 0xaaaabe370f28 *)
mov %v11 [%v3[1], %v6[1]];
(* ushr	v1.2d, v4.2d, #34                          #! PC = 0xaaaabe370f2c *)
shrs %v1 %dc %v4 [34, 34];
(* and	v3.16b, v8.16b, v1.16b                      #! PC = 0xaaaabe370f30 *)
and %v3@uint64[2] %v8 %v1;
(* ushr	v12.2d, v8.2d, #30                         #! PC = 0xaaaabe370f34 *)
shrs %v12 %dc %v8 [30, 30];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f38 *)
and %v12@uint64[2] %v12 %v1;
(* sli	v3.2d, v12.2d, #32                          #! PC = 0xaaaabe370f3c *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v3 %v3 32; or %v3@uint64[2] %slih %v3;
(* ushr	v4.2d, v8.2d, #60                          #! PC = 0xaaaabe370f40 *)
shrs %v4 %dc %v8 [60, 60];
(* shl	v12.2d, v9.2d, #4                           #! PC = 0xaaaabe370f44 *)
shls %dc %v12 %v9 [4, 4];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f48 *)
and %v12@uint64[2] %v12 %v1;
(* orr	v4.16b, v4.16b, v12.16b                     #! PC = 0xaaaabe370f4c *)
or %v4@uint64[2] %v4 %v12;
(* ushr	v12.2d, v9.2d, #26                         #! PC = 0xaaaabe370f50 *)
shrs %v12 %dc %v9 [26, 26];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f54 *)
and %v12@uint64[2] %v12 %v1;
(* sli	v4.2d, v12.2d, #32                          #! PC = 0xaaaabe370f58 *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v4 %v4 32; or %v4@uint64[2] %slih %v4;
(* ushr	v5.2d, v9.2d, #56                          #! PC = 0xaaaabe370f5c *)
shrs %v5 %dc %v9 [56, 56];
(* shl	v12.2d, v10.2d, #8                          #! PC = 0xaaaabe370f60 *)
shls %dc %v12 %v10 [8, 8];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f64 *)
and %v12@uint64[2] %v12 %v1;
(* orr	v5.16b, v5.16b, v12.16b                     #! PC = 0xaaaabe370f68 *)
or %v5@uint64[2] %v5 %v12;
(* ushr	v12.2d, v10.2d, #22                        #! PC = 0xaaaabe370f6c *)
shrs %v12 %dc %v10 [22, 22];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f70 *)
and %v12@uint64[2] %v12 %v1;
(* sli	v5.2d, v12.2d, #32                          #! PC = 0xaaaabe370f74 *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v5 %v5 32; or %v5@uint64[2] %slih %v5;
(* ushr	v6.2d, v10.2d, #52                         #! PC = 0xaaaabe370f78 *)
shrs %v6 %dc %v10 [52, 52];
(* shl	v12.2d, v11.2d, #12                         #! PC = 0xaaaabe370f7c *)
shls %dc %v12 %v11 [12, 12];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f80 *)
and %v12@uint64[2] %v12 %v1;
(* orr	v6.16b, v6.16b, v12.16b                     #! PC = 0xaaaabe370f84 *)
or %v6@uint64[2] %v6 %v12;
(* ushr	v12.2d, v11.2d, #18                        #! PC = 0xaaaabe370f88 *)
shrs %v12 %dc %v11 [18, 18];
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaabe370f8c *)
and %v12@uint64[2] %v12 %v1;
(* sli	v6.2d, v12.2d, #32                          #! PC = 0xaaaabe370f90 *)
split %dc %slil %v12 (64-32); shl %slih %v12 [32@uint64, 32@uint64];
split %dc %v6 %v6 32; or %v6@uint64[2] %slih %v6;
(* ushr	v7.2d, v11.2d, #48                         #! PC = 0xaaaabe370f94 *)
shrs %v7 %dc %v11 [48, 48];
(* movi	v8.2d, #0x0                                #! PC = 0xaaaabe370f98 *)
broadcast %v8 2 [0x0@uint64];
(* mov	x2, #0x1                   	// #1           #! PC = 0xaaaabe370f9c *)
mov x2 0x1@uint64;
(* mov	v8.d[1], x2                                 #! PC = 0xaaaabe370fa0 *)
mov %v8 [%v8[0], x2];
(* movi	v9.2d, #0x0                                #! PC = 0xaaaabe370fa4 *)
broadcast %v9 2 [0x0@uint64];
(* movi	v10.2d, #0x0                               #! PC = 0xaaaabe370fa8 *)
broadcast %v10 2 [0x0@uint64];
(* movi	v11.2d, #0x0                               #! PC = 0xaaaabe370fac *)
broadcast %v11 2 [0x0@uint64];
(* movi	v12.2d, #0x0                               #! PC = 0xaaaabe370fb0 *)
broadcast %v12 2 [0x0@uint64];
(* uzp1	v2.4s, v1.4s, v1.4s                        #! PC = 0xaaaabe370fb4 *)
mov %v2 [%v1[0], %v1[2], %v1[0], %v1[2]];
(* mov	x4, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaabe370fb8 *)
mov x4 0xffffffffffffffed@uint64;
(* mov	x21, #0xffffffffffffffff    	// #-1         #! PC = 0xaaaabe370fbc *)
mov x21 0xffffffffffffffff@uint64;
(* mov	x1, x4                                      #! PC = 0xaaaabe370fc0 *)
mov x1 x4;
(* mov	x2, x5                                      #! PC = 0xaaaabe370fc4 *)
mov x2 x5;
(* mov	x3, #0x1                   	// #1           #! PC = 0xaaaabe370fc8 *)
mov x3 0x1@uint64;
(* mov	x6, #0x20000000000         	// #2199023255552#! PC = 0xaaaabe370fcc *)
mov x6 0x20000000000@uint64;
(* add	x6, x6, #0x100, lsl #12                     #! PC = 0xaaaabe370fd0 *)
split dcH tmp 0x100@uint64 52; shl tmp tmp 12; adds carry x6 x6 tmp;
(* mov	x7, #0x286b0000            	// #678100992   #! PC = 0xaaaabe370fd4 *)
mov x7 0x286b0000@uint64;
(* movk	x7, #0xca1b                                #! PC = 0xaaaabe370fd8 *)
movk	%%x7, #0xca1b                                #! 0xaaaabe370fd8 = 0xaaaabe370fd8;
(* dup	v15.4s, w7                                  #! PC = 0xaaaabe370fdc *)
cast w7@sint32 x7;
mov %v15 [w7,w7,w7,w7];

