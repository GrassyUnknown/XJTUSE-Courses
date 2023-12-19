#include<stdio.h>
int main() {
	int n, num[20][20];
	scanf("%d", & n);
	for (int i = 0; i < n; i++) {
		num[0][i] = 0;
	}
	for (int i = 0; i < n; i++) {
		num[i][0] = 1;
		if (i > 0) {
			for (int j = 1; j < n; j++) {
				num[i][j] = num[i - 1][j - 1] + num[i - 1][j];
			}
		}
	}
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < i; j++) {
			printf("%d ", num[i][j]);
		}
		printf("%d\n", num[i][i]);
	}
}