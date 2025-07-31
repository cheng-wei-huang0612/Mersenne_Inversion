/*
 * Copyright (c) 2024-2025 The mlkem-native project authors
 * SPDX-License-Identifier: Apache-2.0
 */
#include <inttypes.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hal.h"

#define NWARMUP 50
#define NITERATIONS 300
#define NTESTS 500

static int cmp_uint64_t(const void *a, const void *b)
{
  return (int)((*((const uint64_t *)a)) - (*((const uint64_t *)b)));
}

static void print_median(const char *txt, uint64_t cyc[NTESTS])
{
  printf("%10s cycles = %" PRIu64 "\n", txt, cyc[NTESTS >> 1] / NITERATIONS);
}

static int percentiles[] = {1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 99};

static void print_percentile_legend(void)
{
  unsigned i;
  printf("%21s", "percentile");
  for (i = 0; i < sizeof(percentiles) / sizeof(percentiles[0]); i++)
  {
    printf("%7d", percentiles[i]);
  }
  printf("\n");
}

static void print_percentiles(const char *txt, uint64_t cyc[NTESTS])
{
  unsigned i;
  printf("%10s percentiles:", txt);
  for (i = 0; i < sizeof(percentiles) / sizeof(percentiles[0]); i++)
  {
    printf("%7" PRIu64, (cyc)[NTESTS * percentiles[i] / 100] / NITERATIONS);
  }
  printf("\n");
}

// extern void inverse(uint64_t inv[static 4], const uint64_t x[static 4]);
extern void s2n_innerloop();
extern void my_innerloop();

static int bench_s2n(void)
{

  int i, j;
  uint64_t t0, t1;
  uint64_t cycles_ntt[NTESTS];

  for (i = 0; i < NTESTS; i++)
  {
    for (j = 0; j < NWARMUP; j++)
    {
      s2n_innerloop();
    }

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      s2n_innerloop();
    }
    t1 = get_cyclecounter();
    cycles_ntt[i] = t1 - t0;
  }
  qsort(cycles_ntt, NTESTS, sizeof(uint64_t), cmp_uint64_t);
  print_median("scalar", cycles_ntt);
  printf("\n");
  print_percentile_legend();
  print_percentiles("scalar", cycles_ntt);

  return 0;
}

static int bench_my(void)
{

  int i, j;
  uint64_t t0, t1;
  uint64_t cycles_ntt[NTESTS];

  for (i = 0; i < NTESTS; i++)
  {
    for (j = 0; j < NWARMUP; j++)
    {
      my_innerloop();
    }

    t0 = get_cyclecounter();
    for (j = 0; j < NITERATIONS; j++)
    {
      my_innerloop();
    }
    t1 = get_cyclecounter();
    cycles_ntt[i] = t1 - t0;
  }
  qsort(cycles_ntt, NTESTS, sizeof(uint64_t), cmp_uint64_t);
  print_median("scalar", cycles_ntt);
  printf("\n");
  print_percentile_legend();
  print_percentiles("scalar", cycles_ntt);

  return 0;
}

int main(void)
{
  enable_cyclecounter();
  bench_s2n();
  bench_my();

  disable_cyclecounter();

  return 0;
}
