#include <stdio.h>


double ftod(float f){
    return (double)f;
}

float dtof(double d){
    return (float)d;
}

int ftoi(float f){
    return (int)f;
}

int dtoi(double d){
    return (int)d;
}

float itof(int i){
    return (float)i;
}

double itod(int i){
    return (double)i;
}

int main(){
    float a = 1.5;
    double b = 1.5;
    int c = 1;
    printf("%lf\n", ftod(a));
    printf("%f\n", dtof(b));
    printf("%d\n%d\n", ftoi(a), dtoi(b));
    printf("%f\n", itof(c));
    printf("%lf\n", itod(c));
}
