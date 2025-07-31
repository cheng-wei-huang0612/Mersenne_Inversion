



.global _update_vector
.global update_vector
update_vector:
_update_vector:


stp d8, d9, [sp, #-16]!
stp d10, d11, [sp, #-16]!
stp d12, d13, [sp, #-16]!
stp d14, d15, [sp, #-16]!



stp x18, x19, [sp, #-16]!
stp x20, x21, [sp, #-16]!
stp x22, x23, [sp, #-16]!
stp x24, x25, [sp, #-16]!
stp x26, x27, [sp, #-16]!
stp x28, x29, [sp, #-16]!




mov x20, #100
loop:

ins v16.d[0], x11
ins v16.d[1], x13
ins v17.d[0], x12
ins v17.d[1], x14
uzp1 v13.4s, v16.4s, v17.4s
and v13.16b, v13.16b, v2.16b
sshr v16.2d, v16.2d, #30
sshr v17.2d, v17.2d, #30
uzp1 v14.4s, v16.4s, v17.4s



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
umov w4, v3.s[0]
umov w27, v3.s[1]
add  x4, x4, x27, lsl #30
umov w27, v4.s[0]
add  x4, x4, x27, lsl #60
add  x21, xzr, x27, lsr #4
umov w27, v4.s[1]
add  x21, x21, x27, lsl #26
umov w5, v3.s[2]
umov w27, v3.s[3]
add  x5, x5, x27, lsl #30
umov w27, v4.s[2]
add  x5, x5, x27, lsl #60
add  x22, xzr, x27, lsr #4
umov w27, v4.s[3]
add  x22, x22, x27, lsl #26
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



subs x20, x20, #1
cbnz x20, loop



ldp x28, x29, [sp], #16
ldp x26, x27, [sp], #16
ldp x24, x25, [sp], #16
ldp x22, x23, [sp], #16
ldp x20, x21, [sp], #16
ldp x18, x19, [sp], #16




ldp d14, d15, [sp], #16
ldp d12, d13, [sp], #16
ldp d10, d11, [sp], #16
ldp d8, d9, [sp], #16

ret