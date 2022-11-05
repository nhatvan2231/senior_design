#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <fcntl.h>
#include <unistd.h>

void main(){
	unsigned char b[2];
	int file = open("test.txt", O_RDONLY);
//	int file = open("../sts-2.1.2/sts-2.1.2/data/data.sha1", O_RDONLY);
	int count = 0;
	while(true){
		int byte=0;
		byte += read(file, &b[0], sizeof(unsigned char));
//		byte += read(file, &b[1], sizeof(unsigned char));
//		byte += read(file, &b[2], sizeof(unsigned char));
//		byte += read(file, &b[3], sizeof(unsigned char));
		if(byte <= 0){
			printf("numbers: %d", count);
			printf("done!!\n");
			break;
		}
		count++;
		printf("%x\n",b[0]);
//		printf("%x\n",b[1]);
//		printf("%x%x\n", b[0],b[1]);
	}



}
