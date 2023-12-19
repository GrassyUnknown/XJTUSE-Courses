#include<stdio.h>
int position(char s1, char s[]);
void insert(char s1, char s[],int n);
int main() {
	char s1,ch[20] = "bcfmr";
	scanf("%c",&s1);
	insert(s1, ch, position(s1, ch));
}
int position(char s1, char s[]) {
	int i = 0;
	for (; i < 5 && s1 > s[i]; i++);
	return i;
}
void insert(char s1, char s[], int n) {
	for (int i = 5; i > n; i--) {
		s[i] = s[i - 1];
	}
	s[n] = s1;
	printf("%s", s);
}