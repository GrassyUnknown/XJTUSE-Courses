#include<stdio.h>
void Pai(int num[128],int n) {
	int k;
	for (int i = 0; i < n-1; i++) {
		for (int j = 0; j < n-1; j++) {
			if (num[j] > num[j + 1]) {
				k = num[j];
				num[j] = num[j + 1];
				num[j + 1] = k;
			}
		}
	}
}
int main() {
	int n, num[128];
	scanf("%d", &n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &num[i]);
	}
	Pai(num, n);
	for (int i = 0; i < n-1; i++) {
		printf("%d ", num[i]);
	}
	printf("%d", num[n - 1]);
}