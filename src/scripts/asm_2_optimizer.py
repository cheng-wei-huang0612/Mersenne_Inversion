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
slothy.load_source_from_file("../asm/inverse_2.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x1","x2","x3", "x6", "x8",
                         "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9", "v10", "v11", "v12", "v13", "v14", "v15"]

slothy.config.reserved_regs = ["x0", "x19", "sp"]
slothy.config.reserved_regs_are_locked = True
slothy.config.allow_useless_instructions = True
slothy.optimize("L_begin_initialization", "L_end_initialization")
slothy.config.allow_useless_instructions = False


slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x1","x2","x3"]
slothy.optimize("Lbig_loop","Lend")




slothy.write_source_to_file("../opt/inverse_2_a72.s")


del slothy

target = Target_CortexA76
slothy = Slothy(arch, target)
slothy.load_source_from_file("../asm/inverse_2.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x1","x2","x3", "x6", "x8",
                         "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9", "v10", "v11", "v12", "v13", "v14", "v15"]

slothy.config.reserved_regs = ["x0", "x19", "sp"]
slothy.config.reserved_regs_are_locked = True
slothy.config.allow_useless_instructions = True
slothy.optimize("L_begin_initialization", "L_end_initialization")
slothy.config.allow_useless_instructions = False

slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x1","x2","x3"]
slothy.config.reserved_regs = ["x0", "x19","sp"]




slothy.optimize("Lbig_loop","Lend")
slothy.write_source_to_file("../opt/inverse_2_a76.s")