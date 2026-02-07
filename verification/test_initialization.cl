
proc main(op_x0@uint64, op_x1@uint64, op_x2@uint64, op_x3@uint64)
= {true && true}

mov L0xffffc68e1808 op_x0;
mov L0xffffc68e1810 op_x1;
mov L0xffffc68e1818 op_x2;
mov L0xffffc68e1820 op_x3;

(* ldp	x5, x22, [x1]                               #! EA = L0xffffc68e1808; Value = 0x0000000000000000; PC = 0xaaaabe370eb4 *)
mov x5 L0xffffc68e1808; mov x22 L0xffffc68e1810;


// Hi I am a assertion that are manually inserted
assert true && const 64 0 = const 64 0
;

(* ldp	x4, x21, [x1, #16]                          #! EA = L0xffffc68e1818; Value = 0x0000000000000000; PC = 0xaaaabe370eb8 *)
mov x4 L0xffffc68e1818; mov x21 L0xffffc68e1820;

(* mov	x2, #0x13                  	// #19          #! PC = 0xaaaabe370ebc *)
mov x2 0x13@uint64;

(* lsr	x3, x21, #63                                #! PC = 0xaaaabe370ec0 *)
split x3 dcL x21 63;
