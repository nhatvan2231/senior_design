#include <stdint.h>
#include <stdio.h>

void main(){
	uint32_t state0=0xACE1u;
	uint32_t nfsr;
	uint32_t bit;
	FILE *file;
	int counter = 0;
	file = fopen("input.txt", "w");
	for(int i = 0; i < 100000000; i++){
		bit = ((nfsr>>0) 
			^(nfsr>>2)
			^(nfsr>>6)
			^(nfsr>>7)
			^(nfsr>>12)
			^(nfsr>>17)
			^(nfsr>>20)
			^(nfsr>>27)
			^(nfsr>>30)
			^((nfsr>>3)&(nfsr>>9))
			^((nfsr>>12)&(nfsr>>15))
			^((nfsr>>4)&(nfsr>>5)&(nfsr>>16))
			) & 1u;
		nfsr = (nfsr >> 1) | (bit << 31);
		fprintf(file, "%d", bit);
	}
	
}
