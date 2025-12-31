
proc main() = {true && true}

nondet F_0_limb30_0@int32;
nondet F_0_limb30_1@int32;
nondet F_0_limb30_2@int32;
nondet F_0_limb30_3@int32;
nondet F_0_limb30_4@int32;
nondet F_0_limb30_5@int32;
nondet F_0_limb30_6@int32;
nondet F_0_limb30_7@int32;
nondet F_0_limb30_8@int32;
nondet G_0_limb30_0@int32;
nondet G_0_limb30_1@int32;
nondet G_0_limb30_2@int32;
nondet G_0_limb30_3@int32;
nondet G_0_limb30_4@int32;
nondet G_0_limb30_5@int32;
nondet G_0_limb30_6@int32;
nondet G_0_limb30_7@int32;
nondet G_0_limb30_8@int32;
nondet V_0_limb30_0@int32;
nondet V_0_limb30_1@int32;
nondet V_0_limb30_2@int32;
nondet V_0_limb30_3@int32;
nondet V_0_limb30_4@int32;
nondet V_0_limb30_5@int32;
nondet V_0_limb30_6@int32;
nondet V_0_limb30_7@int32;
nondet V_0_limb30_8@int32;
nondet S_0_limb30_0@int32;
nondet S_0_limb30_1@int32;
nondet S_0_limb30_2@int32;
nondet S_0_limb30_3@int32;
nondet S_0_limb30_4@int32;
nondet S_0_limb30_5@int32;
nondet S_0_limb30_6@int32;
nondet S_0_limb30_7@int32;
nondet S_0_limb30_8@int32;

nondet F_59_limb30_0@int32;
nondet F_59_limb30_1@int32;
nondet F_59_limb30_2@int32;
nondet F_59_limb30_3@int32;
nondet F_59_limb30_4@int32;
nondet F_59_limb30_5@int32;
nondet F_59_limb30_6@int32;
nondet F_59_limb30_7@int32;
nondet F_59_limb30_8@int32;
nondet G_59_limb30_0@int32;
nondet G_59_limb30_1@int32;
nondet G_59_limb30_2@int32;
nondet G_59_limb30_3@int32;
nondet G_59_limb30_4@int32;
nondet G_59_limb30_5@int32;
nondet G_59_limb30_6@int32;
nondet G_59_limb30_7@int32;
nondet G_59_limb30_8@int32;
nondet V_59_limb30_0@int32;
nondet V_59_limb30_1@int32;
nondet V_59_limb30_2@int32;
nondet V_59_limb30_3@int32;
nondet V_59_limb30_4@int32;
nondet V_59_limb30_5@int32;
nondet V_59_limb30_6@int32;
nondet V_59_limb30_7@int32;
nondet V_59_limb30_8@int32;
nondet S_59_limb30_0@int32;
nondet S_59_limb30_1@int32;
nondet S_59_limb30_2@int32;
nondet S_59_limb30_3@int32;
nondet S_59_limb30_4@int32;
nondet S_59_limb30_5@int32;
nondet S_59_limb30_6@int32;
nondet S_59_limb30_7@int32;
nondet S_59_limb30_8@int32;

nondet u_0_59@int32;
nondet v_0_59@int32;
nondet r_0_59@int32;
nondet s_0_59@int32;

nondet P@int256;


assume
// [F_0] = P

(
    poly (2**30) [
    F_0_limb30_0, F_0_limb30_1, F_0_limb30_2, F_0_limb30_3,
    F_0_limb30_4, F_0_limb30_5, F_0_limb30_6, F_0_limb30_7,
    F_0_limb30_8
    ]
) = P
,

// u_0_59 * [F_0] + v_0_59 * [G_0] = [F_59] * ((-(2**20))**3)
u_0_59 *
(
    poly (2**30) [
    F_0_limb30_0, F_0_limb30_1, F_0_limb30_2, F_0_limb30_3,
    F_0_limb30_4, F_0_limb30_5, F_0_limb30_6, F_0_limb30_7,
    F_0_limb30_8
    ]
)
+
v_0_59 *
(
    poly (2**30) [
    G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
    G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
    G_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    F_59_limb30_0, F_59_limb30_1, F_59_limb30_2, F_59_limb30_3,
    F_59_limb30_4, F_59_limb30_5, F_59_limb30_6, F_59_limb30_7,
    F_59_limb30_8
    ]
) * ((-(2**20))**3)
,
// r_0_59 * [F_0] + s_0_59 * [G_0] = [G_59] * ((-(2**20))**3)
r_0_59 *
(
    poly (2**30) [
    F_0_limb30_0, F_0_limb30_1, F_0_limb30_2, F_0_limb30_3,
    F_0_limb30_4, F_0_limb30_5, F_0_limb30_6, F_0_limb30_7,
    F_0_limb30_8
    ]
)
+
s_0_59 *
(
    poly (2**30) [
    G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
    G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
    G_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    G_59_limb30_0, G_59_limb30_1, G_59_limb30_2, G_59_limb30_3,
    G_59_limb30_4, G_59_limb30_5, G_59_limb30_6, G_59_limb30_7,
    G_59_limb30_8
    ]
) * ((-(2**20))**3)
,
// u_0_59 * [V_0] + v_0_59 * [S_0] = [V_59] * ((-(2**20))**3) mod P
u_0_59 *
(
    poly (2**30) [
    V_0_limb30_0, V_0_limb30_1, V_0_limb30_2, V_0_limb30_3,
    V_0_limb30_4, V_0_limb30_5, V_0_limb30_6, V_0_limb30_7,
    V_0_limb30_8
    ]
)
+
v_0_59 *
(
    poly (2**30) [
    S_0_limb30_0, S_0_limb30_1, S_0_limb30_2, S_0_limb30_3,
    S_0_limb30_4, S_0_limb30_5, S_0_limb30_6, S_0_limb30_7,
    S_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    V_59_limb30_0, V_59_limb30_1, V_59_limb30_2, V_59_limb30_3,
    V_59_limb30_4, V_59_limb30_5, V_59_limb30_6, V_59_limb30_7,
    V_59_limb30_8
    ]
) * ((-(2**20))**3)
(mod P)
,
// r_0_59 * [V_0] + s_0_59 * [S_0] = [S_59] * ((-(2**20))**3) mod P
r_0_59 *
(
    poly (2**30) [
    V_0_limb30_0, V_0_limb30_1, V_0_limb30_2, V_0_limb30_3,
    V_0_limb30_4, V_0_limb30_5, V_0_limb30_6, V_0_limb30_7,
    V_0_limb30_8
    ]
)
+
s_0_59 *
(
    poly (2**30) [
    S_0_limb30_0, S_0_limb30_1, S_0_limb30_2, S_0_limb30_3,
    S_0_limb30_4, S_0_limb30_5, S_0_limb30_6, S_0_limb30_7,
    S_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    S_59_limb30_0, S_59_limb30_1, S_59_limb30_2, S_59_limb30_3,
    S_59_limb30_4, S_59_limb30_5, S_59_limb30_6, S_59_limb30_7,
    S_59_limb30_8
    ]
) * ((-(2**20))**3)
(mod P)
,

// [V_0] * [G_0] = [F_0] mod P
(
    poly (2**30) [
    V_0_limb30_0, V_0_limb30_1, V_0_limb30_2, V_0_limb30_3,
    V_0_limb30_4, V_0_limb30_5, V_0_limb30_6, V_0_limb30_7,
    V_0_limb30_8
    ]
)
*
(
    poly (2**30) [
    G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
    G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
    G_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    F_0_limb30_0, F_0_limb30_1, F_0_limb30_2, F_0_limb30_3,
    F_0_limb30_4, F_0_limb30_5, F_0_limb30_6, F_0_limb30_7,
    F_0_limb30_8
    ]
)
(mod P)
,
// [S_0] * [G_0] = [G_0] mod p
(
    poly (2**30) [
    S_0_limb30_0, S_0_limb30_1, S_0_limb30_2, S_0_limb30_3,
    S_0_limb30_4, S_0_limb30_5, S_0_limb30_6, S_0_limb30_7,
    S_0_limb30_8
    ]
)
*
(
    poly (2**30) [
    G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
    G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
    G_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
    G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
    G_0_limb30_8
    ]
)
(mod P)

&& true;



assert 
(
    poly (2**30) [
    V_59_limb30_0, V_59_limb30_1, V_59_limb30_2, V_59_limb30_3,
    V_59_limb30_4, V_59_limb30_5, V_59_limb30_6, V_59_limb30_7,
    V_59_limb30_8
    ]
)
*
(
    poly (2**30) [
    G_0_limb30_0, G_0_limb30_1, G_0_limb30_2, G_0_limb30_3,
    G_0_limb30_4, G_0_limb30_5, G_0_limb30_6, G_0_limb30_7,
    G_0_limb30_8
    ]
)
=
(
    poly (2**30) [
    F_59_limb30_0, F_59_limb30_1, F_59_limb30_2, F_59_limb30_3,
    F_59_limb30_4, F_59_limb30_5, F_59_limb30_6, F_59_limb30_7,
    F_59_limb30_8
    ]
)
(mod P)
prove with [algebra solver smt:z3]
&& true;





{true && true}
