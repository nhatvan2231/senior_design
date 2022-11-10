#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[]){
	unsigned char b;
	if (argc !=2) return 1;

	int file = open(argv[1], O_RDONLY);

	int count = 0;
	while(true){
		int byte=0;
		byte += read(file, &b, sizeof(unsigned char));
		if(byte <= 0){
			printf("numbers: %d", count);
			printf("done!!\n");
			break;
		}
		count++;
		printf("%x\n",b);
	}



}
