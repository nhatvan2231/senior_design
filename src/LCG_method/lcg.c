#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(){
	int m, z, a, c, temp, bin;
	m = 256;
	a = 11;
	c = 3;
	FILE *file = fopen("input.txt", "w+");
	for (int i=10; i<110; i++){
		z = i;
		for(int j=0; j<125000; j++){
			z = (a*z+c) % m;
			//printf("%d\n",z);
			temp =z;
			for(int i=0;i<8;i++){
				bin = temp%2;
				temp/=2;
				fprintf(file,"%d",bin);
			}
		}
	}	
}
