


#include <stdint.h>
extern void inverse(uint64_t inv[static 4], const uint64_t x[static 4]);


int main(int argc, char const *argv[])
{
    uint64_t x[4] = {0};
    uint64_t inv[4] = {0};

    inverse(inv, x);

    return 0;
}
