#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

int main(){
	FILE *file;
	char z[255]={0};
	char a[255];
	char c[255];
	char prob[255];
	int i = 0;
	file = fopen("zac.txt", "r");
	int num[237021];
	for(i=0;i<237022;i++){
		fscanf(file, "%s", z);
		fscanf(file, "%s", a);
		fscanf(file, "%s", c);
		fscanf(file, "%s", prob);
		if((atoi(z)==19)&&(atoi(a)==255)&&(atoi(c)==255)){
			break;
		}
		strcat(a,c);
		num[i] = atoi(a);
	//	printf("%d\n",atoi(a));
	}
	fclose(file);
	int cur, next,temp;
	for(int j = 0; j<237021; j++){
		for(int k =0; k<237021; k++){
			cur = num[k];
			next = num[k+1];
			if(cur > next){
				num[k+1] = cur;
				num[k] = next;
			}
		}
	}
	file = fopen("test.txt", "w");
	for(int j=0; j<237021; j++){
		fprintf(file,"%d\n",num[j]);
	}
	//printf("i:%d\n", i);
}	
