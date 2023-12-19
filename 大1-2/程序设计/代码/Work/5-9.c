#include<stdio.h>
int main() {
	char n[128];
	int i = 0;
	gets(n);
	for (i = 0; n[i] != 0; i++);
	printf("%d", i);
}