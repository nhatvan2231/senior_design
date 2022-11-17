#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>
#include <pthread.h>

static FILE *file;
void *calc(void *param);

int main(){
	
        file= fopen("zac.txt", "w");
	uint16_t a[2];
	a[0] = 0xf;
	a[1] = 0xff;
	pthread_attr_t attr;
	pthread_attr_init(&attr);
	pthread_t thread[2];
	for (int i=0; i<2; i++){
		pthread_create(&thread[i], &attr, calc, (void*)a[i]);
	}
	for (int i=0; i<2; i++){
		pthread_join(thread[i], NULL);
	}
}


void *calc(void *param){
	uint16_t ah = (uint16_t*)param;
	uint16_t a = ah >> 4; 
	uint16_t c;
	uint32_t m = 0xff;
	uint32_t z;
	int ones;
	int zeros;
	float prob;
	for(uint32_t i=25; i<125; i++){
		for(a; a<ah; a++){
			for(c=0; c<m; c++){
				z = i;
				zeros = 0;
				ones = 0;
				for(uint16_t j=0; j<10000; j++){
					z = (a*z+c) & m;
					for(unsigned char k = 0; k<8; k++){
						(((z >> k) & 1)==1)? ones++:zeros++;
					}
				}
				prob = (float)((float)zeros/(float)(zeros+ones));
				if((prob > 0.45) && (prob < 0.55)){
					fprintf(file, "%d\t%d\n", a, c);
				}
			}
		}
	}
}
