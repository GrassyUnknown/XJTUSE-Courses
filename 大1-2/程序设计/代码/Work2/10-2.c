#include<stdio.h>
struct COMPLEX {
	float real;
	float imag;
};
struct COMPLEX add(struct COMPLEX a, struct COMPLEX b) {
	struct COMPLEX c;
	c.real = a.real + b.real;
	c.imag = a.imag + b.imag;
	return c;
}
void show(struct COMPLEX c) {
	if (c.imag < 0) {
		printf("%g%gj", c.real, c.imag);
	}
	else {
		printf("%g+%gj", c.real, c.imag);
	}
}
int main()
{
	struct COMPLEX a, b, c;
	scanf("%f %f", &a.real, &a.imag);
	scanf("%f %f", &b.real, &b.imag);
	c = add(a, b);
	show(c);
	return 0;
}