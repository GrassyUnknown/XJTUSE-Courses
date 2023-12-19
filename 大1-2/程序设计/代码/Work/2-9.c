#include<stdio.h>
int main() {
	char a, b, c, d;int k;
	scanf("%c%c%c%c %d", &a, &b, &c, &d, &k);
	int al[] = { a,b,c,d };
	for (int i = 0; i < 4; i++) {
		al[i] +=k;
		while (al[i] > 122) {
			al[i] -= 26;
		
		}
		printf("%c", al[i]);
	}
}