#ifndef _BPA_H
#define _BPA_H

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int N_hidden=0; /*number of hidden neurons in layer*/
int N_in=0;  /*number of input variables*/
int N_iter=0; /*number of training iterations*/
int N_dat=0;  /*number of training data*/

/*activation function mode*/
int actFunc=0; 
/*0 = logsig , 1= linear  /*
/*------------------------*/



float eta=0.0; /*learning speed*/
float *b;

float * x_pi;
float *y_pj; //hidden out
float *y_pk; // output out
float delta_pk; //output layer delta
float * delta_pj; //hidden layer delta
float **w_ji;
float *w_kj;


/*N input - single output ANN*/ //replace with hardware
void ANN (float * In, float ** w_ji, float  * w_kj, float *b, float * y_pj,float * y_pk);


/*one dimensional input - backpropagation algorithm*/
void BPA (float **In,float *d_pk, float *b); //



//Ending head-------------------------------------------





//------------Backpropagation algorithm-------------------------
void BPA (float **In,float *d_pk, float * b) {
int i = 0;
int j=0;
int iter=0;

//------------ Initial random weights generation//

srand ((unsigned) (time(0)));
for (i=0;i<N_hidden;i++){
	w_kj [i] =(float) (rand()) / (float) (RAND_MAX);
	for (j=0;j<N_in;j++) {
        w_ji [i][j]=(float) (rand()) / (float) (RAND_MAX);
		}
	}





*b=-1.72; //adjust bias manually.

//------------ End of random weigths generation

//----------Back_propagation-----------------------//
for (iter;iter<N_iter;iter++) {
	int pos =0;
	for (pos;pos<N_dat;pos++){
		ANN (In[pos], w_ji, w_kj,b,y_pj,y_pk);//ANN run
		//printf("salida %d = %f \n",pos,*y_pk);
 
		//output delta computing
		delta_pk=(d_pk[pos]-*y_pk); 
		//hidden delta computing
		 for (i=0;i<N_hidden;i++) {
			delta_pj[i]= y_pj[i] *( 1.0 - y_pj[i])* delta_pk * w_kj[i];
			w_kj[i] =  w_kj[i] + eta * delta_pk * y_pj[i];  //output weights adjustment
			for (j=0;j<N_in;j++) {
				w_ji[i][j] =  w_ji[i][j] + eta * delta_pj[i] * In[pos][j]; // hidden weight adjustment
			} 
			
			}
			*b=*b + eta * delta_pk ;
		}
	}

}


#endif

