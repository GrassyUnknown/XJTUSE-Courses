#include<stdio.h>
#include<math.h>
void DigiTran(int k, char res[]) {
	if (k == 0) {
		res[0] = 65;
		res[1] = 0;
		return;
	}
	int j,i = log10(k) ;
	for (j = 0; i >= 0; j++) {
		int s1 = k / pow(10, i), s = k / pow(10, i - 1);
		if (s1 == 0) {
			res[j] = 65;
			i--;
		}
		else if (s <= 25&&i>0) {
			res[j] = s + 65;
			i = i - 2;
		}
		else {
			res[j] = s1 + 65;
			i--;
		}
		if (i >= 0) { k = k % (int)pow(10, i + 1); }
	}
	res[j] = 0;
}
int main() {
	int k[15],t; char res[15][15];
	for (t = 0; k[t-1] != -1; t++) {
		scanf("%d", &k[t]);	
	}
	for (int p = 0; p < t-1; p++) {
		DigiTran(k[p], res[p]);
		printf("%s ", res[p]);
	}
}
