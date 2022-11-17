#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>

int main(){
	//unsigned long m, z, a, c, temp, bin;
	uint8_t m,a,c;
	unsigned long z = 25;
	a = 45;
	c = 215;
	int file = open("input.txt", O_WRONLY);
	//for (int i=10; i<110; i++){
	//	z = i;
		for(int j=0; j<12500000; j++){
			z = (a*z+c) & 0xFF;
		//	printf("%x\n",z);
			write(file, &z, sizeof(unsigned char));
		}
//	}	
}
