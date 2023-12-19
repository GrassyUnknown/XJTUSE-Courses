#include<stdio.h>
int main() {
	char s[3][128];
	gets(s[0]);
	gets(s[1]);
	gets(s[2]);
	int a=0, b=0, c=0, d=0, e=0;
	for (int i = 0; i < 3; i++) {
		for (int j = 0; s[i][j] != 0; j++) {
			if (s[i][j]>=65&&s[i][j]<=90) {
				a++;
			}
			else if (s[i][j] >= 97 && s[i][j] <= 122) {
				b++;
			}
			else if (s[i][j] >= 48 && s[i][j] <= 57) {
				c++;
			}
			else if (s[i][j] ==32) {
				d++;
			}
			else{
				e++;
			}
		}
	}
	printf("%d %d %d %d %d", a,b,c,d,e);
}