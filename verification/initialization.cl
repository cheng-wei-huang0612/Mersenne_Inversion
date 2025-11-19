proc main (
uint64 op_x0,
uint64 op_x1,
uint64 op_x2,
uint64 op_x3
) =
{
  true
  &&
  true
}
mov L0xfffff0a5bc88 op_x0;
mov L0xfffff0a5bc90 op_x1;
mov L0xfffff0a5bc98 op_x2;
mov L0xfffff0a5bca0 op_x3;

(* ldp	q5, q6, [x1]                                #! EA = L0xfffff0a5bc88; Value = 0x0000000000000000; PC = 0xaaaaca660eb4 *)
mov v5_uint64_0 L0xfffff0a5bc88;
mov v5_uint64_1 L0xfffff0a5bc90;
mov v6_uint64_0 L0xfffff0a5bc98;
mov v6_uint64_1 L0xfffff0a5bca0;

(* movi	v4.2d, #0xffffffffffffffff                 #! PC = 0xaaaaca660eb8 *)
mov v4_uint64_0 0xffffffffffffffff@uint64;
mov v4_uint64_1 0xffffffffffffffff@uint64;

(* mov	x2, #0xffffffffffffffff    	// #-1          #! PC = 0xaaaaca660ebc *)
mov x2 0xffffffffffffffff@uint64;

(* lsr	x2, x2, #1                                  #! PC = 0xaaaaca660ec0 *)
split x2 dcL x2 1;

(* mov	v3.d[1], x2                                 #! PC = 0xaaaaca660ec4 *)
mov v3_uint64_1 x2;

(* mov	x2, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaca660ec8 *)
mov x2 0xffffffffffffffed@uint64;

(* mov	v3.d[0], x2                                 #! PC = 0xaaaaca660ecc *)
mov v3_uint64_0 x2;

(* zip1	v8.2d, v3.2d, v5.2d                        #! PC = 0xaaaaca660ed0 *)
mov v8_uint64_0 v3_uint64_0;
mov v8_uint64_1 v5_uint64_0;

(* zip2	v9.2d, v4.2d, v5.2d                        #! PC = 0xaaaaca660ed4 *)
mov v9_uint64_0 v4_uint64_1;
mov v9_uint64_1 v5_uint64_1;

(* zip1	v10.2d, v4.2d, v6.2d                       #! PC = 0xaaaaca660ed8 *)
mov v10_uint64_0 v4_uint64_0;
mov v10_uint64_1 v6_uint64_0;

(* zip2	v11.2d, v3.2d, v6.2d                       #! PC = 0xaaaaca660edc *)
mov v11_uint64_0 v3_uint64_1;
mov v11_uint64_1 v6_uint64_1;

(* ushr	v1.2d, v4.2d, #34                          #! PC = 0xaaaaca660ee0 *)
shrs v1_uint64_0 dc v4_uint64_0 34;
shrs v1_uint64_1 dc v4_uint64_1 34;

(* and	v3.16b, v8.16b, v1.16b                      #! PC = 0xaaaaca660ee4 *)
assert true &&
    v1_uint64_0 = (const 64 (2**30 - 1)),
    v1_uint64_1 = (const 64 (2**30 - 1));
split dc v3_uint64_0 v8_uint64_0 30;
split dc v3_uint64_1 v8_uint64_1 30;

(* ushr	v12.2d, v8.2d, #30                         #! PC = 0xaaaaca660ee8 *)
shrs v12_uint64_0 dc v8_uint64_0 30;
shrs v12_uint64_1 dc v8_uint64_1 30;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660eec *)
assert true &&
    v1_uint64_0 = (const 64 (2**30 - 1)),
    v1_uint64_1 = (const 64 (2**30 - 1));
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* sli	v3.2d, v12.2d, #32                          #! PC = 0xaaaaca660ef0 *)
cast v3_sint32_0@sint32 v3_uint64_0;
cast v3_sint32_2@sint32 v3_uint64_1;
cast v3_sint32_1@sint32 v12_uint64_0;
cast v3_sint32_3@sint32 v12_uint64_1;

assert true &&
    (const 32 0) <=s v3_sint32_0, v3_sint32_0 <=s (const 32 ((2**30) - 1)),
    (const 32 0) <=s v3_sint32_1, v3_sint32_1 <=s (const 32 ((2**30) - 1)),
    (const 32 0) <=s v3_sint32_2, v3_sint32_2 <=s (const 32 ((2**30) - 1)),
    (const 32 0) <=s v3_sint32_3, v3_sint32_3 <=s (const 32 ((2**30) - 1));

(* ushr	v4.2d, v8.2d, #60                          #! PC = 0xaaaaca660ef4 *)
shrs v4_uint64_0 dc v8_uint64_0 60;
shrs v4_uint64_1 dc v8_uint64_1 60;

(* shl	v12.2d, v9.2d, #4                           #! PC = 0xaaaaca660ef8 *)
shls dc v12_uint64_0 v9_uint64_0 4;
shls dc v12_uint64_1 v9_uint64_1 4;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660efc *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* orr	v4.16b, v4.16b, v12.16b                     #! PC = 0xaaaaca660f00 *)
or v4_uint64_0@uint64 v4_uint64_0 v12_uint64_0;
or v4_uint64_1@uint64 v4_uint64_1 v12_uint64_1;

(* ushr	v12.2d, v9.2d, #26                         #! PC = 0xaaaaca660f04 *)
shrs v12_uint64_0 dc v9_uint64_0 26;
shrs v12_uint64_1 dc v9_uint64_1 26;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f08 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* sli	v4.2d, v12.2d, #32                          #! PC = 0xaaaaca660f0c *)
cast v4_sint32_0@sint32 v4_uint64_0;
cast v4_sint32_2@sint32 v4_uint64_1;
cast v4_sint32_1@sint32 v12_uint64_0;
cast v4_sint32_3@sint32 v12_uint64_1;

(* ushr	v5.2d, v9.2d, #56                          #! PC = 0xaaaaca660f10 *)
shrs v5_uint64_0 dc v9_uint64_0 56;
shrs v5_uint64_1 dc v9_uint64_1 56;

(* shl	v12.2d, v10.2d, #8                          #! PC = 0xaaaaca660f14 *)
shls dc v12_uint64_0 v10_uint64_0 8;
shls dc v12_uint64_1 v10_uint64_1 8;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f18 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* orr	v5.16b, v5.16b, v12.16b                     #! PC = 0xaaaaca660f1c *)
or v5_uint64_0@uint64 v5_uint64_0 v12_uint64_0;
or v5_uint64_1@uint64 v5_uint64_1 v12_uint64_1;

(* ushr	v12.2d, v10.2d, #22                        #! PC = 0xaaaaca660f20 *)
shrs v12_uint64_0 dc v10_uint64_0 22;
shrs v12_uint64_1 dc v10_uint64_1 22;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f24 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* sli	v5.2d, v12.2d, #32                          #! PC = 0xaaaaca660f28 *)
cast v5_sint32_0@sint32 v5_uint64_0;
cast v5_sint32_2@sint32 v5_uint64_1;
cast v5_sint32_1@sint32 v12_uint64_0;
cast v5_sint32_3@sint32 v12_uint64_1;

(* ushr	v6.2d, v10.2d, #52                         #! PC = 0xaaaaca660f2c *)
shrs v6_uint64_0 dc v10_uint64_0 52;
shrs v6_uint64_1 dc v10_uint64_1 52;

(* shl	v12.2d, v11.2d, #12                         #! PC = 0xaaaaca660f30 *)
shls dc v12_uint64_0 v11_uint64_0 12;
shls dc v12_uint64_1 v11_uint64_1 12;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f34 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* orr	v6.16b, v6.16b, v12.16b                     #! PC = 0xaaaaca660f38 *)
or v6_uint64_0@uint64 v6_uint64_0 v12_uint64_0;
or v6_uint64_1@uint64 v6_uint64_1 v12_uint64_1;

(* ushr	v12.2d, v11.2d, #18                        #! PC = 0xaaaaca660f3c *)
shrs v12_uint64_0 dc v11_uint64_0 18;
shrs v12_uint64_1 dc v11_uint64_1 18;

(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f40 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;

(* sli	v6.2d, v12.2d, #32                          #! PC = 0xaaaaca660f44 *)
cast v6_sint32_0@sint32 v6_uint64_0;
cast v6_sint32_2@sint32 v6_uint64_1;
cast v6_sint32_1@sint32 v12_uint64_0;
cast v6_sint32_3@sint32 v12_uint64_1;

(* ushr	v7.2d, v11.2d, #48                         #! PC = 0xaaaaca660f48 *)
shrs v7_uint64_0 dc v11_uint64_0 48;
shrs v7_uint64_1 dc v11_uint64_1 48;

spl v7_sint32_1 v7_sint32_0 v7_uint64_0 32;
spl v7_sint32_3 v7_sint32_2 v7_uint64_1 32;

(* movi	v8.2d, #0x0                                #! PC = 0xaaaaca660f4c *)
mov v8_sint32_0 0@sint32;
mov v8_sint32_1 0@sint32;
mov v8_sint32_2 0@sint32;
mov v8_sint32_3 0@sint32;

(* mov	x2, #0x1                   	// #1           #! PC = 0xaaaaca660f50 *)
mov x2 0x1@uint64;

(* mov	v8.d[1], x2                                 #! PC = 0xaaaaca660f54 *)
cast v8_sint32_2@sint32 x2;

(* movi	v9.2d, #0x0                                #! PC = 0xaaaaca660f58 *)
mov v9_sint32_0 0@sint32;
mov v9_sint32_1 0@sint32;
mov v9_sint32_2 0@sint32;
mov v9_sint32_3 0@sint32;

(* movi	v10.2d, #0x0                               #! PC = 0xaaaaca660f5c *)
mov v10_sint32_0 0@sint32;
mov v10_sint32_1 0@sint32;
mov v10_sint32_2 0@sint32;
mov v10_sint32_3 0@sint32;

(* movi	v11.2d, #0x0                               #! PC = 0xaaaaca660f60 *)
mov v11_sint32_0 0@sint32;
mov v11_sint32_1 0@sint32;
mov v11_sint32_2 0@sint32;
mov v11_sint32_3 0@sint32;

(* movi	v12.2d, #0x0                               #! PC = 0xaaaaca660f64 *)
mov v12_sint32_0 0@sint32;
mov v12_sint32_1 0@sint32;
mov v12_sint32_2 0@sint32;
mov v12_sint32_3 0@sint32;

(* uzp1	v2.4s, v1.4s, v1.4s                        #! PC = 0xaaaaca660f68 *)
spl v1_uint32_1 v1_uint32_0 v1_uint64_0 32;
spl v1_uint32_3 v1_uint32_2 v1_uint64_1 32;
// uzp1 takes even elements: 0, 2
mov v2_uint32_0 v1_uint32_0;
mov v2_uint32_1 v1_uint32_2;
mov v2_uint32_2 v1_uint32_0;
mov v2_uint32_3 v1_uint32_2;

(* ldp	x5, x22, [x1]                               #! EA = L0xfffff0a5bc88; Value = 0x0000000000000000; PC = 0xaaaaca660f6c *)
mov x5 L0xfffff0a5bc88; mov x22 L0xfffff0a5bc90;

(* mov	x4, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaca660f70 *)
mov x4 0xffffffffffffffed@uint64;

(* mov	x21, #0xffffffffffffffff    	// #-1         #! PC = 0xaaaaca660f74 *)
mov x21 0xffffffffffffffff@uint64;

(* mov	x1, x4                                      #! PC = 0xaaaaca660f78 *)
mov x1 x4;

(* mov	x2, x5                                      #! PC = 0xaaaaca660f7c *)
mov x2 x5;

(* mov	x3, #0x1                   	// #1           #! PC = 0xaaaaca660f80 *)
mov x3 0x1@uint64;

(* mov	x6, #0x20000000000         	// #2199023255552#! PC = 0xaaaaca660f84 *)
mov x6 0x20000000000@uint64;

(* add	x6, x6, #0x100, lsl #12                     #! PC = 0xaaaaca660f88 *)
add x6 x6 1048576@uint64;

(* mov	x7, #0x286b0000            	// #678100992   #! PC = 0xaaaaca660f8c *)
(* movk	x7, #0xca1b                                #! PC = 0xaaaaca660f90 *)
mov x7 0x286bca1b@uint64;

(* dup	v15.4s, w7                                  #! PC = 0xaaaaca660f94 *)
cast w7@sint32 x7;
mov v15_sint32_0 w7;
mov v15_sint32_1 w7;
mov v15_sint32_2 w7;
mov v15_sint32_3 w7;

mov F_0_limb30_0 v3_sint32_0;
mov F_0_limb30_1 v3_sint32_1;
mov G_0_limb30_0 v3_sint32_2;
mov G_0_limb30_1 v3_sint32_3;
mov F_0_limb30_2 v4_sint32_0;
mov F_0_limb30_3 v4_sint32_1;
mov G_0_limb30_2 v4_sint32_2;
mov G_0_limb30_3 v4_sint32_3;
mov F_0_limb30_4 v5_sint32_0;
mov F_0_limb30_5 v5_sint32_1;
mov G_0_limb30_4 v5_sint32_2;
mov G_0_limb30_5 v5_sint32_3;
mov F_0_limb30_6 v6_sint32_0;
mov F_0_limb30_7 v6_sint32_1;
mov G_0_limb30_6 v6_sint32_2;
mov G_0_limb30_7 v6_sint32_3;
mov F_0_limb30_8 v7_sint32_0;
mov G_0_limb30_8 v7_sint32_2;
mov V_0_limb30_0 v8_sint32_0;
mov V_0_limb30_1 v8_sint32_1;
mov S_0_limb30_0 v8_sint32_2;
mov S_0_limb30_1 v8_sint32_3;
mov V_0_limb30_2 v9_sint32_0;
mov V_0_limb30_3 v9_sint32_1;
mov S_0_limb30_2 v9_sint32_2;
mov S_0_limb30_3 v9_sint32_3;
mov V_0_limb30_4 v10_sint32_0;
mov V_0_limb30_5 v10_sint32_1;
mov S_0_limb30_4 v10_sint32_2;
mov S_0_limb30_5 v10_sint32_3;
mov V_0_limb30_6 v11_sint32_0;
mov V_0_limb30_7 v11_sint32_1;
mov S_0_limb30_6 v11_sint32_2;
mov S_0_limb30_7 v11_sint32_3;
mov V_0_limb30_8 v12_sint32_0;
mov S_0_limb30_8 v12_sint32_2;


mov f x1;
mov g x2;
mov f_low128_0 x4;
mov f_low128_1 x21;
mov g_low128_0 x5;
mov g_low128_1 x22;
mov delta x3;
mov const_2p41a2p20 x6;


cut
  true
  &&
    and [
    (const 32 0) <=s F_0_limb30_0, F_0_limb30_0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_1, F_0_limb30_1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_2, F_0_limb30_2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_3, F_0_limb30_3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_4, F_0_limb30_4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_5, F_0_limb30_5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_6, F_0_limb30_6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_7, F_0_limb30_7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F_0_limb30_8, F_0_limb30_8 <=s (const 32 ((2**15)-1)),

    (const 32 0) <=s G_0_limb30_0, G_0_limb30_0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_1, G_0_limb30_1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_2, G_0_limb30_2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_3, G_0_limb30_3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_4, G_0_limb30_4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_5, G_0_limb30_5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_6, G_0_limb30_6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_7, G_0_limb30_7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G_0_limb30_8, G_0_limb30_8 <=s (const 32 ((2**16)-1)),

    (const 32 0) <=s V_0_limb30_0, V_0_limb30_0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_1, V_0_limb30_1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_2, V_0_limb30_2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_3, V_0_limb30_3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_4, V_0_limb30_4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_5, V_0_limb30_5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_6, V_0_limb30_6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_7, V_0_limb30_7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s V_0_limb30_8, V_0_limb30_8 <=s (const 32 ((2**15)-1)),

    (const 32 0) <=s S_0_limb30_0, S_0_limb30_0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_1, S_0_limb30_1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_2, S_0_limb30_2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_3, S_0_limb30_3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_4, S_0_limb30_4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_5, S_0_limb30_5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_6, S_0_limb30_6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_7, S_0_limb30_7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s S_0_limb30_8, S_0_limb30_8 <=s (const 32 ((2**16)-1)),

    slimbs 30 [
        F_0_limb30_0, F_0_limb30_1, F_0_limb30_2, F_0_limb30_3,
        F_0_limb30_4, F_0_limb30_5, F_0_limb30_6, F_0_limb30_7,
        F_0_limb30_8
    ]
    =
    (const 272 (2**255 - 19))
    ,

    slimbs 30 [
        G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
        G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
        G_0_limb30_8
    ]
    =
    uext (limbs 64 [op_x0, op_x1, op_x2, op_x3]) 16
    ,
    slimbs 30 [
        V_0_limb30_0, V_0_limb30_1, V_0_limb30_2, V_0_limb30_3,
        V_0_limb30_4, V_0_limb30_5, V_0_limb30_6, V_0_limb30_7,
        V_0_limb30_8
    ]
    =
    (const 272 (0))
    ,

    slimbs 30 [
        S_0_limb30_0, S_0_limb30_1, S_0_limb30_2, S_0_limb30_3,
        S_0_limb30_4, S_0_limb30_5, S_0_limb30_6, S_0_limb30_7,
        S_0_limb30_8
    ]
    =
    (const 272 (1))
    ,


    (uext f 192) = 
    (const 256 ((2**255) - 19))
    (mod (const 256 (2**60)))
    ,

    (uext g 192) = 
    (limbs 64 [op_x0, op_x1, op_x2, op_x3])
    (mod (const 256 (2**60)))
    ,

    delta = (const 64 1)
    ,

    (uext (limbs 64 [f_low128_0, f_low128_1]) 128) =
    (const 256 ((2**255) - 19))
    (mod (const 256 (2**128)))
    ,

    (uext (limbs 64 [g_low128_0, g_low128_1]) 128) =
    (limbs 64 [op_x0, op_x1, op_x2, op_x3])
    (mod (const 256 (2**128)))
    ,

    const_2p41a2p20 = (const 64 (2**41 + 2**20))
    ]
;
