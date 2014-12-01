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


/* Device Memory Map

Device                      Dir

W training coefs.      0x800 - 0x84C
b output offset           0x850
In traning data           0x854
Start Register            0x858

*/
#include <stdio.h>
#include <stdint.h>
#include <float.h>

/* Device pointers*/
     /* Coefs*/
int * w_ji=0x0800;
int * w_kj=0x0828;
    /* offset*/
int * b=0x0850;
/*   Training input   */
int * training=0x0854;
/*   Start register   */
int * start = 0x858;
/*   LSFR random */
int * lsfr=0x1000;



int main()
{
	int i;
	*b=1;
	float x= 100.123787;
	unsigned int y = (int)x;
	x=(x-y)*1000000;
	y = (int)x;
 printf("%d \n", y);


  for (i=0;i<2*10*4;i=i+4){
  	*(w_ji+i) = 5;
  	}
*b=1;
printf("%d \n", *w_ji);


 for (i=0;i<2*10*4;i=i+4){
  	printf("%d \n", *(w_ji+i));
  	}

  return 0;
}
