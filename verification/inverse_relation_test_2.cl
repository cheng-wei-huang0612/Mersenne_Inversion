
proc main() = {true && true}
nondet P@int256;
assume P = ((2**255) - 19) && true;


nondet u_0_59@int32;
nondet v_0_59@int32;
nondet r_0_59@int32;
nondet s_0_59@int32;

nondet F_0@sint256;
nondet G_0@sint256;
nondet V_0@sint256;
nondet S_0@sint256;
nondet F_59@sint256;
nondet G_59@sint256;
nondet V_59@sint256;
nondet S_59@sint256;

assume
F_0 = P
&& true;

assume
u_0_59 * F_0 + v_0_59 * G_0 = F_59 * ((-(2**20))**3),
r_0_59 * F_0 + s_0_59 * G_0 = G_59 * ((-(2**20))**3)
&& true;

assume
u_0_59 * V_0 + v_0_59 * S_0 = V_59 * ((-(2**20))**3) (mod P),
r_0_59 * V_0 + s_0_59 * S_0 = S_59 * ((-(2**20))**3) (mod P)
&& true;


assume
V_0 * G_0 = F_0 (mod P),
S_0 * G_0 = G_0 (mod P)
&& true;


// assert
// V_59 * G_0 * (-(2**60)) = F_59 * (-(2**60)) (mod P),
// S_59 * G_0 * (-(2**60)) = G_59 * (-(2**60)) (mod P)
// && true;

assert
V_59 * G_0 = F_59  (mod P),
S_59 * G_0 = G_59  (mod P)
&& true;

// assert 1 = 0 && true;




{true && true}
