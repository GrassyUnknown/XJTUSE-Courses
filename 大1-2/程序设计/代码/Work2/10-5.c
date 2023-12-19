#include<stdio.h>
struct DATE {
	int year;
	int month;
	int day;
};
int Run(int year) {
	if (year % 4 == 0) {
		if (year % 100 == 0) {
			if (year % 400 == 0) {
				return 1;
			}
			return 0;
		}
		return 1;
	}
	return 0;
}
struct DATE adddays(struct DATE d1, int k) {
	int dates[12] = { 31,28 + Run(d1.year),31,30,31,30,31,31,30,31,30,31 };
	d1.day += k;
	while (d1.day > dates[d1.month - 1]) {
		d1.day -= dates[d1.month - 1];
		if (d1.month < 12) { d1.month++; }
		else { d1.year++; d1.month = 1; }
	}
	return d1;
}
int main()
{
	struct DATE d1, d2;
	int k;
	scanf("%d %d %d", &d1.year, &d1.month, &d1.day);
	scanf("%d", &k);
	d2 = adddays(d1, k);
	printf("%d-%d-%d",d2.year,d2.month,d2.day);
	return 0;
}