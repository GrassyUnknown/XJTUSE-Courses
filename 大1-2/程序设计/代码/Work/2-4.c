#include<stdio.h>
#include<math.h>
int Run(int k);
int main()
{
	int n=-1,i=0,alday=0;
	int date;
	scanf("%d", &date);
	int day = date%100;
	int month =( (date-day)/100)%100;
	int year = (date - day - month * 100) / 100;
	int days[] = {31, 28 + Run(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	for (i = 0; i < month-1; i++) {
		alday += days[i];
	}
	alday += day;
	printf("%d", alday);

}
int Run(int k) {if (k % 4 == 0) {if (k % 100 == 0) {if (k % 400 == 0) {return 1;}else {return 0;}}else {return 1;}}else {return 0;}}