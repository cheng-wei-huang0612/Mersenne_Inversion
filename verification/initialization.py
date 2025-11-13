from gen_cl import *


emit = []

inputs = [Var("uint64", f"op_x{i}") for i in range(4)]
inputs += [Var("uint64", f"rop_x{i}") for i in range(4)]

emit.append(cl_proc_head())
emit.append(cl_var_layout(inputs))
emit.append(cl_proc_tail())
emit.append(cl_precondition(Pred()))


emit.append(cl_line_comment("initialization the model input to the memory"))
addr = EA(0xffffd2937698)
emit.append(mov_var_var(addr.literal(), inputs[0]))
addr.increment_8bytes()
emit.append(mov_var_var(addr.literal(), inputs[1]))
addr.increment_8bytes()
emit.append(mov_var_var(addr.literal(), inputs[2]))
addr.increment_8bytes()
emit.append(mov_var_var(addr.literal(), inputs[3]))

emit.append(cl_line_comment("initialization of 25519 prime"))
Pi_var = [Var(uint64, f"P{i}") for i in range(4)]
emit.append(mov_var_const(Pi_var[0], (2**64 - 19), uint64))
emit.append(mov_var_const(Pi_var[1], (2**64 - 1 ), uint64))
emit.append(mov_var_const(Pi_var[2], (2**64 - 1 ), uint64))
emit.append(mov_var_const(Pi_var[3], (2**63 - 1 ), uint64))


addr = EA(0xffffd1ddc898)
pc = PC(0xaaaaba370eb4)
emit.append(ldp_q0_q1_from_x0("q5", "q6", "x1", addr, pc))
emit.append(vector_qu64_to_vu64("q5"))
emit.append(vector_qu64_to_vu64("q6"))

emit.append(movi_u64("v4", (2**64 -1), pc))

rpred = Rpred()
rpred.append("v4_uint64_0 = (const 64 (-1))")
rpred.append("v4_uint64_1 = (const 64 (-1))")
emit.append(cl_assert(Pred(epred = Epred(), rpred = rpred)))

emit.append(mov_x_imm("x2", (2**64 - 1), pc))

emit.append(cl_assert(Pred(epred = Epred(), rpred = Rpred("x2 = (const 64 (-1))"))))


emit.append(lsr_x_imm("x2", "x2", 1, pc))
emit.append(mov_x_to_v_u64("v3", 1, "x2", pc))




print(output_string(emit))
with open("initialization.cl", "w") as f:
    f.write(output_string(emit))

