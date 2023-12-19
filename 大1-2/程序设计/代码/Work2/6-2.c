int slen(char* s) {
	int i = 0;
	for (; *(s + i) != 0; i++);
	return i;
}
#include<stdio.h>
int main() {
	char s[20];
	gets(s);
	printf("%d",slen(s));
}