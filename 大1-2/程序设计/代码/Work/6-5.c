#include<stdio.h>
float F(float x) {
	float y = x * x * x + 2 * x * x + 3 * x + 4;
	return y;
}
float F1(float x) {
	float y = 3 * x * x + 4 * x + 3;
	return y;
}
float DieDai(float x,int n) {
	for (int i = 0; i < n; i++) {
		x = x - F(x) / F1(x);
	}
	return x;
}

int main() {
	float x; int n;
	scanf("%f %d", &x, &n);
	printf("%f", DieDai(x, n));
}