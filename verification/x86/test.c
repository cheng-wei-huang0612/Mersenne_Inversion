


#include <stdio.h>
#include "inverse25519.h"

/*
void inverse25519(unsigned char *out,const unsigned char *in)
{
  inverse25519_skylake_asm(in,out,table);
}
*/

int main()
{
    unsigned char x[32] = {0};
    unsigned char y[32] = {0};

    x[0] = 2;
    x[6] = 2;

    inverse25519(y,x);

    printf("sage: x = 0\n");
    for (int i = 0; i<32; i++) {
        printf("sage: x += %d * (2**(8*%d))\n", x[i], i);
    }
    printf("sage: y = 0\n");
    for (int i = 0; i<32; i++) {
        printf("sage: y += %d * (2**(8*%d))\n", y[i], i);
    }
    printf("sage: y == pow(x,-1,(2**255-19))\n");


    return 0;
}
