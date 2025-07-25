// ──────────────────────────────────────────────────────────────
//  snap.inc – scalar & vector register snapshot macros (AArch64)
// ──────────────────────────────────────────────────────────────

/*
 * SNAPSHOT MACROS - Always enabled and ready to use
 * 
 * Usage: Just use SNAP_SCALAR_REG, SNAP_VECTOR_REG_U32x4, etc. in your assembly
 * Note: Requires snap.c to be linked (automatically handled by Makefile debug target)
 */

.macro SNAP_PUSH_CALLER
    stp  x0,  x1,  [sp, #-16]!
    stp  x2,  x3,  [sp, #-16]!
    stp  x4,  x5,  [sp, #-16]!
    stp  x6,  x7,  [sp, #-16]!
    stp  x8,  x9,  [sp, #-16]!
    stp  x10, x11, [sp, #-16]!
    stp  x12, x13, [sp, #-16]!
    stp  x14, x15, [sp, #-16]!
    stp  x16, x17, [sp, #-16]!
    sub  sp, sp, #16
    str  x30,      [sp]
    sub  sp, sp, #128
    stp  q0,  q1,  [sp, #0]
    stp  q2,  q3,  [sp, #32]
    stp  q4,  q5,  [sp, #64]
    stp  q6,  q7,  [sp, #96]
.endm

.macro SNAP_POP_CALLER
    ldp  q6,  q7,  [sp, #96]
    ldp  q4,  q5,  [sp, #64]
    ldp  q2,  q3,  [sp, #32]
    ldp  q0,  q1,  [sp, #0]
    add  sp, sp, #128
    ldr  x30,      [sp]
    add  sp, sp, #16
    ldp  x16, x17, [sp], #16
    ldp  x14, x15, [sp], #16
    ldp  x12, x13, [sp], #16
    ldp  x10, x11, [sp], #16
    ldp  x8,  x9,  [sp], #16
    ldp  x6,  x7,  [sp], #16
    ldp  x4,  x5,  [sp], #16
    ldp  x2,  x3,  [sp], #16
    ldp  x0,  x1,  [sp], #16
.endm

.macro SNAP_SCALAR_REG reg, tag
    SNAP_PUSH_CALLER
    mov  x0,  \reg
    adr  x1,  1000f
    bl   _print_scalar_reg_tag
    SNAP_POP_CALLER
    b    2000f
    .balign 4
1000:   .asciz "\tag"
    .balign 4
2000:
.endm

.macro SNAP_VECTOR_REG_U32x4 vreg, tag
    SNAP_PUSH_CALLER
    sub  sp, sp, #16
    st1  {\vreg\().4s}, [sp]
    mov  x0,  sp
    adr  x1,  1000f
    bl   _print_vector_reg_u32x4
    add  sp, sp, #16
    SNAP_POP_CALLER
    b    2000f
    .balign 4
1000:   .asciz "\tag"
    .balign 4
2000:
.endm

.macro SNAP_VECTOR_REG_U64x2 vreg, tag
    SNAP_PUSH_CALLER
    sub  sp, sp, #16
    st1  {\vreg\().2d}, [sp]
    mov  x0,  sp
    adr  x1,  1000f
    bl   _print_vector_reg_u64x2
    add  sp, sp, #16
    SNAP_POP_CALLER
    b    2000f
    .balign 4
1000:   .asciz "\tag"
    .balign 4
2000:
.endm
