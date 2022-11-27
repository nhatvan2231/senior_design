#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>

int main(){
	//unsigned long m, z, a, c, temp, bin;
	uint16_t m,a,c;
	unsigned long z;
	a = 485;
	c = 0;
	unsigned char byte;
	int file = open("input.txt", O_WRONLY);
	for (int i=20; i<220; i++){
		z = 2*i+1;
		for(int j=0; j<125000; j++){
			z = (a*z+c) %(0xFFF1);
			byte = (z>>8) & 0xFF;
			write(file, &byte, sizeof(unsigned char));
		}
	}	
}
