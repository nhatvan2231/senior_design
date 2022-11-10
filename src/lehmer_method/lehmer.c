#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>

//the first iteration is the seed
//multip by a multiplier
//module of a prime number

void main() {
	unsigned long num = 10;
	unsigned char bytes;
	int file;
	file = open("../../data/lehmer_method.txt", O_WRONLY);
	//file = open("lehmer_method.txt", O_WRONLY);
	if(!file){
		printf("Error\n");
		return;
	}
	for (int j = 10; j < 110; j++){
		num = j;
		for (int i = 0; i < 125000; i++){
			num = num * 48271 % 0x7fffffff;
			bytes = num & 0xFF;
			write(file, &bytes, sizeof(unsigned char));
		}
	}
}
