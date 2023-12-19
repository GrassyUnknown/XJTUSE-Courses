#include<stdio.h>
#include<math.h>
struct dot {
	float x;
	float y;
};
float length(struct dot d1, struct dot d2) {
	float l = pow((pow((d2.x - d1.x), 2) + pow((d2.y - d1.y), 2)), 0.5);
	return l;
}
int main() {
	struct dot d1, d2;
	scanf("%f %f %f %f", &d1.x, &d1.y, &d2.x, &d2.y);
	printf("%f", length(d1, d2));
}