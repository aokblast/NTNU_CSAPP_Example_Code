#include <stdbool.h>
#include <stdio.h>

enum {MAXLEN = (int)(1e5 + 5)};

int djs[MAXLEN], n;

void init(){
    for(int i = 0; i <= n; ++i){
        djs[i] = i;
    }
}

int parent(int u){
    return (u == djs[u]) ? u : parent(djs[u]);
}

static inline bool union_set(int a, int b){
    a = parent(a);
    b = parent(b);
    djs[a] = b;
    return a == b;
}

int main(){
    n = 6;
    init();
    union_set(1, 2);
    union_set(1, 5);
    union_set(2, 5);
    printf("%d\n", parent(5));
}

