#include<stdio.h>
struct info {
	char id[10];
	char name[10];
	int score[3];
	int sum;
}p[4], * p1[4];
int main() {
	for (int i = 0; i < 4; i++) {
		scanf("%s %s %d %d %d", &p[i].id, &p[i].name, &p[i].score[0], &p[i].score[1], &p[i].score[2]);
		p[i].sum = p[i].score[0] + p[i].score[1] + p[i].score[2];
		p1[i] = &p[i];
	}
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 3; j++) {
			if (p1[j]->sum < p1[j + 1]->sum) {
				struct info* temp;
				temp = p1[j];
				p1[j] = p1[j + 1];
				p1[j + 1] = temp;
			}
		}
	}
	for (int i = 0; i < 4; i++) {
		printf("%s %s %d %d %d %d\n", p1[i]->id, p1[i]->name, p1[i]->score[0], p1[i]->score[1], p1[i]->score[2],p1[i]->sum);
	}
}