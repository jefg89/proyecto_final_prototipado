/*
 * main_ann.c
 *
 *  Created on: 03/12/2014
 *      Author: jgonzalez
 */




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
 *bv
 */

#include <stdio.h>
#include <math.h>
#include "ann.h"
#include<time.h>
#define RAND_MAX 2147483647 /* 2^31-1*/

// ------------------Input Layer----------------------------------------------
void input_layer_1_D(float in, float *out) {
     *out=in;
     }
//--------------------------------------------------------------------------------

// ----------------Hidden Layer-------------------------------------------------
void hidden_layer_1_D(int N_hidden,float x_pi, float * w_ji, float * y_pj, int actFunc){
	int n=0;

	for (n=0;n<N_hidden;n++) {

		switch (actFunc){

		case 0: /*logsig activation function*/
			{
				y_pj[n]= tanh(x_pi/12.0 * w_ji[n]); //mejorar esto//
			}

		case 1: /*linear activation function*/
			{
				y_pj[n]=x_pi * w_ji[n];
			}
		default:
			{
				y_pj[n]= tanh(x_pi/12.0 * w_ji[n]); // y esto//
			}
		}

	}


}
//-------------------------------------------------------------------------------------

//--------------------Output Layer-----------------------------------------------------
void output_layer_1_D(int N_hidden, float *x , float *w_kj,float *b, float *Y )
{
     int n=0;
     float add=0.0;
     for (n=0; n<N_hidden; n++)
	{
		add= add + x[n] * w_kj[n];
     }
     *Y=add + *b;
}

//-----------------------------------------------------------------------------

//------------------ANN construction------------------------------------------
void ANN (int N_hidden,float In, float * w_ji, float  * w_kj, float *b, float * y_pj,float * y_pk)  {
float x_pi;

input_layer_1_D(In,&x_pi);

hidden_layer_1_D(N_hidden,x_pi, w_ji, y_pj,0);

output_layer_1_D(N_hidden,y_pj,w_kj,b,y_pk);

}
//-------------------------------------------------------------

//------------Backpropagation algorithm-------------------------


void BPA (int N_hidden, int N_dat,float eta, float *In,float *d_pk, float *w_ji, float *w_kj, float * b) {

float *y_pj; //hidden out
float *y_pk; // output out
float delta_pk; //output layer delta
float * delta_pj; //hidden layer delta
int x = 0;

//memory allocation for hidden output and delta
y_pj = (float*)malloc(N_hidden* sizeof(float));
delta_pj = (float*)malloc(N_hidden* sizeof(float));
y_pk = (float*)malloc(1* sizeof(float));




//------------ Initial random weights generation//

srand ((unsigned) (time(0)));
for (x=0;x<N_hidden;x++)
	{
        w_ji [x] =(float) (rand()) / (float) (RAND_MAX);

	    w_kj [x] =(float) (rand()) / (float) (RAND_MAX);

	}

//bias random generation

//b= static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
*b=-1.72;

//------------ End of random weigths generation





int iter=0;
for (iter=0;iter<15;iter++) {
	int pos =0;

for (pos=0;pos<N_dat;pos++){
	int y=0;
	ANN (N_hidden,In[pos], w_ji, w_kj,b,y_pj,y_pk);//ANN run

	//output delta computing
	delta_pk=(d_pk[pos]-*y_pk);


	//hidden delta computing
	 for (y=0;y<N_hidden;y++) {

         delta_pj[y]= y_pj[y] *( 1.0 - y_pj[y])* delta_pk * w_kj[y];
         w_kj[y] =  w_kj[y] + eta * delta_pk * y_pj[y];  //output weights adjustment
         w_ji[y] =  w_ji[y] + eta * delta_pj[y] * In[pos]; // hidden weight adjustment
		}
	*b=*b + eta * delta_pk ;

	}
}

}


int main()
{
	double pi=pow(2,-24) + pow(2,-23);
  printf("Hello from Nios II! %e\n", pi);
  int N=10; // number of hidden layers
  int N_dat = 102; // number of training data
  int c=0;


  float *w_ji;
  float *w_kj;
  float *y_pj;
  float *b;
  float *y_pk;



  y_pj= (float*)malloc(N * sizeof(float));
  w_ji = (float*)malloc(N* sizeof(float));;//memory allocation  for hidden w
  w_kj = (float*)malloc(N* sizeof(float));;//memory allocation  for output w
  b=(float*)malloc(1* sizeof(float));
  y_pk=(float*)malloc(1* sizeof(float));
  float In [192] = {11.800009,16.400026,17.400030,16.400026,12.600012,16.200026,1.800000,13.600016,14.200018,15.000021,30.400080,17.200029,13.400015,17.800032,15.200022,13.600016,
  13.200014,13.600016,14.000017,13.600016,14.200018,17.000029,8.999998,11.400007,13.600016,13.600016,29.000074,13.600016,32.800072,17.800032,13.600016,11.400007,11.600008,8.999998,
  11.800009,16.400026,13.600016,8.999998,13.600016,11.200006,21.200045,14.000017,20.000040,14.000017,2.000000,32.000084,32.000084,32.200081,27.600069,26.000063,1.800000,1.800000,17.000029,
  1.800000,25.400061,12.200010,1.800000,14.200018,16.400026,11.800009,13.600016,13.600016,13.400015,1.800000,11.800009,44.799889,13.600016,16.600027,11.200006,1.800000,14.200018,24.200056,
  32.200081,1.800000,32.200081,16.200026,13.800016,33.200066,13.600016,16.400026,35.000038,14.200018,13.600016,16.400026,1.800000,11.800009,12.200010,12.200010,15.000021,1.800000,17.000029,
  16.800028,13.600016,1.800000,1.800000,17.200029,32.200081,13.800016,14.200018,13.600016,14.200018,16.400026,17.200029,32.400078,12.200010,1.800000,1.800000,11.600008,13.600016,13.600016,11.000006,
  13.600016,32.600075,32.400078,1.800000,14.200018,2.000000,11.600008,1.800000,13.600016,32.000084,17.200029,13.600016,39.399971,14.000017,2.000000,33.200066,15.000021,14.000017,11.600008,32.200081,
  13.400015,1.800000,33.600060,19.600039,1.800000,14.200018,17.400030,17.200029,13.600016,17.200029,17.200029,14.200018,13.600016,14.400019,16.400026,17.200029,16.600027,16.400026,13.800016,13.600016,
  6.999996,17.200029,16.400026,32.200081,17.200029,16.400026,14.000017,2.000000,16.400026,17.600031,32.600075,13.800016,17.600031,20.600042,21.000044,2.000000,14.000017,15.000021,13.600016,17.400030,
  14.000017,20.600042,15.000021,11.000006,9.199999,13.600016,12.200010,14.200018,14.200018,13.600016,14.200018,32.200081,23.800055,13.400015,32.200081,17.200029,14.200018,13.600016,17.600031,17.200029,20.800043};
  float d_pk [192] ;

  for (c=0;c<192;c++) {
  	if (In [c] < 11.6) d_pk[c]=-1;
  	else d_pk[c]=1;
  }
  float eta = 0.0000002;  // 0.0000272



  BPA (N,N_dat,eta, In,d_pk, w_ji, w_kj,b);


  //testing
  int c2=0;
  for (c2=0;c2<192;c2++) {
  	printf("%f \t", In [c2]);
  	ANN (N,In[c2], w_ji, w_kj,b, y_pj,y_pk);
  	printf ("%f \t", *y_pk);
  	printf ("%f \n", d_pk[c2]);
  }

  c=0;

  for (c=0;c<N;c++) {
  	printf (" %f \t", w_ji[c]);
  	printf ("%f \n", w_kj[c]);
  }
  printf("b= %f \n",*b);


  return 0;
}
