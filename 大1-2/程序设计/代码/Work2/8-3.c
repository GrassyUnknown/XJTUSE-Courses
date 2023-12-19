void swap(int* n1, int* n2) {
	int temp = *n1;
	*n1 = *n2;
	*n2 = temp;
}
void Yiwei(int* num, int ci,int n) {
	for (int k = 0; k < ci; k++) {
		for (int j = n - 1; j > 0; j--) {
			swap(num + j, num + j - 1);
		}
	}
}

#include<stdio.h>
int main() {
	int num[128],i,ci;
	for (i = 0; num[i - 1] != 9999; i++) {
		scanf("%d", &num[i]);
	}
	scanf("%d", &ci);
	//i-1是数组位数
	Yiwei(num,ci, i-1);
	for (int j = 0; j < i - 2; j++) {
		printf("%d ", num[j]);
	}
	printf("%d", num[i - 2]);
}