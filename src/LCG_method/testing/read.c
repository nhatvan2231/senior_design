#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <inttypes.h>
#include <pthread.h>
#include <string.h>
int main(){
	FILE *file;
	file = fopen("zac.txt", "r");
	int n = 25913;
	//int n = 100;
	double *array = (double *)malloc(n*sizeof(double));
	int a,c;
	int k = 0;
	string s;
	while(fscanf(file, "%s", s) != EOF){
		//array[k] = (double)a/(double)c;
		printf("%s\n", s
		k++;
	}

//	double * ar = (double *)malloc(n*sizeof(double));
//	int * id = (int *)malloc(n*sizeof(int));
//
//	for(int i=0; i<(n-1); i++){
//		ar[i] = array[i];
//		id[i] = 0;
//		for(int j = 1; j<n; j++){
//			if((ar[i] != array[j]) || array[j] == 0) continue;
//			else{
//				id[i]++;
//				array[j] = 0;
//			}
//		}
//	}
//
//	for(int i = 0; i<n; i++){
//		printf("%f\t%d\n", ar[i], id[i]);
//	}
//	int max=0;
//	int index;
//	for(int i = 0; i<n;i++){
//		if(id[i] > max){
//			max = id[i];
//			index = i;
//		}
//	}
//
//	printf("%d\n", index);

}
