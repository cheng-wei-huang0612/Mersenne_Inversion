
proc divstepx20_1(
    f_low60_0@sint64,
    g_low60_0@sint64
    ;
    neg_f_low60_20@sint64,
    neg_g_low60_20@sint64,
    u@sint64,
    v@sint64,
    r@sint64,
    s@sint64
) = {true && true}

// init_fuv_grs
// divstepx20
// extraction
// update_fg
nondet neg_f_low60_20@sint64;
nondet neg_g_low60_20@sint64;
nondet u@sint64;
nondet v@sint64;
nondet r@sint64;
nondet s@sint64;


assume 
u * f_low60_0 + v * g_low60_0 = neg_f_low60_20 * (2**20),
r * f_low60_0 + s * g_low60_0 = neg_g_low60_20 * (2**20)
&& true;

{
u * f_low60_0 + v * g_low60_0 = neg_f_low60_20 * (2**20),
r * f_low60_0 + s * g_low60_0 = neg_g_low60_20 * (2**20)
&& true
}



proc divstepx20_2(
    neg_f_low60_20@sint64,
    neg_g_low60_20@sint64,
    f_low60_0@sint64,
    g_low60_0@sint64,
    u_in@sint64,
    v_in@sint64,
    r_in@sint64,
    s_in@sint64
    ;
    f_low60_40@sint64,
    g_low60_40@sint64,
    u@sint64,
    v@sint64,
    r@sint64,
    s@sint64
) = {
u_in * f_low60_0 + v_in * g_low60_0 = neg_f_low60_20 * (2**20),
r_in * f_low60_0 + s_in * g_low60_0 = neg_g_low60_20 * (2**20)
&& true}

// init_fuv_grs
// divstepx20
// extraction
// update_fg
// update_uuvvrrss
nondet f_low60_40@sint64;
nondet g_low60_40@sint64;
nondet u@sint64;
nondet v@sint64;
nondet r@sint64;
nondet s@sint64;


assume 
u * f_low60_0 + v * g_low60_0 = f_low60_40 * (2**40),
r * f_low60_0 + s * g_low60_0 = g_low60_40 * (2**40)
&& true;

{
u * f_low60_0 + v * g_low60_0 = f_low60_40 * (2**40),
r * f_low60_0 + s * g_low60_0 = g_low60_40 * (2**40)
&& true
}


proc divstepx19_3(
    f_low60_40@sint64,
    g_low60_40@sint64,
    f_low60_0@sint64,
    g_low60_0@sint64,
    u_in@sint64,
    v_in@sint64,
    r_in@sint64,
    s_in@sint64
    ;
    neg_f_low60_59@sint64,
    neg_g_low60_59@sint64,
    u@sint64,
    v@sint64,
    r@sint64,
    s@sint64
) = {
u_in * f_low60_0 + v_in * g_low60_0 = f_low60_40 * (2**40),
r_in * f_low60_0 + s_in * g_low60_0 = g_low60_40 * (2**40)
&& true}

// init_fuv_grs
// divstepx19
// extraction
// update_uuvvrrss
nondet neg_f_low60_59@sint64;
nondet neg_g_low60_59@sint64;
nondet u@sint64;
nondet v@sint64;
nondet r@sint64;
nondet s@sint64;


assume 
u * f_low60_0 + v * g_low60_0 = neg_f_low60_59 * (2**60),
r * f_low60_0 + s * g_low60_0 = neg_g_low60_59 * (2**60)
&& true;

{
u * f_low60_0 + v * g_low60_0 = neg_f_low60_59 * (2**60),
r * f_low60_0 + s * g_low60_0 = neg_g_low60_59 * (2**60)
&& true
}


proc main()
={true && true}

nondet x1@sint64;
nondet x2@sint64;

// ghost f_low60_0@sint64, g_low60_0@sint64:
// f_low60_0 = x1, g_low60_0 = x2
// &&
// f_low60_0 = x1, g_low60_0 = x2;
mov f_low60_0 x1;
mov g_low60_0 x2;

call divstepx20_1(
    x1, x2; x1, x2, x11, x12, x13, x14
);


call divstepx20_2(
    x1, x2, f_low60_0, g_low60_0, x11, x12, x13, x14; x1, x2, x11, x12, x13, x14
);



call divstepx19_3(
    x1, x2, f_low60_0, g_low60_0, x11, x12, x13, x14; x1, x2, x11, x12, x13, x14
);

mov neg_f_low60_59 x1;
mov neg_g_low60_59 x2;
mov u_0_59 x11;
mov v_0_59 x12;
mov r_0_59 x13;
mov s_0_59 x14;

assert 
u_0_59 * f_low60_0 + v_0_59 * g_low60_0 = neg_f_low60_59 * (2**60),
r_0_59 * f_low60_0 + s_0_59 * g_low60_0 = neg_g_low60_59 * (2**60)
&& true;

{true && true}
