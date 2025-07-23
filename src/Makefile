# Makefile for Mersenne Inversion project
# Organized structure with subdirectories

# Directories
PYTHON_DIR = python
C_DIR = c
ASM_DIR = asm
INCLUDE_DIR = include

# Source files
PYTHON_GEN = $(PYTHON_DIR)/gen_asm_1.py
PYTHON_LIB = $(PYTHON_DIR)/genlib.py
DRIVER_C = $(C_DIR)/driver.c
RANDOM_TEST_C = $(C_DIR)/random_test.c
INVERSE_REF_C = $(C_DIR)/inverse_ref.c

# Generated files
GENERATED_ASM = $(ASM_DIR)/inverse_1.s
SNAP_INC = $(INCLUDE_DIR)/snap.inc

# Build targets
DRIVER_BIN = driver
RANDOM_TEST_BIN = random_test
INVERSE_REF_BIN = inverse_ref

# Compiler flags
CFLAGS = -O2 -std=c11 -I$(INCLUDE_DIR)
LDFLAGS = -lgmp

.PHONY: all clean generate test driver random_test inverse_ref

all: generate driver

# Generate assembly code and snap.inc
generate: $(GENERATED_ASM) $(SNAP_INC)

$(GENERATED_ASM) $(SNAP_INC): $(PYTHON_GEN) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_1.py

# Build driver program
driver: $(DRIVER_BIN)

$(DRIVER_BIN): $(DRIVER_C) $(GENERATED_ASM)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM) $(LDFLAGS) -o $@

# Build random test program  
random_test: $(RANDOM_TEST_BIN)

$(RANDOM_TEST_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM) $(LDFLAGS) -o $@

# Build reference implementation
inverse_ref: $(INVERSE_REF_BIN)

$(INVERSE_REF_BIN): $(INVERSE_REF_C)
	gcc $(CFLAGS) $(INVERSE_REF_C) $(LDFLAGS) -o $@

# Test target
test: driver
	./$(DRIVER_BIN)

# Clean build artifacts
clean:
	rm -f $(DRIVER_BIN) $(RANDOM_TEST_BIN) $(INVERSE_REF_BIN)
	rm -f *.o *.out
	rm -f $(GENERATED_ASM)
	rm -f $(SNAP_INC)

# Help
help:
	@echo "Available targets:"
	@echo "  all         - Generate assembly and build driver (default)"
	@echo "  generate    - Generate assembly code from Python"
	@echo "  driver      - Build driver program"
	@echo "  random_test - Build random test program"
	@echo "  inverse_ref - Build reference implementation"
	@echo "  test        - Run driver test"
	@echo "  clean       - Remove build artifacts"
	@echo "  help        - Show this help"
