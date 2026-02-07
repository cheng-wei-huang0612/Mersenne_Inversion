proc main () = {true && true}
nop;

nondet  u_0_20@sint64;
nondet  v_0_20@sint64;
nondet  r_0_20@sint64;
nondet  s_0_20@sint64;
nondet u_20_40@sint64;
nondet v_20_40@sint64;
nondet r_20_40@sint64;
nondet s_20_40@sint64;

nondet  u_0_40@sint64;
nondet  v_0_40@sint64;
nondet  r_0_40@sint64;
nondet  s_0_40@sint64;

nondet  f_0_low60_0@sint64;
nondet  g_0_low60_0@sint64;
nondet f_0_low60_20@sint64;
nondet g_0_low60_20@sint64;
nondet f_0_low60_40@sint64;
nondet g_0_low60_40@sint64;



assume
    u_0_20 * f_0_low60_0  + v_0_20 * g_0_low60_0 = f_0_low60_20 * (-2**20)
    ,
    r_0_20 * f_0_low60_0  + s_0_20 * g_0_low60_0 = g_0_low60_20 * (-2**20)
&& true;


assume
    u_20_40 * f_0_low60_20  + v_20_40 * g_0_low60_20 = f_0_low60_40 * (-2**20)
    ,
    r_20_40 * f_0_low60_20  + s_20_40 * g_0_low60_20 = g_0_low60_40 * (-2**20)
&& true;


assume
    u_20_40 * u_0_20 + v_20_40 * r_0_20 = u_0_40
    ,
    u_20_40 * v_0_20 + v_20_40 * s_0_20 = v_0_40
    ,
    r_20_40 * u_0_20 + s_20_40 * r_0_20 = r_0_40
    ,
    r_20_40 * v_0_20 + s_20_40 * s_0_20 = s_0_40
&& true;


assert
    u_0_40 * f_0_low60_0  + v_0_40 * g_0_low60_0 = f_0_low60_40 * (2**40)
    ,
    r_0_40 * f_0_low60_0  + s_0_40 * g_0_low60_0 = g_0_low60_40 * (2**40)
&& true;




sadds dc u_20_40 u_20_40 u_20_40;



{true && true}
