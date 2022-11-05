#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

void main() {
	FILE *file;
	int r = 0;
	int counter = 0;
	file = fopen("test.txt", "w+");

	for (int i = 0; i < 20000000; i++){
		r = rand()%2;
		fprintf(file, "%d", r);
		counter++;
		//if (counter %64 == 0)
		//	fprintf(file, "\n");

	}

	return 0;
}
