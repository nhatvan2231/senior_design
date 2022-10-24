#include <stdio.h>
#include <stdint.h>

//the first iteration is the seed
//multip by a multiplier
//module of a prime number
uint32_t lcg_parkmiller(uint64_t *state, FILE *file)
{
	*state = *state * 48271 % 0x7fffffff;
	int bin[64];
	int temp = *state;

	for (int i = 63; i >= 0; i--){
	       	bin[i] = temp % 2;
		//printf("i: %d, value: %d",i, bin[i]);
       		temp /= 2;	
		//printf("\n");
	}
	for (int i = 0; i <= 63; i++){
		fprintf(file,"%d", bin[i]);
	}
	fprintf(file,"\n");	
	//printf("%ld", *state);
	//printf("\n");
	return *state;
}

void main() {
	uint64_t num = 10;
	FILE *file;
	file = fopen("test.txt", "w+");
	//generate 1million sequence
	for (int i = 0; i <= 1000000; i++){
		lcg_parkmiller(&num, file);
		//printf("%d\n", num);
	
	}
}
