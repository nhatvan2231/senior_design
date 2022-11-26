#include <stdint.h>
#include <stdio.h>

void main(){
	uint16_t state0=0xACE1u;
	uint16_t lfsr;
	uint16_t bit;
	FILE *file;
	file = fopen("input.txt", "w");
	for(int i = 0; i < 100; i++){
		state0 += 3*i+1;
		lfsr = state0;
		do{
			bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1u;
			lfsr = (lfsr >> 1) | (bit << 15);
			fprintf(file, "%d", bit);
		}while(lfsr != state0);

	}
}
