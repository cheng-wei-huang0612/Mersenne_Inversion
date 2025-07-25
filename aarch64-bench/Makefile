# SPDX-License-Identifier: Apache-2.0

.PHONY: clean

TARGET = bench bench_inverse_1_a72 bench_inverse_1_a76 bench_inverse_2_a72 bench_inverse_2_a76
CC  ?= gcc
LD  := $(CC)

COMMON_SOURCES = hal/hal.c
BENCH_SOURCES = $(COMMON_SOURCES) bench.c ../src/asm/inverse_1.s
BENCH_A72_SOURCES = $(COMMON_SOURCES) bench_inverse_1_a72.c ../src/opt/inverse_1_a72.s
BENCH_A76_SOURCES = $(COMMON_SOURCES) bench_inverse_1_a76.c ../src/opt/inverse_1_a76.s
BENCH_2_A72_SOURCES = $(COMMON_SOURCES) bench_inverse_2_a72.c ../src/opt/inverse_2_a72.s
BENCH_2_A76_SOURCES = $(COMMON_SOURCES) bench_inverse_2_a76.c ../src/opt/inverse_2_a76.s

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

all: $(TARGET)

bench: $(BENCH_SOURCES)
	$(CC) $(CFLAGS) $(BENCH_SOURCES) -o bench

bench_inverse_1_a72: $(BENCH_A72_SOURCES)
	$(CC) $(CFLAGS) $(BENCH_A72_SOURCES) -o bench_inverse_1_a72

bench_inverse_1_a76: $(BENCH_A76_SOURCES)
	$(CC) $(CFLAGS) $(BENCH_A76_SOURCES) -o bench_inverse_1_a76

bench_inverse_2_a72: $(BENCH_2_A72_SOURCES)
	$(CC) $(CFLAGS) $(BENCH_2_A72_SOURCES) -o bench_inverse_2_a72

bench_inverse_2_a76: $(BENCH_2_A76_SOURCES)
	$(CC) $(CFLAGS) $(BENCH_2_A76_SOURCES) -o bench_inverse_2_a76

clean:
	-$(RM) -rf $(TARGET) *.d