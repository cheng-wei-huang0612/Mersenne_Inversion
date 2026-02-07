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
nondet %v5@uint64[2];
nondet %v6@uint64[2];
mov %v5 [L0xfffff0a5bc88, %v5[1]];
mov %v5 [%v5[0], L0xfffff0a5bc90];
mov %v6 [L0xfffff0a5bc98, %v6[1]];
mov %v6 [%v6[0], L0xfffff0a5bca0];

(* movi	v4.2d, #0xffffffffffffffff                 #! PC = 0xaaaaca660eb8 *)
nondet %v4@uint64[2];
broadcast %v4 2 [0xffffffffffffffff@uint64];
(* mov	x2, #0xffffffffffffffff    	// #-1          #! PC = 0xaaaaca660ebc *)
mov x2 0xffffffffffffffff@uint64;
(* lsr	x2, x2, #1                                  #! PC = 0xaaaaca660ec0 *)
split x2 dcL x2 1;
(* mov	v3.d[1], x2                                 #! PC = 0xaaaaca660ec4 *)
nondet %v3@uint64[2];
mov %v3 [%v3[0], x2];
(* mov	x2, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaca660ec8 *)
mov x2 0xffffffffffffffed@uint64;
(* mov	v3.d[0], x2                                 #! PC = 0xaaaaca660ecc *)
mov %v3 [x2, %v3[1]];
(* zip1	v8.2d, v3.2d, v5.2d                        #! PC = 0xaaaaca660ed0 *)
nondet %v8@uint64[2];
mov %v8 [%v3[0], %v5[0]];
(* zip2	v9.2d, v4.2d, v5.2d                        #! PC = 0xaaaaca660ed4 *)
nondet %v9@uint64[2];
mov %v9 [%v4[1], %v5[1]];
(* zip1	v10.2d, v4.2d, v6.2d                       #! PC = 0xaaaaca660ed8 *)
nondet %v10@uint64[2];
mov %v10 [%v4[0], %v6[0]];
(* zip2	v11.2d, v3.2d, v6.2d                       #! PC = 0xaaaaca660edc *)
nondet %v11@uint64[2];
mov %v11 [%v3[1], %v6[1]];
(* ushr	v1.2d, v4.2d, #34                          #! PC = 0xaaaaca660ee0 *)
nondet %v1@uint64[2];
shrs %v1 %dc %v4 [34, 34];

# shrs v1_uint64_0 dc v4_uint64_0 34;
# shrs v1_uint64_1 dc v4_uint64_1 34;
