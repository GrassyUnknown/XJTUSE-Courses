void paixu(int* p, int* q, int* r) {
	if (*p < *q) {
		int* m;
		m = p;
		p = q;
		q = m;
	}
	if (*q < *r) {
		int* m;
		m = q;
		q = r;
		r = m;
	}
	if (*p < *q) {
		int* m;
		m = p;
		p = q;
		q = m;
	}
	printf("%d %d %d", *p, *q, *r);
}
#include<stdio.h>
int main() {
	int a, b, c;
	scanf("%d %d %d", &a, &b, &c);
	int* p, * q, * r;
	p = &a; q = &b; r = &c;
	paixu(p, q, r);
}