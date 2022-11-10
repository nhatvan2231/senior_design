#include <stdio.h>
//#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <math.h>
//#include <inttypes.h>

int sabs(int);
int main() {
	//double root = 1.9384; //sqrt(1<x<4)
	//const signed char N = INT8_MAX; //max interger for 8 bit
	unsigned char byte;
	//signed char s0 = 93;
	//signed char s1 = 55;
	//signed char s2 = 16;
	//signed char pn = 0;
	//signed char result = 0;
	int file;
	//file = open("../../data/itamaraca_method.txt", O_WRONLY);
	file = open("input.txt", O_WRONLY);
	
	
	const double N = 10000;
	double s0 = 4120;
	double s1 = 1300;
	double s2 = 490;
	double pn = 0;
	int result = 0;
	//unsigned long result;
	double root = sqrt(3.9);
	for (int j= 10; j < 11; j++){
		//root += 0.0001;
		for (int i=0; i<10; i++){
			pn = sabs(s2 - s1 + s1 - s0);
			result = sabs((N-(pn*root)));
			//byte = result & 0xFF;
			printf("%d\n", result);
			//write(file, &byte, sizeof(unsigned char));
			s0 = s1;
			s1 = s2;
			s2 = result;
		}
	}
}

int sabs(int num){
	if (num == INT8_MIN)
		return (INT8_MAX);
	else
		return (num<0? -num:num);
}	
