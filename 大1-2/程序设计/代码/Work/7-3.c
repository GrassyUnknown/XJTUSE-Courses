#include<stdio.h>
int DaYin(int a, int b) {
	if (b > a) {
		int i = a;
		a = b;
		b = i;
	}
	if (a % b == 0) {
		return b;
	}
	else {
		return DaYin(a - b, b);
	}
}
int main() {
	int a, b; scanf("%d %d", &a, &b);
	printf("%d", DaYin(a, b));
}