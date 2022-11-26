#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <math.h>
//#include <inttypes.h>

int main() {
	unsigned char byte;
	int file;
	file = open("input.txt", O_WRONLY);
	const double N = 127;
	double s0 = 29;
	double s1 = 122;
	double s2 = 4;
	double pn = 0;
	int result = 0;
	double root = sqrt(3.9);
	for (int i=0; i<10000000; i++){
		pn = abs(s2 - s0);
		result = abs((N-pn*1.87));
		s0 = s1;
		s1 = s2;
		s2 = result;
		write(file,&result, sizeof(unsigned char));
	}
}
