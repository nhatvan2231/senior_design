#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>

void main() {
	unsigned long r = 0;
	unsigned char bytes;

	int file = open("test.txt", O_WRONLY);
	for (int i = 0; i < 12500000; i++){
		r = rand()&0xFF;
		write(file, &r, sizeof(unsigned char)); 

	}

}
