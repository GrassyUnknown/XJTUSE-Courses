#include<stdio.h>
int main() {
	int n[3][5], min[8]={999,999,999,999,999,999,999,999}, minmax=-999;
//输入
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 5; j++) {
			scanf("%d", &n[i][j]);
		}
	}
//行最小值
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 5; j++) {
			if (min[i] > n[i][j]) {
				min[i] = n[i][j];
			}
		}
	}
//列最小值
	for (int j = 0; j < 5; j++) {
		for (int i = 0; i < 3; i++) {
			if (min[j+3] > n[i][j]) {
				min[j+3] = n[i][j];
			}
		}
	}
//最小值最大值
	for (int i = 0; i < 8; i++) {
		if (minmax < min[i]) {
			minmax = min[i];
		}
	}
	printf("%d", minmax);
}