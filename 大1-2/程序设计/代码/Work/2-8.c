#include<stdio.h>
int main() {
	char a, b, c, d;
	scanf("%c%c%c%c", &a, &b, &c, &d);
	a -= 32;
	b -= 32;
	c -= 32;
	d -= 32;
	printf("%c%c%c%c", a, b, c, d);
}