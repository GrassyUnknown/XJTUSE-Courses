#include<stdio.h>
int main() {
	char s1[128], s2[128],i;
	gets(s1);
	for (i = 0; s1[i] != 0; i++) {
		s2[i] = s1[i];
	}
	s2[i] = s1[i];
	printf("%s", s2);
}