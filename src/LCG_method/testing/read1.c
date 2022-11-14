#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

int main(){
	FILE *file;
	file = fopen("test.txt", "r");
	int n[255256] = {0};
	char a[255];
	int b;
	for(int i=0; i<237022;i++){
		fscanf(file,"%s",a);
		b = atoi(a);
		n[b]++;
	}

	int max =0;
	int ac = 0;
	for(int i=0; i< 255256;i++){
		if(n[i] > max){
			max = n[i];
			ac = i;
		}
	}
	printf("max: %d %d\n",ac, max);
}	




