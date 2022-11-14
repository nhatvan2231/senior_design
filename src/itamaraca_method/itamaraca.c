#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <math.h>
//#include <inttypes.h>

int sabs(int);
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
	int num[128]={0};
	int x=0;
	int y;
	int ones=0;
	int zeros=0;
	int temp;
	double prob = 0;
	for (int i=0; i<100000; i++){
		pn = abs(s2 - s0);
		result = abs((N-(round(pn*1.87))));

		for(int j=0; j<8;j++){
			temp =result;
			y=temp%2;
			temp/=2;
			if(y==0) zeros++;
			if(y==1) ones++;
		}
			
		x = result%128;
		num[x]++;
		s0 = s1;
		s1 = s2;
		s2 = result;
	}
	for(int i = 0; i<128;i++){
		printf("%d: %d\n",i,num[i]);
	}

	printf("zeros:%d ones:%d\n", zeros, ones);
	prob = (double)((double)zeros/(double)(zeros+ones));
	printf("probability: %f\n", prob);
}
