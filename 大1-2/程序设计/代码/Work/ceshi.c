int main() {
	int k[15],t;
	for (t = 0; k[t - 1] != -1; t++) {
		scanf("%d", &k[t]);
	}
	for (t = 0; k[t - 1] != -1; t++) {
		printf("%d\n", k[t]);
	}
}