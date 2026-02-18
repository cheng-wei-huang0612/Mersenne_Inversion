proc main (
 f_0@uint64, f_1@uint64,
 g_0@uint64, g_1@uint64,
 u@sint64, v@sint64, r@sint64, s@sint64;
 new_f@sint64, new_g@sint64
) = {true &&

(const 64 (-(2**60))) <=s u, u <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s v, v <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s r, r <=s (const 64 ((2**60) - 1)),
(const 64 (-(2**60))) <=s s, s <=s (const 64 ((2**60) - 1))
}

mov x4 f_0;
mov x21 f_1;
mov x5 g_0;
mov x22 g_1;
mov x11 u;
mov x12 v;
mov x13 r;
mov x14 s;



(* cmp	x11, xzr                                    #! PC = 0xaaaabe371984 *)
spl mi dc x11 63;
cast mi@bit mi;
(* csetm	x23, mi	// mi = first                     #! PC = 0xaaaabe371988 *)
cmov x23 mi (-1)@sint64 0@sint64;
(* cneg	x11, x11, mi	// mi = first                 #! PC = 0xaaaabe37198c *)
subs dc x11_neg 0@sint64 x11;
cmov x11 mi x11_neg x11;	// ge = tcont;;

(* cmp	x12, xzr                                    #! PC = 0xaaaabe371990 *)
spl mi dc x12 63;
cast mi@bit mi;
(* csetm	x24, mi	// mi = first                     #! PC = 0xaaaabe371994 *)
cmov x24 mi (-1)@sint64 0@sint64;
(* cneg	x12, x12, mi	// mi = first                 #! PC = 0xaaaabe371998 *)
subs dc x12_neg 0@sint64 x12;
cmov x12 mi x12_neg x12;	// ge = tcont;;

(* cmp	x13, xzr                                    #! PC = 0xaaaabe37199c *)
spl mi dc x13 63;
cast mi@bit mi;
(* csetm	x25, mi	// mi = first                     #! PC = 0xaaaabe3719a0 *)
cmov x25 mi (-1)@sint64 0@sint64;
(* cneg	x13, x13, mi	// mi = first                 #! PC = 0xaaaabe3719a4 *)
subs dc x13_neg 0@sint64 x13;
cmov x13 mi x13_neg x13;	// ge = tcont;;

(* cmp	x14, xzr                                    #! PC = 0xaaaabe3719a8 *)
spl mi dc x14 63;
cast mi@bit mi;
(* csetm	x26, mi	// mi = first                     #! PC = 0xaaaabe3719ac *)
cmov x26 mi (-1)@sint64 0@sint64;
(* cneg	x14, x14, mi	// mi = first                 #! PC = 0xaaaabe3719b0 *)
subs dc x14_neg 0@sint64 x14;
cmov x14 mi x14_neg x14;	// ge = tcont;;


mov sign_u x23;
mov sign_v x24;
mov sign_r x25;
mov sign_s x26;

cast x11@uint64 x11;
cast x12@uint64 x12;
cast x13@uint64 x13;
cast x14@uint64 x14;
mov abs_u x11;
mov abs_v x12;
mov abs_r x13;
mov abs_s x14;

assert true && 
x11 >=s (const 64 0),
x12 >=s (const 64 0),
x13 >=s (const 64 0),
x14 >=s (const 64 0);


assert true && (sign_u * (const 64 2) + (const 64 1)) * abs_u = u;
assert true && (sign_v * (const 64 2) + (const 64 1)) * abs_v = v;
assert true && (sign_r * (const 64 2) + (const 64 1)) * abs_r = r;
assert true && (sign_s * (const 64 2) + (const 64 1)) * abs_s = s;
assume (sign_u * 2 + 1) * abs_u = u && (sign_u * (const 64 2) + (const 64 1)) * abs_u = u;
assume (sign_v * 2 + 1) * abs_v = v && (sign_v * (const 64 2) + (const 64 1)) * abs_v = v;
assume (sign_r * 2 + 1) * abs_r = r && (sign_r * (const 64 2) + (const 64 1)) * abs_r = r;
assume (sign_s * 2 + 1) * abs_s = s && (sign_s * (const 64 2) + (const 64 1)) * abs_s = s;



(* and	x27, x11, x23                               #! PC = 0xaaaabe3719b4 *)
and x27@uint64 x11 x23;

(* and	x28, x12, x24                               #! PC = 0xaaaabe3719b8 *)
and x28@uint64 x12 x24;

(* add	x15, x27, x28                               #! PC = 0xaaaabe3719bc *)
add x15 x27 x28;


assert true &&
uext x15 64 = 
(uext abs_u 64) * ((const 128 0) - (sext sign_u 64)) +
(uext abs_v 64) * ((const 128 0) - (sext sign_v 64))
;

assert true &&
uext x15 64 = 
(uext abs_u 64) * ((const 128 0) - ((uext sign_u 64) + (uext sign_u 64) * (const 128 (2**64)))) +
(uext abs_v 64) * ((const 128 0) - ((uext sign_v 64) + (uext sign_v 64) * (const 128 (2**64))))
;




(* eor	x27, x4, x23                                #! PC = 0xaaaabe3719c0 *)
xor x27@uint64 x4 x23;


assert true && 
((sign_u * (const 64 2)) + (const 64 1)) * f_0 + sign_u = x27;
assume (sign_u * 2 + 1) * f_0 + sign_u = x27 &&
((sign_u * (const 64 2)) + (const 64 1)) * f_0 + sign_u = x27;

(* mul	x9, x27, x11                                #! PC = 0xaaaabe3719c4 *)
(* umulh	x10, x27, x11                             #! PC = 0xaaaabe3719c8 *)
mull x10 x9 x27 x11;


assert
limbs 64 [x9, x10] = x27 * x11
&& true;

assume 
limbs 64 [x9, x10] = x27 * x11
&&
limbs 64 [x9, x10] = 
((((uext sign_u 64) * (const 128 2)) + (const 128 1)) * (uext f_0 64) + (uext sign_u 64)) * (uext abs_u 64);



ghost x15_old@uint64, x16_old@uint64 :
    x15_old = x15, x16_old = 0
&&
    x15_old = x15, x16_old = 0@uint64;

(* adds	x15, x9, x15                               #! PC = 0xaaaabe3719cc *)
adds carry x15 x9 x15;

(* adc	x16, x10, xzr                               #! PC = 0xaaaabe3719d0 *)
adc x16 x10 0@uint64 carry;


assert true && 
limbs 64 [x15, x16] =
limbs 64 [x9, x10] + limbs 64 [x15_old, x16_old]
;

assert true &&
limbs 64 [x15, x16] =
(((((uext sign_u 64) * (const 128 2)) + (const 128 1)) * (uext f_0 64) + (uext sign_u 64)) * (uext abs_u 64)) +
(uext x15_old 64);


assert true &&
limbs 64 [x15, x16] =
(((((uext sign_u 64) * (const 128 2)) + (const 128 1)) * (uext f_0 64) + (uext sign_u 64)) * (uext abs_u 64)) +
((uext abs_u 64) * ((const 128 0) - ((uext sign_u 64) + (uext sign_u 64) * (const 128 (2**64)))) +
(uext abs_v 64) * ((const 128 0) - ((uext sign_v 64) + (uext sign_v 64) * (const 128 (2**64)))))
;

assume
limbs 64 [x15, x16] =
((2 * sign_u + 1) * f_0 + sign_u) * abs_u +
abs_u * ( -(sign_u + sign_u * (2**64)) ) +
abs_v * ( -(sign_v + sign_v * (2**64)) )
(mod (2**128))
&&
limbs 64 [x15, x16] =
(((((uext sign_u 64) * (const 128 2)) + (const 128 1)) * (uext f_0 64) + (uext sign_u 64)) * (uext abs_u 64)) +
((uext abs_u 64) * ((const 128 0) - ((uext sign_u 64) + (uext sign_u 64) * (const 128 (2**64)))) +
(uext abs_v 64) * ((const 128 0) - ((uext sign_v 64) + (uext sign_v 64) * (const 128 (2**64)))))
;

assert
limbs 64 [x15, x16] =
((2 * sign_u + 1) * f_0) * abs_u +
abs_u * ( -(sign_u * (2**64)) ) +
abs_v * ( -(sign_v + sign_v * (2**64)) )
(mod (2**128))
&& true;

assume
limbs 64 [x15, x16] =
((2 * sign_u + 1) * f_0) * abs_u +
abs_u * ( -(sign_u * (2**64)) ) +
abs_v * ( -(sign_v + sign_v * (2**64)) )
(mod (2**128))
&&
limbs 64 [x15, x16] =
(((((uext sign_u 64) * (const 128 2)) + (const 128 1)) * (uext f_0 64)) * (uext abs_u 64)) +
((uext abs_u 64) * ((const 128 0) - ((uext sign_u 64) * (const 128 (2**64)))) +
(uext abs_v 64) * ((const 128 0) - ((uext sign_v 64) + (uext sign_v 64) * (const 128 (2**64)))))
;

(* eor	x27, x21, x23                               #! PC = 0xaaaabe3719d4 *)
xor x27@uint64 x21 x23;

assert true && 
((sign_u * (const 64 2)) + (const 64 1)) * f_1 + sign_u = x27;
assume (sign_u * 2 + 1) * f_1 + sign_u = x27 &&
((sign_u * (const 64 2)) + (const 64 1)) * f_1 + sign_u = x27;

(* mul	x9, x27, x11                                #! PC = 0xaaaabe3719d8 *)
mull dcH x9 x27 x11;

assert 
limbs 64 [0, x9] = x27 * x11 * (2**64) (mod (2**128))
&& true;

assume
limbs 64 [0, x9] = 
x27 * x11 * (2**64)
(mod (2**128))
&&
(const 128 (2**64)) * (uext x9 64) =
(uext x27 64) * (uext x11 64) * (const 128 (2**64))
;


assert
limbs 64 [0, x9] = 
((sign_u * 2 + 1) * f_1 + sign_u) * abs_u * (2**64)
(mod (2**128))
&& true ;




ghost x15_old_1@uint64, x16_old_1@uint64 :
    x15_old_1 = x15, x16_old_1 = x16
&&
    x15_old_1 = x15, x16_old_1 = x16
;

(* add	x16, x16, x9                                #! PC = 0xaaaabe3719dc *)
adds dc x16 x16 x9;

assert true &&
limbs 64 [x15, x16] = (limbs 64 [x15_old_1, x16_old_1]) + (limbs 64 [(const 64 0), x9]);
    assume
    limbs 64 [x15, x16] = (limbs 64 [x15_old_1, x16_old_1]) + (limbs 64 [0, x9]) (mod (2**128))
    &&
    limbs 64 [x15, x16] = (limbs 64 [x15_old_1, x16_old_1]) + (limbs 64 [(const 64 0), x9]);

assert 
limbs 64 [x15, x16] = 
((2 * sign_u + 1) * f_0) * abs_u +
abs_u * ( -(sign_u * (2**64)) ) +
abs_v * ( -(sign_v + sign_v * (2**64)) )
+
((sign_u * 2 + 1) * f_1 + sign_u) * abs_u * (2**64)
(mod (2**128))
// ,
// limbs 64 [x15, x16] = 
// ((2 * sign_u + 1) * f_0) * abs_u +
// abs_v * ( -(sign_v + sign_v * (2**64)) )
// +
// ((sign_u * 2 + 1) * f_1 ) * abs_u * (2**64)
// (mod (2**128))
// ,
// limbs 64 [x15, x16] = 
// ((2 * sign_u + 1) * (f_0 + f_1 * (2**64))) * abs_u +
// abs_v * ( -(sign_v + sign_v * (2**64)) )
// (mod (2**128))
// ,
// limbs 64 [x15, x16] = 
// (abs_u * (2 * sign_u + 1)) * (f_0 + f_1 * (2**64)) +
// abs_v * ( -(sign_v + sign_v * (2**64)) )
// (mod (2**128)) 
&& true;

cut 
limbs 64 [x15, x16] = 
(abs_u * (2 * sign_u + 1)) * (f_0 + f_1 * (2**64)) +
abs_v * ( -(sign_v + sign_v * (2**64)) )
(mod (2**128)),
(sign_u * 2 + 1) * abs_u = u,
(sign_v * 2 + 1) * abs_v = v,
(sign_r * 2 + 1) * abs_r = r,
(sign_s * 2 + 1) * abs_s = s
&& true;

assert
limbs 64 [x15, x16] = 
(u) * (f_0 + f_1 * (2**64)) +
abs_v * ( -(sign_v + sign_v * (2**64)) )
(mod (2**128))
&& true;



// (* eor	x27, x5, x24                                #! PC = 0xaaaabe3719e0 *)
// xor x27@uint64 x5 x24;
//
// (* mul	x9, x27, x12                                #! PC = 0xaaaabe3719e4 *)
// mull dcH x9 x27 x12;
//
// (* umulh	x10, x27, x12                             #! PC = 0xaaaabe3719e8 *)
// mull x10 dcL x27 x12;
//
// (* adds	x15, x9, x15                               #! PC = 0xaaaabe3719ec *)
// adds carry x15 x9 x15;
//
// (* adc	x16, x10, x16                               #! PC = 0xaaaabe3719f0 *)
// adc x16 x10 x16 carry;
//
// (* eor	x27, x22, x24                               #! PC = 0xaaaabe3719f4 *)
// xor x27@uint64 x22 x24;
//
// (* mul	x9, x27, x12                                #! PC = 0xaaaabe3719f8 *)
// mull dcH x9 x27 x12;
//
// (* add	x16, x16, x9                                #! PC = 0xaaaabe3719fc *)
// add x16 x16 x9;
//
// (* extr	x1, x16, x15, #60                          #! PC = 0xaaaabe371a00 *)
// spl dc extr_H x16 60; spl extr_L dc x15 60; join x1 extr_H extr_L;
//
// (* and	x27, x13, x25                               #! PC = 0xaaaabe371a04 *)
// and x27@uint64 x13 x25;
//
// (* and	x28, x14, x26                               #! PC = 0xaaaabe371a08 *)
// and x28@uint64 x14 x26;
//
// (* add	x17, x27, x28                               #! PC = 0xaaaabe371a0c *)
// add x17 x27 x28;
//
// (* eor	x27, x4, x25                                #! PC = 0xaaaabe371a10 *)
// xor x27@uint64 x4 x25;
//
// (* mul	x9, x27, x13                                #! PC = 0xaaaabe371a14 *)
// mull dcH x9 x27 x13;
//
// (* umulh	x10, x27, x13                             #! PC = 0xaaaabe371a18 *)
// mull x10 dcL x27 x13;
//
// (* adds	x17, x9, x17                               #! PC = 0xaaaabe371a1c *)
// adds carry x17 x9 x17;
//
// (* adc	x20, x10, xzr                               #! PC = 0xaaaabe371a20 *)
// adc x20 x10 0@uint64 carry;
//
// (* eor	x27, x21, x25                               #! PC = 0xaaaabe371a24 *)
// xor x27@uint64 x21 x25;
//
// (* mul	x9, x27, x13                                #! PC = 0xaaaabe371a28 *)
// mull dcH x9 x27 x13;
//
// (* add	x20, x20, x9                                #! PC = 0xaaaabe371a2c *)
// add x20 x20 x9;
//
// (* eor	x27, x5, x26                                #! PC = 0xaaaabe371a30 *)
// xor x27@uint64 x5 x26;
//
// (* mul	x9, x27, x14                                #! PC = 0xaaaabe371a34 *)
// mull dcH x9 x27 x14;
//
// (* umulh	x10, x27, x14                             #! PC = 0xaaaabe371a38 *)
// mull x10 dcL x27 x14;
//
// (* adds	x17, x9, x17                               #! PC = 0xaaaabe371a3c *)
// adds carry x17 x9 x17;
//
// (* adc	x20, x10, x20                               #! PC = 0xaaaabe371a40 *)
// adc x20 x10 x20 carry;
//
// (* eor	x27, x22, x26                               #! PC = 0xaaaabe371a44 *)
// xor x27@uint64 x22 x26;
//
// (* mul	x9, x27, x14                                #! PC = 0xaaaabe371a48 *)
// mull dcH x9 x27 x14;
//
// (* add	x20, x20, x9                                #! PC = 0xaaaabe371a4c *)
// add x20 x20 x9;
//
// (* extr	x2, x20, x17, #60                          #! PC = 0xaaaabe371a50 *)
// spl dc extr_H x20 60; spl extr_L dc x17 60; join x2 extr_H extr_L;
