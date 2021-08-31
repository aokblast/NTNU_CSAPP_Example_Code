#include <stdio.h>


int sum_vec(int *arr, int m, int n){
    int ans = 0;
    for(int i = 0; i < m; ++i){
        for(int j = 0; j < n; ++j){
            ans += (arr + i * n)[j];
        }
    }
    return ans;
}



int main(){
    int arr[5][3] = {
        {1, 2, 3}, 
        {4, 5, 6},
        {7, 8, 9},
        {10, 11, 12},
        {13, 14, 15}
    };
    int sum = sum_vec((int *)arr, sizeof(arr) / sizeof(arr[0]), sizeof(arr[0]) / sizeof(int));
    printf("%d\n", sum);
}
