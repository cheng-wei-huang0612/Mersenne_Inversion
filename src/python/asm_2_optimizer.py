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
slothy.load_source_from_file("../asm/inverse_2.s")
slothy.config.variable_size = True
slothy.config.constraints.stalls_first_attempt = 32

slothy.config.inputs_are_outputs = True
slothy.config.outputs = ["x1","x2","x3"]
slothy.config.reserved_regs = ["x0", "x19","sp"]




slothy.optimize("big_loop","end")
slothy.write_source_to_file("../opt/inverse_2_a72.s")
