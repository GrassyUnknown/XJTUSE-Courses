#include<stdio.h>
//×Ö·û´®±È½Ï
int strcmp(char* p1, char* p2) {
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
//×Ö·û´®½»»»
void swap(char* n1, char* n2) {
	int i = 0;
	//printf("%s %s\n", n1, n2);
	for (; *(n1 + i) != 0; i++) {
		char temp = *(n1+i);
		*(n1+i) = *(n2+i);
		*(n2+i) = temp;
	}
	for (; *(n2 + i) != 0; i++) {
		char temp = *(n1 + i);
		*(n1 + i) = *(n2 + i);
		*(n2 + i) = temp;
	}
	*(n1 + i) = 0;
}
void sortstring(char (*r)[20], int n) {
	//´óÐ´×ªÐ¡Ð´
	char r1[20][20];
	for (int i = 0; i < n; i++) {
		int j = 0;
		for (; *(*(r+i)+j) != 0; j++) {
			if (*(*(r+i)+j) >= 65 && *(*(r+i)+j) <= 90) {
				*(*(r1+i)+j) = *(*(r+i)+j) + 32;
			}
			else {
				*(*(r1 + i) + j) = *(*(r + i) + j);
			}
			//printf("%c", *(*(r1 + i) + j));
		}
		*(*(r1 + i) + j) = 0;
	}
	//½»»»×Ö·û´®´ÎÐò
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n - 1; j++) {
			//printf("%s\n", *(r1  + j));
			if (strcmp(*(r1+j), *(r1+j+1)) == 1){
				swap(*(r1+j),*(r1+j+1));
				swap(*(r + j), *(r + j + 1));
			}
		}
	}
}
int main() {
	int n; char r0[20][20]; char (*r)[20]; r = r0;
	scanf("%d", &n);
	for (int i = 0; i < n; i++) {
		scanf("%s", &r0[i]);
	}
	sortstring(r, n);
	for (int i = 0; i < n; i++) {
		printf("%s\n", r0[i]);
	}
}