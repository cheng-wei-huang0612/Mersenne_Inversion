import logging
import sys

if __name__ == "__main__":
    sys.path.append("../")

from slothy import Slothy

import slothy.targets.aarch64.aarch64_neon as AArch64_Neon
import slothy.targets.aarch64.cortex_a72_frontend as Target_CortexA72
import slothy.targets.aarch64.cortex_a76_frontend as Target_CortexA76

logging.basicConfig(stream=sys.stdout, level=logging.INFO)

arch = AArch64_Neon
target = Target_CortexA72

slothy = Slothy(arch, target)

# example
slothy.load_source_from_file("../asm/inverse_2_1.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.config.inputs_are_outputs = True
slothy.config.reserved_regs = ["x0", "x19","sp"]
slothy.config.outputs = ["x1","x2","x3","x7","x8"]
slothy.optimize("Lbig_loop","Lend")



slothy.config.outputs = ["x1","x2","x3","x7","x8"]


slothy.optimize("L_begin_opt1","L_end_opt1")
slothy.optimize("L_begin_opt2","L_end_opt2")
slothy.write_source_to_file("../opt/inverse_2_1_a72.s")


del slothy

target = Target_CortexA76
slothy = Slothy(arch, target)
slothy.load_source_from_file("../asm/inverse_2_1.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.config.inputs_are_outputs = True
slothy.config.reserved_regs = ["x0", "x19","sp"]
slothy.config.outputs = ["x1","x2","x3","x7","x8"]
slothy.optimize("Lbig_loop","Lend")



slothy.config.outputs = ["x1","x2","x3","x7","x8"]


slothy.optimize("L_begin_opt1","L_end_opt1")
slothy.optimize("L_begin_opt2","L_end_opt2")
slothy.write_source_to_file("../opt/inverse_2_1_a76.s")