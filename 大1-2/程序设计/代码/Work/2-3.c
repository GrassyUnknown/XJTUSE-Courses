#include<stdio.h>
int main() {
	char word[128];
	scanf("%c,%c,%c,%c,%c", &word[0], &word[1], &word[2], &word[3], &word[4]);
	int a=0, b=0;
	for (int i = 0; i < 5; i++) {
		if (word[i] >= 65 && word[i] <= 90) {
			a += 1;
		}
		if (word[i] >= 97 && word[i] <= 122) {
			b += 1;
		}
	}
	printf("��д��ĸ����=%d\nСд��ĸ����=%d", a, b);

}