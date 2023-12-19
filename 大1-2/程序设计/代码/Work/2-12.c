#include<stdio.h>
int main() {
	int num,a,b,c,d,nu2;
	scanf("%d", &num);
	a = num % 10;
	b = ((num - a) / 10) % 10;
	c = ((num - a-b*10) / 100) % 10;
	d = (num - a - b * 10-c*100) / 1000;
	nu2 = 2000 * a + 200 * b + 20 * c + 2 * d;
	printf("%d", nu2);
}