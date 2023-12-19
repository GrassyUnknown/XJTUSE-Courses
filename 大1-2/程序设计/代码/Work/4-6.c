#include<stdio.h>
int Su(int n);
int main() {
	int a, b;
	scanf("%d %d", &a, &b);
	for (int j = a; j <= b; j++) {
		Su(j);
	}
}
int Su(int n) {
	for (int i = 2; i < n; i++) {
		if (n % i == 0) {
			printf("");
			return 0;
		}
	}
	if (n != 1) { printf("%d ", n); }
	return 0;
}