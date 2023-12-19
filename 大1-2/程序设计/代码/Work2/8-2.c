char* copykn(char* s1, char* s2, int n, int k)
{
	int i = -1;
	for (; *(s1 + n + i) != 0 && i < k-1; i++) {
		*(s2 + i + 1) = *(s1 + i + n);
	}
	*(s2 + i + 1) = 0;
	return (s2);
}
#include<stdio.h>
int main()
{
	char s1[100], s2[100];
	int n, k;
	gets(s1);
	scanf("%d %d", &n, &k);
	puts(copykn(s1, s2, n, k));
	return 0;
}