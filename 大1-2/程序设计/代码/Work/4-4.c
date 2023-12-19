#include<stdio.h>
int main() {
	char s1[64], s2[64];
	int m = 0;
	scanf("%s", &s1);
	scanf("%s", &s2);
	for (int i = 0; i < 3 && m == 0; i++) {
		if (s1[i] > s2[i]) {
			m = 1;
		}
		else if (s1[i] < s2[i]) {
			m = -1;
		}
	}
	printf("%d", m);
}
