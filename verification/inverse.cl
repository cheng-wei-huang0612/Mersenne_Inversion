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
mov x3 0x1@sint64;

(* mov	x6, #0x20000000000         	// #2199023255552#! PC = 0xaaaaca660f84 *)
mov x6 0x20000000000@sint64;

(* add	x6, x6, #0x100, lsl #12                     #! PC = 0xaaaaca660f88 *)
add x6 x6 1048576@sint64;

(* mov	x7, #0x286b0000            	// #678100992   #! PC = 0xaaaaca660f8c *)
(* movk	x7, #0xca1b                                #! PC = 0xaaaaca660f90 *)
mov x7 0x286bca1b@sint64;

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
    (const 32 0) <=s S_0_limb30_8, S_0_limb30_8 <=s (const 32 ((2**15)-1)),

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
        (const 32 0) <=s V_0_limb30_8, V_0_limb30_8 <=s (const 32 ((2**16)-1)),
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


// init_fuv_grs
mov x1 f;
mov x2 g;

(* and	x7, x1, #0xfffff                            #! PC = 0xaaaaca660f98 *)
and x7@sint64 x1 0xfffff@uint64;

(* and	x8, x2, #0xfffff                            #! PC = 0xaaaaca660f9c *)
and x8@sint64 x2 0xfffff@uint64;

(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaaca660fa0 *)
or x7@sint64 x7 0xfffffe0000000000@uint64;

(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaaca660fa4 *)
or x8@sint64 x8 0xc000000000000000@uint64;

mov fuv x7;
mov grs x8;
and f_0_low60_0_low20_0@sint64 f (2**20 - 1)@sint64;
and g_0_low60_0_low20_0@sint64 g (2**20 - 1)@sint64;
mov u_0_20 (-(2**20))@sint64;
mov v_0_20 ( 0)@sint64;
mov r_0_20 ( 0)@sint64;
mov s_0_20 (-(2**20))@sint64;

cut
u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20)),
r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))
&&
fuv = f_0_low60_0_low20_0 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
grs = g_0_low60_0_low20_0 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_0,
f_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_0,
g_0_low60_0_low20_0 <=s (const 64 ((2**20)-1)),
fuv = (const 64 1) (mod (const 64 2)),
delta = (const 64 1),
u_0_20 = (const 64 (-(2**20))),
v_0_20 = (const 64 (0)),
r_0_20 = (const 64 (0)),
s_0_20 = (const 64 (-(2**20))),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;

// divsteps
// step0

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* tst	x8, #0x1                                    #! PC = 0xaaaaca660fa8 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fac *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fb0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fb4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fb8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fbc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fc0 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca660fc4 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca660fc8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca660fcc *)
split x8 dc x8 1;

assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step1

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660fd0 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660fd4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660fd8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca660fdc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca660fe0 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca660fe4 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca660fe8 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca660fec *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca660ff0 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step2

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca660ff4 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca660ff8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca660ffc *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661000 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661004 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661008 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66100c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661010 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661014 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step3

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661018 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca66101c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661020 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661024 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661028 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca66102c *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661030 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661034 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661038 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step4

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca66103c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661040 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661044 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661048 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca66104c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661050 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661054 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661058 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca66105c *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step5

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661060 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661064 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661068 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca66106c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661070 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661074 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661078 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66107c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661080 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step6

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661084 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661088 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca66108c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661090 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661094 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661098 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66109c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6610a0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6610a4 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step7

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6610a8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6610ac *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6610b0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6610b4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6610b8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6610bc *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6610c0 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6610c4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6610c8 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step8

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6610cc *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6610d0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6610d4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6610d8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6610dc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6610e0 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6610e4 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6610e8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6610ec *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step9

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6610f0 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6610f4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6610f8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6610fc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661100 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661104 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661108 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66110c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661110 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step10

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661114 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661118 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca66111c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661120 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661124 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661128 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66112c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661130 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661134 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step11

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661138 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca66113c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661140 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661144 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661148 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca66114c *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661150 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661154 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661158 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step12

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca66115c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661160 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661164 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661168 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca66116c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661170 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661174 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661178 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca66117c *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step13

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661180 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661184 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661188 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca66118c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661190 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661194 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661198 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66119c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6611a0 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step14

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6611a4 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6611a8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6611ac *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6611b0 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6611b4 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6611b8 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6611bc *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6611c0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6611c4 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step15

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6611c8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6611cc *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6611d0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6611d4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6611d8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6611dc *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6611e0 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6611e4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6611e8 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step16

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6611ec *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6611f0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6611f4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6611f8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6611fc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661200 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661204 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661208 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca66120c *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step17

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661210 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661214 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661218 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca66121c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661220 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661224 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661228 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66122c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661230 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step18

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661234 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661238 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca66123c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661240 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661244 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661248 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66124c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661250 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661254 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step19

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661258 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca66125c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661260 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661264 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661268 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca66126c *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661270 *)
add x3 x3 0x2@sint64;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661274 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

nondet f_0_low60_0_low20_20@sint64;
nondet g_0_low60_0_low20_20@sint64;
nondet u_0_20@sint64;
nondet v_0_20@sint64;
nondet r_0_20@sint64;
nondet s_0_20@sint64;

// from lemma we have
assume
u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_20 * (-(2**20)),
r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_20 * (-(2**20))
&&
fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
fuv = (const 64 1) (mod (const 64 2)),
(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),


delta = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20)),

(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1))
;

nondet f_0_low60_0@sint64;
nondet g_0_low60_0@sint64;
nondet f_0_low60_20@sint64;
nondet g_0_low60_20@sint64;
mov f_0_low60_0 f;
mov g_0_low60_0 g;

// by the theory of jumpdivstep, we have
assume
u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
f_0_low60_20 = (const 64 1) (mod (const 64 2))
;

cut
u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42)),
grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42)),
(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20,
f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20,
g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1)),
f_0_low60_20 = (const 64 1) (mod (const 64 2)),

delta = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20)),

(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;

// extraction
mov x6 const_2p41a2p20;
mov x7 fuv;
mov x8 grs;



(* add	x12, x7, x6                                 #! PC = 0xaaaaafca0c08 *)
add x12 x7 x6;
(* asr	x12, x12, #42                               #! PC = 0xaaaaafca0c0c *)
cast x12@sint64 x12;
split x12 dc x12 42;
(* add	x11, x7, #0x100, lsl #12                    #! PC = 0xaaaaafca0c10 *)
// add x11 x7 0x100@sint64, lsl;
add x11 x7 (2**20)@sint64;
(* lsl	x11, x11, #22                               #! PC = 0xaaaaafca0c14 *)
split dcH x11 x11 (64-22); shl x11 x11 22;
(* asr	x11, x11, #43                               #! PC = 0xaaaaafca0c18 *)
cast x11@sint64 x11;
split x11 dc x11 43;
(* add	x14, x8, x6                                 #! PC = 0xaaaaafca0c1c *)
add x14 x8 x6;
(* asr	x14, x14, #42                               #! PC = 0xaaaaafca0c20 *)
cast x14@sint64 x14;
split x14 dc x14 42;
(* add	x13, x8, #0x100, lsl #12                    #! PC = 0xaaaaafca0c24 *)
// add x13 x8 0x100@sint64, lsl;
add x13 x8 (2**20)@sint64;
(* lsl	x13, x13, #22                               #! PC = 0xaaaaafca0c28 *)
split dcH x13 x13 (64-22); shl x13 x13 22;
(* asr	x13, x13, #43                               #! PC = 0xaaaaafca0c2c *)
cast x13@sint64 x13;
split x13 dc x13 43;

assert true && x11 = u_0_20;
assert true && x12 = v_0_20;
assert true && x13 = r_0_20;
assert true && x14 = s_0_20;
assume x11 = u_0_20 && true;
assume x12 = v_0_20 && true;
assume x13 = r_0_20 && true;
assume x14 = s_0_20 && true;

mov u_0_20 x11;
mov v_0_20 x12;
mov r_0_20 x13;
mov s_0_20 x14;

cut
u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20)),
r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))
&&
f_0_low60_20 = (const 64 1) (mod (const 64 2)),

delta = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20)),

(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1)),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;

// update_fg

mov x1 f_0_low60_0;
mov x2 g_0_low60_0;
// we only care about the low 60 bits, casting is required since the syntax of cryptoline
cast x1@sint64 x1;
cast x2@sint64 x2;

mov x11 u_0_20;
mov x12 v_0_20;
mov x13 r_0_20;
mov x14 s_0_20;
nondet dcH@sint64;

(* mul	x9, x11, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x11 x1;
(* madd	x9, x12, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x12;
adds dc x9 x9 tmp;
assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * f_0_low60_20 (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * f_0_low60_20;
(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;


assert true && x9 * (const 64 (2**20)) = (const 64 (-1)) * (const 64 (2**20)) * f_0_low60_20;
assert true && x9 = (const 64 (-1)) * f_0_low60_20 (mod (const 64 (2**44)));



(* mul	x10, x13, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x13 x1;
(* madd	x10, x14, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x14;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * g_0_low60_20 (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * g_0_low60_20;


(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;

assert true && x2 * (const 64 (2**20)) = (const 64 (-1)) * (const 64 (2**20)) * g_0_low60_20;
assert true && x2 = (const 64 (-1)) * g_0_low60_20 (mod (const 64 (2**44)));

(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;


assert true && x1 = (const 64 (-1)) * f_0_low60_20 (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_0_low60_20 (mod (const 64 (2**44)));
mov neg_f_0_low60_20 x1;
mov neg_g_0_low60_20 x2;

// init_fuv_grs

(* and	x7, x1, #0xfffff                            #! PC = 0xaaaaca6612bc *)
and x7@sint64 x1 0xfffff@uint64;

(* and	x8, x2, #0xfffff                            #! PC = 0xaaaaca6612c0 *)
and x8@sint64 x2 0xfffff@uint64;

(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaaca6612c4 *)
or x7@sint64 x7 0xfffffe0000000000@uint64;

(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaaca6612c8 *)
or x8@sint64 x8 0xc000000000000000@uint64;

mov fuv x7;
mov grs x8;
and neg_f_0_low60_20_low20_0@sint64 neg_f_0_low60_20 (2**20 - 1)@sint64;
and neg_g_0_low60_20_low20_0@sint64 neg_g_0_low60_20 (2**20 - 1)@sint64;
mov u_20_40 (-(2**20))@sint64;
mov v_20_40 ( 0)@sint64;
mov r_20_40 ( 0)@sint64;
mov s_20_40 (-(2**20))@sint64;

cut
u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20)),
r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))
&&
fuv = neg_f_0_low60_20_low20_0 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
grs = neg_g_0_low60_20_low20_0 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
(const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_0,
neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_0,
neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1)),
fuv = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20)),
delta = (const 64 1) (mod (const 64 2)),
u_20_40 = (const 64 (-(2**20))),
v_20_40 = (const 64 (0)),
r_20_40 = (const 64 (0)),
s_20_40 = (const 64 (-(2**20))),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;

// divsteps
// step0

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* tst	x8, #0x1                                    #! PC = 0xaaaaca6612cc *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6612d0 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6612d4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6612d8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6612dc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6612e0 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6612e4 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6612e8 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6612ec *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6612f0 *)
split x8 dc x8 1;

assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step1

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6612f4 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6612f8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6612fc *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661300 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661304 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661308 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66130c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661310 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661314 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step2

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661318 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca66131c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661320 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661324 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661328 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca66132c *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661330 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661334 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661338 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step3

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca66133c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661340 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661344 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661348 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca66134c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661350 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661354 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661358 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca66135c *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step4

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661360 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661364 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661368 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca66136c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661370 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661374 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661378 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66137c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661380 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step5

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661384 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661388 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca66138c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661390 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661394 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661398 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66139c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6613a0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6613a4 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step6

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6613a8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6613ac *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6613b0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6613b4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6613b8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6613bc *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6613c0 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6613c4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6613c8 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step7

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6613cc *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6613d0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6613d4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6613d8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6613dc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6613e0 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6613e4 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6613e8 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6613ec *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step8

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6613f0 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6613f4 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6613f8 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6613fc *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661400 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661404 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661408 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66140c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661410 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step9

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661414 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661418 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca66141c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661420 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661424 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661428 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66142c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661430 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661434 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step10

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661438 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca66143c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661440 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661444 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661448 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca66144c *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661450 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661454 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661458 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step11

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca66145c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661460 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661464 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661468 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca66146c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661470 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661474 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661478 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca66147c *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step12

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661480 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661484 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661488 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca66148c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661490 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661494 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661498 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66149c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6614a0 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step13

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6614a4 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6614a8 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6614ac *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6614b0 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6614b4 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6614b8 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6614bc *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6614c0 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6614c4 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step14

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6614c8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6614cc *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6614d0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6614d4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6614d8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca6614dc *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca6614e0 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca6614e4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca6614e8 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step15

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca6614ec *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca6614f0 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca6614f4 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca6614f8 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca6614fc *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661500 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661504 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661508 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca66150c *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step16

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661510 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661514 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661518 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca66151c *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661520 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661524 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661528 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca66152c *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661530 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step17

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661534 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661538 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca66153c *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661540 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661544 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661548 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca66154c *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661550 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661554 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step18

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca661558 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca66155c *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661560 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661564 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca661568 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca66156c *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661570 *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = 0xaaaaca661574 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661578 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

// divsteps
// step19

mov x7 fuv;
mov x8 grs;
mov x3 delta;

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaca66157c *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaca661580 *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaca661584 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaca661588 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaca66158c *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaca661590 *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaca661594 *)
add x3 x3 0x2@sint64;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaca661598 *)
split x8 dc x8 1;


assert true &&
or [
    and [
        grs = (const 64 0) (mod (const 64 2)),

        x7 = fuv,
        x8 * (const 64 2) = grs,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta <s (const 64 0),

        x7 = fuv,
        x8 * (const 64 2) = grs + fuv,
        x3 = (const 64 2) + delta
    ],
    and [
        grs = (const 64 1) (mod (const 64 2)),
        delta >=s (const 64 0),

        x7 = grs,
        x8 * (const 64 2) = grs - fuv,
        x3 = (const 64 2) - delta
    ]
]
;

mov fuv x7;
mov grs x8;
mov delta x3;

nondet neg_f_0_low60_20_low20_20@sint64;
nondet neg_g_0_low60_20_low20_20@sint64;
nondet u_20_40@sint64;
nondet v_20_40@sint64;
nondet r_20_40@sint64;
nondet s_20_40@sint64;

// from lemma we have
assume
u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_20 * (-(2**20)),
r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_20 * (-(2**20))
&&
fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),
fuv = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*40)) <=s delta, delta <=s (const 64 (1 + 2 * 40)),

(const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),


(const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1))
;

nondet neg_f_0_low60_40@sint64;
nondet neg_g_0_low60_40@sint64;
nondet f_0_low60_20@sint64;
nondet g_0_low60_20@sint64;
nondet f_0_low60_40@sint64;
nondet g_0_low60_40@sint64;

// by the theory of jumpdivstep, we have
assume
u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
neg_f_0_low60_40 = (const 64 1) (mod (const 64 2))
;

cut
u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
fuv = neg_f_0_low60_20_low20_20 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42)),
grs = neg_g_0_low60_20_low20_20 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42)),

(const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_20,
neg_f_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_20,
neg_g_0_low60_20_low20_20 <=s (const 64 ((2**20)-1)),

neg_f_0_low60_40 = (const 64 1) (mod (const 64 2)),

delta = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*40)) <=s delta, delta <=s (const 64 (1 + 2 * 40)),

(const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;

// extraction
mov x6 const_2p41a2p20;
mov x7 fuv;
mov x8 grs;



(* add	x16, x7, x6                                 #! PC = 0xaaaaca66159c *)
add x16 x7 x6;
(* asr	x16, x16, #42                               #! PC = 0xaaaaafca0c0c *)
cast x16@sint64 x16;
split x16 dc x16 42;
(* add	x15, x7, #0x100, lsl #12                    #! PC = 0xaaaaafca0c10 *)
add x15 x7 (2**20)@sint64;
(* lsl	x15, x15, #22                               #! PC = 0xaaaaafca0c14 *)
split dcH x15 x15 (64-22); shl x15 x15 22;
(* asr	x15, x15, #43                               #! PC = 0xaaaaafca0c18 *)
cast x15@sint64 x15;
split x15 dc x15 43;
(* add	x20, x8, x6                                 #! PC = 0xaaaaafca0c1c *)
add x20 x8 x6;
(* asr	x20, x20, #42                               #! PC = 0xaaaaafca0c20 *)
cast x20@sint64 x20;
split x20 dc x20 42;
(* add	x17, x8, #0x100, lsl #12                    #! PC = 0xaaaaafca0c24 *)
add x17 x8 (2**20)@sint64;
(* lsl	x17, x17, #22                               #! PC = 0xaaaaafca0c28 *)
split dcH x17 x17 (64-22); shl x17 x17 22;
(* asr	x17, x17, #43                               #! PC = 0xaaaaafca0c2c *)
cast x17@sint64 x17;
split x17 dc x17 43;

assert true && x15 = u_20_40;
assert true && x16 = v_20_40;
assert true && x17 = r_20_40;
assert true && x20 = s_20_40;
assume x15 = u_20_40 && true;
assume x16 = v_20_40 && true;
assume x17 = r_20_40 && true;
assume x20 = s_20_40 && true;

mov u_20_40 x15;
mov v_20_40 x16;
mov r_20_40 x17;
mov s_20_40 x20;

cut
u_20_40 * neg_f_0_low60_20 + v_20_40 * neg_g_0_low60_20 = neg_f_0_low60_40 * (-(2**20)),
r_20_40 * neg_f_0_low60_20 + s_20_40 * neg_g_0_low60_20 = neg_g_0_low60_40 * (-(2**20)),
u_20_40 * f_0_low60_20 + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-(2**20)),
r_20_40 * f_0_low60_20 + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-(2**20))
&&
neg_f_0_low60_40 = (const 64 1) (mod (const 64 2)),

delta = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2)*40)) <=s delta, delta <=s (const 64 (1 + 2 * 40)),


(const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20)-1)),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;

// update_fg

mov x1 neg_f_0_low60_20;
mov x2 neg_g_0_low60_20;
// we only care about the low 60 bits, casting is required since the syntax of cryptoline
cast x1@sint64 x1;
cast x2@sint64 x2;

mov x15 u_20_40;
mov x16 v_20_40;
mov x17 r_20_40;
mov x20 s_20_40;
nondet dcH@sint64;

(* mul	x9, x15, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x15 x1;
(* madd	x9, x16, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x16;
adds dc x9 x9 tmp;
assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * neg_f_0_low60_40 (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * neg_f_0_low60_40;
(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;


assert true && x9 * (const 64 (2**20)) = (const 64 (-1)) * (const 64 (2**20)) * neg_f_0_low60_40;
assert true && x9 = (const 64 (-1)) * neg_f_0_low60_40 (mod (const 64 (2**44)));



(* mul	x10, x17, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x17 x1;
(* madd	x10, x20, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x20;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * neg_g_0_low60_40 (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * neg_g_0_low60_40;


(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;

assert true && x2 * (const 64 (2**20)) = (const 64 (-1)) * (const 64 (2**20)) * neg_g_0_low60_40;
assert true && x2 = (const 64 (-1)) * neg_g_0_low60_40 (mod (const 64 (2**44)));

(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;


assert true && x1 = (const 64 (-1)) * neg_f_0_low60_40 (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * neg_g_0_low60_40 (mod (const 64 (2**44)));
mov neg_f_0_low60_40 x1;
mov neg_g_0_low60_40 x2;

nondet u_0_40@sint64;
nondet v_0_40@sint64;
nondet r_0_40@sint64;
nondet s_0_40@sint64;
assume
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
&&
    true
;

assert
    true
&&
    (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 (2**20 - 1)),
    and [(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 (2**20 - 1)) ] prove with [all cuts],
    (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 (2**20 - 1)),
    and [(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 (2**20 - 1)) ] prove with [all cuts],
    (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 (2**20 - 1)),
    and [(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 (2**20 - 1)) ] prove with [all cuts],
    (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 (2**20 - 1)),
    and [(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 (2**20 - 1)) ] prove with [all cuts]
;

assume
    (-(2**20)) <= u_0_20, u_0_20 <= (2**20 - 1),
    (-(2**20)) <= u_20_40, u_20_40 <= (2**20 - 1),
    (-(2**20)) <= v_0_20, v_0_20 <= (2**20 - 1),
    (-(2**20)) <= v_20_40, v_20_40 <= (2**20 - 1),
    (-(2**20)) <= r_0_20, r_0_20 <= (2**20 - 1),
    (-(2**20)) <= r_20_40, r_20_40 <= (2**20 - 1),
    (-(2**20)) <= s_0_20, s_0_20 <= (2**20 - 1),
    (-(2**20)) <= s_20_40, s_20_40 <= (2**20 - 1)
&&
    true
;

assert
    and [(-(2**41)) <= u_0_40] prove with [algebra solver smt:z3],
    and [u_0_40 <= ((2**41))] prove with [algebra solver smt:z3]
&&
    true
;


// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
mull dcH x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
mull dcH tmp x13 x16;
adds dc x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
mull dcH x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
mull dcH tmp x13 x20;
adds dc x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
mull dcH x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
mull dcH tmp x14 x16;
adds dc x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
mull dcH x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
mull dcH tmp x14 x20;
adds dc x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;


mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;

