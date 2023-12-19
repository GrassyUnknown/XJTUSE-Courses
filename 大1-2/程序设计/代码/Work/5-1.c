#include<stdio.h>
int main() {
	int n[1024];
	scanf("%d",&n[0]);
	for (int i = 1; i <= n[0]; i++) {
		scanf("%d", &n[i]);
	}
	int row = n[0] / 5;
	for (int i = 1; i <= row; i++) {
		for (int j = 1; j <= 4; j++) {
			printf("%d ", n[n[0] - i * 5 - j + 6]);
		}
		printf("%d\n", n[n[0]-i*5+1]);
	}
	int i = 5 * row + 1;
	while (i <= n[0]) {
		printf("%d ", n[n[0]+1 - i]);
		i++;
	}
}