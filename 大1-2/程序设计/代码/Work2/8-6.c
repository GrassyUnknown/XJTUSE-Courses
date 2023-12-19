#include<stdio.h>
int findint(char* s, int* a) {
	int temp=0, n=0;
	for (int i = 0; *(s+i) != 0; i++) {
		if (*(s + i)>=48 &&* (s + i)<=57) {
			if (temp == 0) {
				*(a + n) = *(s + i) - 48;
				n++;
				temp++;
			}
			else {
				*(a + n - 1) = *(a + n - 1) * 10 + *(s + i) - 48;
			}
		}
		else {
			temp = 0;
		}
	}
	return n;
}
int main() {
	char s[200]; int a[64], n;
	gets(s);
	n = findint(s, a);
	for (; n > 1; n--) {
		printf("%d,", a[n - 1]);
	}
	printf("%d", a[0]);
}