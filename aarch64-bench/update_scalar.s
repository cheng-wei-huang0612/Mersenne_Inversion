
#define N 8

// Used for the return pointer

#define res x20

// Loop counter and d = 2 * delta value for divstep

#define i x21
#define d x22

// Registers used for matrix element magnitudes and signs

#define m00 x10
#define m01 x11
#define m10 x12
#define m11 x13
#define s00 x14
#define s01 x15
#define s10 x16
#define s11 x17

// Initial carries for combinations

#define car0 x9
#define car1 x19

// Input and output, plain registers treated according to pattern

#define reg0 x0, #0
#define reg1 x1, #0
#define reg2 x2, #0
#define reg3 x3, #0
#define reg4 x4, #0

#define x x1, #0
#define z x0, #0

// Pointer-offset pairs for temporaries on stack

#define f sp, #0
#define g sp, #(4*N)
#define u sp, #(8*N)
#define v sp, #(12*N)

// Total size to reserve on the stack

#define NSPACE #(16*N)


.global _update_scalar
.global update_scalar
update_scalar:
_update_scalar:


stp x18, x19, [sp, #-16]!
stp x20, x21, [sp, #-16]!
stp x22, x23, [sp, #-16]!
stp x24, x25, [sp, #-16]!
stp x26, x27, [sp, #-16]!
stp x28, x29, [sp, #-16]!




mov x23, #10000
loop:


        cmp     m00, xzr
        csetm   s00, mi
        cneg    m00, m00, mi

        cmp     m01, xzr
        csetm   s01, mi
        cneg    m01, m01, mi

        cmp     m10, xzr
        csetm   s10, mi
        cneg    m10, m10, mi

        cmp     m11, xzr
        csetm   s11, mi
        cneg    m11, m11, mi

// Adjust the initial values to allow for complement instead of negation
// This initial offset is the same for [f,g] and [u,v] compositions.
// Save it in stable registers for the [u,v] part and do [f,g] first.

        and     x0, m00, s00
        and     x1, m01, s01
        add     car0, x0, x1

        and     x0, m10, s10
        and     x1, m11, s11
        add     car1, x0, x1

// Now the computation of the updated f and g values. This maintains a
// 2-word carry between stages so we can conveniently insert the shift
// right by 59 before storing back, and not overwrite digits we need
// again of the old f and g values.
//
// Digit 0 of [f,g]

        # ldr     x7, [f]
        eor     x1, x7, s00
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x4, car0, x0
        adc     x2, xzr, x1
        # ldr     x8, [g]
        eor     x1, x8, s01
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x4, x4, x0
        adc     x2, x2, x1

        eor     x1, x7, s10
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x5, car1, x0
        adc     x3, xzr, x1
        eor     x1, x8, s11
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x5, x5, x0
        adc     x3, x3, x1

// Digit 1 of [f,g]

        # ldr     x7, [f+N]
        eor     x1, x7, s00
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x2, x2, x0
        adc     x6, xzr, x1
        # ldr     x8, [g+N]
        eor     x1, x8, s01
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x2, x2, x0
        adc     x6, x6, x1
        extr    x4, x2, x4, #59
        # str     x4, [f]

        eor     x1, x7, s10
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x3, x3, x0
        adc     x4, xzr, x1
        eor     x1, x8, s11
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x3, x3, x0
        adc     x4, x4, x1
        extr    x5, x3, x5, #59
        # str     x5, [g]

// Digit 2 of [f,g]

        # ldr     x7, [f+2*N]
        eor     x1, x7, s00
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x6, x6, x0
        adc     x5, xzr, x1
        # ldr     x8, [g+2*N]
        eor     x1, x8, s01
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x6, x6, x0
        adc     x5, x5, x1
        extr    x2, x6, x2, #59
        # str     x2, [f+N]

        eor     x1, x7, s10
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x4, x4, x0
        adc     x2, xzr, x1
        eor     x1, x8, s11
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x4, x4, x0
        adc     x2, x2, x1
        extr    x3, x4, x3, #59
        # str     x3, [g+N]

// Digits 3 and 4 of [f,g]

        # ldr     x7, [f+3*N]
        eor     x1, x7, s00
        asr     x3, x1, #63
        and     x3, x3, m00
        neg     x3, x3
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x5, x5, x0
        adc     x3, x3, x1
        # ldr     x8, [g+3*N]
        eor     x1, x8, s01
        asr     x0, x1, #63
        and     x0, x0, m01
        sub     x3, x3, x0
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x5, x5, x0
        adc     x3, x3, x1
        extr    x6, x5, x6, #59
        # str     x6, [f+2*N]
        extr    x5, x3, x5, #59
        # str     x5, [f+3*N]

        eor     x1, x7, s10
        asr     x5, x1, #63
        and     x5, x5, m10
        neg     x5, x5
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x2, x2, x0
        adc     x5, x5, x1
        eor     x1, x8, s11
        asr     x0, x1, #63
        and     x0, x0, m11
        sub     x5, x5, x0
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x2, x2, x0
        adc     x5, x5, x1
        extr    x4, x2, x4, #59
        # str     x4, [g+2*N]
        extr    x2, x5, x2, #59
        # str     x2, [g+3*N]

// Now the computation of the updated u and v values and their
// modular reductions. A very similar accumulation except that
// the top words of u and v are unsigned and we don't shift.
//
// Digit 0 of [u,v]

        # ldr     x7, [u]
        eor     x1, x7, s00
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x4, car0, x0
        adc     x2, xzr, x1
        # ldr     x8, [v]
        eor     x1, x8, s01
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x4, x4, x0
        # str     x4, [u]
        adc     x2, x2, x1

        eor     x1, x7, s10
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x5, car1, x0
        adc     x3, xzr, x1
        eor     x1, x8, s11
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x5, x5, x0
        # str     x5, [v]
        adc     x3, x3, x1

// Digit 1 of [u,v]

        # ldr     x7, [u+N]
        eor     x1, x7, s00
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x2, x2, x0
        adc     x6, xzr, x1
        # ldr     x8, [v+N]
        eor     x1, x8, s01
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x2, x2, x0
        # str     x2, [u+N]
        adc     x6, x6, x1

        eor     x1, x7, s10
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x3, x3, x0
        adc     x4, xzr, x1
        eor     x1, x8, s11
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x3, x3, x0
        # str     x3, [v+N]
        adc     x4, x4, x1

// Digit 2 of [u,v]

        # ldr     x7, [u+2*N]
        eor     x1, x7, s00
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x6, x6, x0
        adc     x5, xzr, x1
        # ldr     x8, [v+2*N]
        eor     x1, x8, s01
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x6, x6, x0
        # str     x6, [u+2*N]
        adc     x5, x5, x1

        eor     x1, x7, s10
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x4, x4, x0
        adc     x2, xzr, x1
        eor     x1, x8, s11
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x4, x4, x0
        # str     x4, [v+2*N]
        adc     x2, x2, x1

// Digits 3 and 4 of u (top is unsigned)

        # ldr     x7, [u+3*N]
        eor     x1, x7, s00
        and     x3, s00, m00
        neg     x3, x3
        mul     x0, x1, m00
        umulh   x1, x1, m00
        adds    x5, x5, x0
        adc     x3, x3, x1
        # ldr     x8, [v+3*N]
        eor     x1, x8, s01
        and     x0, s01, m01
        sub     x3, x3, x0
        mul     x0, x1, m01
        umulh   x1, x1, m01
        adds    x5, x5, x0
        adc     x3, x3, x1

// Modular reduction of u

        extr    x6, x3, x5, #63
        # ldp     x0, x1, [u]
        add     x6, x6, x3, asr #63
        mov     x3, #19
        mul     x4, x6, x3
        add     x5, x5, x6, lsl #63
        smulh   x3, x6, x3
        # ldr     x6, [u+2*N]
        adds    x0, x0, x4
        adcs    x1, x1, x3
        asr     x3, x3, #63
        adcs    x6, x6, x3
        adc     x5, x5, x3
        # stp     x0, x1, [u]
        # stp     x6, x5, [u+16]

// Digits 3 and 4 of v (top is unsigned)

        eor     x1, x7, s10
        and     x5, s10, m10
        neg     x5, x5
        mul     x0, x1, m10
        umulh   x1, x1, m10
        adds    x2, x2, x0
        adc     x5, x5, x1
        eor     x1, x8, s11
        and     x0, s11, m11
        sub     x5, x5, x0
        mul     x0, x1, m11
        umulh   x1, x1, m11
        adds    x2, x2, x0
        adc     x5, x5, x1

// Modular reduction of v

        extr    x6, x5, x2, #63
        # ldp     x0, x1, [v]
        add     x6, x6, x5, asr #63
        mov     x5, #19
        mul     x4, x6, x5
        add     x2, x2, x6, lsl #63
        smulh   x5, x6, x5
        # ldr     x3, [v+2*N]
        adds    x0, x0, x4
        adcs    x1, x1, x5
        asr     x5, x5, #63
        adcs    x3, x3, x5
        adc     x2, x2, x5
        # stp     x0, x1, [v]
        # stp     x3, x2, [v+16]

subs x23, x23, #1
cbnz x23, loop



ldp x28, x29, [sp], #16
ldp x26, x27, [sp], #16
ldp x24, x25, [sp], #16
ldp x22, x23, [sp], #16
ldp x20, x21, [sp], #16
ldp x18, x19, [sp], #16


ret
