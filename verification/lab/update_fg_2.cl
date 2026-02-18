proc main (
f@sint64, g@sint64,
u@sint64, r@sint64,
v@sint64, s@sint64,
f_updated@sint64, g_updated@sint64;
f_out@sint64, g_out@sint64
)
=
{
    u * f + v * g = f_updated * (-(2**20)),
    r * f + s * g = g_updated * (-(2**20))
    &&
    (const 64 (-(2**20))) <=s u, u <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s v, v <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s r, r <=s (const 64 ((2**20)-1)),
    (const 64 (-(2**20))) <=s s, s <=s (const 64 ((2**20)-1))
}

mov x15 u;
mov x16 v;
mov x17 r;
mov x20 s;
mov x1 f;
mov x2 g;


(* mul	x9, x15, x1                                 #! PC = 0xaaaaafca0c30 *)
mull dcH x9 x15 x1;
(* madd	x9, x16, x2, x9                            #! PC = 0xaaaaafca0c34 *)
mull dcH tmp x2 x16;
adds dc x9 x9 tmp;

assert 
x9 = 0 (mod (2**20)),
x9 = (-1) * ((2**20)) * f_updated (mod (2**64))
&& true;
assume true &&
x9 = (const 64 0) (mod (const 64 (2**20))),
x9 = (const 64 (-1)) * (const 64 (2**20)) * f_updated;

(* asr	x9, x9, #20                                 #! PC = 0xaaaaafca0c38 *)
split x9 dc x9 20;
(* mul	x10, x17, x1                                #! PC = 0xaaaaafca0c3c *)
mull dcH x10 x17 x1;
(* madd	x10, x20, x2, x10                          #! PC = 0xaaaaafca0c40 *)
mull dcH tmp x2 x20;
adds dc x10 x10 tmp;

assert 
x10 = 0 (mod (2**20)),
x10 = (-1) * ((2**20)) * g_updated (mod (2**64))
&& true;
assume true &&
x10 = (const 64 0) (mod (const 64 (2**20))),
x10 = (const 64 (-1)) * (const 64 (2**20)) * g_updated;


(* asr	x2, x10, #20                                #! PC = 0xaaaaafca0c44 *)
split x2 dc x10 20;
(* mov	x1, x9                                      #! PC = 0xaaaaafca0c48 *)
mov x1 x9;




assert true && x1 = (const 64 (-1)) * f_updated (mod (const 64 (2**44)));
assert true && x2 = (const 64 (-1)) * g_updated (mod (const 64 (2**44)));
mov f_out x1;
mov g_out x2;



{true && 
    f_out = (const 64 (-1)) * f_updated (mod (const 64 (2**44))),
    g_out = (const 64 (-1)) * g_updated (mod (const 64 (2**44)))
}
