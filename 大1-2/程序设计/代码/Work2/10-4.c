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
int daysofyear(struct DATE d) {
	int dates[12] = { 31,28 + Run(d.year),31,30,31,30,31,31,30,31,30,31 },sum=0;
	for (int i = 0; i < d.month-1; i++) {
		sum += dates[i];
	}
	sum += d.day;
	return sum;
}
int main()
{
	struct DATE d1;
	scanf("%d %d %d", &d1.year, &d1.month, &d1.day);
	printf("%d\n", daysofyear(d1));
	return 0;
}