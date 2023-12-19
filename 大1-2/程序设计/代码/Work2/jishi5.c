#include<stdio.h>
struct fruitinfo {
	int id;
	char name[20];
	float xiaoliang;
	float danjia;
}info[6],*t;
void set(struct fruitinfo* t) {
	scanf("%d %s %f %f", &t->id, &t->name, &t->xiaoliang, &t->danjia);
}
void print(struct fruitinfo* t) {
	printf("%d %s %.2f %.2f\n", t->id, t->name, t->xiaoliang, t->danjia);
}
void sortfruit(struct fruitinfo* t) {
	for (int k = 0; k < 6; k++) {
		for (int i = 0; i < 5; i++) {
			if ((t + i)->danjia * (t + i)->xiaoliang > (t + i + 1)->danjia * (t + i + 1)->xiaoliang) {
				int temp1 = (t + i)->id; (t + i)->id = (t + i + 1)->id; (t + i + 1)->id = temp1;
				for (int q = 0; q < 20;q++) { char temp2 = (t + i)->name[q]; (t + i)->name[q] = (t + i + 1)->name[q]; (t + i + 1)->name[q] = temp2; }
				float temp3 = (t + i)->xiaoliang; (t + i)->xiaoliang = (t + i + 1)->xiaoliang; (t + i + 1)->xiaoliang = temp3;
				float temp4 = (t + i)->danjia; (t + i)->danjia = (t + i + 1)->danjia; (t + i + 1)->danjia = temp4;
			}
		}
	}
}
int main() {
	for (int i = 0; i < 6; i++) {
		set(&info[i]);
	}
	sortfruit(info);
	for (int i = 0; i < 6; i++) {
		print(&info[i]);
	}
}