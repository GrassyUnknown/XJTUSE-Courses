#include<stdio.h>
int main() {
	int n, num[1024];
	scanf("%d", &n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &num[i]);
	}
	for (int i = 0; i < n; i++) {
		int j = i,m;
		for (int k = i; k < n; k++) {
			if (num[k] > num[j]) {
				j = k;
			}
		}
		m = num[j];
		num[j] = num[i];
		num[i] = m;
		if (i < n - 1) {
			printf("%d ", num[i]);
		}
		else if (i == n - 1) {
			printf("%d", num[i]);
		}
	}
}