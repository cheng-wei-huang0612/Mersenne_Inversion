# Makefile for Mersenne Inversion project
# Organized structure with subdirectories

# Directories
PYTHON_DIR = python
C_DIR = c
ASM_DIR = asm
OPT_DIR = opt
INCLUDE_DIR = include

# Source files
PYTHON_GEN1 = $(PYTHON_DIR)/gen_asm_1.py
PYTHON_GEN2 = $(PYTHON_DIR)/gen_asm_2.py
PYTHON_GEN3 = $(PYTHON_DIR)/gen_asm_3.py
PYTHON_LIB = $(PYTHON_DIR)/genlib.py
DRIVER_C = $(C_DIR)/driver.c
RANDOM_TEST_C = $(C_DIR)/random_test.c
INVERSE_REF_C = $(C_DIR)/inverse_ref.c

# Generated files
GENERATED_ASM1 = $(ASM_DIR)/inverse_1.s
GENERATED_ASM2 = $(ASM_DIR)/inverse_2.s
GENERATED_ASM3 = $(ASM_DIR)/inverse_3.s
OPTIMIZED_ASM_A72 = $(OPT_DIR)/inverse_1_a72.s
OPTIMIZED_ASM_A76 = $(OPT_DIR)/inverse_1_a76.s
SNAP_INC = $(INCLUDE_DIR)/snap.inc

# Build targets
DRIVER1_BIN = driver1
DRIVER2_BIN = driver2
DRIVER3_BIN = driver3
DRIVER_A72_BIN = driver_a72
DRIVER_A76_BIN = driver_a76
RANDOM_TEST1_BIN = random_test1
RANDOM_TEST2_BIN = random_test2
RANDOM_TEST3_BIN = random_test3
RANDOM_TEST_A72_BIN = random_test_a72
RANDOM_TEST_A76_BIN = random_test_a76
INVERSE_REF_BIN = inverse_ref
BIGNUM_DRIVER_BIN = bignum_driver

# Compiler flags
CFLAGS = -O2 -std=c11 -I$(INCLUDE_DIR)
LDFLAGS = -lgmp

.PHONY: all clean generate1 generate2 generate3 test1 test2 test3 driver1 driver2 driver3 driver_a72 driver_a76 random_test1 random_test2 random_test3 random_test_a72 random_test_a76 test_a72 test_a76 inverse_ref bignum test-bignum

all: generate1 driver1

# Generate assembly code and snap.inc for version 1
generate1: $(GENERATED_ASM1) $(SNAP_INC)

$(GENERATED_ASM1) $(SNAP_INC): $(PYTHON_GEN1) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_1.py

# Generate assembly code and snap.inc for version 2
generate2: $(GENERATED_ASM2) $(SNAP_INC)

$(GENERATED_ASM2): $(PYTHON_GEN2) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_2.py

# Generate assembly code and snap.inc for version 3
generate3: $(GENERATED_ASM3) $(SNAP_INC)

$(GENERATED_ASM3): $(PYTHON_GEN3) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_3.py

# Build driver program with version 1
driver1: $(DRIVER1_BIN)

$(DRIVER1_BIN): $(DRIVER_C) $(GENERATED_ASM1)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM1) snap.c $(LDFLAGS) -o $@

# Build driver program with version 2
driver2: $(DRIVER2_BIN)

$(DRIVER2_BIN): $(DRIVER_C) $(GENERATED_ASM2)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM2) snap.c $(LDFLAGS) -o $@

# Build driver program with version 3
driver3: $(DRIVER3_BIN)

$(DRIVER3_BIN): $(DRIVER_C) $(GENERATED_ASM3)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM3) snap.c $(LDFLAGS) -o $@

# Build driver program with A72 optimized version
driver_a72: $(DRIVER_A72_BIN)

$(DRIVER_A72_BIN): $(DRIVER_C) $(OPTIMIZED_ASM_A72)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM_A72) snap.c $(LDFLAGS) -o $@

# Build driver program with A76 optimized version
driver_a76: $(DRIVER_A76_BIN)

$(DRIVER_A76_BIN): $(DRIVER_C) $(OPTIMIZED_ASM_A76)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM_A76) snap.c $(LDFLAGS) -o $@

# Build random test program  
random_test1: $(RANDOM_TEST1_BIN)

$(RANDOM_TEST1_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM1)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM1) snap.c $(LDFLAGS) -o $@

# Build random test program with version 2
random_test2: $(RANDOM_TEST2_BIN)

$(RANDOM_TEST2_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM2)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM2) snap.c $(LDFLAGS) -o $@

# Build random test program with version 3
random_test3: $(RANDOM_TEST3_BIN)

$(RANDOM_TEST3_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM3)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM3) snap.c $(LDFLAGS) -o $@

# Build random test program with A72 optimized version
random_test_a72: $(RANDOM_TEST_A72_BIN)

$(RANDOM_TEST_A72_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A72)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A72) snap.c $(LDFLAGS) -o $@

# Build random test program with A76 optimized version
random_test_a76: $(RANDOM_TEST_A76_BIN)

$(RANDOM_TEST_A76_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A76)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A76) snap.c $(LDFLAGS) -o $@

# Build reference implementation
inverse_ref: $(INVERSE_REF_BIN)

$(INVERSE_REF_BIN): $(INVERSE_REF_C)
	gcc $(CFLAGS) $(INVERSE_REF_C) $(LDFLAGS) -o $@

# Build external bignum test with debug snapshots
bignum: $(BIGNUM_DRIVER_BIN)

$(BIGNUM_DRIVER_BIN): $(C_DIR)/bignum_driver.c $(ASM_DIR)/bignum_inv_p25519_debug.S
	gcc $(CFLAGS) $(C_DIR)/bignum_driver.c $(ASM_DIR)/bignum_inv_p25519_debug.S snap.c $(LDFLAGS) -o $@

# Test targets
test1: driver1
	./$(DRIVER1_BIN)

test2: driver2
	./$(DRIVER2_BIN)

test3: driver3
	./$(DRIVER3_BIN)

# Run test with A72 optimized version
test_a72: driver_a72
	./$(DRIVER_A72_BIN)

# Run test with A76 optimized version
test_a76: driver_a76
	./$(DRIVER_A76_BIN)

# Run random tests with A72 optimized version
random_test_a72_run: random_test_a72
	./$(RANDOM_TEST_A72_BIN)

# Run random tests with A76 optimized version
random_test_a76_run: random_test_a76
	./$(RANDOM_TEST_A76_BIN)

# Test external bignum function
test-bignum: bignum
	./$(BIGNUM_DRIVER_BIN)

# Clean build artifacts
clean:
	rm -f $(DRIVER1_BIN) $(DRIVER2_BIN) $(DRIVER3_BIN) $(DRIVER_A72_BIN) $(DRIVER_A76_BIN) $(RANDOM_TEST1_BIN) $(RANDOM_TEST2_BIN) $(RANDOM_TEST3_BIN) $(RANDOM_TEST_A72_BIN) $(RANDOM_TEST_A76_BIN) $(INVERSE_REF_BIN) $(BIGNUM_DRIVER_BIN)
	rm -f *.o *.out
	rm -f $(GENERATED_ASM1) $(GENERATED_ASM2) $(GENERATED_ASM3)
	rm -f $(SNAP_INC)

# Help
help:
	@echo "Available targets:"
	@echo "  all         - Generate assembly (v1) and build driver1 (default)"
	@echo "  generate1   - Generate assembly code from gen_asm_1.py"
	@echo "  generate2   - Generate assembly code from gen_asm_2.py"
	@echo "  generate3   - Generate assembly code from gen_asm_3.py"
	@echo "  driver1     - Build driver program with inverse_1.s"
	@echo "  driver2     - Build driver program with inverse_2.s"
	@echo "  driver3     - Build driver program with inverse_3.s"
	@echo "  driver_a72  - Build driver program with A72 optimized version"
	@echo "  driver_a76  - Build driver program with A76 optimized version"
	@echo "  test1       - Run test with gen_asm_1.py version"
	@echo "  test2       - Run test with gen_asm_2.py version"
	@echo "  test3       - Run test with gen_asm_3.py version"
	@echo "  test_a72    - Run test with A72 optimized version"
	@echo "  test_a76    - Run test with A76 optimized version"
	@echo "  random_test1 - Build random test program with inverse_1.s"
	@echo "  random_test2 - Build random test program with inverse_2.s"
	@echo "  random_test3 - Build random test program with inverse_3.s"
	@echo "  random_test_a72 - Build random test program with A72 optimized version"
	@echo "  random_test_a76 - Build random test program with A76 optimized version"
	@echo "  random_test_a72_run - Build and run random tests with A72 optimized version"
	@echo "  random_test_a76_run - Build and run random tests with A76 optimized version"
	@echo "  inverse_ref - Build reference implementation"
	@echo "  bignum      - Build external bignum_inv_p25519 test (with debug snapshots)"
	@echo "  test-bignum - Run external bignum test (with debug output)"
	@echo "  clean       - Remove build artifacts"
	@echo "  help        - Show this help"
