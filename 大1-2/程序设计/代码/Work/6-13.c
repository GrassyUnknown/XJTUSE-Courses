#include<stdio.h>
int getin(int data[128], int find[128]) {
	int i;
	for (i = 0; data[i-1] != -9999; i++) {
		scanf("%d", &data[i]);
	}
	for (int j = 0; j < 5; j++) {
		scanf("%d", &find[j]);
	}
	return i;
}
void search(int i, int data[128], int find[128], int result[128]) {
	for (int j = 0; j < 5; j++) {
		result[j] = -1;
		for (int k = 0; k < i ; k++) {
			if (data[k] == find[j]) {
				result[j] = k-1;
				break;
			}
		}
	}
}
void Pai(int num[128], int n) {
	int k;
	for (int i = 0; i < n - 1; i++) {
		for (int j = 0; j < n - 1; j++) {
			if (num[j] > num[j + 1]) {
				k = num[j];
				num[j] = num[j + 1];
				num[j + 1] = k;
			}
		}
	}
}
void getout(int result[128]) {
	for (int i = 0; i < 4; i++) {
		printf("%d\n", result[i]);
	}
	printf("%d", result[4]);
}
int main() {
	int data[128], find[128], result[128],i;
	i = getin(data, find);
	Pai(data, i);
	search(i, data, find, result);
	getout(result);
}