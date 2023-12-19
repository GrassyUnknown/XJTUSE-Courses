#include<stdio.h>
int fbnq(int n) {
    if (n == 2 || n == 1) {
        return 1;
    }
    else {
        return fbnq(n - 2) + fbnq(n - 1);
    }
}
int main() {
    int n; scanf("%d", &n);
    if (n > 0) {
        printf("%d", fbnq(n));
    }
    else {
        printf("ERROR");
    }
}