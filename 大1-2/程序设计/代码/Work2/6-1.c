void change(int* p1, int* p2) {
	int temp = *p2;
	*p2 = *p1;
	*p1 = temp;
}
void fun(int* p, int n) {
	for (int j = 0; j < 5; j++) {
		for (int* i = p; i < (p + 4); i++) {
			if (*i < *(i + 1)) {
				change(i, i + 1);
			}
		}
	}
}

#include<stdio.h>
int main() {
	int p[5];
	for (int* i = p; i < (p + 5); i++) {
		scanf("%d", i);
	}
	fun(p, 5);
	for (int* i = p; i < (p + 4); i++) {
		printf("%d,", *i);
	}
	printf("%d", *(p + 4));
}