#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(){
	//int file = open("input.txt", O_WRONLY);
	int m, z, a, c;
	int ones = 0;
	int zeros = 0;
	int temp;
	int x;
	double prob;
	m = 256;
	FILE *file;
	file = fopen("zac.txt", "w");
	for (int i=10; i<20; i++){
		for(a=0; a<m; a++){
			for(c=0; c<m; c++){
				z = i;
				zeros = 0;
				ones = 0;
				for(int j=0; j<100000; j++){
					z = (a*z+c) % m;
					temp = z;
					for(int k = 0; k<8; k++){
				//		printf("z:%d temp:%d\n",z,temp);
						if((temp%2)==0) zeros++;
						if((temp%2)==1) ones++;
						temp/=2;
					}
				}
			        prob = (double)((double)zeros/(double)(zeros+ones));
				if((prob > 0.45) && (prob < 0.55)){
					//printf("z: %d\ta: %d\tc: %d\tzeros:%d\tones:%d\t prob: %f\n",i,a,c,zeros,ones,prob);
					fprintf(file, "%d\t%d\n", a, c);
				}

			}
		}
	}	
}
