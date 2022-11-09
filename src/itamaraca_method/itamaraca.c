#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>

int sabs(int);
int main() {
	const int8_t N = INT8_MAX; //max interger for 8 bit
	int8_t s0 = 93;
	int8_t s1 = 55;
	int8_t s2 = 16;
	double root = 1.9384; //sqrt(1<x<4)

	int8_t pn = 0;
	int8_t result = 0;
	unsigned char byte;

	int file;
	file = open("../../data/itamaraca_method.txt", O_WRONLY);

	int i;
	for (i=0; i<125000; i++){

		pn = abs(s2 - s1 + s1 - s0);
		result = abs((N-(pn*root)));
		//printf("%X\n", result);
		write(file, &result, sizeof(int8_t));
		s0 = s1;
		s1 = s2;
		s2 = result;
	}
	printf("%d\n", i);
}

int sabs(int num){
	if (num == INT8_MIN)
		return (INT8_MAX);
	else
		return (num<0? -num:num);
}	
