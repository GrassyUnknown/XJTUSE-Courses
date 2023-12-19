#include<stdio.h>
int main() {
	int a, b, c, d,m;
	scanf("%d %d %d %d", &a, &b, &c, &d);
	int num[] = { a,b,c,d };
	for (int i = 1; i <= 3; i++) {
		for (int j = 0; j <= 2; j ++ ) {
			if (num[j] > num[j + 1]) {
				m = num[j + 1];
				num[j + 1] = num[j];
				num[j] = m;
			}
		}
	}
	printf("%d %d %d %d", num[0], num[1], num[2], num[3]);
}