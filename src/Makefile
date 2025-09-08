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
PYTHON_GEN2_1 = $(PYTHON_DIR)/gen_asm_2_1.py
PYTHON_GEN3 = $(PYTHON_DIR)/gen_asm_3.py
PYTHON_GEN4 = $(PYTHON_DIR)/gen_asm_4.py
PYTHON_LIB = $(PYTHON_DIR)/components/genlib.py
DRIVER_C = $(C_DIR)/driver.c
RANDOM_TEST_C = $(C_DIR)/random_test.c
INVERSE_REF_C = $(C_DIR)/inverse_ref.c

# Generated files
GENERATED_ASM1 = $(ASM_DIR)/inverse_1.s
GENERATED_ASM2 = $(ASM_DIR)/inverse_2.s
GENERATED_ASM2_1 = $(ASM_DIR)/inverse_2_1.s
GENERATED_ASM3 = $(ASM_DIR)/inverse_3.s
GENERATED_ASM4 = $(ASM_DIR)/inverse_4.s
OPTIMIZED_ASM_A72 = $(OPT_DIR)/inverse_1_a72.s
OPTIMIZED_ASM_A76 = $(OPT_DIR)/inverse_1_a76.s
OPTIMIZED_ASM2_A72 = $(OPT_DIR)/inverse_2_a72.s
OPTIMIZED_ASM2_A76 = $(OPT_DIR)/inverse_2_a76.s
OPTIMIZED_ASM2_1_A72 = $(OPT_DIR)/inverse_2_1_a72.s
OPTIMIZED_ASM2_1_A76 = $(OPT_DIR)/inverse_2_1_a76.s
OPTIMIZED_ASM3_A72 = $(OPT_DIR)/inverse_3_a72.s
OPTIMIZED_ASM4_A72 = $(OPT_DIR)/inverse_4_a72.s
OPTIMIZED_ASM4_A72_4000 = $(OPT_DIR)/inverse_4_a72_4000.s
OPTIMIZED_ASM4_A72_4100 = $(OPT_DIR)/inverse_4_a72_4100.s
OPTIMIZED_ASM2_A72_4786 = $(OPT_DIR)/inverse_2_a72_4786.s
OPTIMIZED_ASM2_A72_4794 = $(OPT_DIR)/inverse_2_a72_4794.s
OPTIMIZED_ASM2_A76_4871 = $(OPT_DIR)/inverse_2_a76_4871.s
SNAP_INC = $(INCLUDE_DIR)/snap.inc

# Build targets
DRIVER1_BIN = driver1
DRIVER2_BIN = driver2
DRIVER2_1_BIN = driver2_1
DRIVER3_BIN = driver3
DRIVER4_BIN = driver4
DRIVER_A72_BIN = driver_a72
DRIVER_A76_BIN = driver_a76
DRIVER2_A72_BIN = driver2_a72
DRIVER2_A76_BIN = driver2_a76
DRIVER2_1_A72_BIN = driver2_1_a72
DRIVER2_1_A76_BIN = driver2_1_a76
DRIVER3_A72_BIN = driver3_a72
DRIVER4_A72_BIN = driver4_a72
DRIVER4_A72_4000_BIN = driver4_a72_4000
DRIVER4_A72_4100_BIN = driver4_a72_4100
DRIVER2_A72_4786_BIN = driver2_a72_4786
DRIVER2_A72_4794_BIN = driver2_a72_4794
DRIVER2_A76_4871_BIN = driver2_a76_4871
RANDOM_TEST1_BIN = random_test1
RANDOM_TEST2_BIN = random_test2
RANDOM_TEST2_1_BIN = random_test2_1
RANDOM_TEST3_BIN = random_test3
RANDOM_TEST4_BIN = random_test4
RANDOM_TEST_A72_BIN = random_test_a72
RANDOM_TEST_A76_BIN = random_test_a76
RANDOM_TEST2_A72_BIN = random_test2_a72
RANDOM_TEST2_A76_BIN = random_test2_a76
RANDOM_TEST2_1_A72_BIN = random_test2_1_a72
RANDOM_TEST2_1_A76_BIN = random_test2_1_a76
RANDOM_TEST3_A72_BIN = random_test3_a72
RANDOM_TEST4_A72_BIN = random_test4_a72
RANDOM_TEST4_A72_4000_BIN = random_test4_a72_4000
RANDOM_TEST4_A72_4100_BIN = random_test4_a72_4100
RANDOM_TEST2_A72_4786_BIN = random_test2_a72_4786
RANDOM_TEST2_A72_4794_BIN = random_test2_a72_4794
RANDOM_TEST2_A76_4871_BIN = random_test2_a76_4871
INVERSE_REF_BIN = inverse_ref
BIGNUM_DRIVER_BIN = bignum_driver

# Compiler flags
CFLAGS = -O2 -std=c11 -I$(INCLUDE_DIR)
LDFLAGS = -lgmp

.PHONY: all clean generate1 generate2 generate2_1 generate3 generate4 test1 test2 test2_1 test3 test4 driver1 driver2 driver2_1 driver3 driver4 driver_a72 driver_a76 driver2_a72 driver2_a76 driver2_1_a72 driver2_1_a76 driver3_a72 driver4_a72 driver4_a72_4000 driver4_a72_4100 driver2_a72_4786 driver2_a72_4794 driver2_a76_4871 random_test1 random_test2 random_test2_1 random_test3 random_test4 random_test_a72 random_test_a76 random_test2_a72 random_test2_a76 random_test2_1_a72 random_test2_1_a76 random_test3_a72 random_test4_a72 random_test4_a72_4000 random_test4_a72_4100 random_test2_a72_4786 random_test2_a72_4794 random_test2_a76_4871 test_a72 test_a76 test2_a72 test2_a76 test2_1_a72 test2_1_a76 test3_a72 test4_a72 test4_a72_4000 test4_a72_4100 test2_a72_4786 test2_a72_4794 test2_a76_4871 random_test_a72_run random_test_a76_run random_test2_a72_run random_test2_a76_run random_test2_1_a72_run random_test2_1_a76_run random_test3_a72_run random_test4_a72_run random_test4_a72_4000_run random_test4_a72_4100_run random_test2_a72_4786_run random_test2_a72_4794_run random_test2_a76_4871_run run_all_random_test inverse_ref bignum test-bignum

all: generate1 generate2 generate2_1 generate3 generate4 driver1 driver2 driver2_1 driver3 driver4

# Generate assembly code and snap.inc for version 1
generate1: $(GENERATED_ASM1) $(SNAP_INC)

$(GENERATED_ASM1) $(SNAP_INC): $(PYTHON_GEN1) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_1.py

# Generate assembly code and snap.inc for version 2
generate2: $(GENERATED_ASM2) $(SNAP_INC)

$(GENERATED_ASM2): $(PYTHON_GEN2) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_2.py

# Generate assembly code and snap.inc for version 2_1
generate2_1: $(GENERATED_ASM2_1) $(SNAP_INC)

$(GENERATED_ASM2_1): $(PYTHON_GEN2_1) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_2_1.py

# Generate assembly code and snap.inc for version 3
generate3: $(GENERATED_ASM3) $(SNAP_INC)

$(GENERATED_ASM3): $(PYTHON_GEN3) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_3.py

# Generate assembly code and snap.inc for version 4
generate4: $(GENERATED_ASM4) $(SNAP_INC)

$(GENERATED_ASM4): $(PYTHON_GEN4) $(PYTHON_LIB)
	cd $(PYTHON_DIR) && python3 gen_asm_4.py

# Build driver program with version 1
driver1: $(DRIVER1_BIN)

$(DRIVER1_BIN): $(DRIVER_C) $(GENERATED_ASM1)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM1) snap.c $(LDFLAGS) -o $@

# Build driver program with version 2
driver2: $(DRIVER2_BIN)

$(DRIVER2_BIN): $(DRIVER_C) $(GENERATED_ASM2)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM2) snap.c $(LDFLAGS) -o $@

# Build driver program with version 2_1
driver2_1: $(DRIVER2_1_BIN)

$(DRIVER2_1_BIN): $(DRIVER_C) $(GENERATED_ASM2_1)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM2_1) snap.c $(LDFLAGS) -o $@

# Build driver program with version 3
driver3: $(DRIVER3_BIN)

$(DRIVER3_BIN): $(DRIVER_C) $(GENERATED_ASM3)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM3) snap.c $(LDFLAGS) -o $@

# Build driver program with version 4
driver4: $(DRIVER4_BIN)

$(DRIVER4_BIN): $(DRIVER_C) $(GENERATED_ASM4)
	gcc $(CFLAGS) $(DRIVER_C) $(GENERATED_ASM4) snap.c $(LDFLAGS) -o $@

# Build driver program with A72 optimized version
driver_a72: $(DRIVER_A72_BIN)

$(DRIVER_A72_BIN): $(DRIVER_C) $(OPTIMIZED_ASM_A72)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM_A72) snap.c $(LDFLAGS) -o $@

# Build driver program with A76 optimized version
driver_a76: $(DRIVER_A76_BIN)

$(DRIVER_A76_BIN): $(DRIVER_C) $(OPTIMIZED_ASM_A76)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM_A76) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2 A72 optimized version
driver2_a72: $(DRIVER2_A72_BIN)

$(DRIVER2_A72_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_A72)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_A72) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2 A76 optimized version
driver2_a76: $(DRIVER2_A76_BIN)

$(DRIVER2_A76_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_A76)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_A76) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2_1 A72 optimized version
driver2_1_a72: $(DRIVER2_1_A72_BIN)

$(DRIVER2_1_A72_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_1_A72)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_1_A72) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2_1 A76 optimized version
driver2_1_a76: $(DRIVER2_1_A76_BIN)

$(DRIVER2_1_A76_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_1_A76)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_1_A76) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_3 A72 optimized version
driver3_a72: $(DRIVER3_A72_BIN)

$(DRIVER3_A72_BIN): $(DRIVER_C) $(OPTIMIZED_ASM3_A72)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM3_A72) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_4 A72 optimized version
driver4_a72: $(DRIVER4_A72_BIN)

$(DRIVER4_A72_BIN): $(DRIVER_C) $(OPTIMIZED_ASM4_A72)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM4_A72) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_4 A72 optimized version (4000)
driver4_a72_4000: $(DRIVER4_A72_4000_BIN)

$(DRIVER4_A72_4000_BIN): $(DRIVER_C) $(OPTIMIZED_ASM4_A72_4000)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM4_A72_4000) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_4 A72 optimized version (4100)
driver4_a72_4100: $(DRIVER4_A72_4100_BIN)

$(DRIVER4_A72_4100_BIN): $(DRIVER_C) $(OPTIMIZED_ASM4_A72_4100)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM4_A72_4100) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2 A72 optimized version (4786)
driver2_a72_4786: $(DRIVER2_A72_4786_BIN)

$(DRIVER2_A72_4786_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_A72_4786)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_A72_4786) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2 A72 optimized version (4794)
driver2_a72_4794: $(DRIVER2_A72_4794_BIN)

$(DRIVER2_A72_4794_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_A72_4794)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_A72_4794) snap.c $(LDFLAGS) -o $@

# Build driver program with inverse_2 A76 optimized version (4871)
driver2_a76_4871: $(DRIVER2_A76_4871_BIN)

$(DRIVER2_A76_4871_BIN): $(DRIVER_C) $(OPTIMIZED_ASM2_A76_4871)
	gcc $(CFLAGS) $(DRIVER_C) $(OPTIMIZED_ASM2_A76_4871) snap.c $(LDFLAGS) -o $@

# Build random test program  
random_test1: $(RANDOM_TEST1_BIN)

$(RANDOM_TEST1_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM1)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM1) snap.c $(LDFLAGS) -o $@

# Build random test program with version 2
random_test2: $(RANDOM_TEST2_BIN)

$(RANDOM_TEST2_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM2)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM2) snap.c $(LDFLAGS) -o $@

# Build random test program with version 2_1
random_test2_1: $(RANDOM_TEST2_1_BIN)

$(RANDOM_TEST2_1_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM2_1)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM2_1) snap.c $(LDFLAGS) -o $@

# Build random test program with version 3
random_test3: $(RANDOM_TEST3_BIN)

$(RANDOM_TEST3_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM3)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM3) snap.c $(LDFLAGS) -o $@

# Build random test program with version 4
random_test4: $(RANDOM_TEST4_BIN)

$(RANDOM_TEST4_BIN): $(RANDOM_TEST_C) $(GENERATED_ASM4)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(GENERATED_ASM4) snap.c $(LDFLAGS) -o $@

# Build random test program with A72 optimized version
random_test_a72: $(RANDOM_TEST_A72_BIN)

$(RANDOM_TEST_A72_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A72)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A72) snap.c $(LDFLAGS) -o $@

# Build random test program with A76 optimized version
random_test_a76: $(RANDOM_TEST_A76_BIN)

$(RANDOM_TEST_A76_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A76)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM_A76) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2 A72 optimized version
random_test2_a72: $(RANDOM_TEST2_A72_BIN)

$(RANDOM_TEST2_A72_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A72)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A72) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2 A76 optimized version
random_test2_a76: $(RANDOM_TEST2_A76_BIN)

$(RANDOM_TEST2_A76_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A76)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A76) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2_1 A72 optimized version
random_test2_1_a72: $(RANDOM_TEST2_1_A72_BIN)

$(RANDOM_TEST2_1_A72_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_1_A72)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_1_A72) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2_1 A76 optimized version
random_test2_1_a76: $(RANDOM_TEST2_1_A76_BIN)

$(RANDOM_TEST2_1_A76_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_1_A76)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_1_A76) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_3 A72 optimized version
random_test3_a72: $(RANDOM_TEST3_A72_BIN)

$(RANDOM_TEST3_A72_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM3_A72)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM3_A72) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_4 A72 optimized version
random_test4_a72: $(RANDOM_TEST4_A72_BIN)

$(RANDOM_TEST4_A72_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM4_A72)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM4_A72) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_4 A72 optimized version (4000)
random_test4_a72_4000: $(RANDOM_TEST4_A72_4000_BIN)

$(RANDOM_TEST4_A72_4000_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM4_A72_4000)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM4_A72_4000) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_4 A72 optimized version (4100)
random_test4_a72_4100: $(RANDOM_TEST4_A72_4100_BIN)

$(RANDOM_TEST4_A72_4100_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM4_A72_4100)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM4_A72_4100) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2 A72 optimized version (4786)
random_test2_a72_4786: $(RANDOM_TEST2_A72_4786_BIN)

$(RANDOM_TEST2_A72_4786_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A72_4786)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A72_4786) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2 A72 optimized version (4794)
random_test2_a72_4794: $(RANDOM_TEST2_A72_4794_BIN)

$(RANDOM_TEST2_A72_4794_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A72_4794)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A72_4794) snap.c $(LDFLAGS) -o $@

# Build random test program with inverse_2 A76 optimized version (4871)
random_test2_a76_4871: $(RANDOM_TEST2_A76_4871_BIN)

$(RANDOM_TEST2_A76_4871_BIN): $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A76_4871)
	gcc $(CFLAGS) $(RANDOM_TEST_C) $(OPTIMIZED_ASM2_A76_4871) snap.c $(LDFLAGS) -o $@

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

test2_1: driver2_1
	./$(DRIVER2_1_BIN)

test3: driver3
	./$(DRIVER3_BIN)

test4: driver4
	./$(DRIVER4_BIN)

# Run test with A72 optimized version
test_a72: driver_a72
	./$(DRIVER_A72_BIN)

# Run test with A76 optimized version
test_a76: driver_a76
	./$(DRIVER_A76_BIN)

# Run test with inverse_2 A72 optimized version
test2_a72: driver2_a72
	./$(DRIVER2_A72_BIN)

# Run test with inverse_2 A76 optimized version
test2_a76: driver2_a76
	./$(DRIVER2_A76_BIN)

# Run test with inverse_2_1 A72 optimized version
test2_1_a72: driver2_1_a72
	./$(DRIVER2_1_A72_BIN)

# Run test with inverse_2_1 A76 optimized version
test2_1_a76: driver2_1_a76
	./$(DRIVER2_1_A76_BIN)

# Run test with inverse_3 A72 optimized version
test3_a72: driver3_a72
	./$(DRIVER3_A72_BIN)

# Run test with inverse_4 A72 optimized version
test4_a72: driver4_a72
	./$(DRIVER4_A72_BIN)

# Run test with inverse_4 A72 optimized version (4000)
test4_a72_4000: driver4_a72_4000
	./$(DRIVER4_A72_4000_BIN)

# Run test with inverse_4 A72 optimized version (4100)
test4_a72_4100: driver4_a72_4100
	./$(DRIVER4_A72_4100_BIN)

# Run test with inverse_2 A72 optimized version (4786)
test2_a72_4786: driver2_a72_4786
	./$(DRIVER2_A72_4786_BIN)

# Run test with inverse_2 A72 optimized version (4794)
test2_a72_4794: driver2_a72_4794
	./$(DRIVER2_A72_4794_BIN)

# Run test with inverse_2 A76 optimized version (4871)
test2_a76_4871: driver2_a76_4871
	./$(DRIVER2_A76_4871_BIN)

# Run random tests with A72 optimized version
random_test_a72_run: random_test_a72
	./$(RANDOM_TEST_A72_BIN)

# Run random tests with A76 optimized version
random_test_a76_run: random_test_a76
	./$(RANDOM_TEST_A76_BIN)

# Run random tests with inverse_2 A72 optimized version
random_test2_a72_run: random_test2_a72
	./$(RANDOM_TEST2_A72_BIN)

# Run random tests with inverse_2 A76 optimized version
random_test2_a76_run: random_test2_a76
	./$(RANDOM_TEST2_A76_BIN)

# Run random tests with inverse_2_1 A72 optimized version
random_test2_1_a72_run: random_test2_1_a72
	./$(RANDOM_TEST2_1_A72_BIN)

# Run random tests with inverse_2_1 A76 optimized version
random_test2_1_a76_run: random_test2_1_a76
	./$(RANDOM_TEST2_1_A76_BIN)

# Run random tests with inverse_3 A72 optimized version
random_test3_a72_run: random_test3_a72
	./$(RANDOM_TEST3_A72_BIN)

# Run random tests with inverse_4 A72 optimized version
random_test4_a72_run: random_test4_a72
	./$(RANDOM_TEST4_A72_BIN)

# Run random tests with inverse_4 A72 optimized version (4000)
random_test4_a72_4000_run: random_test4_a72_4000
	./$(RANDOM_TEST4_A72_4000_BIN)

# Run random tests with inverse_4 A72 optimized version (4100)
random_test4_a72_4100_run: random_test4_a72_4100
	./$(RANDOM_TEST4_A72_4100_BIN)

# Run random tests with inverse_2 A72 optimized version (4786)
random_test2_a72_4786_run: random_test2_a72_4786
	./$(RANDOM_TEST2_A72_4786_BIN)

# Run random tests with inverse_2 A72 optimized version (4794)
random_test2_a72_4794_run: random_test2_a72_4794
	./$(RANDOM_TEST2_A72_4794_BIN)

# Run random tests with inverse_2 A76 optimized version (4871)
random_test2_a76_4871_run: random_test2_a76_4871
	./$(RANDOM_TEST2_A76_4871_BIN)

# Test external bignum function
test-bignum: bignum
	./$(BIGNUM_DRIVER_BIN)

# Clean build artifacts
clean:
	rm -f $(DRIVER1_BIN) $(DRIVER2_BIN) $(DRIVER2_1_BIN) $(DRIVER3_BIN) $(DRIVER4_BIN) $(DRIVER_A72_BIN) $(DRIVER_A76_BIN) $(DRIVER2_A72_BIN) $(DRIVER2_A76_BIN) $(DRIVER2_1_A72_BIN) $(DRIVER2_1_A76_BIN) $(DRIVER3_A72_BIN) $(DRIVER4_A72_BIN) $(DRIVER4_A72_4000_BIN) $(DRIVER4_A72_4100_BIN) $(DRIVER2_A72_4786_BIN) $(DRIVER2_A72_4794_BIN) $(DRIVER2_A76_4871_BIN) $(RANDOM_TEST1_BIN) $(RANDOM_TEST2_BIN) $(RANDOM_TEST2_1_BIN) $(RANDOM_TEST3_BIN) $(RANDOM_TEST4_BIN) $(RANDOM_TEST_A72_BIN) $(RANDOM_TEST_A76_BIN) $(RANDOM_TEST2_A72_BIN) $(RANDOM_TEST2_A76_BIN) $(RANDOM_TEST2_1_A72_BIN) $(RANDOM_TEST2_1_A76_BIN) $(RANDOM_TEST3_A72_BIN) $(RANDOM_TEST4_A72_BIN) $(RANDOM_TEST4_A72_4000_BIN) $(RANDOM_TEST4_A72_4100_BIN) $(RANDOM_TEST2_A72_4786_BIN) $(RANDOM_TEST2_A72_4794_BIN) $(RANDOM_TEST2_A76_4871_BIN) $(INVERSE_REF_BIN) $(BIGNUM_DRIVER_BIN)
	rm -f *.o *.out
	rm -f $(GENERATED_ASM1) $(GENERATED_ASM2) $(GENERATED_ASM2_1) $(GENERATED_ASM3) $(GENERATED_ASM4)
	rm -f $(SNAP_INC)

# Help
help:
	@echo "Available targets:"
	@echo "  all         - Generate all assembly versions and build all drivers (default)"
	@echo "  generate1   - Generate assembly code from gen_asm_1.py"
	@echo "  generate2   - Generate assembly code from gen_asm_2.py"
	@echo "  generate2_1 - Generate assembly code from gen_asm_2_1.py"
	@echo "  generate3   - Generate assembly code from gen_asm_3.py"
	@echo "  generate4   - Generate assembly code from gen_asm_4.py"
	@echo "  driver1     - Build driver program with inverse_1.s"
	@echo "  driver2     - Build driver program with inverse_2.s"
	@echo "  driver2_1   - Build driver program with inverse_2_1.s"
	@echo "  driver3     - Build driver program with inverse_3.s"
	@echo "  driver4     - Build driver program with gen_asm_4.py (inverse_4.s)"
	@echo "  driver_a72  - Build driver program with A72 optimized version (inverse_1)"
	@echo "  driver_a76  - Build driver program with A76 optimized version (inverse_1)"
	@echo "  driver2_a72 - Build driver program with A72 optimized version (inverse_2)"
	@echo "  driver2_a76 - Build driver program with A76 optimized version (inverse_2)"
	@echo "  driver2_1_a72 - Build driver program with A72 optimized version (inverse_2_1)"
	@echo "  driver2_1_a76 - Build driver program with A76 optimized version (inverse_2_1)"
	@echo "  driver3_a72 - Build driver program with A72 optimized version (inverse_3)"
	@echo "  driver4_a72 - Build driver program with A72 optimized version (inverse_4)"
	@echo "  driver4_a72_4000 - Build driver program with A72 optimized version (inverse_4_4000)"
	@echo "  driver4_a72_4100 - Build driver program with A72 optimized version (inverse_4_4100)"
	@echo "  driver2_a72_4786 - Build driver program with A72 optimized version (inverse_2_4786)"
	@echo "  driver2_a72_4794 - Build driver program with A72 optimized version (inverse_2_4794)"
	@echo "  driver2_a76_4871 - Build driver program with A76 optimized version (inverse_2_4871)"
	@echo "  test1       - Run test with gen_asm_1.py version"
	@echo "  test2       - Run test with gen_asm_2.py version"
	@echo "  test2_1     - Run test with gen_asm_2_1.py version"
	@echo "  test3       - Run test with gen_asm_3.py version"
	@echo "  test4       - Run test with gen_asm_4.py version"
	@echo "  test_a72    - Run test with A72 optimized version (inverse_1)"
	@echo "  test_a76    - Run test with A76 optimized version (inverse_1)"
	@echo "  test2_a72   - Run test with A72 optimized version (inverse_2)"
	@echo "  test2_a76   - Run test with A76 optimized version (inverse_2)"
	@echo "  test2_1_a72 - Run test with A72 optimized version (inverse_2_1)"
	@echo "  test2_1_a76 - Run test with A76 optimized version (inverse_2_1)"
	@echo "  test3_a72   - Run test with A72 optimized version (inverse_3)"
	@echo "  test4_a72   - Run test with A72 optimized version (inverse_4)"
	@echo "  test4_a72_4000 - Run test with A72 optimized version (inverse_4_4000)"
	@echo "  test4_a72_4100 - Run test with A72 optimized version (inverse_4_4100)"
	@echo "  test2_a72_4786 - Run test with A72 optimized version (inverse_2_4786)"
	@echo "  test2_a72_4794 - Run test with A72 optimized version (inverse_2_4794)"
	@echo "  test2_a76_4871 - Run test with A76 optimized version (inverse_2_4871)"
	@echo "  random_test1 - Build random test program with inverse_1.s"
	@echo "  random_test2 - Build random test program with inverse_2.s"
	@echo "  random_test2_1 - Build random test program with inverse_2_1.s"
	@echo "  random_test3 - Build random test program with inverse_3.s"
	@echo "  random_test4 - Build random test program with gen_asm_4.py (inverse_4.s)"
	@echo "  random_test_a72 - Build random test program with A72 optimized version (inverse_1)"
	@echo "  random_test_a76 - Build random test program with A76 optimized version (inverse_1)"
	@echo "  random_test2_a72 - Build random test program with A72 optimized version (inverse_2)"
	@echo "  random_test2_a76 - Build random test program with A76 optimized version (inverse_2)"
	@echo "  random_test2_1_a72 - Build random test program with A72 optimized version (inverse_2_1)"
	@echo "  random_test2_1_a76 - Build random test program with A76 optimized version (inverse_2_1)"
	@echo "  random_test3_a72 - Build random test program with A72 optimized version (inverse_3)"
	@echo "  random_test4_a72 - Build random test program with A72 optimized version (inverse_4)"
	@echo "  random_test4_a72_4000 - Build random test program with A72 optimized version (inverse_4_4000)"
	@echo "  random_test4_a72_4100 - Build random test program with A72 optimized version (inverse_4_4100)"
	@echo "  random_test2_a72_4786 - Build random test program with A72 optimized version (inverse_2_4786)"
	@echo "  random_test2_a72_4794 - Build random test program with A72 optimized version (inverse_2_4794)"
	@echo "  random_test2_a76_4871 - Build random test program with A76 optimized version (inverse_2_4871)"
	@echo "  random_test_a72_run - Build and run random tests with A72 optimized version (inverse_1)"
	@echo "  random_test_a76_run - Build and run random tests with A76 optimized version (inverse_1)"
	@echo "  random_test2_a72_run - Build and run random tests with A72 optimized version (inverse_2)"
	@echo "  random_test2_a76_run - Build and run random tests with A76 optimized version (inverse_2)"
	@echo "  random_test2_1_a72_run - Build and run random tests with A72 optimized version (inverse_2_1)"
	@echo "  random_test2_1_a76_run - Build and run random tests with A76 optimized version (inverse_2_1)"
	@echo "  random_test3_a72_run - Build and run random tests with A72 optimized version (inverse_3)"
	@echo "  random_test4_a72_run - Build and run random tests with A72 optimized version (inverse_4)"
	@echo "  random_test4_a72_4000_run - Build and run random tests with A72 optimized version (inverse_4_4000)"
	@echo "  random_test4_a72_4100_run - Build and run random tests with A72 optimized version (inverse_4_4100)"
	@echo "  random_test2_a72_4786_run - Build and run random tests with A72 optimized version (inverse_2_4786)"
	@echo "  random_test2_a72_4794_run - Build and run random tests with A72 optimized version (inverse_2_4794)"
	@echo "  random_test2_a76_4871_run - Build and run random tests with A76 optimized version (inverse_2_4871)"
	@echo "  inverse_ref - Build reference implementation"
	@echo "  bignum      - Build external bignum_inv_p25519 test (with debug snapshots)"
	@echo "  test-bignum - Run external bignum test (with debug output)"
	@echo "  clean       - Remove build artifacts"
	@echo "  help        - Show this help"
