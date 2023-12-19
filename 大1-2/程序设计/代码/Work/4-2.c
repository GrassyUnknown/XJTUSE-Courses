#include<stdio.h>
#include<math.h>
int main() {
	double eps, pai=1;
	scanf("%lf", &eps);
	for (int i = 1; pow((2 * i + 1),-1)>=eps; i++) {
		pai += pow(-1, i) / (2 * i + 1);
	}
	pai *= 4;
	printf("%.8f", pai);
}