int strcmp(char* p1,char* p2) {
	for (int i = 0;; i++) {
		if (*(p2 + i) == 0 && *(p1 + i) == 0) {
			return 0;
		}
		else if (*(p1 + i) > *(p2 + i)) {
			return 1;
		}
		else if (*(p2 + i) > *(p1 + i)) {
			return -1;
		}
	}
}
#include<stdio.h>
int main() {
	char s1[128],s2[128];
	scanf("%s", &s1); scanf("%s", &s2);
	printf("%d", strcmp(s1,s2));
}