#include<stdio.h>
#include<math.h>
int main() {
	int num[1024], n;
	scanf("%d", &n);
	for (int i = 0; i <= n; i++) {
		num[i] = i;
	}
	num[1] = 0;
	for (int i = 2; i < sqrt(n); i++) {
		if (num[i] != 0) {
			for (int j = 2; i * j <= n; j++) {
				num[i * j] = 0;
			}
		}
	}
	int j = 1;
	for (int i = n; i > 0; i--) {
		if (num[i] != 0) {
			if (j < 10) {
				printf("%d ", i);
				j++;
			}
			else if (j = 10) {
				printf("%d\n", i);
				j = 1;
			}
		}
	}
}