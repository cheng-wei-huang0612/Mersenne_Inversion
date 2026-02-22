proc main () = {true && true}

nondet u@sint64;
nondet v@sint64;
nondet r@sint64;
nondet s@sint64;
nondet x15@sint64;
nondet x16@sint64;
nondet f_0@sint64;
nondet f_1@sint64;
nondet g_0@sint64;
nondet g_1@sint64;
nondet new_f_expected@sint64;
nondet new_g_expected@sint64;


assume
limbs 64 [x15, x16] =
(u * (f_0 + f_1 * (2**64))) +
(v * (g_0 + g_1 * (2**64)))
(mod (2**128)),
    (u * (f_0 + f_1 * (2**64))) + (v * (g_0 + g_1 * (2**64))) = 
    new_f_expected * (-(2**60)) (mod 2**128),
    r * (f_0 + f_1 * (2**64)) + s * (g_0 + g_1 * (2**64)) = 
    new_g_expected * (-(2**60)) (mod 2**128)
&&
true
;

assert 
limbs 64 [x15, x16] =
new_f_expected * (-(2**60))
(mod (2**128))
&& true;

assert 
limbs 64 [x15, x16] =
new_f_expected * (-2**60)
(mod (2**128))
&& true;

{true && true}
