#include<stdio.h>
int main(){
	int a;
	scanf("%d", &a);
	if (a >= 10000) {
		printf("5");
	}
	else if (a >= 1000) {
		printf("4");
	}
	else if (a >= 100) {
		printf("3");
	}
	else if (a >= 10) {
		printf("2");
	}
	else {
		printf("1");
	}
	}