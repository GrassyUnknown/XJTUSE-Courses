#include<stdio.h>
int main() {
	int n,sum=0, num[20][20];
	scanf("%d", &n);
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			scanf("%d", &num[i][j]);
		}
	}
	for (int i = 0; i < n; i++) {
		sum += num[i][i];
	}
	printf("%d", sum);
}