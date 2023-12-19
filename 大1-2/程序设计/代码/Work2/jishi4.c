#include<stdio.h>
int sum(int* p, int n) {
	int sum = 0;
	for (int i = 0; i < n; i++) {
		sum += *(p + i);
	}
	return sum;
}
int main() {
	int p[5];
	for (int i = 0; i < 5; i++) {
		scanf("%d", p + i);
	}
	printf("%d", sum(p, 5));
}