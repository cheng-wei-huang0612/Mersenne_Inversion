
.global my_innerloop
.global _my_innerloop

my_innerloop:
_my_innerloop:


stp x18, x19, [sp, #-16]!



mov x0, #100

loop:


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


subs x0, x0, #1
cbnz x0, loop


ldp x18, x19, [sp], #16
ret