#include <math.h>
#include <stdio.h>
#include <stdint.h>

union {
    double dval;
    uint64_t hval;
} InfVal, NanVal, NormVal, zVal;

int main(){
    InfVal.dval = INFINITY;
    NanVal.dval = NAN;
    NormVal.dval = 3.1415;
    zVal.dval = 0.0;
    printf("Dec: %lf Hex: %lx\n", InfVal.dval, InfVal.hval);
    printf("Dec: %lf Hex: %lx\n", NanVal.dval, NanVal.hval);
    printf("Dec: %lf Hex: %lx\n", NormVal.dval, NormVal.hval);
    printf("Dec: %lf Hex: %lx\n", zVal.dval, zVal.hval);
}
