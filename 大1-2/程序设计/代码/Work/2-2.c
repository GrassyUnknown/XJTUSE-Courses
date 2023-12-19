#include<stdio.h>
#include<math.h>
int main() {
	int num,a,b,c;
	scanf("%d", &num);
	c = num % 10;
	b = (num /10)%10;
	a = num / 100;
	if (pow(a, 3) + pow(b, 3) + pow(c, 3) == num) {
		printf("%d is a narcissistic number", num);
	}
	else {
		printf("%d is not a narcissistic number", num);
	}
}