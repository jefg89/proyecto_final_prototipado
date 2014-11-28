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
#include <unistd.h>
#include "nios2_ctrl_reg_macros.h"
#include "system.h"
#include <stdint.h>
#include <stdio.h>
#include <sys/time.h>
#include "sys/alt_irq.h"


int8_t mat1 [4] [4] [2] , mat2 [4] [4] [2];
int  res [4] [4] [2] ;
int8_t lfsr;
int x;

int inicio_hard=0;
int fin_hard=0;

void print_mat(int mod);
void init_mat(int mod);
int *hw_acc= (int *) 0x2000;
int *inter= (int *) 0x2610;
int *start_mult= (int *) 0x2600;
int * out=(int *) 0x2400;
int *random=(int *)0x1000;
volatile int * timer = (int *) 0x0009000;
int *leds=0x0000;
int * T_status=(int *)0x0009000;
int * T_control=(int *)0x00009004;
int * T_low = (int *)0x00009008;
int * T_high = (int *)0x000900C;
int * T_snap_low = (int *)0x0009010;
int * T_snap_high = (int *)0x00009014;

int ticks=1;
int time_slapsed=0;
int8_t get_random1();
int8_t get_random2();

void mult_mat();

void init_mat1(int mod);
void init_mat2(int mod);
int ix, jx, kx;


void interrupt_handler(void)
{
/*int ipending;
NIOS2_READ_IPENDING(ipending);*/
/*if ( ipending & 0x11 ) {// interval timer is interrupt level 0
	time_slapsed =time_slapsed+1;
	*(timer)=0;
	if (time_slapsed==1000)
	{
		printf("LED ENCENDIDO \n");
		*leds=0x1;
	}
	if (time_slapsed==2000)
	{
		printf("LED APAGADO \n");
		*leds=0x0;
		time_slapsed=0;
	}
}*/


*T_snap_low=1;
fin_hard=*T_snap_low + *T_snap_high * 65536;
*T_control=0x0008;

int ipending;
NIOS2_READ_IPENDING(ipending);
//printf("Interrupt \n");
*leds=0;
*inter=0;
printf("El Hardware duró, %d ticks \n", (inicio_hard-fin_hard));
return;
}


void init_timer(){
	*(timer + 0x2) = 0xFFFFFFFF;
	*(timer + 0x3) = 0xFFFFFFFF;
}




void init_mat(int mod){
	for (ix=0;ix<4;ix++){
		for (jx=0;jx<4;jx++){
			for (kx=0;kx<2;kx++){
			if (mod==0) mat1[ix] [jx] [kx] = get_random1();
			else mat2[ix] [jx] [kx] = get_random1();
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





int8_t get_random1(){ //software LFSR

        unsigned lsb = lfsr & 1;
        lfsr >>= 1;
        if (lsb == 1)
            lfsr ^= 0xA2;

        return lfsr;

}

int8_t get_random2(){ //hardware LFSR
        return *random;
}




void parte_1(){


	lfsr = *random;
	init_mat(0);
	init_mat(1);

	int inicio=0;
	int fin=0;

	init_timer();
	*T_snap_low=1;
	*T_control=0x0004;
	inicio=*T_snap_low + *T_snap_high * 65536;

	mult_mat();

	*T_snap_low=1;
	fin=*T_snap_low + *T_snap_high * 65536;
	*T_control=0x0008;

	printf("La aplicación duró, %d ticks \n\n", (inicio-fin));

	print_mat(0);
	print_mat(1);
	print_mat(2);
}


void init_interrupt(){

 	NIOS2_WRITE_IENABLE(0x1);
 	NIOS2_WRITE_STATUS( 1 );
 	alt_irq_register(2,0, interrupt_handler);

}

void init_mat1(int mod){
	int i=0;
	for (ix=0;ix<4;ix++){
		for (jx=0;jx<4;jx++){
			for (kx=0;kx<2;kx++){
			if (mod==0) mat1[ix] [jx] [kx] = (int8_t)*(hw_acc+i);
			else mat2[ix] [jx] [kx] = (int8_t)*(hw_acc+i);
			i = i + 4;
			}
		}
	}
}

void init_mat2(int mod){
	int i=32*4;
	for (ix=0;ix<4;ix++){
		for (jx=0;jx<4;jx++){
			for (kx=0;kx<2;kx++){
			if (mod==0) mat1[ix] [jx] [kx] = (int8_t)*(hw_acc+i);
			else {mat2[ix] [jx] [kx] = (int8_t)*(hw_acc+i);}
			i = i + 4;
			}
		}
	}
}


int main()
{
	//parte_1();
	lfsr = *random;
	init_interrupt();
	//*leds=0xFF;
	for (ix=0;ix<64*4;ix=ix+4){
		/*if(ix<32*4){*(hw_acc+ix)=128;}
		else{*(hw_acc+ix)=127;}*/
		*(hw_acc+ix) = *random;
	}
	init_mat1(0);
	init_mat2(1);
	for (ix=0;ix<63*4+1;ix=ix+4){
		if(ix%(8*4)==0){
			if(ix==0){
				printf("%d",*(hw_acc+ix));
			}
			else {
				printf("\n%d",*(hw_acc+ix));
			}
		}
		else{
			printf("\t%d",*(hw_acc+ix));
		}
		if(ix%(31*4)== 0 && ix != 0){
			printf("\n");
		}
	}
	printf("\n");

	init_timer();
	*T_snap_low=1;
	*T_control=0x0004;
	inicio_hard=*T_snap_low + *T_snap_high * 65536;

	mult_mat();

	*T_snap_low=1;
	fin_hard=*T_snap_low + *T_snap_high * 65536;
	*T_control=0x0008;
	printf("----------------- \n");
	printf("La aplicación duró, %d ticks \n\nResultados Software:\n", (inicio_hard-fin_hard));

	print_mat(res);

	init_timer();
	*T_snap_low=1;
	*T_control=0x0004;
	inicio_hard=*T_snap_low + *T_snap_high * 65536;

	*start_mult=0x1;

	printf("\nResultados Hardware:\n");
	for (ix=0;ix<32*4;ix=ix+4){
		if(ix%(8*4)==0){
			if(ix==0){
				printf("%d",(int32_t)*(out+ix));
			}
			else {
				printf("\n%d",(int32_t)*(out+ix));
			}
		}
		else{
			printf("\t%d",(int32_t)*(out+ix));
		}
	}
	while(1);
	return 0;
}























