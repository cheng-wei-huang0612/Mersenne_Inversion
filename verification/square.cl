proc main () = {true && true}
nondet g_odd@bit;
nondet d_pos@bit;
nondet f_0_low60_0_low20_0@sint64;
nondet f_0_low60_0_low20_1@sint64;
nondet g_0_low60_0_low20_0@sint64;
nondet g_0_low60_0_low20_1@sint64;
nondet u_0_0@sint64;
nondet v_0_0@sint64;
nondet r_0_0@sint64;
nondet s_0_0@sint64;
nondet u_0_1@sint64;
nondet v_0_1@sint64;
nondet r_0_1@sint64;
nondet s_0_1@sint64;



assume 
(g_odd-1)**2 +
(f_0_low60_0_low20_1 - f_0_low60_0_low20_0)**2 +
(u_0_1 - u_0_0)**2 +
(v_0_1 - v_0_0)**2 +
(g_0_low60_0_low20_1 - 2 * g_0_low60_0_low20_0)**2 +
(r_0_1 - 2 * r_0_0)**2 +
(s_0_1 - 2 * s_0_0)**2 
= 0
&& true;

assert g_odd = 1 prove with [algebra solver smt:z3]
&& true;



{true && true}
