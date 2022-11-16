#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>


int main(){
	//int file = open("input.txt", O_WRONLY);
//	int m, z, a, c;
//	int temp;
//	int x;
//	double prob;

	uint32_t m = 0xff;
	uint32_t z = 10;
	uint16_t a,c;
	int ones = 0;
	int zeros = 0;
	FILE *file;
	unsigned char mask = 1;
	float prob;
	file = fopen("zac.txt", "w");
	for (int i=10; i<15; i++){
		for(a=0; a<m; a++){
			for(c=0; c<m; c++){
				z = i;
				zeros = 0;
				ones = 0;
				for(int j=0; j<1000000; j++){
					z = (a*z+c) & m;
					for(unsigned char k = 0; k<8; k++){
						(((z >> k) & 1)==1)? ones++:zeros++;
					}
				}
			        prob = (float)((float)zeros/(float)(zeros+ones));
				if((prob > 0.45) && (prob < 0.55)){
					fprintf(file, "%d\t%d\n", a, c);
				}

			}
		}
	}	
}


