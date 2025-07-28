#include <stdint.h>

__attribute__((noinline))
extern void inverse(uint64_t[static 4], const uint64_t[static 4]);

int main(void)
{
    uint64_t x[4] = {1,0,0,0};
    uint64_t inv[4];

    for (unsigned i = 0; i < 100000; i++)   // ← 10^5 次大約 10~20 ms
        inverse(inv, x);

    return 0;
}