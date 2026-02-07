from gen_cl import *


emit = ""

emit += """
proc update_uuvvrrss (
    u_0_20@sint64,
    v_0_20@sint64,
    r_0_20@sint64,
    s_0_20@sint64,
    u_20_40@sint64,
    v_20_40@sint64,
    r_20_40@sint64,
    s_20_40@sint64;
    u_0_40@sint64,
    v_0_40@sint64,
    r_0_40@sint64,
    s_0_40@sint64
) = 
{

#     (-(2**20)) <= u_0_20, u_0_20 <= (2**20 - 1),
#     (-(2**20)) <= u_20_40, u_20_40 <= (2**20 - 1),
#     (-(2**20)) <= v_0_20, v_0_20 <= (2**20 - 1),
#     (-(2**20)) <= v_20_40, v_20_40 <= (2**20 - 1),
#     (-(2**20)) <= r_0_20, r_0_20 <= (2**20 - 1),
#     (-(2**20)) <= r_20_40, r_20_40 <= (2**20 - 1),
#     (-(2**20)) <= s_0_20, s_0_20 <= (2**20 - 1),
#     (-(2**20)) <= s_20_40, s_20_40 <= (2**20 - 1),
#
# u_20_40 + v_20_40 <= (2**20),
# u_20_40 - v_20_40 <= (2**20),
#  - u_20_40 + v_20_40 <= (2**20),
#  - u_20_40 - v_20_40 <= (2**20),
# r_20_40 + s_20_40 <= (2**20),
# r_20_40 - s_20_40 <= (2**20),
#  - r_20_40 + s_20_40 <= (2**20),
#  - r_20_40 - s_20_40 <= (2**20),
# u_0_20 + v_0_20 <= (2**20),
# u_0_20 - v_0_20 <= (2**20),
#  - u_0_20 + v_0_20 <= (2**20),
#  - u_0_20 - v_0_20 <= (2**20),
# r_0_20 + s_0_20 <= (2**20),
# r_0_20 - s_0_20 <= (2**20),
#  - r_0_20 + s_0_20 <= (2**20),
#  - r_0_20 - s_0_20 <= (2**20)
  true
        &&

(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20) - 1)),
(const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20) - 1)),
u_20_40 + v_20_40 <=s (const 64 (2**20)),
u_20_40 - v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
r_20_40 + s_20_40 <=s (const 64 (2**20)),
r_20_40 - s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
u_0_20 + v_0_20 <=s (const 64 (2**20)),
u_0_20 - v_0_20 <=s (const 64 (2**20)),
(const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
(const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
r_0_20 + s_0_20 <=s (const 64 (2**20)),
r_0_20 - s_0_20 <=s (const 64 (2**20)),
(const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
(const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))
}




mov x11 u_0_20;
mov x12 v_0_20;
mov x13 r_0_20;
mov x14 s_0_20;
mov x15 u_20_40;
mov x16 v_20_40;
mov x17 r_20_40;
mov x20 s_20_40;



// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
smul x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
smul tmp x13 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
smul x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
smul tmp x13 x20;
sadd x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
smul x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
smul tmp x14 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
smul x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
smul tmp x14 x20;
sadd x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;

mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;


assert
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
    && true
;

assert true &&
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
;

// By theorem from matrix norm, we have
assume true &&
u_0_40 + v_0_40 <=s (const 64 (2**40)),
u_0_40 - v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
r_0_40 + s_0_40 <=s (const 64 (2**40)),
r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1));

{
u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
    &&
u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40,
u_0_40 + v_0_40 <=s (const 64 (2**40)),
u_0_40 - v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
(const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
r_0_40 + s_0_40 <=s (const 64 (2**40)),
r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
(const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
(const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
(const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1))
}

"""


emit += """
proc update_uuvvrrss_2 (
    u_0_40@sint64,
    v_0_40@sint64,
    r_0_40@sint64,
    s_0_40@sint64,
    u_40_59@sint64,
    v_40_59@sint64,
    r_40_59@sint64,
    s_40_59@sint64;
    u_0_59@sint64,
    v_0_59@sint64,
    r_0_59@sint64,
    s_0_59@sint64
) = 
{
  true
        &&

    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1)),

    (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20) - 1)),
    (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20) - 1)),
    u_40_59 + v_40_59 <=s (const 64 (2**20)),
    u_40_59 - v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
    (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
    r_40_59 + s_40_59 <=s (const 64 (2**20)),
    r_40_59 - s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
    (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40))

}




mov x11 u_0_40;
mov x12 v_0_40;
mov x13 r_0_40;
mov x14 s_0_40;
mov x15 u_40_59;
mov x16 v_40_59;
mov x17 r_40_59;
mov x20 s_40_59;



// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
smul x9 x15 x11;
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
smul tmp x13 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
smul x9 x17 x11;
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
smul tmp x13 x20;
sadd x13 x9 tmp;
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
mov x11 x10;
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
smul x9 x15 x12;
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
smul tmp x14 x16;
sadd x10 x9 tmp;
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
smul x9 x17 x12;
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
smul tmp x14 x20;
sadd x14 x9 tmp;
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)
mov x12 x10;

mov u_0_59 x11;
mov v_0_59 x12;
mov r_0_59 x13;
mov s_0_59 x14;


assert
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    && true
;

assert true &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
;

// By theorem from matrix norm, we have
assume true &&
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1));

{
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59,
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1))
}

"""

emit += "proc main (\n"

for i in range(4):
    end_char = ",\n" 
    if i == 3:
        end_char = ""
    emit += f"uint64 op_x{i}{end_char}"
emit += """
) =
{
  true
  &&
  true
}
"""

addr = 0xfffff0a5bc88
for i in range(4):
    emit += f"mov L{hex(addr + 8 * i)} op_x{i};\n"


emit += """
(* ldp	q5, q6, [x1]                                #! EA = L0xfffff0a5bc88; Value = 0x0000000000000000; PC = 0xaaaaca660eb4 *)
"""

addr = 0xfffff0a5bc88
for i in range(4):
    emit += f"mov v{(i>>1)+5}_uint64_{i%2} L{hex(addr + 8 * i)};\n"
# mov v5_uint64_0 L0xfffff0a5bc88
# mov v5_uint64_1 L0xfffff0a5bc90
# mov v6_uint64_0 L0xfffff0a5bc98
# mov v6_uint64_1 L0xfffff0a5bca0

emit += """
(* movi	v4.2d, #0xffffffffffffffff                 #! PC = 0xaaaaca660eb8 *)
mov v4_uint64_0 0xffffffffffffffff@uint64;
mov v4_uint64_1 0xffffffffffffffff@uint64;
(* mov	x2, #0xffffffffffffffff    	// #-1          #! PC = 0xaaaaca660ebc *)
mov x2 0xffffffffffffffff@uint64;
(* lsr	x2, x2, #1                                  #! PC = 0xaaaaca660ec0 *)
split x2 dcL x2 1;


nondet %v3@int32[4];
(* mov	v3.d[1], x2                                 #! PC = 0xaaaaca660ec4 *)
mov v3_uint64_1 x2;

(* mov	x2, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaca660ec8 *)
mov x2 0xffffffffffffffed@uint64;
"""

emit += """
(* mov	v3.d[0], x2                                 #! PC = 0xaaaaca660ecc *)
mov v3_uint64_0 x2;
"""

emit += """
(* zip1	v8.2d, v3.2d, v5.2d                        #! PC = 0xaaaaca660ed0 *)
mov v8_uint64_0 v3_uint64_0;
mov v8_uint64_1 v5_uint64_0;
"""

emit += """
(* zip2	v9.2d, v4.2d, v5.2d                        #! PC = 0xaaaaca660ed4 *)
mov v9_uint64_0 v4_uint64_1;
mov v9_uint64_1 v5_uint64_1;
"""

emit += """
(* zip1	v10.2d, v4.2d, v6.2d                       #! PC = 0xaaaaca660ed8 *)
mov v10_uint64_0 v4_uint64_0;
mov v10_uint64_1 v6_uint64_0;
"""

emit += """
(* zip2	v11.2d, v3.2d, v6.2d                       #! PC = 0xaaaaca660edc *)
mov v11_uint64_0 v3_uint64_1;
mov v11_uint64_1 v6_uint64_1;
"""

emit += """
(* ushr	v1.2d, v4.2d, #34                          #! PC = 0xaaaaca660ee0 *)
shrs v1_uint64_0 dc v4_uint64_0 34;
shrs v1_uint64_1 dc v4_uint64_1 34;
"""

emit += """
(* and	v3.16b, v8.16b, v1.16b                      #! PC = 0xaaaaca660ee4 *)
assert true &&
    v1_uint64_0 = (const 64 (2**30 - 1)),
    v1_uint64_1 = (const 64 (2**30 - 1));
split dc v3_uint64_0 v8_uint64_0 30;
split dc v3_uint64_1 v8_uint64_1 30;
"""

emit += """
(* ushr	v12.2d, v8.2d, #30                         #! PC = 0xaaaaca660ee8 *)
shrs v12_uint64_0 dc v8_uint64_0 30;
shrs v12_uint64_1 dc v8_uint64_1 30;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660eec *)
assert true &&
    v1_uint64_0 = (const 64 (2**30 - 1)),
    v1_uint64_1 = (const 64 (2**30 - 1));
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* sli	v3.2d, v12.2d, #32                          #! PC = 0xaaaaca660ef0 *)
cast v3_sint32_0@sint32 v3_uint64_0;
cast v3_sint32_2@sint32 v3_uint64_1;
cast v3_sint32_1@sint32 v12_uint64_0;
cast v3_sint32_3@sint32 v12_uint64_1;
"""

emit += """
assert true &&
    (const 32 0) <=s v3_sint32_0, v3_sint32_0 <=s (const 32 ((2**30) - 1)),
    (const 32 0) <=s v3_sint32_1, v3_sint32_1 <=s (const 32 ((2**30) - 1)),
    (const 32 0) <=s v3_sint32_2, v3_sint32_2 <=s (const 32 ((2**30) - 1)),
    (const 32 0) <=s v3_sint32_3, v3_sint32_3 <=s (const 32 ((2**30) - 1));
"""

emit += """
(* ushr	v4.2d, v8.2d, #60                          #! PC = 0xaaaaca660ef4 *)
shrs v4_uint64_0 dc v8_uint64_0 60;
shrs v4_uint64_1 dc v8_uint64_1 60;
"""

emit += """
(* shl	v12.2d, v9.2d, #4                           #! PC = 0xaaaaca660ef8 *)
shls dc v12_uint64_0 v9_uint64_0 4;
shls dc v12_uint64_1 v9_uint64_1 4;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660efc *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* orr	v4.16b, v4.16b, v12.16b                     #! PC = 0xaaaaca660f00 *)
or v4_uint64_0@uint64 v4_uint64_0 v12_uint64_0;
or v4_uint64_1@uint64 v4_uint64_1 v12_uint64_1;
"""

emit += """
(* ushr	v12.2d, v9.2d, #26                         #! PC = 0xaaaaca660f04 *)
shrs v12_uint64_0 dc v9_uint64_0 26;
shrs v12_uint64_1 dc v9_uint64_1 26;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f08 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* sli	v4.2d, v12.2d, #32                          #! PC = 0xaaaaca660f0c *)
cast v4_sint32_0@sint32 v4_uint64_0;
cast v4_sint32_2@sint32 v4_uint64_1;
cast v4_sint32_1@sint32 v12_uint64_0;
cast v4_sint32_3@sint32 v12_uint64_1;
"""

emit += """
(* ushr	v5.2d, v9.2d, #56                          #! PC = 0xaaaaca660f10 *)
shrs v5_uint64_0 dc v9_uint64_0 56;
shrs v5_uint64_1 dc v9_uint64_1 56;
"""

emit += """
(* shl	v12.2d, v10.2d, #8                          #! PC = 0xaaaaca660f14 *)
shls dc v12_uint64_0 v10_uint64_0 8;
shls dc v12_uint64_1 v10_uint64_1 8;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f18 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* orr	v5.16b, v5.16b, v12.16b                     #! PC = 0xaaaaca660f1c *)
or v5_uint64_0@uint64 v5_uint64_0 v12_uint64_0;
or v5_uint64_1@uint64 v5_uint64_1 v12_uint64_1;
"""

emit += """
(* ushr	v12.2d, v10.2d, #22                        #! PC = 0xaaaaca660f20 *)
shrs v12_uint64_0 dc v10_uint64_0 22;
shrs v12_uint64_1 dc v10_uint64_1 22;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f24 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* sli	v5.2d, v12.2d, #32                          #! PC = 0xaaaaca660f28 *)
cast v5_sint32_0@sint32 v5_uint64_0;
cast v5_sint32_2@sint32 v5_uint64_1;
cast v5_sint32_1@sint32 v12_uint64_0;
cast v5_sint32_3@sint32 v12_uint64_1;
"""

emit += """
(* ushr	v6.2d, v10.2d, #52                         #! PC = 0xaaaaca660f2c *)
shrs v6_uint64_0 dc v10_uint64_0 52;
shrs v6_uint64_1 dc v10_uint64_1 52;
"""

emit += """
(* shl	v12.2d, v11.2d, #12                         #! PC = 0xaaaaca660f30 *)
shls dc v12_uint64_0 v11_uint64_0 12;
shls dc v12_uint64_1 v11_uint64_1 12;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f34 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* orr	v6.16b, v6.16b, v12.16b                     #! PC = 0xaaaaca660f38 *)
or v6_uint64_0@uint64 v6_uint64_0 v12_uint64_0;
or v6_uint64_1@uint64 v6_uint64_1 v12_uint64_1;
"""

emit += """
(* ushr	v12.2d, v11.2d, #18                        #! PC = 0xaaaaca660f3c *)
shrs v12_uint64_0 dc v11_uint64_0 18;
shrs v12_uint64_1 dc v11_uint64_1 18;
"""

emit += """
(* and	v12.16b, v12.16b, v1.16b                    #! PC = 0xaaaaca660f40 *)
split dc v12_uint64_0 v12_uint64_0 30;
split dc v12_uint64_1 v12_uint64_1 30;
"""

emit += """
(* sli	v6.2d, v12.2d, #32                          #! PC = 0xaaaaca660f44 *)
cast v6_sint32_0@sint32 v6_uint64_0;
cast v6_sint32_2@sint32 v6_uint64_1;
cast v6_sint32_1@sint32 v12_uint64_0;
cast v6_sint32_3@sint32 v12_uint64_1;
"""

emit += """
(* ushr	v7.2d, v11.2d, #48                         #! PC = 0xaaaaca660f48 *)
shrs v7_uint64_0 dc v11_uint64_0 48;
shrs v7_uint64_1 dc v11_uint64_1 48;
"""

emit += """
spl v7_sint32_1 v7_sint32_0 v7_uint64_0 32;
spl v7_sint32_3 v7_sint32_2 v7_uint64_1 32;
"""

emit += """
(* movi	v8.2d, #0x0                                #! PC = 0xaaaaca660f4c *)
mov v8_sint32_0 0@sint32;
mov v8_sint32_1 0@sint32;
mov v8_sint32_2 0@sint32;
mov v8_sint32_3 0@sint32;
"""

emit += """
(* mov	x2, #0x1                   	// #1           #! PC = 0xaaaaca660f50 *)
mov x2 0x1@uint64;
"""

emit += """
(* mov	v8.d[1], x2                                 #! PC = 0xaaaaca660f54 *)
cast v8_sint32_2@sint32 x2;
"""

emit += """
(* movi	v9.2d, #0x0                                #! PC = 0xaaaaca660f58 *)
mov v9_sint32_0 0@sint32;
mov v9_sint32_1 0@sint32;
mov v9_sint32_2 0@sint32;
mov v9_sint32_3 0@sint32;
"""

emit += """
(* movi	v10.2d, #0x0                               #! PC = 0xaaaaca660f5c *)
mov v10_sint32_0 0@sint32;
mov v10_sint32_1 0@sint32;
mov v10_sint32_2 0@sint32;
mov v10_sint32_3 0@sint32;
"""

emit += """
(* movi	v11.2d, #0x0                               #! PC = 0xaaaaca660f60 *)
mov v11_sint32_0 0@sint32;
mov v11_sint32_1 0@sint32;
mov v11_sint32_2 0@sint32;
mov v11_sint32_3 0@sint32;
"""

emit += """
(* movi	v12.2d, #0x0                               #! PC = 0xaaaaca660f64 *)
mov v12_sint32_0 0@sint32;
mov v12_sint32_1 0@sint32;
mov v12_sint32_2 0@sint32;
mov v12_sint32_3 0@sint32;
"""

emit += """
(* uzp1	v2.4s, v1.4s, v1.4s                        #! PC = 0xaaaaca660f68 *)
spl v1_uint32_1 v1_uint32_0 v1_uint64_0 32;
spl v1_uint32_3 v1_uint32_2 v1_uint64_1 32;
// uzp1 takes even elements: 0, 2
mov v2_uint32_0 v1_uint32_0;
mov v2_uint32_1 v1_uint32_2;
mov v2_uint32_2 v1_uint32_0;
mov v2_uint32_3 v1_uint32_2;
"""

emit += """
(* ldp	x5, x22, [x1]                               #! EA = L0xfffff0a5bc88; Value = 0x0000000000000000; PC = 0xaaaaca660f6c *)
mov x5 L0xfffff0a5bc88; mov x22 L0xfffff0a5bc90;
"""

emit += """
(* mov	x4, #0xffffffffffffffed    	// #-19         #! PC = 0xaaaaca660f70 *)
mov x4 0xffffffffffffffed@uint64;
"""

emit += """
(* mov	x21, #0xffffffffffffffff    	// #-1         #! PC = 0xaaaaca660f74 *)
mov x21 0xffffffffffffffff@uint64;
"""

emit += """
(* mov	x1, x4                                      #! PC = 0xaaaaca660f78 *)
mov x1 x4;
cast x1@sint64 x1;
"""

emit += """
(* mov	x2, x5                                      #! PC = 0xaaaaca660f7c *)
mov x2 x5;
cast x2@sint64 x2;
"""

emit += """
(* mov	x3, #0x1                   	// #1           #! PC = 0xaaaaca660f80 *)
mov x3 0x1@sint64;
"""

emit += """
(* mov	x6, #0x20000000000         	// #2199023255552#! PC = 0xaaaaca660f84 *)
mov x6 0x20000000000@sint64;
"""

emit += """
(* add	x6, x6, #0x100, lsl #12                     #! PC = 0xaaaaca660f88 *)
add x6 x6 1048576@sint64;
"""

emit += """
(* mov	x7, #0x286b0000            	// #678100992   #! PC = 0xaaaaca660f8c *)
(* movk	x7, #0xca1b                                #! PC = 0xaaaaca660f90 *)
mov x7 0x286bca1b@sint64;
"""

emit += """
(* dup	v15.4s, w7                                  #! PC = 0xaaaaca660f94 *)
cast w7@sint32 x7;
mov v15_sint32_0 w7;
mov v15_sint32_1 w7;
mov v15_sint32_2 w7;
mov v15_sint32_3 w7;
"""


emit += """
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


mov f_0_low60_0 x1;
mov g_0_low60_0 x2;
mov f_low128_0 x4;
mov f_low128_1 x21;
mov g_low128_0 x5;
mov g_low128_1 x22;
mov delta x3;
mov const_2p41a2p20 x6;
"""



emit += cl_cut(
    Epred(),
    Rpred(
        cl_rand(
            [f"(const 32 0) <=s F_0_limb30_{i}, F_0_limb30_{i} <=s (const 32 ((2**30)-1))" for i in range(0,8) ],
            f"(const 32 0) <=s F_0_limb30_8, F_0_limb30_8 <=s (const 32 ((2**15)-1))",
            [f"(const 32 0) <=s G_0_limb30_{i}, G_0_limb30_{i} <=s (const 32 ((2**30)-1))" for i in range(0,8) ],
            f"(const 32 0) <=s G_0_limb30_8, G_0_limb30_8 <=s (const 32 ((2**16)-1))",
            [f"(const 32 0) <=s V_0_limb30_{i}, V_0_limb30_{i} <=s (const 32 ((2**30)-1))" for i in range(0,8) ],
            f"(const 32 0) <=s V_0_limb30_8, V_0_limb30_8 <=s (const 32 ((2**16)-1))",
            [f"(const 32 0) <=s S_0_limb30_{i}, S_0_limb30_{i} <=s (const 32 ((2**30)-1))" for i in range(0,8) ],
            f"(const 32 0) <=s S_0_limb30_8, S_0_limb30_8 <=s (const 32 ((2**16)-1))",

            """
    slimbs 30 [
        F_0_limb30_0, F_0_limb30_1, F_0_limb30_2, F_0_limb30_3,
        F_0_limb30_4, F_0_limb30_5, F_0_limb30_6, F_0_limb30_7,
        F_0_limb30_8
    ]
    =
    (const 272 (2**255 - 19))
            """,


            """
    slimbs 30 [
        G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
        G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
        G_0_limb30_8
    ]
    =
    uext (limbs 64 [op_x0, op_x1, op_x2, op_x3]) 16
            """,
            """
    slimbs 30 [
        V_0_limb30_0, V_0_limb30_1, V_0_limb30_2, V_0_limb30_3,
        V_0_limb30_4, V_0_limb30_5, V_0_limb30_6, V_0_limb30_7,
        V_0_limb30_8
    ]
    =
    (const 272 (0))
            """,
            """
    slimbs 30 [
        S_0_limb30_0, S_0_limb30_1, S_0_limb30_2, S_0_limb30_3,
        S_0_limb30_4, S_0_limb30_5, S_0_limb30_6, S_0_limb30_7,
        S_0_limb30_8
    ]
    =
    (const 272 (1))
            """,

            """
    (uext f_0_low60_0 192) = 
    (const 256 ((2**255) - 19))
    (mod (const 256 (2**60)))
            """,

            """
    (uext g_0_low60_0 192) = 
    (limbs 64 [op_x0, op_x1, op_x2, op_x3])
    (mod (const 256 (2**60)))
            """,
            """
    delta = (const 64 1)
            """,
            """
    (uext (limbs 64 [f_low128_0, f_low128_1]) 128) =
    (const 256 ((2**255) - 19))
    (mod (const 256 (2**128)))
            """,
            """
    (uext (limbs 64 [g_low128_0, g_low128_1]) 128) =
    (limbs 64 [op_x0, op_x1, op_x2, op_x3])
    (mod (const 256 (2**128)))
            """,
            """
    const_2p41a2p20 = (const 64 (2**41 + 2**20))
            """,
        )
    )
)

emit += """
// init_fuv_grs
"""

emit += """
(* and	x7, x1, #0xfffff                            #! PC = 0xaaaaca660f98 *)
and x7@sint64 x1 0xfffff@uint64;
"""

emit += """
(* and	x8, x2, #0xfffff                            #! PC = 0xaaaaca660f9c *)
and x8@sint64 x2 0xfffff@uint64;
"""

emit += """
(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaaca660fa0 *)
or x7@sint64 x7 0xfffffe0000000000@uint64;
"""

emit += """
(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaaca660fa4 *)
or x8@sint64 x8 0xc000000000000000@uint64;
"""


emit += """
mov fuv x7;
mov grs x8;
and f_0_low60_0_low20_0@sint64 f_0_low60_0 (2**20 - 1)@sint64;
and g_0_low60_0_low20_0@sint64 g_0_low60_0 (2**20 - 1)@sint64;
mov u_0_20 (-(2**20))@sint64;
mov v_0_20 ( 0)@sint64;
mov r_0_20 ( 0)@sint64;
mov s_0_20 (-(2**20))@sint64;
"""

emit += """
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
"""


emit += """
// divsteps
// step0

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
"""

pc = 0xaaaaca660fd0
for i in range(18):
    pc_base = pc + i* 4 * 9
    # print(hex(pc_base))
    emit += f"""
// divsteps
// step{i+1}

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc_base)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc_base + 4)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc_base + 8)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc_base + 12)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc_base + 16)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc_base + 20)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc_base + 24)} *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = {hex(pc_base + 28)} *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = {hex(pc_base + 32)} *)
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
"""


i = 18
pc_base = pc + i* 4 * 9
emit += f"""
// divsteps
// step{i+1}

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc_base)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc_base + 4)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc_base + 8)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc_base + 12)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc_base + 16)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc_base + 20)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc_base + 24)} *)
add x3 x3 0x2@sint64;
(* asr	x8, x8, #1                                  #! PC = {hex(pc_base + 28)} *)
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
"""

emit += """
nondet f_0_low60_0_low20_20@sint64;
nondet g_0_low60_0_low20_20@sint64;
nondet u_0_20@sint64;
nondet v_0_20@sint64;
nondet r_0_20@sint64;
nondet s_0_20@sint64;

// from lemma we have
"""
emit += cl_assume(
    Epred(
        f"u_0_20 * f_0_low60_0_low20_0 + v_0_20 * g_0_low60_0_low20_0 = f_0_low60_0_low20_0 * (-(2**20))",
        f"r_0_20 * f_0_low60_0_low20_0 + s_0_20 * g_0_low60_0_low20_0 = g_0_low60_0_low20_0 * (-(2**20))"
    ),
    Rpred(
        f"fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42))",
        f"grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42))",

        f"fuv = (const 64 1) (mod (const 64 2))",

        f"(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20",
        f"f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20",
        f"g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1))",

        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20))",

        f"(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1))",
        f"u_0_20 + v_0_20 <=s (const 64 (2**20))",
        f"u_0_20 - v_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20))",
        f"r_0_20 + s_0_20 <=s (const 64 (2**20))",
        f"r_0_20 - s_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))",
    )

)


emit += """
nondet f_0_low60_20@sint64;
nondet g_0_low60_20@sint64;

// by the theory of jumpdivstep, we have
"""
emit += cl_assume(
    Epred(
        f"u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20))",
        f"r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))",
    ),
    Rpred(
        f"f_0_low60_20 = (const 64 1) (mod (const 64 2))",
    )
)


emit += cl_cut(
    Epred(
        f"u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20))",
        f"r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))"
    ),
    Rpred(
        f"fuv = f_0_low60_0_low20_20 + u_0_20 * (const 64 (2**21)) + v_0_20 * (const 64 (2**42))",
        f"grs = g_0_low60_0_low20_20 + r_0_20 * (const 64 (2**21)) + s_0_20 * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s f_0_low60_0_low20_20",
        f"f_0_low60_0_low20_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s g_0_low60_0_low20_20",
        f"g_0_low60_0_low20_20 <=s (const 64 ((2**20)-1))",
        f"f_0_low60_20 = (const 64 1) (mod (const 64 2))",

        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20))",

        f"(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1))",
        f"u_0_20 + v_0_20 <=s (const 64 (2**20))",
        f"u_0_20 - v_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20))",
        f"r_0_20 + s_0_20 <=s (const 64 (2**20))",
        f"r_0_20 - s_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))",
        f"const_2p41a2p20 = (const 64 (2**20 + 2**41))",
    )

)

emit += """
// extraction, step20


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
"""


emit += cl_cut(
    Epred(
        f"u_0_20 * f_0_low60_0 + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-(2**20))",
        f"r_0_20 * f_0_low60_0 + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-(2**20))"
    ),
    Rpred(
        f"f_0_low60_20 = (const 64 1) (mod (const 64 2))",

        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20))",

        f"(const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20)-1))",
        f"u_0_20 + v_0_20 <=s (const 64 (2**20))",
        f"u_0_20 - v_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20))",
        f"r_0_20 + s_0_20 <=s (const 64 (2**20))",
        f"r_0_20 - s_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20))",
        f"(const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20))",

        f"const_2p41a2p20 = (const 64 (2**20 + 2**41))",
    )
)


emit += """
// update_fg


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
(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;


assert true && x1 = (const 64 (-1)) * f_0_low60_20 (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_0_low60_20 (mod (const 64 (2**44)));
mov neg_f_0_low60_20 x1;
mov neg_g_0_low60_20 x2;
"""

emit += """
// init_fuv_grs
"""

emit += """
(* and	x7, x1, #0xfffff                            #! PC = 0xaaaaca6612bc *)
and x7@sint64 x1 0xfffff@uint64;
"""

emit += """
(* and	x8, x2, #0xfffff                            #! PC = 0xaaaaca6612c0 *)
and x8@sint64 x2 0xfffff@uint64;
"""

emit += """
(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaaca6612c4 *)
or x7@sint64 x7 0xfffffe0000000000@uint64;
"""

emit += """
(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaaca6612c8 *)
or x8@sint64 x8 0xc000000000000000@uint64;
"""


emit += """
mov fuv x7;
mov grs x8;
and neg_f_0_low60_20_low20_0@sint64 neg_f_0_low60_20 (2**20 - 1)@sint64;
and neg_g_0_low60_20_low20_0@sint64 neg_g_0_low60_20 (2**20 - 1)@sint64;
mov u_20_40 (-(2**20))@sint64;
mov v_20_40 ( 0)@sint64;
mov r_20_40 ( 0)@sint64;
mov s_20_40 (-(2**20))@sint64;
"""


emit += cl_cut(
    Epred(
f"u_20_40 * neg_f_0_low60_20_low20_0 + v_20_40 * neg_g_0_low60_20_low20_0 = neg_f_0_low60_20_low20_0 * (-(2**20))",
f"r_20_40 * neg_f_0_low60_20_low20_0 + s_20_40 * neg_g_0_low60_20_low20_0 = neg_g_0_low60_20_low20_0 * (-(2**20))",
    ),
    Rpred(
f"fuv = neg_f_0_low60_20_low20_0 + u_20_40 * (const 64 (2**21)) + v_20_40 * (const 64 (2**42))",
f"grs = neg_g_0_low60_20_low20_0 + r_20_40 * (const 64 (2**21)) + s_20_40 * (const 64 (2**42))",
f"(const 64 (-(2**20)+1)) <=s neg_f_0_low60_20_low20_0",
f"neg_f_0_low60_20_low20_0 <=s (const 64 ((2**20)-1))",
f"(const 64 (-(2**20)+1)) <=s neg_g_0_low60_20_low20_0",
f"neg_g_0_low60_20_low20_0 <=s (const 64 ((2**20)-1))",
f"fuv = (const 64 1) (mod (const 64 2))",
f"(const 64 (1 + (-2)*20)) <=s delta, delta <=s (const 64 (1 + 2 * 20))",
f"delta = (const 64 1) (mod (const 64 2))",
f"u_20_40 = (const 64 (-(2**20)))",
f"v_20_40 = (const 64 (0))",
f"r_20_40 = (const 64 (0))",
f"s_20_40 = (const 64 (-(2**20)))",
f"const_2p41a2p20 = (const 64 (2**20 + 2**41))",
    )
)


pc = 0xaaaaca6612cc
i = 20
emit += f"""
// divsteps
// step{i}

(* tst	x8, #0x1                                    #! PC = {hex(pc)} *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc + 4)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc + 8)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc + 12)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc + 16)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc + 20)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc + 24)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc + 28)} *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = {hex(pc + 32)} *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = {hex(pc + 36)} *)
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
"""

pc += 40
for i in range(20,38):
    pc_base = pc + i* 4 * 9
    # print(hex(pc_base))
    emit += f"""
// divsteps
// step{i+1}

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc_base)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc_base + 4)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc_base + 8)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc_base + 12)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc_base + 16)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc_base + 20)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc_base + 24)} *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = {hex(pc_base + 28)} *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = {hex(pc_base + 32)} *)
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
"""


i = 38
pc_base = pc + i* 4 * 9
emit += f"""
// divsteps
// step{i+1}

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc_base)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc_base + 4)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc_base + 8)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc_base + 12)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc_base + 16)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc_base + 20)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc_base + 24)} *)
add x3 x3 0x2@sint64;
(* asr	x8, x8, #1                                  #! PC = {hex(pc_base + 28)} *)
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
"""

emit += """
nondet neg_f_0_low60_20_low20_20@sint64;
nondet neg_g_0_low60_20_low20_20@sint64;
nondet u_20_40@sint64;
nondet v_20_40@sint64;
nondet r_20_40@sint64;
nondet s_20_40@sint64;

// from lemma we have
"""

k = 0
j = 1
i = 19
neg_prefix = ""
if (k + j) % 2 == 1:
    neg_prefix = "neg_"
emit += cl_assume(
        Epred(
            f"u_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + v_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} * (-(2**20))",
            f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + s_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * (-(2**20))",
        ), 
        Rpred(
        f"fuv = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} + u_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + v_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"grs = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} + r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2) * {59*k + 20*j + i+1})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i+1}))",
        # f"(const 64 (-(2**20))) <=s u_0_{i+1}, u_0_{i+1} <=s (const 64 ((2**19)))",
        # f"(const 64 (-(2**20))) <=s v_0_{i+1}, v_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1})) ))",
        # f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s r_0_{i+1}, r_0_{i+1} <=s (const 64 ((2**19)))",
        # f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s s_0_{i+1}, s_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1}))))",
        # f"(const 64 ((2**(20-{i+1}))-(2**19))) <=s (r_0_{i+1} - u_0_{i+1}), (r_0_{i+1} - u_0_{i+1}) <=s (const 64 ((2**20)))",
        # f"(const 64 (-(2**19))) <=s (s_0_{i+1} - v_0_{i+1}), (s_0_{i+1} - v_0_{i+1}) <=s (const 64 ((2**20) - (2**(20 - {i+1}))))",


        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i+1}, u_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i+1}, v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i+1}, r_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i+1}, s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",

        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"s_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        )
    )


emit += f"""
nondet {neg_prefix}f_{59*k}_low60_{20*(j+1)}@sint64;
nondet {neg_prefix}g_{59*k}_low60_{20*(j+1)}@sint64;
nondet f_{59*k}_low60_{20*(j+1)}@sint64;
nondet g_{59*k}_low60_{20*(j+1)}@sint64;
"""


emit += cl_assume(
    Epred(
        f"u_{59*k+20*j}_{59*k+20*j+20} * {neg_prefix}f_0_low60_20 + v_{59*k + 20*j}_{59*k+20*j+20} * {neg_prefix}g_0_low60_20 = {neg_prefix}f_0_low60_40 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+20} * {neg_prefix}f_0_low60_20 + s_{59*k + 20*j}_{59*k+20*j+20} * {neg_prefix}g_0_low60_20 = {neg_prefix}g_0_low60_40 * (-(2**20))",
        f"u_{59*k+20*j}_{59*k+20*j+20} * f_0_low60_20 + v_{59*k + 20*j}_{59*k+20*j+20} * g_0_low60_20 = f_0_low60_40 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+20} * f_0_low60_20 + s_{59*k + 20*j}_{59*k+20*j+20} * g_0_low60_20 = g_0_low60_40 * (-(2**20))",
    )
    ,
    Rpred(
        f"neg_f_{59*k}_low60_{20*j+20} = (const 64 1) (mod (const 64 2))",
    )
)


emit += cl_cut(
    Epred(
        f"u_{59*k+20*j}_{59*k+20*j+20} * {neg_prefix}f_0_low60_20 + v_{59*k + 20*j}_{59*k+20*j+20} * {neg_prefix}g_0_low60_20 = {neg_prefix}f_0_low60_40 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+20} * {neg_prefix}f_0_low60_20 + s_{59*k + 20*j}_{59*k+20*j+20} * {neg_prefix}g_0_low60_20 = {neg_prefix}g_0_low60_40 * (-(2**20))",
        f"u_{59*k+20*j}_{59*k+20*j+20} * f_0_low60_20 + v_{59*k + 20*j}_{59*k+20*j+20} * g_0_low60_20 = f_0_low60_40 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+20} * f_0_low60_20 + s_{59*k + 20*j}_{59*k+20*j+20} * g_0_low60_20 = g_0_low60_40 * (-(2**20))",
    ),
        Rpred(
        cl_line_comment("asd"),
        f"fuv = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} + u_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + v_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"grs = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} + r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2) * {59*k + 20*j + i+1})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i+1}))",
        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i+1}, u_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i+1}, v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i+1}, r_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i+1}, s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"const_2p41a2p20 = (const 64 (2**20 + 2**41))",
        f"neg_f_{59*k}_low60_{20*j+20} = (const 64 1) (mod (const 64 2))",
    )
)


emit += """
// extraction, step 40

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
"""




emit += """
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
u_20_40 + v_20_40 <=s (const 64 (2**20)),
u_20_40 - v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
(const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
r_20_40 + s_20_40 <=s (const 64 (2**20)),
r_20_40 - s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
(const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
const_2p41a2p20 = (const 64 (2**20 + 2**41))
;
"""



emit += """
// update_fg

// we only care about the low 60 bits, casting is required since the syntax of cryptoline
cast x1@sint64 x1;
cast x2@sint64 x2;


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
mov f_0_low60_40 x1;
mov g_0_low60_40 x2;
assert true &&
f_0_low60_40 = (const 64 1) (mod (const 64 2));
"""




emit += cl_cut(Epred(),Rpred(
    """
    and [
        x11 = u_0_20,
        x12 = v_0_20,
        x13 = r_0_20,
        x14 = s_0_20,
        x15 = u_20_40,
        x16 = v_20_40,
        x17 = r_20_40,
        x20 = s_20_40,

        (const 64 (-(2**20))) <=s u_0_20, u_0_20 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s u_20_40, u_20_40 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s v_0_20, v_0_20 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s v_20_40, v_20_40 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s r_0_20, r_0_20 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s r_20_40, r_20_40 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s s_0_20, s_0_20 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s s_20_40, s_20_40 <=s (const 64 ((2**20) - 1)),
        u_20_40 + v_20_40 <=s (const 64 (2**20)),
        u_20_40 - v_20_40 <=s (const 64 (2**20)),
        (const 64 0) - u_20_40 + v_20_40 <=s (const 64 (2**20)),
        (const 64 0) - u_20_40 - v_20_40 <=s (const 64 (2**20)),
        r_20_40 + s_20_40 <=s (const 64 (2**20)),
        r_20_40 - s_20_40 <=s (const 64 (2**20)),
        (const 64 0) - r_20_40 + s_20_40 <=s (const 64 (2**20)),
        (const 64 0) - r_20_40 - s_20_40 <=s (const 64 (2**20)),
        u_0_20 + v_0_20 <=s (const 64 (2**20)),
        u_0_20 - v_0_20 <=s (const 64 (2**20)),
        (const 64 0) - u_0_20 + v_0_20 <=s (const 64 (2**20)),
        (const 64 0) - u_0_20 - v_0_20 <=s (const 64 (2**20)),
        r_0_20 + s_0_20 <=s (const 64 (2**20)),
        r_0_20 - s_0_20 <=s (const 64 (2**20)),
        (const 64 0) - r_0_20 + s_0_20 <=s (const 64 (2**20)),
        (const 64 0) - r_0_20 - s_0_20 <=s (const 64 (2**20)),

        f_0_low60_40 = (const 64 1) (mod (const 64 2))
    ] prove with [all cuts]
    """
))


emit += """
// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)


call update_uuvvrrss(
x11,x12,x13,x14,x15,x16,x17,x20;
x11,x12,x13,x14
);


mov u_0_40 x11;
mov v_0_40 x12;
mov r_0_40 x13;
mov s_0_40 x14;

cut
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
        &&
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40,
    u_0_40 + v_0_40 <=s (const 64 (2**40)),
    u_0_40 - v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
    (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
    r_0_40 + s_0_40 <=s (const 64 (2**40)),
    r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
    (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),
    (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
    (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1))
;
"""

emit += """
(* and	x7, x1, #0xfffff                            #! PC = 0xaaaaca661608 *)
and x7@sint64 x1 0xfffff@uint64;
(* and	x8, x2, #0xfffff                            #! PC = 0xaaaaca66160c *)
and x8@sint64 x2 0xfffff@uint64;
(* orr	x7, x7, #0xfffffe0000000000                 #! PC = 0xaaaaca661610 *)
or x7@sint64 x7 0xfffffe0000000000@uint64;
(* orr	x8, x8, #0xc000000000000000                 #! PC = 0xaaaaca661614 *)
or x8@sint64 x8 0xc000000000000000@uint64;
"""

emit += """
mov fuv x7;
mov grs x8;
and f_0_low60_40_low20_0@sint64 f_0_low60_40 (2**20 - 1)@sint64;
and g_0_low60_40_low20_0@sint64 g_0_low60_40 (2**20 - 1)@sint64;
mov u_40_59 (-(2**20))@sint64;
mov v_40_59 ( 0)@sint64;
mov r_40_59 ( 0)@sint64;
mov s_40_59 (-(2**20))@sint64;
"""

emit += """
cut
u_40_59 * f_0_low60_40_low20_0 + v_40_59 * g_0_low60_40_low20_0 = f_0_low60_40_low20_0 * (-(2**20)),
r_40_59 * f_0_low60_40_low20_0 + s_40_59 * g_0_low60_40_low20_0 = g_0_low60_40_low20_0 * (-(2**20))
&& and
[
fuv = f_0_low60_40_low20_0 + u_40_59 * (const 64 (2**21)) + v_40_59 * (const 64 (2**42)),
grs = g_0_low60_40_low20_0 + r_40_59 * (const 64 (2**21)) + s_40_59 * (const 64 (2**42)),
(const 64 (-(2**20)+1)) <=s f_0_low60_40_low20_0,
f_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
(const 64 (-(2**20)+1)) <=s g_0_low60_40_low20_0,
g_0_low60_40_low20_0 <=s (const 64 ((2**20)-1)),
fuv = (const 64 1) (mod (const 64 2)),
delta = (const 64 1) (mod (const 64 2)),
(const 64 (1 + (-2) * 40)) <=s delta, delta <=s (const 64 (1 + 2*40)),
u_40_59 = (const 64 (-(2**20))),
v_40_59 = (const 64 (0)),
r_40_59 = (const 64 (0)),
s_40_59 = (const 64 (-(2**20))),
const_2p41a2p20 = (const 64 (2**20 + 2**41)) 
] prove with [all cuts]
;
"""


pc = 0xaaaaca661618
i = 40
emit += f"""
// divsteps
// step{i}

(* tst	x8, #0x1                                    #! PC = {hex(pc)} *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc + 4)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc + 8)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc + 12)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc + 16)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc + 20)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc + 24)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc + 28)} *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = {hex(pc + 32)} *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = {hex(pc + 36)} *)
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
"""

pc += 40
for i in range(40,57):
    pc_base = pc + i* 4 * 9
    # print(hex(pc_base))
    emit += f"""
// divsteps
// step{i+1}

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc_base)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc_base + 4)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc_base + 8)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc_base + 12)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc_base + 16)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc_base + 20)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc_base + 24)} *)
add x3 x3 0x2@sint64;
(* tst	x8, #0x2                                    #! PC = {hex(pc_base + 28)} *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = {hex(pc_base + 32)} *)
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
"""


i = 57
pc_base = pc + i* 4 * 9
emit += f"""
// divsteps
// step{i+1}

(* csel	x10, x7, xzr, ne	// ne = any               #! PC = {hex(pc_base)} *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = {hex(pc_base + 4)} *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = {hex(pc_base + 8)} *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = {hex(pc_base + 12)} *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = {hex(pc_base + 16)} *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = {hex(pc_base + 20)} *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = {hex(pc_base + 24)} *)
add x3 x3 0x2@sint64;
(* asr	x8, x8, #1                                  #! PC = {hex(pc_base + 28)} *)
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
"""

emit += """
nondet f_0_low60_40_low20_19@sint64;
nondet g_0_low60_40_low20_19@sint64;
nondet u_40_59@sint64;
nondet v_40_59@sint64;
nondet r_40_59@sint64;
nondet s_40_59@sint64;

// from lemma we have
"""

k = 0
j = 2
i = 18
neg_prefix = ""
if (k + j) % 2 == 1:
    neg_prefix = "neg_"
emit += cl_assume(
        Epred(
            f"u_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + v_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} * (-(2**20))",
            f"r_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}f_{59*k}_low60_{20*j}_low20_0 + s_{59*k + 20*j}_{59*k + 20*j + i+1} * {neg_prefix}g_{59*k}_low60_{20*j}_low20_0 = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} * (-(2**20))",
        ), 
        Rpred(
        f"fuv = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} + u_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + v_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"grs = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} + r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2) * {59*k + 20*j + i+1})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i+1}))",
        # f"(const 64 (-(2**20))) <=s u_0_{i+1}, u_0_{i+1} <=s (const 64 ((2**19)))",
        # f"(const 64 (-(2**20))) <=s v_0_{i+1}, v_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1})) ))",
        # f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s r_0_{i+1}, r_0_{i+1} <=s (const 64 ((2**19)))",
        # f"(const 64 ((2**(20-{i+1}))-(2**20))) <=s s_0_{i+1}, s_0_{i+1} <=s (const 64 ((2**19) - (2**(20 - {i+1}))))",
        # f"(const 64 ((2**(20-{i+1}))-(2**19))) <=s (r_0_{i+1} - u_0_{i+1}), (r_0_{i+1} - u_0_{i+1}) <=s (const 64 ((2**20)))",
        # f"(const 64 (-(2**19))) <=s (s_0_{i+1} - v_0_{i+1}), (s_0_{i+1} - v_0_{i+1}) <=s (const 64 ((2**20) - (2**(20 - {i+1}))))",


        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i+1}, u_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i+1}, v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i+1}, r_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i+1}, s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",

        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"v_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        f"s_{59*k + 20*j}_{59*k + 20*j + i+1} = (const 64 0) (mod (const 64 (2**(20-{i+1}))))",
        )
    )


emit += f"""
nondet f_{59*k}_low60_{20*(j)+(i+1)}@sint64;
nondet g_{59*k}_low60_{20*(j)+(i+1)}@sint64;
"""


emit += cl_assume(
    Epred(
        f"u_{59*k+20*j}_{59*k+20*j+(i+1)} * f_0_low60_40 + v_{59*k + 20*j}_{59*k+20*j+i+1} * g_0_low60_40 = f_0_low60_59 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+(i+1)} * f_0_low60_40 + s_{59*k + 20*j}_{59*k+20*j+i+1} * g_0_low60_40 = g_0_low60_59 * (-(2**20))",
    )
    ,
    Rpred(
        f"f_{59*k}_low60_{20*j+i+1} = (const 64 1) (mod (const 64 2))",
    )
)


emit += cl_cut(
    Epred(
        f"u_{59*k+20*j}_{59*k+20*j+(i+1)} * f_0_low60_40 + v_{59*k + 20*j}_{59*k+20*j+i+1} * g_0_low60_40 = f_0_low60_59 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+(i+1)} * f_0_low60_40 + s_{59*k + 20*j}_{59*k+20*j+i+1} * g_0_low60_40 = g_0_low60_59 * (-(2**20))",
    ),
        Rpred(
        f"fuv = {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} + u_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + v_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"grs = {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} + r_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**21)) + s_{59*k + 20*j}_{59*k + 20*j + i+1} * (const 64 (2**42))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}f_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20)+1)) <=s {neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1}",
        f"{neg_prefix}g_{59*k}_low60_{20*j}_low20_{i+1} <=s (const 64 ((2**20)-1))",
        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2) * {59*k + 20*j + i+1})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i+1}))",
        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i+1}, u_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i+1}, v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i+1}, r_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i+1}, s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"const_2p41a2p20 = (const 64 (2**20 + 2**41))",
        f"f_{59*k}_low60_{20*j+i+1} = (const 64 1) (mod (const 64 2))",
    )
)


emit += """
// extraction, step 59

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

assert true && x15 = u_40_59;
assert true && x16 = v_40_59;
assert true && x17 = r_40_59;
assert true && x20 = s_40_59;
assume x15 = u_40_59 && true;
assume x16 = v_40_59 && true;
assume x17 = r_40_59 && true;
assume x20 = s_40_59 && true;

mov u_40_59 x15;
mov v_40_59 x16;
mov r_40_59 x17;
mov s_40_59 x20;
"""




emit += cl_cut(
    Epred(
        f"u_{59*k+20*j}_{59*k+20*j+(i+1)} * f_0_low60_40 + v_{59*k + 20*j}_{59*k+20*j+i+1} * g_0_low60_40 = f_0_low60_59 * (-(2**20))",
        f"r_{59*k+20*j}_{59*k+20*j+(i+1)} * f_0_low60_40 + s_{59*k + 20*j}_{59*k+20*j+i+1} * g_0_low60_40 = g_0_low60_59 * (-(2**20))",
    ),
        Rpred(
        f"delta = (const 64 1) (mod (const 64 2))",
        f"(const 64 (1 + (-2) * {59*k + 20*j + i+1})) <=s delta, delta <=s (const 64 (1 + 2*{59*k + 20*j + i+1}))",
        f"(const 64 (-(2**20))) <=s u_{59*k + 20*j}_{59*k + 20*j + i+1}, u_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s v_{59*k + 20*j}_{59*k + 20*j + i+1}, v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s r_{59*k + 20*j}_{59*k + 20*j + i+1}, r_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"(const 64 (-(2**20))) <=s s_{59*k + 20*j}_{59*k + 20*j + i+1}, s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 ((2**20)-1))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} + v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - u_{59*k + 20*j}_{59*k + 20*j + i+1} - v_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} + s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"(const 64 0) - r_{59*k + 20*j}_{59*k + 20*j + i+1} - s_{59*k + 20*j}_{59*k + 20*j + i+1} <=s (const 64 (2**20))",
        f"const_2p41a2p20 = (const 64 (2**20 + 2**41))",
        f"f_{59*k}_low60_{20*j+i+1} = (const 64 1) (mod (const 64 2))",
    )
)









emit += cl_cut(Epred(),Rpred(
    """
    and [
        x11 = u_0_40,
        x12 = v_0_40,
        x13 = r_0_40,
        x14 = s_0_40,
        x15 = u_40_59,
        x16 = v_40_59,
        x17 = r_40_59,
        x20 = s_40_59,

        (const 64 (-(2**40))) <=s u_0_40, u_0_40 <=s (const 64 ((2**40) - 1)),
        (const 64 (-(2**40))) <=s v_0_40, v_0_40 <=s (const 64 ((2**40) - 1)),
        (const 64 (-(2**40))) <=s r_0_40, r_0_40 <=s (const 64 ((2**40) - 1)),
        (const 64 (-(2**40))) <=s s_0_40, s_0_40 <=s (const 64 ((2**40) - 1)),

        (const 64 (-(2**20))) <=s u_40_59, u_40_59 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s v_40_59, v_40_59 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s r_40_59, r_40_59 <=s (const 64 ((2**20) - 1)),
        (const 64 (-(2**20))) <=s s_40_59, s_40_59 <=s (const 64 ((2**20) - 1)),
        u_40_59 + v_40_59 <=s (const 64 (2**20)),
        u_40_59 - v_40_59 <=s (const 64 (2**20)),
        (const 64 0) - u_40_59 + v_40_59 <=s (const 64 (2**20)),
        (const 64 0) - u_40_59 - v_40_59 <=s (const 64 (2**20)),
        r_40_59 + s_40_59 <=s (const 64 (2**20)),
        r_40_59 - s_40_59 <=s (const 64 (2**20)),
        (const 64 0) - r_40_59 + s_40_59 <=s (const 64 (2**20)),
        (const 64 0) - r_40_59 - s_40_59 <=s (const 64 (2**20)),
        u_0_40 + v_0_40 <=s (const 64 (2**40)),
        u_0_40 - v_0_40 <=s (const 64 (2**40)),
        (const 64 0) - u_0_40 + v_0_40 <=s (const 64 (2**40)),
        (const 64 0) - u_0_40 - v_0_40 <=s (const 64 (2**40)),
        r_0_40 + s_0_40 <=s (const 64 (2**40)),
        r_0_40 - s_0_40 <=s (const 64 (2**40)),
        (const 64 0) - r_0_40 + s_0_40 <=s (const 64 (2**40)),
        (const 64 0) - r_0_40 - s_0_40 <=s (const 64 (2**40)),

        f_0_low60_59 = (const 64 1) (mod (const 64 2))
    ] prove with [all cuts]
    """
))


emit += """
// update_uuvvrrss
(* mul	x9, x15, x11                                #! PC = 0xaaaaca6615e0 *)
(* madd	x10, x16, x13, x9                          #! PC = 0xaaaaca6615e4 *)
(* mul	x9, x17, x11                                #! PC = 0xaaaaca6615e8 *)
(* madd	x13, x20, x13, x9                          #! PC = 0xaaaaca6615ec *)
(* mov	x11, x10                                    #! PC = 0xaaaaca6615f0 *)
(* mul	x9, x15, x12                                #! PC = 0xaaaaca6615f4 *)
(* madd	x10, x16, x14, x9                          #! PC = 0xaaaaca6615f8 *)
(* mul	x9, x17, x12                                #! PC = 0xaaaaca6615fc *)
(* madd	x14, x20, x14, x9                          #! PC = 0xaaaaca661600 *)
(* mov	x12, x10                                    #! PC = 0xaaaaca661604 *)


call update_uuvvrrss_2(
x11,x12,x13,x14,x15,x16,x17,x20;
x11,x12,x13,x14
);


mov u_0_59 x11;
mov v_0_59 x12;
mov r_0_59 x13;
mov s_0_59 x14;

assert 
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59
    &&
    u_40_59 * u_0_40 + v_40_59 * r_0_40 = u_0_59,
    u_40_59 * v_0_40 + v_40_59 * s_0_40 = v_0_59,
    r_40_59 * u_0_40 + s_40_59 * r_0_40 = r_0_59,
    r_40_59 * v_0_40 + s_40_59 * s_0_40 = s_0_59,
u_0_59 + v_0_59 <=s (const 64 (2**60)),
u_0_59 - v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 + v_0_59 <=s (const 64 (2**60)),
(const 64 0) - u_0_59 - v_0_59 <=s (const 64 (2**60)),
r_0_59 + s_0_59 <=s (const 64 (2**60)),
r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 + s_0_59 <=s (const 64 (2**60)),
(const 64 0) - r_0_59 - s_0_59 <=s (const 64 (2**60)),
(const 64 (-(2**60))) <=s u_0_59, u_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v_0_59, v_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r_0_59, r_0_59 <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s_0_59, s_0_59 <=s (const 64 ((2**60) - 1))
;
"""


emit += """
(* mov	x19, #0x9                   	// #9          #! PC = 0xaaaaca661914 *)
mov x19 9@uint64;

nondet %v16@int64[2];
nondet %v17@int64[2];


(* 	mov	v16.d[0], x11                               #! PC = 0xaaaae76b1918 *)
mov %v16 [x11, %v16[1]];
(* 	mov	v16.d[1], x13                               #! PC = 0xaaaae76b191c *)
mov %v16 [%v16[0], x13];
(* 	mov	v17.d[0], x12                               #! PC = 0xaaaae76b1920 *)
mov %v17 [x12, %v17[1]];
(* 	mov	v17.d[1], x14                               #! PC = 0xaaaae76b1924 *)
mov %v17 [%v17[0], x14];
(* 	uzp1	v13.4s, v16.4s, v17.4s                     #! PC = 0xaaaae76b1928 *)
cast %v16@int32[4] %v16;
cast %v17@int32[4] %v17;
mov %v13 [%v16[0], %v16[2], %v17[0], %v17[2]];
# (* 	and	v13.16b, v13.16b, v2.16b                    #! PC = 0xaaaae76b192c *)
# and %v13@int32[4] %v13 %v2;
# (* 	sshr	v16.2d, v16.2d, #30                        #! PC = 0xaaaae76b1930 *)
# cast %v16@int64[2] %v16;
# split %v16 %dc %v16 30;
# (* 	sshr	v17.2d, v17.2d, #30                        #! PC = 0xaaaae76b1934 *)
# cast %v17@int64[2] %v17;
# split %v17 %dc %v17 30;
# (* 	uzp1	v14.4s, v16.4s, v17.4s                     #! PC = 0xaaaae76b1938 *)
# cast %v16@int32[4] %v16;
# cast %v17@int32[4] %v17;
# mov %v14 [%v16[0], %v16[2], %v17[0], %v17[2]];





"""



with open("inverse.cl", "w") as f:
    f.write((emit))

