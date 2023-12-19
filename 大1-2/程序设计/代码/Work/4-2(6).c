#include<stdio.h>
void Da(char n);
int main() {
	char s[10];
	gets(s);
	for (int i = 0; i < 10; i++) {
		Da(s[i]);
	}
}
void Da(char n) {
	if (n>=65&&n <= 90) {
		printf("%c", n);
	}
}