#include<stdio.h>
int BigYue(int a, int b) {
	for (int i = a;; i--) {
		if (b % i == 0&&a%i==0) {
			return i;
		}
	}
}
int SmallBei(int a, int b) {
	for (int i = a;; i++) {
		if (i % b == 0&&i%a==0) {
			return i;
		}
	}
}
int main() {
	int a, b;
	scanf("%d %d", &a, &b);
	printf("%d %d", BigYue(a, b), SmallBei(a, b));
}