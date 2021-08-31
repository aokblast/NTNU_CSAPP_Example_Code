#include <stdio.h>

int sum_vec(int *vec, int size){
    int ans = 0;
    for(int i = 0; i < size; ++i){
        ans += vec[i];
    }
    return ans;
    
}


int main(){
    int arr[5] = {1, 2, 3, 4, 5};
    int sum = sum_vec(arr, sizeof(arr) / sizeof(int));
    printf("%d\n", sum);
}
