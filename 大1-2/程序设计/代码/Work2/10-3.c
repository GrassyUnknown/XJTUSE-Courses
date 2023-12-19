#include<stdio.h>
#include<string.h>
struct votes {
	char name[5];
	int vote;
}p[4] = {"zhao",0,"qian",0,"sun",0,"wang",0},*p1[4];
int main() {
	for (int i = 0; i < 4; i++) { p1[i] = &p[i]; }
	char tempname[5];
	while(1) {
		scanf("%s", &tempname);
		if (strcmp(tempname,"000")==0) {
			break;
		}
		for (int i = 0; i < 4; i++) {
			if (strcmp(tempname,p[i].name)==0) {
				p[i].vote++;
			}
		}
	}
	//ÅÅÐò
	for (int j = 0; j < 4; j++) {
		for (int i = 0; i < 3; i++) {
			if (p1[i]->vote < p1[i + 1]->vote) {
				struct votes* temp;
				temp = p1[i];
				p1[i] = p1[i + 1];
				p1[i + 1] = temp;
			}
		}
	}
	//Êä³ö
	for (int i = 0; i < 4; i++) {
		printf("%s %d\n", p1[i]->name, p1[i]->vote);
	}
}