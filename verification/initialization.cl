proc main (uint64 op_x0, uint64 op_x1, uint64 op_x2, uint64 op_x3) = {
    true 
    &&
    limbs 64 [op_x0, op_x1, op_x2, op_x3] 
    <u (const 256 (2**255 - 19))
}
mov P0 0xffffffffffffffed@uint64;
mov P1 0xffffffffffffffff@uint64;
mov P2 0xffffffffffffffff@uint64;
mov P3 0x7fffffffffffffff@uint64;

mov L0xffffd2937698 op_x0;
mov L0xffffd29376a0 op_x1;
mov L0xffffd29376a8 op_x2;
mov L0xffffd29376b0 op_x3;



(* ldp	q5, q6, [x1]                                #! EA = L0xffffd2937698; Value = 0x0000000000000000; PC = 0xaaaaafca08b0 *)
mov v5_uint64_0 L0xffffd2937698;
mov v5_uint64_1 L0xffffd29376a0;
mov v6_uint64_0 L0xffffd29376a8;
mov v6_uint64_1 L0xffffd29376b0;
(* movi	v4.2d, #0xffffffffffffffff                 #! PC = 0xaaaaafca08b4 *)
mov v4_uint64_0 0xffffffffffffffff@uint64;
mov v4_uint64_1 0xffffffffffffffff@uint64;
(* mov	x2, #0xffffffffffffffff    	// #-1          #! PC = 0xaaaaafca08b8 *)
mov x2 0xffffffffffffffff@uint64;
(* lsr	x2, x2, #1                                  #! PC = 0xaaaaafca08bc *)
split x2 dcL x2 1;
(* mov	v3.d[1], x2                                 #! PC = 0xaaaaafca08c0 *)
mov v3_uint64_1 x2;
(* mov	x2, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaafca08c4 *)
mov x2 0xffffffffffffffed@uint64;
(* mov	v3.d[0], x2                                 #! PC = 0xaaaaafca08c8 *)
mov v3_uint64_0 x2;
(* zip1	v8.2d, v3.2d, v5.2d                        #! PC = 0xaaaaafca08cc *)
mov v8_uint64_0 v3_uint64_0;
mov v8_uint64_1 v5_uint64_0;
(* zip2	v9.2d, v4.2d, v5.2d                        #! PC = 0xaaaaafca08d0 *)
mov v9_uint64_0 v4_uint64_1;
mov v9_uint64_1 v5_uint64_1;
(* zip1	v10.2d, v4.2d, v6.2d                       #! PC = 0xaaaaafca08d4 *)
mov v10_uint64_0 v4_uint64_0;
mov v10_uint64_1 v6_uint64_0;
(* zip2	v11.2d, v3.2d, v6.2d                       #! PC = 0xaaaaafca08d8 *)
mov v11_uint64_0 v3_uint64_1;
mov v11_uint64_1 v6_uint64_1;
(* ushr	v1.2d, v4.2d, #34                          #! PC = 0xaaaaafca08dc *)
shrs v1_uint64_0 dc v4_uint64_0 34;
shrs v1_uint64_1 dc v4_uint64_1 34;
(* and	v3.16b, v8.16b, v1.16b                      #! PC = 0xaaaaafca08e0 *)
split dc v3_sint32_0 v8_uint64_0 30;
split dc v3_sint32_2 v8_uint64_1 30;
(* ushr	v12.2d, v8.2d, #30                         #! PC = 0xaaaaafca08e4 *)
shrs v12_uint64_0 dc v8_uint64_0 30;
shrs v12_uint64_1 dc v8_uint64_1 30;
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca08e8 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
(* sli	v3.2d, v12.2d, #32                          #! PC = 0xaaaaafca08ec *)
split dc v3_sint32_1 v12_uint64_0 32;
split dc v3_sint32_3 v12_uint64_1 32;

vpc v3_sint32_0@sint32 v3_sint32_0;
vpc v3_sint32_1@sint32 v3_sint32_1;
vpc v3_sint32_2@sint32 v3_sint32_2;
vpc v3_sint32_3@sint32 v3_sint32_3;


mov F0 v3_sint32_0;
mov F1 v3_sint32_1;
mov G0 v3_sint32_2;
mov G1 v3_sint32_3;


// (* ushr	v4.2d, v8.2d, #60                          #! PC = 0xaaaaafca08f0 *)
shrs v4_uint64_0 dc v8_uint64_0 60;
shrs v4_uint64_1 dc v8_uint64_1 60;
// (* shl	v12.2d, v9.2d, #4                           #! PC = 0xaaaaafca08f4 *)
shls dc v12_uint64_0 v9_uint64_0 4;
shls dc v12_uint64_1 v9_uint64_1 4;
// (* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca08f8 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
// (* orr	v4.16b, v4.16b, v12.16b                     #! PC = 0xaaaaafca08fc *)
or v4_uint64_0@uint64 v4_uint64_0 v12_uint64_0;
or v4_uint64_1@uint64 v4_uint64_1 v12_uint64_1;
vpc v4_sint32_0@sint32 v4_uint64_0;
vpc v4_sint32_2@sint32 v4_uint64_1;
// (* ushr	v12.2d, v9.2d, #26                         #! PC = 0xaaaaafca0900 *)
shrs v12_uint64_0 dc v9_uint64_0 26;
shrs v12_uint64_1 dc v9_uint64_1 26;
// (* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca0904 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
// (* sli	v4.2d, v12.2d, #32                          #! PC = 0xaaaaafca0908 *)
split dc v4_sint32_1 v12_uint64_0 32;
split dc v4_sint32_3 v12_uint64_1 32;

vpc v4_sint32_0@sint32 v4_sint32_0;
vpc v4_sint32_1@sint32 v4_sint32_1;
vpc v4_sint32_2@sint32 v4_sint32_2;
vpc v4_sint32_3@sint32 v4_sint32_3;


mov F2 v4_sint32_0;
mov F3 v4_sint32_1;
mov G2 v4_sint32_2;
mov G3 v4_sint32_3;
// // cut 2
// cut true && 
// (const 32 0) <=s F2, F2 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s F3, F3 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s G2, G2 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s G3, G3 <=s (const 32 ((2**30)-1)),
// (
//     (sext F0 96) +
//     (sext F1 96) * (const 128 (2**30)) +
//     (sext F2 96) * (const 128 (2**60)) +
//     (sext F3 96) * (const 128 (2**90)) 
// )
// =
// (
//     (uext P0 64) +
//     (uext P1 64) * (const 128 (2**64))
// )
// (mod (const 128 (2**120)))
// ,
// (
//     (sext G0 96) +
//     (sext G1 96) * (const 128 (2**30)) +
//     (sext G2 96) * (const 128 (2**60)) +
//     (sext G3 96) * (const 128 (2**90)) 
// )
// =
// (
//     (uext op_x0 64) +
//     (uext op_x1 64) * (const 128 (2**64))
// )
// (mod (const 128 (2**120)))
// ;




// (* ushr	v5.2d, v9.2d, #56                          #! PC = 0xaaaaafca090c *)
shrs v5_uint64_0 dc v9_uint64_0 56;
shrs v5_uint64_1 dc v9_uint64_1 56;
// (* shl	v12.2d, v10.2d, #8                          #! PC = 0xaaaaafca0910 *)
shls dc v12_uint64_0 v10_uint64_0 8;
shls dc v12_uint64_1 v10_uint64_1 8;
// (* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca0914 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
// (* orr	v5.16b, v5.16b, v12.16b                     #! PC = 0xaaaaafca0918 *)
or v5_uint64_0@uint64 v5_uint64_0 v12_uint64_0;
or v5_uint64_1@uint64 v5_uint64_1 v12_uint64_1;
vpc v5_sint32_0@sint32 v5_uint64_0;
vpc v5_sint32_2@sint32 v5_uint64_1;
// (* ushr	v12.2d, v10.2d, #22                        #! PC = 0xaaaaafca091c *)
shrs v12_uint64_0 dc v10_uint64_0 22;
shrs v12_uint64_1 dc v10_uint64_1 22;
// (* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca0920 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
// (* sli	v5.2d, v12.2d, #32                          #! PC = 0xaaaaafca0924 *)
split dc v5_sint32_1 v12_uint64_0 32;
split dc v5_sint32_3 v12_uint64_1 32;


vpc v5_sint32_0@sint32 v5_sint32_0;
vpc v5_sint32_1@sint32 v5_sint32_1;
vpc v5_sint32_2@sint32 v5_sint32_2;
vpc v5_sint32_3@sint32 v5_sint32_3;


mov F4 v5_sint32_0;
mov F5 v5_sint32_1;
mov G4 v5_sint32_2;
mov G5 v5_sint32_3;
// // cut 3
// cut true && 
// (const 32 0) <=s F4, F4 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s F5, F5 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s G4, G4 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s G5, G5 <=s (const 32 ((2**30)-1))
// ,
// and [
// (
//     (sext F0 160) +
//     (sext F1 160) * (const 192 (2** 30)) +
//     (sext F2 160) * (const 192 (2** 60)) +
//     (sext F3 160) * (const 192 (2** 90)) +
//     (sext F4 160) * (const 192 (2**120)) +
//     (sext F5 160) * (const 192 (2**150))
// )
// =
// (
//     (uext P0 128) +
//     (uext P1 128) * (const 192 (2** 64)) +
//     (uext P2 128) * (const 192 (2**128)) 
// )
// (mod (const 192 (2**180)))
// ,
// (
//     (sext G0 160) +
//     (sext G1 160) * (const 192 (2** 30)) +
//     (sext G2 160) * (const 192 (2** 60)) +
//     (sext G3 160) * (const 192 (2** 90)) +
//     (sext G4 160) * (const 192 (2**120)) +
//     (sext G5 160) * (const 192 (2**150))
// )
// =
// (
//     (uext op_x0 128) +
//     (uext op_x1 128) * (const 192 (2** 64)) +
//     (uext op_x2 128) * (const 192 (2**128)) 
// )
// (mod (const 192 (2**180)))
// ]
// prove with [cuts [1]];
//




// (* ushr	v6.2d, v10.2d, #52                         #! PC = 0xaaaaafca0928 *)
shrs v6_uint64_0 dc v10_uint64_0 52;
shrs v6_uint64_1 dc v10_uint64_1 52;
// (* shl	v12.2d, v11.2d, #12                         #! PC = 0xaaaaafca092c *)
shls dc v12_uint64_0 v11_uint64_0 12;
shls dc v12_uint64_1 v11_uint64_1 12;
// (* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca0930 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
// (* orr	v6.16b, v6.16b, v12.16b                     #! PC = 0xaaaaafca0934 *)
or v6_uint64_0@uint64 v6_uint64_0 v12_uint64_0;
or v6_uint64_1@uint64 v6_uint64_1 v12_uint64_1;
vpc v6_sint32_0@sint32 v6_uint64_0;
vpc v6_sint32_2@sint32 v6_uint64_1;
// (* ushr	v12.2d, v11.2d, #18                        #! PC = 0xaaaaafca0938 *)
shrs v12_uint64_0 dc v11_uint64_0 18;
shrs v12_uint64_1 dc v11_uint64_1 18;
// (* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaafca093c *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
// (* sli	v6.2d, v12.2d, #32                          #! PC = 0xaaaaafca0940 *)
split dc v6_sint32_1 v12_uint64_0 32;
split dc v6_sint32_3 v12_uint64_1 32;


vpc v6_sint32_0@sint32 v6_sint32_0;
vpc v6_sint32_1@sint32 v6_sint32_1;
vpc v6_sint32_2@sint32 v6_sint32_2;
vpc v6_sint32_3@sint32 v6_sint32_3;

mov F6 v6_sint32_0;
mov F7 v6_sint32_1;
mov G6 v6_sint32_2;
mov G7 v6_sint32_3;
// // cut 4
// cut true && 
// (const 32 0) <=s F6, F6 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s F7, F7 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s G6, G6 <=s (const 32 ((2**30)-1)),
// (const 32 0) <=s G7, G7 <=s (const 32 ((2**30)-1)),
// and [
// (
//     (sext F0 224) +
//     (sext F1 224) * (const 256 (2** 30)) +
//     (sext F2 224) * (const 256 (2** 60)) +
//     (sext F3 224) * (const 256 (2** 90)) +
//     (sext F4 224) * (const 256 (2**120)) +
//     (sext F5 224) * (const 256 (2**150)) +
//     (sext F6 224) * (const 256 (2**180)) +
//     (sext F7 224) * (const 256 (2**210))
// )
// =
// (
//     (uext P0 192) +
//     (uext P1 192) * (const 256 (2** 64)) +
//     (uext P2 192) * (const 256 (2**128)) +
//     (uext P3 192) * (const 256 (2**192)) 
// )
// (mod (const 256 (2**240)))
// ,
// (
//     (sext G0 224) +
//     (sext G1 224) * (const 256 (2** 30)) +
//     (sext G2 224) * (const 256 (2** 60)) +
//     (sext G3 224) * (const 256 (2** 90)) +
//     (sext G4 224) * (const 256 (2**120)) +
//     (sext G5 224) * (const 256 (2**150)) +
//     (sext G6 224) * (const 256 (2**180)) +
//     (sext G7 224) * (const 256 (2**210))
// )
// =
// (
//     (uext op_x0 192) +
//     (uext op_x1 192) * (const 256 (2** 64)) +
//     (uext op_x2 192) * (const 256 (2**128)) +
//     (uext op_x3 192) * (const 256 (2**192)) 
// )
// (mod (const 256 (2**240)))
// ] prove with [cuts [0, 1, 2]];






// (* ushr	v7.2d, v11.2d, #48                         #! PC = 0xaaaaafca0944 *)
shrs v7_uint64_0 dc v11_uint64_0 48;
shrs v7_uint64_1 dc v11_uint64_1 48;

vpc v7_sint32_0@sint32 v7_uint64_0;
vpc v7_sint32_2@sint32 v7_uint64_1;

mov F8 v7_sint32_0;
mov G8 v7_sint32_2;
// cut true && 
// and [
// (const 32 0) <=s F8, F8 <=s (const 32 ((2**15)-1)),
// (const 32 0) <=s G8, G8 <=s (const 32 ((2**16)-1)),
// (
//     (sext F0 224) +
//     (sext F1 224) * (const 256 (2** 30)) +
//     (sext F2 224) * (const 256 (2** 60)) +
//     (sext F3 224) * (const 256 (2** 90)) +
//     (sext F4 224) * (const 256 (2**120)) +
//     (sext F5 224) * (const 256 (2**150)) +
//     (sext F6 224) * (const 256 (2**180)) +
//     (sext F7 224) * (const 256 (2**210)) +
//     (sext F8 224) * (const 256 (2**240))
// )
// =
// (
//     (uext P0 192) +
//     (uext P1 192) * (const 256 (2** 64)) +
//     (uext P2 192) * (const 256 (2**128)) +
//     (uext P3 192) * (const 256 (2**192))
// )
// ,
// (
//     (sext G0 224) +
//     (sext G1 224) * (const 256 (2** 30)) +
//     (sext G2 224) * (const 256 (2** 60)) +
//     (sext G3 224) * (const 256 (2** 90)) +
//     (sext G4 224) * (const 256 (2**120)) +
//     (sext G5 224) * (const 256 (2**150)) +
//     (sext G6 224) * (const 256 (2**180)) +
//     (sext G7 224) * (const 256 (2**210)) +
//     (sext G8 224) * (const 256 (2**240))
// )
// =
// (
//     (uext op_x0 192) +
//     (uext op_x1 192) * (const 256 (2** 64)) +
//     (uext op_x2 192) * (const 256 (2**128)) +
//     (uext op_x3 192) * (const 256 (2**192)) 
// )
// ] prove with [all cuts];


// (* movi	v8.2d, #0x0                                #! PC = 0xaaaaafca0948 *)
mov v8_sint32_0 0@sint32;
mov v8_sint32_1 0@sint32;
mov v8_sint32_2 0@sint32;
mov v8_sint32_3 0@sint32;
// (* mov	x2, #0x1                   	// #1           #! PC = 0xaaaaafca094c *)
mov x2 0x1@uint64;
// (* mov	v8.d[1], x2                                 #! PC = 0xaaaaafca0950 *)
mov v8_sint32_2 x2;
vpc v8_sint32_2@sint32 v8_sint32_2;
// (* movi	v9.2d, #0x0                                #! PC = 0xaaaaafca0954 *)
mov v9_sint32_0 0@sint32;
mov v9_sint32_1 0@sint32;
mov v9_sint32_2 0@sint32;
mov v9_sint32_3 0@sint32;
// (* movi	v10.2d, #0x0                               #! PC = 0xaaaaafca0958 *)
mov v10_sint32_0 0@sint32;
mov v10_sint32_1 0@sint32;
mov v10_sint32_2 0@sint32;
mov v10_sint32_3 0@sint32;
// (* movi	v11.2d, #0x0                               #! PC = 0xaaaaafca095c *)
mov v11_sint32_0 0@sint32;
mov v11_sint32_1 0@sint32;
mov v11_sint32_2 0@sint32;
mov v11_sint32_3 0@sint32;
// (* movi	v12.2d, #0x0                               #! PC = 0xaaaaafca0960 *)
mov v12_sint32_0 0@sint32;
mov v12_sint32_1 0@sint32;
mov v12_sint32_2 0@sint32;
mov v12_sint32_3 0@sint32;

mov V0 v8_sint32_0;
mov V1 v8_sint32_1;
mov S0 v8_sint32_2;
mov S1 v8_sint32_3;
mov V2 v9_sint32_0;
mov V3 v9_sint32_1;
mov S2 v9_sint32_2;
mov S3 v9_sint32_3;
mov V4 v10_sint32_0;
mov V5 v10_sint32_1;
mov S4 v10_sint32_2;
mov S5 v10_sint32_3;
mov V6 v11_sint32_0;
mov V7 v11_sint32_1;
mov S6 v11_sint32_2;
mov S7 v11_sint32_3;
mov V8 v12_sint32_0;
mov S8 v12_sint32_2;

// cut true && 
// and [
// (
//     (sext V0 224) +
//     (sext V1 224) * (const 256 (2** 30)) +
//     (sext V2 224) * (const 256 (2** 60)) +
//     (sext V3 224) * (const 256 (2** 90)) +
//     (sext V4 224) * (const 256 (2**120)) +
//     (sext V5 224) * (const 256 (2**150)) +
//     (sext V6 224) * (const 256 (2**180)) +
//     (sext V7 224) * (const 256 (2**210)) +
//     (sext V8 224) * (const 256 (2**240))
// )
// =
// (const 256 0)
// ,
// (
//     (sext S0 224) +
//     (sext S1 224) * (const 256 (2** 30)) +
//     (sext S2 224) * (const 256 (2** 60)) +
//     (sext S3 224) * (const 256 (2** 90)) +
//     (sext S4 224) * (const 256 (2**120)) +
//     (sext S5 224) * (const 256 (2**150)) +
//     (sext S6 224) * (const 256 (2**180)) +
//     (sext S7 224) * (const 256 (2**210)) +
//     (sext S8 224) * (const 256 (2**240))
// )
// =
// (const 256 1)
// ];


// (* uzp1	v2.4s, v1.4s, v1.4s                        #! PC = 0xaaaaafca0964 *)
spl v1_uint32_1 v1_uint32_0 v1_uint64_0 32;
spl v1_uint32_3 v1_uint32_2 v1_uint64_1 32;
// uzp1 takes even elements: 0, 2
mov v2_uint32_0 v1_uint32_0;
mov v2_uint32_1 v1_uint32_2;
mov v2_uint32_2 v1_uint32_0;
mov v2_uint32_3 v1_uint32_2;


// assert true &&  
// and [
//     v2_uint32_0 = ((2**30) -1)@sint32
//     ,
//     v2_uint32_1 = ((2**30) -1)@sint32
//     ,
//     v2_uint32_2 = ((2**30) -1)@sint32
//     ,
//     v2_uint32_3 = ((2**30) -1)@sint32
// ] prove with [all cuts];



// (* ldp	x5, x22, [x1]                               #! EA = L0xffffd2937698; Value = 0x0000000000000000; PC = 0xaaaaafca0968 *)
mov x5 L0xffffd2937698; mov x22 L0xffffd29376a0;
// (* mov	x4, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaafca096c *)
mov x4 0xffffffffffffffed@uint64;
// (* mov	x21, #0xffffffffffffffff    	// #-1         #! PC = 0xaaaaafca0970 *)
mov x21 0xffffffffffffffff@uint64;
// (* mov	x1, x4                                      #! PC = 0xaaaaafca0974 *)
mov x1 x4;
// (* mov	x2, x5                                      #! PC = 0xaaaaafca0978 *)
mov x2 x5;
// (* mov	x3, #0x1                   	// #1           #! PC = 0xaaaaafca097c *)
mov x3 0x1@uint64;


mov f_0_low_64_0 x4;
mov g_0_low_64_0 x5;
mov f_0_low_128h_0 x21;
mov g_0_low_128h_0 x22;
mov delta x3;
// assert true && 
// f_0_low_64_0 = P0
// ,
// g_0_low_64_0 = op_x0
// ,
// f_0_low_128h_0 = P1
// ,
// g_0_low_128h_0 = op_x1
// ,
// delta = (const 64 1);


// (* mov	x6, #0x20000000000         	// #2199023255552#! PC = 0xaaaaafca0980 *)
mov x6 0x20000000000@uint64;
// (* add	x6, x6, #0x100, lsl #12                     #! PC = 0xaaaaafca0984 *)
add x6 x6 1048576@uint64;
// (* mov	x7, #0x286b0000            	// #678100992   #! PC = 0xaaaaafca0988 *)
// (* movk	x7, #0xca1b                                #! PC = 0xaaaaafca098c *)
mov x7 0x286bca1b@uint64;
// (* dup	v15.4s, w7                                  #! PC = 0xaaaaafca0990 *)
vpc w7@sint32 x7;
mov v15_sint32_0 w7;
mov v15_sint32_1 w7;
mov v15_sint32_2 w7;
mov v15_sint32_3 w7;

mov const_2p20a2p41 x6;



// assert true && 
// const_2p20a2p41 = (const 64 ((2**20) + (2**41)))
// ,
// (uext w7 32) * (P0) = (const 64 (-1)) (mod (const 64 (2**30)))
// ;


{
    true
    &&
    and [
    (const 32 0) <=s F0, F0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F1, F1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F2, F2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F3, F3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F4, F4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F5, F5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F6, F6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F7, F7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s F8, F8 <=s (const 32 ((2**15)-1)),

    (const 32 0) <=s G0, G0 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G1, G1 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G2, G2 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G3, G3 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G4, G4 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G5, G5 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G6, G6 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G7, G7 <=s (const 32 ((2**30)-1)),
    (const 32 0) <=s G8, G8 <=s (const 32 ((2**15)-1)),

    (
        (sext F0 224) +
        (sext F1 224) * (const 256 (2** 30)) +
        (sext F2 224) * (const 256 (2** 60)) +
        (sext F3 224) * (const 256 (2** 90)) +
        (sext F4 224) * (const 256 (2**120)) +
        (sext F5 224) * (const 256 (2**150)) +
        (sext F6 224) * (const 256 (2**180)) +
        (sext F7 224) * (const 256 (2**210)) +
        (sext F8 224) * (const 256 (2**240))
    )
    =
    (
        (uext P0 192) +
        (uext P1 192) * (const 256 (2** 64)) +
        (uext P2 192) * (const 256 (2**128)) +
        (uext P3 192) * (const 256 (2**192))
    )
    ,
    (
        (sext G0 224) +
        (sext G1 224) * (const 256 (2** 30)) +
        (sext G2 224) * (const 256 (2** 60)) +
        (sext G3 224) * (const 256 (2** 90)) +
        (sext G4 224) * (const 256 (2**120)) +
        (sext G5 224) * (const 256 (2**150)) +
        (sext G6 224) * (const 256 (2**180)) +
        (sext G7 224) * (const 256 (2**210)) +
        (sext G8 224) * (const 256 (2**240))
    )
    =
    (
        (uext op_x0 192) +
        (uext op_x1 192) * (const 256 (2** 64)) +
        (uext op_x2 192) * (const 256 (2**128)) +
        (uext op_x3 192) * (const 256 (2**192)) 
    )
    ,
    (
        (sext V0 224) +
        (sext V1 224) * (const 256 (2** 30)) +
        (sext V2 224) * (const 256 (2** 60)) +
        (sext V3 224) * (const 256 (2** 90)) +
        (sext V4 224) * (const 256 (2**120)) +
        (sext V5 224) * (const 256 (2**150)) +
        (sext V6 224) * (const 256 (2**180)) +
        (sext V7 224) * (const 256 (2**210)) +
        (sext V8 224) * (const 256 (2**240))
    )
    =
    (const 256 0)
    ,
    (
        (sext S0 224) +
        (sext S1 224) * (const 256 (2** 30)) +
        (sext S2 224) * (const 256 (2** 60)) +
        (sext S3 224) * (const 256 (2** 90)) +
        (sext S4 224) * (const 256 (2**120)) +
        (sext S5 224) * (const 256 (2**150)) +
        (sext S6 224) * (const 256 (2**180)) +
        (sext S7 224) * (const 256 (2**210)) +
        (sext S8 224) * (const 256 (2**240))
    )
    =
    (const 256 1)
    ] prove with [all cuts]
}
