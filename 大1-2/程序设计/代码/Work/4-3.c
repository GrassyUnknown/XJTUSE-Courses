#include<stdio.h>
int main() {
	int a;
	scanf("%d", &a);
	for (int r = 1; r <= a; r++) {
		for (int l = 1; l < r; l++) {
			printf("%d*%d=%d ", r, l, r * l);
		}
		printf("%d*%d=%d\n", r, r, r * r);
	}
}