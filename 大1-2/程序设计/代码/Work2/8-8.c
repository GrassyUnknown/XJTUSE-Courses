#include<stdio.h>
struct Scores {	char id[5];	int s[3]; float avr; };
void in(struct Scores *b[50], int n) {
	for (int i = 0; i < n; i++) {
		scanf("%s %d %d %d", &b[i]->id, &b[i]->s[0], &b[i]->s[1], &b[i]->s[2]);
		b[i]->avr = ((float)b[i]->s[0] + (float)b[i]->s[1] + (float)b[i]->s[2]) / 3;
	}
}
void rule(struct Scores *b[50], int n) {
	for (int j = 0; j < n; j++) {
		for (int i = 0; i < n - 1; i++) {
			if (b[i]->avr > b[i+1]->avr) {
				struct Scores* temp;
				temp = b[i];
				b[i] = b[i+1];
				b[i + 1] = temp;
			}
		}
	}
}
void out(struct Scores *b[50], int n) {
	for (int i = 0; i < n; i++) {
		printf("%s %d %d %d %.2f\n", b[i]->id, b[i]->s[0], b[i]->s[1], b[i]->s[2], b[i]->avr);
	}
}
int main() {
	int n; scanf("%d", &n);
	struct Scores a[50],* b[50];
	for (int i = 0; i < 50; i++) { b[i] = &a[i]; };
	in(b, n);
	rule(b, n);
	out(b, n);
}