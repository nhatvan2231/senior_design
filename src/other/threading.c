#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

FILE *file;

void *zeros(void *param){
	for (int i = 0; i < 1000000; i++){
		fprintf(file, "%d", 0);
	}

	pthread_exit(0);
}
	
void *ones(void *param){
	for (int i = 0; i < 1000000; i++){
		fprintf(file, "%d",1);
	}

	pthread_exit(0);
}
int main(){

	file = fopen("test.txt", "w+");
	pthread_attr_t attr;
	pthread_attr_init(&attr);

	pthread_t random[6];

	pthread_create(&random[0], &attr, zeros, NULL);
	pthread_create(&random[1], &attr, zeros, NULL);
	pthread_create(&random[2], &attr, zeros, NULL);
	pthread_create(&random[3], &attr, ones, NULL);
	pthread_create(&random[4], &attr, ones, NULL);
	pthread_create(&random[5], &attr, ones, NULL);

	pthread_join(random[0], NULL);
	pthread_join(random[1], NULL);
	pthread_join(random[2], NULL);
	pthread_join(random[3], NULL);
	pthread_join(random[4], NULL);
	pthread_join(random[5], NULL);

	fclose(file);
}
