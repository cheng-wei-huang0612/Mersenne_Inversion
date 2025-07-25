.include "snap.inc"
.global inverse
.global _inverse
inverse:
_inverse:
stp x29, x30, [sp, #-16]!
mov x29, sp
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp q8, q9, [sp, #-32]!
stp q10, q11, [sp, #-32]!
stp q12, q13, [sp, #-32]!
stp q14, q15, [sp, #-32]!
ldp q5, q6, [x1]
movi v4.2d, #-1
mov x2, #-1
lsr x2, x2, #1
ins v3.d[1], x2
mov x2, #-19
ins v3.d[0], x2
zip1 v8.2d, v3.2d, v5.2d
zip2 v9.2d, v4.2d, v5.2d
zip1 v10.2d, v4.2d, v6.2d
zip2 v11.2d, v3.2d, v6.2d
ushr v1.2d, v4.2d, #34
and v3.16b, v8.16b, v1.16b
ushr v12.2d, v8.2d, #30
and v12.16b, v12.16b, v1.16b
shl v12.2d, v12.2d, #32
orr v3.16b, v3.16b, v12.16b
ushr v4.2d, v8.2d, #60
shl v12.2d, v9.2d, #4
and v12.16b, v12.16b, v1.16b
orr v4.16b, v4.16b, v12.16b
ushr v12.2d, v9.2d, #26
and v12.16b, v12.16b, v1.16b
shl v12.2d, v12.2d, #32
orr v4.16b, v4.16b, v12.16b
ushr v5.2d, v9.2d, #56
shl v12.2d, v10.2d, #8
and v12.16b, v12.16b, v1.16b
orr v5.16b, v5.16b, v12.16b
ushr v12.2d, v10.2d, #22
and v12.16b, v12.16b, v1.16b
shl v12.2d, v12.2d, #32
orr v5.16b, v5.16b, v12.16b
ushr v6.2d, v10.2d, #52
shl v12.2d, v11.2d, #12
and v12.16b, v12.16b, v1.16b
orr v6.16b, v6.16b, v12.16b
ushr v12.2d, v11.2d, #18
and v12.16b, v12.16b, v1.16b
shl v12.2d, v12.2d, #32
orr v6.16b, v6.16b, v12.16b
ushr v7.2d, v11.2d, #48
movi v8.2d, #0
mov  x2, #1
ins  v8.d[1], x2
movi v9.2d, #0
movi v10.2d, #0
movi v11.2d, #0
movi v12.2d, #0
uzp1 v2.4s, v1.4s, v1.4s
ldp x23, x24, [x1]
ldp x25, x26, [x1, #16]
mov x19, #-19
mov x20, #-1
mov x21, #-1
mov x22, #-1
lsr x22, x22, #1
ldr x2, [x1]
mov x1, #-19
mov x3, #1
movz x4, #512, LSL #32
movz x5, #16384, LSL #48
add  x6, x4, #1048576
movz  x7, #10347, LSL #16
movk  x7, #51739
dup  v15.4s, w7



// ----------------------------------------



and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
SNAP_SCALAR_REG x1, "f =" 
SNAP_SCALAR_REG x2, "g =" 
SNAP_SCALAR_REG x7, "FUV =" 
SNAP_SCALAR_REG x8, "GRS =" 
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
SNAP_SCALAR_REG x7, "FUV =" 
SNAP_SCALAR_REG x8, "GRS =" 
add x12, x7, x6
asr x12, x12, #42
add x11, x7, #1048576
lsl x11, x11, #22
asr x11, x11, #43
add x14, x8, x6
asr x14, x14, #42
add x13, x8, #1048576
lsl x13, x13, #22
asr x13, x13, #43
mul x9, x11, x1
madd x9, x12, x2, x9
asr x9, x9, #20
mul x10, x13, x1
madd x10, x14, x2, x10
asr x10, x10, #20
mov x1, x9
mov x2, x10
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x28, x8, x6
asr x28, x28, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x1
madd x9, x16, x2, x9
asr x9, x9, #20
mul x10, x17, x1
madd x10, x28, x2, x10
asr x10, x10, #20
mov x1, x9
mov x2, x10
madd x9, x15, x11, XZR
madd x10,  x16, x13, x9
madd x9, x17, x11, XZR
madd x13, x28, x13, x9
mov x11, x10
madd x9, x15, x12, XZR
madd x10,  x16, x14, x9
madd x9, x17, x12, XZR
madd x14, x28, x14, x9
mov x12, x10
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x28, x8, x6
asr x28, x28, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
madd x9, x15, x11, XZR
madd x10,  x16, x13, x9
madd x9, x17, x11, XZR
madd x13, x28, x13, x9
mov x11, x10
madd x9, x15, x12, XZR
madd x10,  x16, x14, x9
madd x9, x17, x12, XZR
madd x14, x28, x14, x9
mov x12, x10
SNAP_SCALAR_REG x11, "uu =" 
SNAP_SCALAR_REG x12, "vv =" 
SNAP_SCALAR_REG x13, "rr =" 
SNAP_SCALAR_REG x14, "ss =" 
SNAP_SCALAR_REG x19, "before update F0 =" 
SNAP_SCALAR_REG x20, "before update F1 =" 
SNAP_SCALAR_REG x21, "before update F2 =" 
SNAP_SCALAR_REG x22, "before update F3 =" 
SNAP_SCALAR_REG x23, "before update G0 =" 
SNAP_SCALAR_REG x24, "before update G1 =" 
SNAP_SCALAR_REG x25, "before update G2 =" 
SNAP_SCALAR_REG x26, "before update G3 =" 
cmp x11, xzr
csetm x15, mi
cneg x11, x11, mi
cmp x12, xzr
csetm x16, mi
cneg x12, x12, mi
cmp x13, xzr
csetm x17, mi
cneg x13, x13, mi
cmp x14, xzr
csetm x28, mi
cneg x14, x14, mi
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
SNAP_SCALAR_REG x11, "[during update] uu =" 
SNAP_SCALAR_REG x12, "[during update] vv =" 
SNAP_SCALAR_REG x13, "[during update] rr =" 
SNAP_SCALAR_REG x14, "[during update] ss =" 
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
and x1, x11, x15
and x2, x12, x16
add x7, x1, x2
SNAP_SCALAR_REG x13, "[during update] rr () =" 
SNAP_SCALAR_REG x17, "[during update] sign_rr () =" 
SNAP_SCALAR_REG x14, "[during update] ss () =" 
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
and x1, x13, x17
SNAP_SCALAR_REG x1, "[during update] tmp0 () =" 
and x2, x14, x28
SNAP_SCALAR_REG x2, "[during update] tmp1 () =" 
add x8, x1, x2
SNAP_SCALAR_REG x8, "[during update] car1 () =" 
eor x2, x19, x15
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x11
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x11
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
adds x9, x7, x1
SNAP_SCALAR_REG x9, "[during update] tmp4 (correct) =" 
adc x7, xzr, x2
SNAP_SCALAR_REG x7, "[during update] tmp2 (correct) =" 
eor x2, x23, x16
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x12
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x12
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
adds x9, x9, x1
SNAP_SCALAR_REG x9, "[during update] tmp4 (correct) =" 
adc x7, x7, x2
SNAP_SCALAR_REG x7, "[during update] tmp2 (correct) =" 
eor x2, x19, x17
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x13
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x13
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
SNAP_SCALAR_REG x8, "[during update] car1 () =" 
adds x10, x8, x1
SNAP_SCALAR_REG x10, "[during update] tmp5 () =" 
adc x8, xzr, x2
eor x2, x23, x28
mul x1, x2, x14
umulh x2, x2, x14
adds x10, x10, x1
adc x8, x8, x2
eor x2, x20, x15
mul x1, x2, x11
umulh x2, x2, x11
adds x7, x7, x1
adc x27, xzr, x2
eor x2, x24, x16
mul x1, x2, x12
umulh x2, x2, x12
adds x7, x7, x1
adc x27, x27, x2
extr x19, x7, x9, #60
eor x2, x20, x17
mul x1, x2, x13
umulh x2, x2, x13
adds x8, x8, x1
adc x9, xzr, x2
eor x2, x24, x28
mul x1, x2, x14
umulh x2, x2, x14
SNAP_SCALAR_REG x8, "[during update] tmp3 =" 
SNAP_SCALAR_REG x1, "[during update] tmp0 =" 
adds x8, x8, x1
adc x9, x9, x2
SNAP_SCALAR_REG x8, "[during update] tmp3 =" 
SNAP_SCALAR_REG x10, "[during update] tmp5 =" 
extr x23, x8, x10, #60
SNAP_SCALAR_REG x23, "[during update] G0 =" 
eor x2, x21, x15
mul x1, x2, x11
umulh x2, x2, x11
adds x27, x27, x1
adc x10, xzr, x2
eor x2, x25, x16
mul x1, x2, x12
umulh x2, x2, x12
adds x27, x27, x1
adc x10, x10, x2
extr x20, x27, x7, #60
eor x2, x21, x17
mul x1, x2, x13
umulh x2, x2, x13
adds x9, x9, x1
adc x7, xzr, x2
eor x2, x25, x28
mul x1, x2, x14
umulh x2, x2, x14
adds x9, x9, x1
adc x7, x7, x2
extr x24, x9, x8, #60
eor x2, x22, x15
asr x8, x2, #63
and x8, x8, x11
neg x8, x8
mul x1, x2, x11
umulh x2, x2, x11
adds x10, x10, x1
adc  x8, x8, x2
eor x2, x26, x16
asr x1, x2, #63
and x1, x1, x12
sub x8, x8, x1
mul x1, x2, x12
umulh x2, x2, x12
adds x10, x10, x1
adc x8, x8, x2
extr x21, x10, x27, #60
extr x22, x8, x10, #60
eor x2, x22, x17
asr x10, x2, #63
and x10, x10, x13
neg x10, x10
mul x1, x2, x13
umulh x2, x2, x13
adds x7, x7, x1
adc  x10, x10, x2
eor x2, x26, x28
asr x1, x2, #63
and x1, x1, x14
sub x10, x10, x1
mul x1, x2, x14
umulh x2, x2, x14
adds x7, x7, x1
adc x10, x10, x2
extr x25, x7, x9, #60
extr x26, x10, x7, #60
SNAP_SCALAR_REG x19, "after  update F0 =" 
SNAP_SCALAR_REG x20, "after  update F1 =" 
SNAP_SCALAR_REG x21, "after  update F2 =" 
SNAP_SCALAR_REG x22, "after  update F3 =" 
SNAP_SCALAR_REG x23, "after  update G0 =" 
SNAP_SCALAR_REG x24, "after  update G1 =" 
SNAP_SCALAR_REG x25, "after  update G2 =" 
SNAP_SCALAR_REG x26, "after  update G3 =" 
ins v13.s[0], w11
ins v13.s[1], w13
ins v13.s[2], w12
ins v13.s[3], w14
and v13.16b, v13.16b, v2.16b
asr x11, x11, #30
asr x12, x12, #30
asr x13, x13, #30
asr x14, x14, #30
ins v14.s[0], w11
ins v14.s[1], w13
ins v14.s[2], w12
ins v14.s[3], w14
mov x9, #19
dup v16.2d, x9
// limb 0
smull  v17.2d, v13.2s, v8.s[0]
smlal2 v17.2d, v13.4s, v8.s[2]
mul v19.4s, v17.4s, v15.4s
and v19.16b, v19.16b, v1.16b
uzp1 v19.4s, v19.4s, v19.4s
smlsl v17.2d, v19.2s, v16.s[0]
sshr   v17.2d, v17.2d, #30
// limb 1
smlal  v17.2d, v14.2s, v8.s[0]
smlal2 v17.2d, v14.4s, v8.s[2]
smlal  v17.2d, v13.2s, v8.s[1]
smlal2 v17.2d, v13.4s, v8.s[3]
mul    v20.4s, v17.4s, v15.4s
and    v20.16b, v20.16b, v1.16b
uzp1   v20.4s, v20.4s, v20.4s
smlsl  v17.2d, v20.2s, v16.s[0]
sshr   v17.2d, v17.2d, #30
// limb 2
smlal  v17.2d, v14.2s, v8.s[1]
smlal2 v17.2d, v14.4s, v8.s[3]
smlal  v17.2d, v13.2s, v9.s[0]
smlal2 v17.2d, v13.4s, v9.s[2]
and    v8.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 3
smlal  v17.2d, v14.2s, v9.s[0]
smlal2 v17.2d, v14.4s, v9.s[2]
smlal  v17.2d, v13.2s, v9.s[1]
smlal2 v17.2d, v13.4s, v9.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v8.16b, v8.16b, v18.16b
// limb 4
smlal  v17.2d, v14.2s, v9.s[1]
smlal2 v17.2d, v14.4s, v9.s[3]
smlal  v17.2d, v13.2s, v10.s[0]
smlal2 v17.2d, v13.4s, v10.s[2]
and    v9.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 5
smlal  v17.2d, v14.2s, v10.s[0]
smlal2 v17.2d, v14.4s, v10.s[2]
smlal  v17.2d, v13.2s, v10.s[1]
smlal2 v17.2d, v13.4s, v10.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v9.16b, v9.16b, v18.16b
// limb 6
smlal  v17.2d, v14.2s, v10.s[1]
smlal2 v17.2d, v14.4s, v10.s[3]
smlal  v17.2d, v13.2s, v11.s[0]
smlal2 v17.2d, v13.4s, v11.s[2]
and    v10.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 7
smlal  v17.2d, v14.2s, v11.s[0]
smlal2 v17.2d, v14.4s, v11.s[2]
smlal  v17.2d, v13.2s, v11.s[1]
smlal2 v17.2d, v13.4s, v11.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v10.16b, v10.16b, v18.16b
// limb 8
smlal  v17.2d, v14.2s, v11.s[1]
smlal2 v17.2d, v14.4s, v11.s[3]
smlal  v17.2d, v13.2s, v12.s[0]
smlal2 v17.2d, v13.4s, v12.s[2]
ushll  v19.2d, v19.2s, #15
add    v17.2d, v17.2d, v19.2d
and    v11.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 9
smlal  v17.2d, v14.2s, v12.s[0]
smlal2 v17.2d, v14.4s, v12.s[2]
ushll  v20.2d, v20.2s, #15
add    v17.2d, v17.2d, v20.2d
and    v18.16b, v17.16b, v1.16b
sshr   v12.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v11.16b, v11.16b, v18.16b
sshr   v18.2d, v12.2d, #15
shl    v17.2d, v18.2d, #15
sub    v12.2d, v12.2d, v17.2d
mla    v8.4s, v18.4s, v16.4s
mov x29, #8
big_loop:
mov x1, x19
mov x2, x23
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x12, x7, x6
asr x12, x12, #42
add x11, x7, #1048576
lsl x11, x11, #22
asr x11, x11, #43
add x14, x8, x6
asr x14, x14, #42
add x13, x8, #1048576
lsl x13, x13, #22
asr x13, x13, #43
mul x9, x11, x1
madd x9, x12, x2, x9
asr x9, x9, #20
mul x10, x13, x1
madd x10, x14, x2, x10
asr x10, x10, #20
mov x1, x9
mov x2, x10
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x28, x8, x6
asr x28, x28, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x1
madd x9, x16, x2, x9
asr x9, x9, #20
mul x10, x17, x1
madd x10, x28, x2, x10
asr x10, x10, #20
mov x1, x9
mov x2, x10
madd x9, x15, x11, XZR
madd x10,  x16, x13, x9
madd x9, x17, x11, XZR
madd x13, x28, x13, x9
mov x11, x10
madd x9, x15, x12, XZR
madd x10,  x16, x14, x9
madd x9, x17, x12, XZR
madd x14, x28, x14, x9
mov x12, x10
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 19
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x28, x8, x6
asr x28, x28, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
madd x9, x15, x11, XZR
madd x10,  x16, x13, x9
madd x9, x17, x11, XZR
madd x13, x28, x13, x9
mov x11, x10
madd x9, x15, x12, XZR
madd x10,  x16, x14, x9
madd x9, x17, x12, XZR
madd x14, x28, x14, x9
mov x12, x10
ins v13.s[0], w11
ins v13.s[1], w13
ins v13.s[2], w12
ins v13.s[3], w14
and v13.16b, v13.16b, v2.16b
asr x11, x11, #30
asr x12, x12, #30
asr x13, x13, #30
asr x14, x14, #30
ins v14.s[0], w11
ins v14.s[1], w13
ins v14.s[2], w12
ins v14.s[3], w14
cmp x11, xzr
csetm x15, mi
cneg x11, x11, mi
cmp x12, xzr
csetm x16, mi
cneg x12, x12, mi
cmp x13, xzr
csetm x17, mi
cneg x13, x13, mi
cmp x14, xzr
csetm x28, mi
cneg x14, x14, mi
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
SNAP_SCALAR_REG x11, "[during update] uu =" 
SNAP_SCALAR_REG x12, "[during update] vv =" 
SNAP_SCALAR_REG x13, "[during update] rr =" 
SNAP_SCALAR_REG x14, "[during update] ss =" 
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
and x1, x11, x15
and x2, x12, x16
add x7, x1, x2
SNAP_SCALAR_REG x13, "[during update] rr () =" 
SNAP_SCALAR_REG x17, "[during update] sign_rr () =" 
SNAP_SCALAR_REG x14, "[during update] ss () =" 
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
and x1, x13, x17
SNAP_SCALAR_REG x1, "[during update] tmp0 () =" 
and x2, x14, x28
SNAP_SCALAR_REG x2, "[during update] tmp1 () =" 
add x8, x1, x2
SNAP_SCALAR_REG x8, "[during update] car1 () =" 
eor x2, x19, x15
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x11
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x11
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
adds x9, x7, x1
SNAP_SCALAR_REG x9, "[during update] tmp4 (correct) =" 
adc x7, xzr, x2
SNAP_SCALAR_REG x7, "[during update] tmp2 (correct) =" 
eor x2, x23, x16
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x12
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x12
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
adds x9, x9, x1
SNAP_SCALAR_REG x9, "[during update] tmp4 (correct) =" 
adc x7, x7, x2
SNAP_SCALAR_REG x7, "[during update] tmp2 (correct) =" 
eor x2, x19, x17
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x13
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x13
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
SNAP_SCALAR_REG x8, "[during update] car1 () =" 
adds x10, x8, x1
SNAP_SCALAR_REG x10, "[during update] tmp5 () =" 
adc x8, xzr, x2
eor x2, x23, x28
mul x1, x2, x14
umulh x2, x2, x14
adds x10, x10, x1
adc x8, x8, x2
eor x2, x20, x15
mul x1, x2, x11
umulh x2, x2, x11
adds x7, x7, x1
adc x27, xzr, x2
eor x2, x24, x16
mul x1, x2, x12
umulh x2, x2, x12
adds x7, x7, x1
adc x27, x27, x2
extr x19, x7, x9, #60
eor x2, x20, x17
mul x1, x2, x13
umulh x2, x2, x13
adds x8, x8, x1
adc x9, xzr, x2
eor x2, x24, x28
mul x1, x2, x14
umulh x2, x2, x14
SNAP_SCALAR_REG x8, "[during update] tmp3 =" 
SNAP_SCALAR_REG x1, "[during update] tmp0 =" 
adds x8, x8, x1
adc x9, x9, x2
SNAP_SCALAR_REG x8, "[during update] tmp3 =" 
SNAP_SCALAR_REG x10, "[during update] tmp5 =" 
extr x23, x8, x10, #60
SNAP_SCALAR_REG x23, "[during update] G0 =" 
eor x2, x21, x15
mul x1, x2, x11
umulh x2, x2, x11
adds x27, x27, x1
adc x10, xzr, x2
eor x2, x25, x16
mul x1, x2, x12
umulh x2, x2, x12
adds x27, x27, x1
adc x10, x10, x2
extr x20, x27, x7, #60
eor x2, x21, x17
mul x1, x2, x13
umulh x2, x2, x13
adds x9, x9, x1
adc x7, xzr, x2
eor x2, x25, x28
mul x1, x2, x14
umulh x2, x2, x14
adds x9, x9, x1
adc x7, x7, x2
extr x24, x9, x8, #60
eor x2, x22, x15
asr x8, x2, #63
and x8, x8, x11
neg x8, x8
mul x1, x2, x11
umulh x2, x2, x11
adds x10, x10, x1
adc  x8, x8, x2
eor x2, x26, x16
asr x1, x2, #63
and x1, x1, x12
sub x8, x8, x1
mul x1, x2, x12
umulh x2, x2, x12
adds x10, x10, x1
adc x8, x8, x2
extr x21, x10, x27, #60
extr x22, x8, x10, #60
eor x2, x22, x17
asr x10, x2, #63
and x10, x10, x13
neg x10, x10
mul x1, x2, x13
umulh x2, x2, x13
adds x7, x7, x1
adc  x10, x10, x2
eor x2, x26, x28
asr x1, x2, #63
and x1, x1, x14
sub x10, x10, x1
mul x1, x2, x14
umulh x2, x2, x14
adds x7, x7, x1
adc x10, x10, x2
extr x25, x7, x9, #60
extr x26, x10, x7, #60
mov x9, #19
dup v16.2d, x9
// limb 0
smull  v17.2d, v13.2s, v8.s[0]
smlal2 v17.2d, v13.4s, v8.s[2]
mul v19.4s, v17.4s, v15.4s
and v19.16b, v19.16b, v1.16b
uzp1 v19.4s, v19.4s, v19.4s
smlsl v17.2d, v19.2s, v16.s[0]
sshr   v17.2d, v17.2d, #30
// limb 1
smlal  v17.2d, v14.2s, v8.s[0]
smlal2 v17.2d, v14.4s, v8.s[2]
smlal  v17.2d, v13.2s, v8.s[1]
smlal2 v17.2d, v13.4s, v8.s[3]
mul    v20.4s, v17.4s, v15.4s
and    v20.16b, v20.16b, v1.16b
uzp1   v20.4s, v20.4s, v20.4s
smlsl  v17.2d, v20.2s, v16.s[0]
sshr   v17.2d, v17.2d, #30
// limb 2
smlal  v17.2d, v14.2s, v8.s[1]
smlal2 v17.2d, v14.4s, v8.s[3]
smlal  v17.2d, v13.2s, v9.s[0]
smlal2 v17.2d, v13.4s, v9.s[2]
and    v8.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 3
smlal  v17.2d, v14.2s, v9.s[0]
smlal2 v17.2d, v14.4s, v9.s[2]
smlal  v17.2d, v13.2s, v9.s[1]
smlal2 v17.2d, v13.4s, v9.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v8.16b, v8.16b, v18.16b
// limb 4
smlal  v17.2d, v14.2s, v9.s[1]
smlal2 v17.2d, v14.4s, v9.s[3]
smlal  v17.2d, v13.2s, v10.s[0]
smlal2 v17.2d, v13.4s, v10.s[2]
and    v9.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 5
smlal  v17.2d, v14.2s, v10.s[0]
smlal2 v17.2d, v14.4s, v10.s[2]
smlal  v17.2d, v13.2s, v10.s[1]
smlal2 v17.2d, v13.4s, v10.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v9.16b, v9.16b, v18.16b
// limb 6
smlal  v17.2d, v14.2s, v10.s[1]
smlal2 v17.2d, v14.4s, v10.s[3]
smlal  v17.2d, v13.2s, v11.s[0]
smlal2 v17.2d, v13.4s, v11.s[2]
and    v10.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 7
smlal  v17.2d, v14.2s, v11.s[0]
smlal2 v17.2d, v14.4s, v11.s[2]
smlal  v17.2d, v13.2s, v11.s[1]
smlal2 v17.2d, v13.4s, v11.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v10.16b, v10.16b, v18.16b
// limb 8
smlal  v17.2d, v14.2s, v11.s[1]
smlal2 v17.2d, v14.4s, v11.s[3]
smlal  v17.2d, v13.2s, v12.s[0]
smlal2 v17.2d, v13.4s, v12.s[2]
ushll  v19.2d, v19.2s, #15
add    v17.2d, v17.2d, v19.2d
and    v11.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 9
smlal  v17.2d, v14.2s, v12.s[0]
smlal2 v17.2d, v14.4s, v12.s[2]
ushll  v20.2d, v20.2s, #15
add    v17.2d, v17.2d, v20.2d
and    v18.16b, v17.16b, v1.16b
sshr   v12.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v11.16b, v11.16b, v18.16b
sshr   v18.2d, v12.2d, #15
shl    v17.2d, v18.2d, #15
sub    v12.2d, v12.2d, v17.2d
mla    v8.4s, v18.4s, v16.4s
subs x29, x29, #1
bne big_loop
umov w1, v3.s[1]
umov w9, v3.s[0]
add x1, x9, x1, LSL #30
umov w2, v3.s[3]
umov w9, v3.s[2]
add x2, x9, x2, LSL #30
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x12, x7, x6
asr x12, x12, #42
add x11, x7, #1048576
lsl x11, x11, #22
asr x11, x11, #43
add x14, x8, x6
asr x14, x14, #42
add x13, x8, #1048576
lsl x13, x13, #22
asr x13, x13, #43
mul x9, x11, x1
madd x9, x12, x2, x9
asr x9, x9, #20
mul x10, x13, x1
madd x10, x14, x2, x10
asr x10, x10, #20
mov x1, x9
mov x2, x10
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 20
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x28, x8, x6
asr x28, x28, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x1
madd x9, x16, x2, x9
asr x9, x9, #20
mul x10, x17, x1
madd x10, x28, x2, x10
asr x10, x10, #20
mov x1, x9
mov x2, x10
madd x9, x15, x11, XZR
madd x10,  x16, x13, x9
madd x9, x17, x11, XZR
madd x13, x28, x13, x9
mov x11, x10
madd x9, x15, x12, XZR
madd x10,  x16, x14, x9
madd x9, x17, x12, XZR
madd x14, x28, x14, x9
mov x12, x10
and x7, x1, #1048575
sub x7, x7, x4
and x8, x2, #1048575
sub x8, x8, x5
.rept 19
sub x9, x3, #1
tst x8, #1
csel x10, x7, XZR, ne
tst x9, x8, ROR #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
.endr
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x28, x8, x6
asr x28, x28, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
madd x9, x15, x11, XZR
madd x10,  x16, x13, x9
madd x9, x17, x11, XZR
madd x13, x28, x13, x9
mov x11, x10
madd x9, x15, x12, XZR
madd x10,  x16, x14, x9
madd x9, x17, x12, XZR
madd x14, x28, x14, x9
mov x12, x10
ins v13.s[0], w11
ins v13.s[1], w13
ins v13.s[2], w12
ins v13.s[3], w14
and v13.16b, v13.16b, v2.16b
asr x11, x11, #30
asr x12, x12, #30
asr x13, x13, #30
asr x14, x14, #30
ins v14.s[0], w11
ins v14.s[1], w13
ins v14.s[2], w12
ins v14.s[3], w14
cmp x11, xzr
csetm x15, mi
cneg x11, x11, mi
cmp x12, xzr
csetm x16, mi
cneg x12, x12, mi
cmp x13, xzr
csetm x17, mi
cneg x13, x13, mi
cmp x14, xzr
csetm x28, mi
cneg x14, x14, mi
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
SNAP_SCALAR_REG x11, "[during update] uu =" 
SNAP_SCALAR_REG x12, "[during update] vv =" 
SNAP_SCALAR_REG x13, "[during update] rr =" 
SNAP_SCALAR_REG x14, "[during update] ss =" 
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
and x1, x11, x15
and x2, x12, x16
add x7, x1, x2
SNAP_SCALAR_REG x13, "[during update] rr () =" 
SNAP_SCALAR_REG x17, "[during update] sign_rr () =" 
SNAP_SCALAR_REG x14, "[during update] ss () =" 
SNAP_SCALAR_REG x28, "[during update] sign_ss () =" 
and x1, x13, x17
SNAP_SCALAR_REG x1, "[during update] tmp0 () =" 
and x2, x14, x28
SNAP_SCALAR_REG x2, "[during update] tmp1 () =" 
add x8, x1, x2
SNAP_SCALAR_REG x8, "[during update] car1 () =" 
eor x2, x19, x15
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x11
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x11
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
adds x9, x7, x1
SNAP_SCALAR_REG x9, "[during update] tmp4 (correct) =" 
adc x7, xzr, x2
SNAP_SCALAR_REG x7, "[during update] tmp2 (correct) =" 
eor x2, x23, x16
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x12
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x12
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
adds x9, x9, x1
SNAP_SCALAR_REG x9, "[during update] tmp4 (correct) =" 
adc x7, x7, x2
SNAP_SCALAR_REG x7, "[during update] tmp2 (correct) =" 
eor x2, x19, x17
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
mul x1, x2, x13
SNAP_SCALAR_REG x1, "[during update] tmp0 (correct) =" 
umulh x2, x2, x13
SNAP_SCALAR_REG x2, "[during update] tmp1 (correct) =" 
SNAP_SCALAR_REG x8, "[during update] car1 () =" 
adds x10, x8, x1
SNAP_SCALAR_REG x10, "[during update] tmp5 () =" 
adc x8, xzr, x2
eor x2, x23, x28
mul x1, x2, x14
umulh x2, x2, x14
adds x10, x10, x1
adc x8, x8, x2
eor x2, x20, x15
mul x1, x2, x11
umulh x2, x2, x11
adds x7, x7, x1
adc x27, xzr, x2
eor x2, x24, x16
mul x1, x2, x12
umulh x2, x2, x12
adds x7, x7, x1
adc x27, x27, x2
extr x19, x7, x9, #60
eor x2, x20, x17
mul x1, x2, x13
umulh x2, x2, x13
adds x8, x8, x1
adc x9, xzr, x2
eor x2, x24, x28
mul x1, x2, x14
umulh x2, x2, x14
SNAP_SCALAR_REG x8, "[during update] tmp3 =" 
SNAP_SCALAR_REG x1, "[during update] tmp0 =" 
adds x8, x8, x1
adc x9, x9, x2
SNAP_SCALAR_REG x8, "[during update] tmp3 =" 
SNAP_SCALAR_REG x10, "[during update] tmp5 =" 
extr x23, x8, x10, #60
SNAP_SCALAR_REG x23, "[during update] G0 =" 
eor x2, x21, x15
mul x1, x2, x11
umulh x2, x2, x11
adds x27, x27, x1
adc x10, xzr, x2
eor x2, x25, x16
mul x1, x2, x12
umulh x2, x2, x12
adds x27, x27, x1
adc x10, x10, x2
extr x20, x27, x7, #60
eor x2, x21, x17
mul x1, x2, x13
umulh x2, x2, x13
adds x9, x9, x1
adc x7, xzr, x2
eor x2, x25, x28
mul x1, x2, x14
umulh x2, x2, x14
adds x9, x9, x1
adc x7, x7, x2
extr x24, x9, x8, #60
eor x2, x22, x15
asr x8, x2, #63
and x8, x8, x11
neg x8, x8
mul x1, x2, x11
umulh x2, x2, x11
adds x10, x10, x1
adc  x8, x8, x2
eor x2, x26, x16
asr x1, x2, #63
and x1, x1, x12
sub x8, x8, x1
mul x1, x2, x12
umulh x2, x2, x12
adds x10, x10, x1
adc x8, x8, x2
extr x21, x10, x27, #60
extr x22, x8, x10, #60
eor x2, x22, x17
asr x10, x2, #63
and x10, x10, x13
neg x10, x10
mul x1, x2, x13
umulh x2, x2, x13
adds x7, x7, x1
adc  x10, x10, x2
eor x2, x26, x28
asr x1, x2, #63
and x1, x1, x14
sub x10, x10, x1
mul x1, x2, x14
umulh x2, x2, x14
adds x7, x7, x1
adc x10, x10, x2
extr x25, x7, x9, #60
extr x26, x10, x7, #60
mov x9, #19
dup v16.2d, x9
// limb 0
smull  v17.2d, v13.2s, v8.s[0]
smlal2 v17.2d, v13.4s, v8.s[2]
mul v19.4s, v17.4s, v15.4s
and v19.16b, v19.16b, v1.16b
uzp1 v19.4s, v19.4s, v19.4s
smlsl v17.2d, v19.2s, v16.s[0]
sshr   v17.2d, v17.2d, #30
// limb 1
smlal  v17.2d, v14.2s, v8.s[0]
smlal2 v17.2d, v14.4s, v8.s[2]
smlal  v17.2d, v13.2s, v8.s[1]
smlal2 v17.2d, v13.4s, v8.s[3]
mul    v20.4s, v17.4s, v15.4s
and    v20.16b, v20.16b, v1.16b
uzp1   v20.4s, v20.4s, v20.4s
smlsl  v17.2d, v20.2s, v16.s[0]
sshr   v17.2d, v17.2d, #30
// limb 2
smlal  v17.2d, v14.2s, v8.s[1]
smlal2 v17.2d, v14.4s, v8.s[3]
smlal  v17.2d, v13.2s, v9.s[0]
smlal2 v17.2d, v13.4s, v9.s[2]
and    v8.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 3
smlal  v17.2d, v14.2s, v9.s[0]
smlal2 v17.2d, v14.4s, v9.s[2]
smlal  v17.2d, v13.2s, v9.s[1]
smlal2 v17.2d, v13.4s, v9.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v8.16b, v8.16b, v18.16b
// limb 4
smlal  v17.2d, v14.2s, v9.s[1]
smlal2 v17.2d, v14.4s, v9.s[3]
smlal  v17.2d, v13.2s, v10.s[0]
smlal2 v17.2d, v13.4s, v10.s[2]
and    v9.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 5
smlal  v17.2d, v14.2s, v10.s[0]
smlal2 v17.2d, v14.4s, v10.s[2]
smlal  v17.2d, v13.2s, v10.s[1]
smlal2 v17.2d, v13.4s, v10.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v9.16b, v9.16b, v18.16b
// limb 6
smlal  v17.2d, v14.2s, v10.s[1]
smlal2 v17.2d, v14.4s, v10.s[3]
smlal  v17.2d, v13.2s, v11.s[0]
smlal2 v17.2d, v13.4s, v11.s[2]
and    v10.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 7
smlal  v17.2d, v14.2s, v11.s[0]
smlal2 v17.2d, v14.4s, v11.s[2]
smlal  v17.2d, v13.2s, v11.s[1]
smlal2 v17.2d, v13.4s, v11.s[3]
and    v18.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v10.16b, v10.16b, v18.16b
// limb 8
smlal  v17.2d, v14.2s, v11.s[1]
smlal2 v17.2d, v14.4s, v11.s[3]
smlal  v17.2d, v13.2s, v12.s[0]
smlal2 v17.2d, v13.4s, v12.s[2]
ushll  v19.2d, v19.2s, #15
add    v17.2d, v17.2d, v19.2d
and    v11.16b, v17.16b, v1.16b
sshr   v17.2d, v17.2d, #30
// limb 9
smlal  v17.2d, v14.2s, v12.s[0]
smlal2 v17.2d, v14.4s, v12.s[2]
ushll  v20.2d, v20.2s, #15
add    v17.2d, v17.2d, v20.2d
and    v18.16b, v17.16b, v1.16b
sshr   v12.2d, v17.2d, #30
shl    v18.2d, v18.2d, #32
orr    v11.16b, v11.16b, v18.16b
sshr   v18.2d, v12.2d, #15
shl    v17.2d, v18.2d, #15
sub    v12.2d, v12.2d, v17.2d
mla    v8.4s, v18.4s, v16.4s
smov x9, v8.s[0]
smov x10, v8.s[1]
smov x11, v9.s[0]
smov x12, v9.s[1]
smov x13, v10.s[0]
smov x14, v10.s[1]
smov x15, v11.s[0]
smov x16, v11.s[1]
smov x17, v12.s[0]
add  x9, x9, x10, LSL #30
add  x9, x9, x11, LSL #60
lsr  x10, x11, #4
add  x10, x10, x12, LSL #26
add  x10, x10, x13, LSL #56
lsr  x11, x13, #8
add  x11, x11, x14, LSL #22
add  x11, x11, x15, LSL #52
lsr  x12, x15, #12
add  x12, x12, x16, LSL #18
add  x12, x12, x17, LSL #48
asr x19, x19, #63
eor x9, x9, x19
eor x10, x10, x19
eor x11, x11, x19
eor x12, x12, x19
subs x9, x9, x19
adds xzr, x12, #0
mov x13, #-19
csel x13, x13, xzr, mi
adds x9, x9, x13
asr x13, x13, #5
adcs x10, x10, x13
adcs x11, x11, x13
lsr x13, x13, #1
adcs x12, x12, x13
stp x9, x10, [x0]
stp x11, x12, [x0, #16]
ldp q14, q15, [sp], #32
ldp q12, q13, [sp], #32
ldp q10, q11, [sp], #32
ldp q8, q9, [sp], #32
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ldp x29, x30, [sp], #16
ret
