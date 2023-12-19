#include<stdio.h>
void myint2str(int a, char s[],int k) {
	if (a>=0&&a < 10) {
		s[k] = a + '0';
		s[k + 1] = 0;
	}
	else {
		myint2str(a % 10, s, k);
		k++;
		myint2str(a / 10, s, k);
	}
}
int main() {
	int a; char s[64]; scanf("%d", &a);
	myint2str(a, s, 0);
	printf("%s", s);
}