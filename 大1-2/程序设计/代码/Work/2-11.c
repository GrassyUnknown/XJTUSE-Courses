#include<stdio.h>
#include<math.h>
int main() {
	double a;
	scanf("%lf", &a);
	double rate[] = { 0.0035,0.015,0.021,0.0275,0.03};
	double w[] = { a,a,a,a,a };
	w[0] = 5 * rate[4] * a + a;
	w[1] = 2 * rate[2] * a + a;
	w[1] = 3 * rate[3] * w[1] + w[1];
	w[2] = 3 * rate[3] * a + a;
	w[2] = 2 * rate[2] * w[2] + w[2];
	for (int i = 1; i <= 5; i++) {
		w[3] = rate[1] * w[3] + w[3];
	}
	for (int i = 1; i <= 20; i++) {
		w[4] = (rate[0]/4) * w[4] + w[4];
	}
	printf("%f %f %f %f %f", w[0], w[1], w[2], w[3], w[4]);
}