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
ldr x2, [x1]
mov x1, #-19
mov x3, #1
movz x4, #512, LSL #32
add  x6, x4, #1048576
movz  x7, #10347, LSL #16
movk  x7, #51739
dup  v15.4s, w7



// ----------------------------------------



and x7, x1, #1048575
and x8, x2, #1048575
orr x7, x7, #0xFFFFFE0000000000
orr x8, x8, #0xC000000000000000
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
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
asr x2, x10, #20
mov x1, x9
and x7, x1, #1048575
and x8, x2, #1048575
orr x7, x7, #0xFFFFFE0000000000
orr x8, x8, #0xC000000000000000
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x18, x8, x6
asr x18, x18, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x1
madd x9, x16, x2, x9
asr x9, x9, #20
mul x10, x17, x1
madd x10, x18, x2, x10
asr x2, x10, #20
mov x1, x9
mul x9, x15, x11
madd x10,  x16, x13, x9
mul x9, x17, x11
madd x13, x18, x13, x9
mov x11, x10
mul x9, x15, x12
madd x10,  x16, x14, x9
mul x9, x17, x12
madd x14, x18, x14, x9
mov x12, x10
and x7, x1, #1048575
and x8, x2, #1048575
orr x7, x7, #0xFFFFFE0000000000
orr x8, x8, #0xC000000000000000
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x18, x8, x6
asr x18, x18, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x11
madd x10,  x16, x13, x9
mul x9, x17, x11
madd x13, x18, x13, x9
mov x11, x10
mul x9, x15, x12
madd x10,  x16, x14, x9
mul x9, x17, x12
madd x14, x18, x14, x9
mov x12, x10
mov x19, #9
Lbig_loop:
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
// limb 0
smull  v16.2d, v13.2s, v3.s[0]
smlal2 v16.2d, v13.4s, v3.s[2]
sshr   v16.2d, v16.2d, #30
// limb 1
smlal  v16.2d, v14.2s, v3.s[0]
smlal2 v16.2d, v14.4s, v3.s[2]
smlal  v16.2d, v13.2s, v3.s[1]
smlal2 v16.2d, v13.4s, v3.s[3]
sshr   v16.2d, v16.2d, #30
// limb 2
smlal  v16.2d, v14.2s, v3.s[1]
smlal2 v16.2d, v14.4s, v3.s[3]
smlal  v16.2d, v13.2s, v4.s[0]
smlal2 v16.2d, v13.4s, v4.s[2]
and    v3.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
// limb 3
smlal  v16.2d, v14.2s, v4.s[0]
smlal2 v16.2d, v14.4s, v4.s[2]
smlal  v16.2d, v13.2s, v4.s[1]
smlal2 v16.2d, v13.4s, v4.s[3]
and    v17.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
shl    v17.2d, v17.2d, #32
orr    v3.16b, v3.16b, v17.16b
// limb 4
smlal  v16.2d, v14.2s, v4.s[1]
smlal2 v16.2d, v14.4s, v4.s[3]
smlal  v16.2d, v13.2s, v5.s[0]
smlal2 v16.2d, v13.4s, v5.s[2]
and    v4.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
// limb 5
smlal  v16.2d, v14.2s, v5.s[0]
smlal2 v16.2d, v14.4s, v5.s[2]
smlal  v16.2d, v13.2s, v5.s[1]
smlal2 v16.2d, v13.4s, v5.s[3]
and    v17.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
shl    v17.2d, v17.2d, #32
orr    v4.16b, v4.16b, v17.16b
// limb 6
smlal  v16.2d, v14.2s, v5.s[1]
smlal2 v16.2d, v14.4s, v5.s[3]
smlal  v16.2d, v13.2s, v6.s[0]
smlal2 v16.2d, v13.4s, v6.s[2]
and    v5.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
// limb 7
smlal  v16.2d, v14.2s, v6.s[0]
smlal2 v16.2d, v14.4s, v6.s[2]
smlal  v16.2d, v13.2s, v6.s[1]
smlal2 v16.2d, v13.4s, v6.s[3]
and    v17.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
shl    v17.2d, v17.2d, #32
orr    v5.16b, v5.16b, v17.16b
// limb 8
smlal  v16.2d, v14.2s, v6.s[1]
smlal2 v16.2d, v14.4s, v6.s[3]
smlal  v16.2d, v13.2s, v7.s[0]
smlal2 v16.2d, v13.4s, v7.s[2]
and    v6.16b, v16.16b, v1.16b
sshr   v16.2d, v16.2d, #30
// limb 9
smlal  v16.2d, v14.2s, v7.s[0]
smlal2 v16.2d, v14.4s, v7.s[2]
and    v17.16b, v16.16b, v1.16b
sshr   v7.2d, v16.2d, #30
shl    v17.2d, v17.2d, #32
orr    v6.16b, v6.16b, v17.16b
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
umov w1, v3.s[1]
umov w9, v3.s[0]
add x1, x9, x1, lsl #30
umov w2, v3.s[3]
umov w9, v3.s[2]
add x2, x9, x2, lsl #30
and x7, x1, #1048575
and x8, x2, #1048575
orr x7, x7, #0xFFFFFE0000000000
orr x8, x8, #0xC000000000000000
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
Lend:
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
asr x2, x10, #20
mov x1, x9
and x7, x1, #1048575
and x8, x2, #1048575
orr x7, x7, #0xFFFFFE0000000000
orr x8, x8, #0xC000000000000000
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
L_begin_opt1:
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x18, x8, x6
asr x18, x18, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x1
madd x9, x16, x2, x9
asr x9, x9, #20
mul x10, x17, x1
madd x10, x18, x2, x10
asr x2, x10, #20
mov x1, x9
mul x9, x15, x11
madd x10,  x16, x13, x9
mul x9, x17, x11
madd x13, x18, x13, x9
mov x11, x10
mul x9, x15, x12
madd x10,  x16, x14, x9
mul x9, x17, x12
madd x14, x18, x14, x9
mov x12, x10
L_end_opt1:
and x7, x1, #1048575
and x8, x2, #1048575
orr x7, x7, #0xFFFFFE0000000000
orr x8, x8, #0xC000000000000000
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
sub x9, x3, #1
tst x8, #1
csel x10, x7, xzr, ne
tst x9, x8, ror #1
csneg x3, x9, x3, pl
csel x7, x8, x7, mi
csneg x10, x10, x10, pl
add x8, x8, x10
asr x8, x8, #1
L_begin_opt2:
add x16, x7, x6
asr x16, x16, #42
add x15, x7, #1048576
lsl x15, x15, #22
asr x15, x15, #43
add x18, x8, x6
asr x18, x18, #42
add x17, x8, #1048576
lsl x17, x17, #22
asr x17, x17, #43
mul x9, x15, x11
madd x10,  x16, x13, x9
mul x9, x17, x11
madd x13, x18, x13, x9
mov x11, x10
mul x9, x15, x12
madd x10,  x16, x14, x9
mul x9, x17, x12
madd x14, x18, x14, x9
mov x12, x10
L_end_opt2:
subs x19, x19, #1
cbnz x19, Lbig_loop
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
// limb 0
smull  v16.2d, v13.2s, v3.s[0]
smlal2 v16.2d, v13.4s, v3.s[2]
sshr   v16.2d, v16.2d, #30
// limb 1
smlal  v16.2d, v14.2s, v3.s[0]
smlal2 v16.2d, v14.4s, v3.s[2]
smlal  v16.2d, v13.2s, v3.s[1]
smlal2 v16.2d, v13.4s, v3.s[3]
sshr   v16.2d, v16.2d, #30
// limb 2
smlal  v16.2d, v14.2s, v3.s[1]
smlal2 v16.2d, v14.4s, v3.s[3]
smlal  v16.2d, v13.2s, v4.s[0]
smlal2 v16.2d, v13.4s, v4.s[2]
and    v3.16b, v16.16b, v1.16b
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
smov x19, v3.s[0]
lsl x19, x19, #34
asr x19, x19, #35
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
