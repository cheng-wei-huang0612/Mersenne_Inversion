
proc main(op_x0@uint64, op_x1@uint64, op_x2@uint64, op_x3@uint64)
= {true && true}

mov L0xffffc68e1808 op_x0;
mov L0xffffc68e1810 op_x1;
mov L0xffffc68e1818 op_x2;
mov L0xffffc68e1820 op_x3;

(* ldur q1, [x5, #4] #! EA = L0x55 *)
mov v1 L0x55;

{
  true
  &&
  true
}

