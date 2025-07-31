# SPDX-License-Identifier: Apache-2.0

.PHONY: clean bench_all help

# Automatically find all .s files from both asm and opt directories
ASM_FILES_OPT := $(wildcard ../src/opt/inverse_*.s)
ASM_FILES_ASM := $(wildcard ../src/asm/inverse_*.s)
ASM_FILES := $(ASM_FILES_OPT) $(ASM_FILES_ASM)
TARGETS := $(patsubst ../src/opt/inverse_%.s,bench_inverse_%,$(ASM_FILES_OPT)) \
           $(patsubst ../src/asm/inverse_%.s,bench_inverse_%,$(ASM_FILES_ASM))

CC  ?= gcc
LD  := $(CC)

COMMON_SOURCES = hal/hal.c bench_inverse.c

CFLAGS := \
	-Wall \
	-Wextra \
	-Werror=unused-result \
	-Wpedantic \
	-Werror \
	-Wmissing-prototypes \
	-Wshadow \
	-Wpointer-arith \
	-Wredundant-decls \
	-Wno-long-long \
	-Wno-unknown-pragmas \
	-Wno-unused-command-line-argument \
	-O3 \
	-fomit-frame-pointer \
	-std=c99 \
	-pedantic \
	-Ihal \
	-I../src/include \
	-MMD \
	$(CFLAGS)

ifeq ($(CYCLES),PMU)
	CFLAGS += -DPMU_CYCLES
endif

ifeq ($(CYCLES),PERF)
	CFLAGS += -DPERF_CYCLES
endif

ifeq ($(CYCLES),MAC)
	CFLAGS += -DMAC_CYCLES
endif

all: $(TARGETS)

# Special target for bench_update (not included in bench_all)
bench_update: hal/hal.c bench_update.c update_scalar.s update_vector.s
	@echo "Building bench_update"
	$(CC) $(CFLAGS) hal/hal.c bench_update.c -x assembler-with-cpp update_scalar.s update_vector.s -o bench_update

# Generic rule to build any bench_inverse_* target
# Try opt directory first, then asm directory
bench_inverse_%: $(COMMON_SOURCES)
	@if [ -f ../src/opt/inverse_$*.s ]; then \
		echo "Building $@ (optimized)"; \
		$(CC) $(CFLAGS) $(COMMON_SOURCES) ../src/opt/inverse_$*.s -o $@; \
	elif [ -f ../src/asm/inverse_$*.s ]; then \
		echo "Building $@ (standard)"; \
		$(CC) $(CFLAGS) $(COMMON_SOURCES) ../src/asm/inverse_$*.s -o $@; \
	else \
		echo "Error: inverse_$*.s not found in opt or asm directories"; \
		exit 1; \
	fi

bench_all: all
	@echo "Running all benchmarks with sudo..."
	@for target in $(TARGETS); do \
		echo "=== Running $$target ==="; \
		sudo ./$$target; \
		echo; \
	done

help:
	@echo "Mersenne Inversion Benchmark Suite"
	@echo "=================================="
	@echo ""
	@echo "Available targets:"
	@echo "  all                    - Build all benchmark binaries"
	@echo "  bench_update           - Build bench_update binary (separate from bench_all)"
	@echo "  bench_all              - Build and run all benchmarks with sudo"
	@echo "  clean                  - Remove all built binaries and dependency files"
	@echo "  help                   - Show this help message"
	@echo ""
	@echo "Auto-discovered benchmark targets:"
	@for target in $(TARGETS); do \
		asm_file=$$(echo $$target | sed 's/bench_//'); \
		echo "  $$target - Build benchmark for $$asm_file"; \
	done
	@echo ""
	@echo "Cycle counting options (set CYCLES variable):"
	@echo "  CYCLES=PMU             - Use Performance Monitoring Unit (user mode)"
	@echo "  CYCLES=PERF            - Use Linux perf events (requires root)"
	@echo "  CYCLES=MAC             - Use Apple KPC framework (requires root on macOS)"
	@echo ""
	@echo "Examples:"
	@echo "  make CYCLES=MAC all                    - Build all with MAC cycle counting"
	@echo "  make CYCLES=PMU bench_inverse_3_a72    - Build and run specific benchmark"
	@echo "  make CYCLES=MAC bench_all              - Build and run all benchmarks"
	@echo ""

clean:
	-$(RM) -rf $(TARGETS) bench_update *.d