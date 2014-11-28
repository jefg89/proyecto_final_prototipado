/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/types.h>

 time_t t1;
int8_t mat1 [4] [4] [2] , mat2 [4] [4] [2];
int  res [4] [4] [2] ;
int8_t lfsr;
int x;
void print_mat(int mod);
void init_mat(int mod);
int *random=0x1000;
int * timer=0x9000;
int8_t get_random();


void mult_mat();
int ix, jx, kx;




void init_mat(int mod){
	for (ix=0;ix<4;ix++){
		for (jx=0;jx<4;jx++){
			for (kx=0;kx<2;kx++){
			if (mod==0) mat1[ix] [jx] [kx] = get_random();
			else mat2[ix] [jx] [kx] = get_random();
			}

		}
	}
}


void print_mat(int mod){
for (ix=0;ix<4;ix++){
		for (jx=0;jx<4;jx++){
			for (kx=0;kx<2;kx++){
				if (mod==0) printf("%d ", mat1[ix] [jx] [kx]);
				else if (mod==1) printf("%d ", mat2[ix] [jx] [kx]);
				else printf("%d ", res[ix] [jx] [kx]);
			}
		    printf("\t");
		}
		printf("\n");
	}
	printf("----------------- \n");
}
void mult_mat(){
	int aux=0, aux_1=0;
for (jx=0;jx<4;jx++){
		for (ix=0;ix<4;ix++){
			aux=0;
			aux_1=0;
			for (kx=0;kx<4;kx++){
				aux+=  mat1[ix] [kx] [0]* mat2[kx] [jx] [0]	- mat1[ix] [kx] [1]* mat2[kx] [jx] [1];
				aux_1+=  mat1[ix] [kx] [1]* mat2[kx] [jx] [0] + 	 mat1[ix] [kx] [0]* mat2[kx] [jx] [1];
			}
			res[ix] [jx] [0]=aux;
			res[ix] [jx] [1]=aux_1;
			}

		}
	}





int8_t get_random(){

        unsigned lsb = lfsr & 1;  /* Get LSB (i.e., the output bit). */
        lfsr >>= 1;               /* Shift register */
        if (lsb == 1)             /* Only apply toggle mask if output bit is 1. */
            lfsr ^= 0xA2;

        return lfsr;

}

void init_timer(){
	int counter = 0x190000; // 1/(50 MHz) × (0x190000) = 33 msec
	*(timer + 0x2)= 0xFFFFFFFF;
	*(timer + 0x3)= 0xFFFFFFFF;
}


void parte_1(){
	int inicio=0;
	int fin=0;

	lfsr = *random;
	init_mat(0);
	init_mat(1);

	init_timer();
	*(timer+0x5)=1;
	inicio=*(timer + 0x5) + *(timer + 0x06); //initial time
	printf("inicio = %d \n",inicio);

	*(timer+0x1)=0x04; //star timer
	printf("status = %d \n",*timer);
	mult_mat();
	usleep(1000);
	*(timer+0x5)=1;
	fin=*(timer + 0x05) + *(timer + 0x06);
	printf("inicio = %d \n",fin);
	*(timer +1)=0x0008;
	printf("status = %d \n",*timer);
	printf("La aplicación duró, %d micros\n", (inicio-fin));


	print_mat(0);
	print_mat(1);
	print_mat(2);
}
int main()
{
parte_1();
printf ("XXXzz");
  return 0;
}
