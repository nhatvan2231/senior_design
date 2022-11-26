#include <stdint.h>
#include <stdio.h>

void main(){
	uint8_t state0;
	uint8_t lfsr;
	uint8_t bit;
	FILE *file;
	file = fopen("input.txt", "w");

	for(int i = 0; i < 1000; i++){
		state0 = (0x3*(i+1)+1)&0xFF;
		lfsr = state0;
		do{
			bit = ((lfsr >> 0) ^ (lfsr >> 5)) & 1u;
			lfsr = (lfsr >> 1) | (bit << 7);
			//printf("%x\n", bit);
			fprintf(file, "%d", bit);
		}while(lfsr != state0);

	}
}
