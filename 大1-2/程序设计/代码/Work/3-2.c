#include<stdio.h>
int main() {
	int a, b,yue,bei;
	scanf("%d", &a);
	scanf("%d", &b);
	for (int i = 1; i <= a; i++) {
		if (a % i == 0 && b % i == 0) {
			yue = i;
		}
	}
	for (int i = a;; i++) {
		if (i % a == 0 && i % b == 0) {
			bei = i;
			break;
		}
	}
	printf("最大公约数为%d\n最小公倍数为%d", yue, bei);
}