import logging
import sys

if __name__ == "__main__":
    sys.path.append("../")

from slothy import Slothy

import slothy.targets.aarch64.aarch64_neon as AArch64_Neon
import slothy.targets.aarch64.cortex_a72_frontend as Target_CortexA72


logging.basicConfig(stream=sys.stdout, level=logging.INFO)

arch = AArch64_Neon
target = Target_CortexA72

slothy = Slothy(arch, target)

# example
slothy.load_source_from_file("../asm/inverse_4.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32
slothy.config.reserved_regs = ["x0", "x18", "x19", "sp",
                               "v1","v2","v15"]
slothy.config.reserved_regs_are_locked = True

slothy.config.inputs_are_outputs = True
# slothy.config.outputs = ["x1","x2","x3", "x6", "x8",
#                          "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9", "v10", "v11", "v12", "v13", "v14", "v15"]

# slothy.config.allow_useless_instructions = True
# slothy.optimize("L_begin_initialization", "L_end_initialization")
# slothy.config.allow_useless_instructions = False


slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x1","x2","x3",
                         "v1", "v2", "v3", "v4", "v5", "v6", "v7", "v8", "v9", "v10", "v11", "v12",
                         "v13", "v14"]



slothy.optimize("Lbig_loop","Lend")

slothy.config.reserved_regs = ["x0", "x18", "x19", "sp",
                               "v1","v2","v8","v9","v10","v11","v12",
                               "v15"]
slothy.config.reserved_regs_are_locked = True
slothy.config.outputs = ["x1","x2","x3","x4","x5","x21","x22",
                         "v3","v4","v13", "v14"]

slothy.optimize("L_optloop_start_1", "L_optloop_end_1")




slothy.config.reserved_regs = ["x0", "x18", "x19", "sp",
                               "v1","v2","v3","v4","v5","v6","v7",
                               "v15"]
slothy.config.reserved_regs_are_locked = True
slothy.config.outputs = ["x1","x2","x3","x4","x5","x21","x22",
                         "v3","v4","v13", "v14"]

slothy.optimize("L_optloop_start_2", "L_optloop_end_2")


slothy.write_source_to_file("../opt/inverse_4_a72.s")

