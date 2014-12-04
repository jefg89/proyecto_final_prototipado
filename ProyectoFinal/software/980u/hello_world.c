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
#include <time.h>

/* Device pointers*/
     /* Coefs*/
int * w_ji=0x0830;
int * w_kj=0x0834;
    /* offset*/
int * b=0x0970;
/*   Training input   */
int * training=0x0860;
/*   Start register   */
int * start = 0x9A0;
/*   LSFR random */
int * lsfr=0x1000;

int * y_pk=0x990; /* ANN final output  -----FALTA  */
int * y_pj=0x810; /* ANN hidden output -----FALTA  */




int N_hidden=10; /*number of hidden neurons in layer*/
int N_in=1;  /*number of input variables*/
int N_iter=10; /*number of training iterations*/
int N_dat=20;  /*number of training data*/

int delta_pk ; /* ANN final delta  */
int delta_pj[10]; /* ANN hidden delta  */
int eta=335; //0.00002
int  d_pk [20]; /* training  desired output*/
int In [20];

int main()
{
	int i, iter;
	/*

	*b=1;
	float x= 100.123787;
	unsigned int y = (int)x;
	x=(x-y)*1000000;
	y = (int)x;
 printf("%d \n", y);
*/
	 int32_t data_t;
	 int32_t data1;
	 int32_t data2;
	 int32_t data3;
	 int32_t data4;

 for (i=0;i<2*10*4;i=i+4){
	 data1 = *(lsfr);
	 data2 = *(lsfr);
	 data3 = *(lsfr);
	 data4 = 0;

	 data_t = data4 << 24 | data3 << 16 | data2 << 8 | data1;
  	*(w_ji+i) =data_t;
  	printf("%d \n", *(w_ji+i));
  	}
printf("----------------------------------------------------------- \n");
 for (iter=0;iter<10;iter++) {
 	int pos;
 	for (pos=0;pos<N_dat;pos++){
 		// llamar a la red
 		*start=1;

 		//ANN (In[pos], w_ji, w_kj,b,y_pj,y_pk);//ANN run
 		//printf("salida %d = %f \n",pos,*y_pk);

 		//output delta computing
 		delta_pk=(d_pk[pos]-*(y_pk));
 		//hidden delta computing
 		 for (i=0;i<N_hidden;i++) {
 			delta_pj[i]= *(y_pj+i*4) * ( (1<<24) - *(y_pj+i*4)) * delta_pk * *( w_kj+i*4);
 			*( w_kj+i*4) =  *( w_kj+i*4) + eta * delta_pk * *(y_pj+i*4);  //output weights adjustment

 			*(w_ji+i*4) =  *(w_ji+i*4) + eta * delta_pj[i] * In[pos]; // hidden weight adjustment

 			}
 			*b=*b + eta * delta_pk ;
 		}
 	}
 for (i=0;i<2*10*4;i=i+4){
   	printf("%d \n", *(w_ji+i));
   	}


  return 0;
}
