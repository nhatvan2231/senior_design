#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(){
	unsigned long m, z, a, c, temp, bin;
	m = 65536;
	a = 114;
	c = 32;
	unsigned char byte;
	int file = open("input.txt", O_WRONLY);
	for (int i=10; i<110; i++){
		z = i;
		for(int j=0; j<125000; j++){
			z = (a*z+c) % m;
			byte = z&0xFF;
			write(file, &byte, sizeof(unsigned char));
			//printf("%x\n",byte);
			//printf("%d\n",z);
		//	temp =z;
	//		for(int i=0;i<8;i++){
	//			bin = temp%2;
	//			temp/=2;
	//			fprintf(file,"%d",bin);
	//		}
		}
	}	
}
