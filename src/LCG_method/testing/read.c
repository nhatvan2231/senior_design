#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>
#include <pthread.h>

#define N 25912
int main(){
	FILE *file;
	file = fopen("zac.txt", "r");
	//int n = 100;
	int *a = (int *)malloc(N*sizeof(int));
	int *c = (int *)malloc(N*sizeof(int));

	int k = 0;

	while(fscanf(file, "%d%d",a[k],c[k]) != EOF){
		k++;
	}
//	
//	for(int i=0; i < N;i++){
//		printf("%d\t%d\n",a[i],c[i]);
//	}


}
