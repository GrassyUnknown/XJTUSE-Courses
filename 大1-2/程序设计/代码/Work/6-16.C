#include<stdio.h>
void getin(int data[10][10],int m,int n) {
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) {
			scanf("%d", &data[i][j]);
		}
	}
}
void getout(int data[10][10], int n, int m) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m-1; j++) {
			printf("%d ", data[i][j]);
		}
		printf("%d\n", data[i][m-1]);
	}
}
void turn(int a[10][10], int b[10][10], int m, int n){
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) {
			b[n-1-j][i] = a[i][j];
		}
	}
}
int main() {
	int m, n, a[10][10], b[10][10];
	scanf("%d %d", &m, &n);
	getin(a, m, n);
	turn(a,b,m,n);
	getout(b, n, m);
}