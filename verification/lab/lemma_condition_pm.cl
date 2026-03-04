proc main (%v12@sint32[4], %v11@sint32[4], %v10@sint32[4], %v9@sint32[4], %v8@sint32[3])
=
{
    true && true
}
ghost %v8_old@sint32[4], %v9_old@sint32[4], %v10_old@sint32[4], %v11_old@sint32[4], %v12_old@sint32[4]:
%v8_old = %v8,
%v9_old = %v9,
%v10_old = %v10,
%v11_old = %v11,
%v12_old = %v12
&&
%v8_old = %v8,
%v9_old = %v9,
%v10_old = %v10,
%v11_old = %v11,
%v12_old = %v12;



assume true &&
        %v12[0] = %v12_old[0] - (((-2)@sint32) * ((2**15)@sint32)),
        %v8[0] = %v8_old[0] + ((-2)@sint32) * (19@sint32)
        ;

assert true &&
        limbs 30 [%v8_old[0], %v8_old[1], %v9_old[0], %v9_old[1], %v10_old[0], %v10_old[1], %v11_old[0], %v11_old[1], %v12_old[0]]
        + (const 272 (-38)) + (const 272 (2**(240+16)))
        =
        limbs 30 [%v8[0], %v8[1], %v9[0], %v9[1], %v10[0], %v10[1], %v11[0], %v11[1], %v12[0]] ;




{
    true && true
}
