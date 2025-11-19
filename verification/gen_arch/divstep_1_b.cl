proc divstep_1_b(sint64 fuv_in, sint64 grs_in, sint64 delta_in,
sint21 u_in, sint21 v_in,
sint21 r_in, sint21 s_in,
sint22 f_0_low60_0_low20_in,
sint22 g_0_low60_0_low20_in,
sint22 f_0_low60_0_low20_ref0,
sint22 g_0_low60_0_low20_ref0;
sint64 fuv_out, sint64 grs_out, sint64 delta_out,
sint21 u_out, sint21 v_out,
sint21 r_out, sint21 s_out,
sint22 f_0_low60_0_low20_out,
sint22 g_0_low60_0_low20_out, bit ne_out
) = {
u_in * f_0_low60_0_low20_ref0 + v_in * g_0_low60_0_low20_ref0 = 
(-1) * f_0_low60_0_low20_in (mod (2**64))
,
r_in * f_0_low60_0_low20_ref0 + s_in * g_0_low60_0_low20_ref0 = 
(-1) * g_0_low60_0_low20_in (mod (2**64))
&& 
(* Since this is the first divstep *)
u_in = (-1)@21,
v_in = ( 0)@21,
r_in = ( 0)@21,
s_in = (-1)@21,

(const 64 (-1200)) <=s delta_in, delta_in <s (const 64 1200),

f_0_low60_0_low20_in = (const 22 1) (mod (const 22 2)),

(const 22 0) <=s f_0_low60_0_low20_in, f_0_low60_0_low20_in <=s (const 22 ((2**20)-1)),
(const 22 0) <=s g_0_low60_0_low20_in, g_0_low60_0_low20_in <=s (const 22 ((2**20)-1)),
fuv_in = 
	 (sext f_0_low60_0_low20_in 42) +
(sext u_in 43) * (const 64 (2**(21+20))) +
(sext v_in 43) * (const 64 (2**(42+20)))
,
grs_in = 
	 (sext g_0_low60_0_low20_in 42) +
(sext r_in 43) * (const 64 (2**(21+20))) +
(sext s_in 43) * (const 64 (2**(42+20)))
}



mov x7 fuv_in;
mov x8 grs_in;
mov x3 delta_in;


(* premise for case b*)
assume true && g_0_low60_0_low20_in = (const 22 1) (mod (const 22 2));
assert true && x8 = (const 64 1) (mod (const 64 2));
assume true && delta_in <s (const 64 0);
assert true && x3 <s (const 64 0);
(* premise for case b*)

ghost x7_old@sint64, x8_old@sint64, x3_old@sint64:
and [x7_old = x7, x8_old = x8, x3_old = x3]
&&
and [x7_old = x7, x8_old = x8, x3_old = x3];

(* tst	x8, #0x1                                    #! PC = 0xaaaaafca09a4 *)
spl dc x8_lo x8 1;
and ne@bit x8_lo 1@bit;
(* csel	x10, x7, xzr, ne	// ne = any               #! PC = 0xaaaaafca09a8 *)
cmov x10 ne x7 0@sint64;	// ne = any;
(* ccmp	x3, xzr, #0x8, ne	// ne = any              #! PC = 0xaaaaafca09ac *)
spl ge dc x3 63;
not ge@bit ge;
cmov ge ne ge 0@bit;	// ne = any;
(* cneg	x3, x3, ge	// ge = tcont                   #! PC = 0xaaaaafca09b0 *)
subs dc x3_neg 0@sint64 x3;
cmov x3 ge x3_neg x3;	// ge = tcont;
(* cneg	x10, x10, ge	// ge = tcont                 #! PC = 0xaaaaafca09b4 *)
subs dc x10_neg 0@sint64 x10;
cmov x10 ge x10_neg x10;	// ge = tcont;
(* csel	x7, x8, x7, ge	// ge = tcont               #! PC = 0xaaaaafca09b8 *)
cmov x7 ge x8 x7;	// ge = tcont;
(* add	x8, x8, x10                                 #! PC = 0xaaaaafca09bc *)
adds dc x8 x8 x10;
(* add	x3, x3, #0x2                                #! PC = 0xaaaaafca09c0 *)
add x3 x3 0x2@sint64;


(* tst	x8, #0x2                                    #! PC = 0xaaaaafca09c4 *)
spl dc x8_lo x8 2;
spl x8_target dc x8_lo 1;
and ne@bit x8_target 1@bit;
(* asr	x8, x8, #1                                  #! PC = 0xaaaaafca09c8 *)
split x8 dc x8 1;




mov fuv_out x7;
mov grs_out x8;
mov delta_out x3;
mov ne_out ne;

(* According to premise of case b *)
assert true && x7 = x7_old;
assert true && x8 * (const 64 2) = x7_old + x8_old;
assert true && x3 = (const 64 2) + x3_old;


(* According to premise of case b *)
mov f_0_low60_0_low20_out f_0_low60_0_low20_in;
shl u_out u_in 1;
shl v_out v_in 1;


add tmp g_0_low60_0_low20_in f_0_low60_0_low20_in;
asr g_0_low60_0_low20_out tmp 1;

add r_out r_in u_in;
add s_out s_in v_in;







assert
true &&
f_0_low60_0_low20_out = f_0_low60_0_low20_in;
assume
f_0_low60_0_low20_out = f_0_low60_0_low20_in
&& true;

assert true && 
u_out = u_in * (const 21 2);

assume
u_out = u_in * 2
&&
true;

assert true && 
v_out = v_in * (const 21 2);

assume
v_out = v_in * 2
&&
true;


assert
true &&
g_0_low60_0_low20_out * (const 22 2) = g_0_low60_0_low20_in + f_0_low60_0_low20_in;
assume
g_0_low60_0_low20_out * 2 = g_0_low60_0_low20_in + f_0_low60_0_low20_in
&& true;


assert
true &&
r_out = r_in + u_in;
assume
r_out = r_in + u_in
&& true;

assert
true &&
s_out = s_in + v_in;
assume
s_out = s_in + v_in
&& true;



assert true && 
fuv_out = 
(sext f_0_low60_0_low20_out 42) +
(sext u_out 43) * (const 64 (2**(21+19))) +
(sext v_out 43) * (const 64 (2**(42+19)));
assert true && 
grs_out = 
(sext g_0_low60_0_low20_out 42) +
(sext r_out 43) * (const 64 (2**(21+19))) +
(sext s_out 43) * (const 64 (2**(42+19)));







{
u_out * f_0_low60_0_low20_ref0 +
v_out * g_0_low60_0_low20_ref0 = 
0
(mod (2**1))
,
r_out * f_0_low60_0_low20_ref0 +
s_out * g_0_low60_0_low20_ref0 = 
0
(mod (2**1))
,
u_out * f_0_low60_0_low20_ref0 +
v_out * g_0_low60_0_low20_ref0 =
(-1) * (2) * f_0_low60_0_low20_out (mod (2**64))
,
r_out * f_0_low60_0_low20_ref0 +
s_out * g_0_low60_0_low20_ref0 =
(-1) * (2) * g_0_low60_0_low20_out (mod (2**64))
&&
(* premise b assertion*)
f_0_low60_0_low20_out = f_0_low60_0_low20_in,
g_0_low60_0_low20_out * (const 22 2) = g_0_low60_0_low20_in + f_0_low60_0_low20_in,


(* common Assertion *)
(const 21 (-(2**1))) <=s u_out, u_out <=s (const 21 ((2**1)-1)),
(const 21 (-(2**1))) <=s v_out, v_out <=s (const 21 ((2**1)-1)),
(const 21 (-(2**1))) <=s r_out, r_out <=s (const 21 ((2**1)-1)),
(const 21 (-(2**1))) <=s s_out, s_out <=s (const 21 ((2**1)-1)),

(const 21 (-(2**2))) <s (v_out + s_out),
// v_out + s_out <s (const 21 0),

(const 22 0) <=s f_0_low60_0_low20_out, 
f_0_low60_0_low20_out <=s (const 22 ((2**20)-1)),
(const 22 0) <=s g_0_low60_0_low20_out, 
g_0_low60_0_low20_out <=s (const 22 ((2**20)-1)),


f_0_low60_0_low20_out = (const 22 1) (mod (const 22 2)),
g_0_low60_0_low20_out = (uext ne_out 21) (mod (const 22 2)),

fuv_out =
	 (sext f_0_low60_0_low20_out 42) +
(sext u_out 43) * (const 64 (2**(21+19))) +
(sext v_out 43) * (const 64 (2**(42+19)))
,
grs_out =
	 (sext g_0_low60_0_low20_out 42) +
(sext r_out 43) * (const 64 (2**(21+19))) +
(sext s_out 43) * (const 64 (2**(42+19)))
// ,(const 64 0) = (const 64 1)
}
