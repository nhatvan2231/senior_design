#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>

void main() {
//	FILE *file;
	unsigned long r = 0;
	unsigned long m=65536;
	unsigned bytes;
	int counter = 0;
//	file = fopen("test.txt", "w+");

	int file = open("test.txt", O_WRONLY);
	for (int i = 0; i < 12500000; i++){
		r = rand()%m;
		bytes = r&0xFF;
		write(file, &bytes, sizeof(unsigned char)); 
		counter++;
		//if (counter %64 == 0)
		//	fprintf(file, "\n");

	}

}
