void nfsr_method(){
	uint32_t state0=0x0000ACE1u;
	uint32_t nfsr=state0;
	uint32_t obit;
	uint32_t ibit; 
	FILE *file;
	int counter = 0;
	file = fopen("../../data/nfsr_result.txt", "w");

	for(int i = 0; i < 100000000; i++){
		obit = nfsr & 1u;
//		printf("%d",obit);
		ibit = ((nfsr>>0)
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
		nfsr = (nfsr >> 1) | (ibit << 31);
		fprintf(file, "%d", obit);
	}
}

