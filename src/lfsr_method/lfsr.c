#include <stdint.h>
#include <stdio.h>

void main(){
	uint32_t state0=0xACE1u;
	uint32_t lfsr;
	uint32_t obit;
	uint32_t ibit;
	FILE *file;
	file = fopen("input.txt", "w");
	lfsr = state0;
	for(int i=0; i<100000000; i++){	
		obit = lfsr & 1u;
		ibit = ((lfsr >> 31)
			^ (lfsr >> 27) 
			^ (lfsr >> 23) 
			^ (lfsr >> 19) 
			^ (lfsr >> 18) 
			^ (lfsr >> 16) 
			^ (lfsr >> 14) 
			^ (lfsr >> 11) 
			^ (lfsr >> 10) 
			^ (lfsr >> 9) 
			^ (lfsr >> 6) 
			^ (lfsr >> 5) 
			^ (lfsr >> 1) 
			& 1u);
		lfsr = (lfsr >> 1) | (ibit << 31);
		fprintf(file, "%d", obit);
	}
}
