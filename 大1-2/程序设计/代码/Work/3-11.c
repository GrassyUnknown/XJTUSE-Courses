#include<stdio.h>
int main() {
	double profit, bonus;
	scanf("%lf", &profit);
	bonus = profit * 0.1;
	if (profit > 100000) {
		bonus -= (profit - 100000) * 0.025;
		if (profit > 200000) {
			bonus -= (profit - 200000) * 0.025;
			if (profit > 400000) {
				bonus -= (profit - 400000) * 0.02;
				if (profit > 600000) {
					bonus -= (profit - 600000) * 0.015;
					if (profit > 1000000) {
						bonus -= (profit - 1000000) * 0.005;
					}
				}
			}
		}
	}
	printf("%.2f", bonus);
}