#include <stdio.h>
#include <stdint.h>
#include <fcntl.h>
#include <unistd.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "lehmer.h"
#include "itamaraca.h"
#include "lfsr.h"
#include "nfsr.h"

void main(int argc, char *argv[]){
	if (argc != 2){
		printf("Usage: %s <method>\n", argv[0]);
		printf("Medthods: itamaraca|lehmer|lfsr|nfsr\n");
		return;
	}

	char* method = argv[1];
	
	if (strcmp(method, "itamaraca") == 0) itamaraca_method();
	else if (strcmp(method, "lehmer") == 0) lehmer_method();
	else if (strcmp(method, "lfsr") == 0) lfsr_method();
	else if (strcmp(method, "nfsr") == 0) nfsr_method();
	else{
		printf("Invalid method\n");
		return;
	}
	
	printf("Medthod %s complete\n", argv[1]);
	return;
}

