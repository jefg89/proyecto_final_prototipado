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
#include <stdlib.h>
#include <float.h>
#include <time.h>
#include<math.h>


double ftod(int32_t in){
    double out = 0, sig;
    int i;
    if(in >> 31 != 0){
        sig = -1.0;
    }
    else{sig = 1.0;}
    in = abs(in);
    for(i=-24;i<7;i++){
        if((in & 0x1) == 0x1){out+= pow(2,i);}
        in = in >> 1;
    }
    return out*sig;
}

int32_t dtof(double in){
    int32_t out = 0, sig;
    int i;

    if(in >= 0){
        sig = 1;
    }
    else{sig = -1; in = in * -1.0;}
    out = (int32_t)in;
    in = in - out;
	for(i=0;i<24;i++){
		out = out << 1;
		in = in*2;
		if(in>=1){out = out|(0x1);in = in - 1;}
    }
    return out*sig;
}



int * ready= (int*)0x0800;

/* Device pointers*/
     /* Coefs*/
int * w_ji=(int*)0x0830;
int * w_kj=(int*)0x08D0;

/*int * w_ji2=(int*)0x0840;
int * w_kj2=(int*)0x08E0;

int * w_ji3=(int*)0x0850;
int * w_kj3=(int*)0x08F0;

int * w_ji4=(int*)0x0860;
int * w_kj4=(int*)0x0900;

int * w_ji5=(int*)0x0870;
int * w_kj5=(int*)0x0910;

int * w_ji6=(int*)0x0880;
int * w_kj6=(int*)0x0920;

int * w_ji7=(int*)0x0890;
int * w_kj7=(int*)0x0930;

int * w_ji8=(int*)0x08A0;
int * w_kj8=(int*)0x0940;

int * w_ji9=(int*)0x08B0;
int * w_kj9=(int*)0x0950;

int * w_ji10=(int*)0x08C0;
int * w_kj10=(int*)0x0960;
*/
    /* offset*/
int * b=(int*)0x0970;
/*   Training input   */
int * training=(int*)0x0980;;
/*   Start register   */
int * start = (int*)0x0A30;
/*   LSFR random */
int * lsfr=(int*)0x1000;

int * y_pk=(int*)0x0810; /* ANN final output  -----FALTA  */
int * y_pj=(int*)0x0990; /* ANN hidden output -----FALTA  */


int N_hidden=10; /*number of hidden neurons in layer*/
int N_in=1;  /*number of input variables*/
int N_iter=10; /*number of training iterations*/
int N_dat=100;  /*number of training data*/

float delta_pk ; /* ANN final delta  */
float delta_pj[10]; /* ANN hidden delta  */
double eta=0.00912; //0.00002
double  d_pk [192]; /* training  desired output*/

float outputs [100];

/*double In [192] = {0.9833340833,1.3666688333,1.4500025,1.3666688333,1.050001,1.3500021667,0.15,1.1333346667,1.1833348333,1.25000175,2.53334,1.43333575,1.1166679167,1.483336,1.2666685,1.1333346667,
		1.1000011667,1.1333346667,1.1666680833,1.1333346667,1.1833348333,1.4166690833,0.7499998333,0.9500005833,1.1333346667,1.1333346667,2.4166728333,1.1333346667,2.7333393333,1.483336,1.1333346667,0.9500005833,0.9666673333,0.7499998333,
		0.9833340833,1.3666688333,1.1333346667,0.7499998333,1.1333346667,0.9333338333,1.7666704167,1.1666680833,1.66667,1.1666680833,0.1666666667,2.6666736667,2.6666736667,2.6833400833,2.30000575,2.1666719167,0.15,0.15,1.4166690833,
		0.15,2.11667175,1.0166675,0.15,1.1833348333,1.3666688333,0.9833340833,1.1333346667,1.1333346667,1.1166679167,0.15,0.9833340833,3.7333240833,1.1333346667,1.3833355833,0.9333338333,0.15,1.1833348333,2.0166713333,
		2.6833400833,0.15,2.6833400833,1.3500021667,1.1500013333,2.7666721667,1.1333346667,1.3666688333,2.9166698333,1.1833348333,1.1333346667,1.3666688333,0.15,0.9833340833,1.0166675,1.0166675,1.25000175,0.15,1.4166690833,
		1.4000023333,1.1333346667,0.15,0.15,1.43333575,2.6833400833,1.1500013333,1.1833348333,1.1333346667,1.1833348333,1.3666688333,1.43333575,2.7000065,1.0166675,0.15,0.15,0.9666673333,1.1333346667,1.1333346667,0.9166671667,
		1.1333346667,2.7166729167,2.7000065,0.15,1.1833348333,0.1666666667,0.9666673333,0.15,1.1333346667,2.6666736667,1.43333575,1.1333346667,3.2833309167,1.1666680833,0.1666666667,2.7666721667,1.25000175,1.1666680833,0.9666673333,2.6833400833,
		1.1166679167,0.15,2.800005,1.6333365833,0.15,1.1833348333,1.4500025,1.43333575,1.1333346667,1.43333575,1.43333575,1.1833348333,1.1333346667,1.2000015833,1.3666688333,1.43333575,1.3833355833,1.3666688333,1.1500013333,1.1333346667,
		0.583333,1.43333575,1.3666688333,2.6833400833,1.43333575,1.3666688333,1.1666680833,0.1666666667,1.3666688333,1.46666925,2.7166729167,1.1500013333,1.46666925,1.7166701667,1.7500036667,0.1666666667,1.1666680833,1.25000175,1.1333346667,1.4500025,
		1.1666680833,1.7166701667,1.25000175,0.9166671667,0.7666665833,1.1333346667,1.0166675,1.1833348333,1.1833348333,1.1333346667,1.1833348333,2.6833400833,1.9833379167,1.1166679167,2.6833400833,1.43333575,1.1833348333,1.1333346667,1.46666925,1.43333575,1.7333369167};
*/
double In [192];
int main()
{

	double c_w_kj, c_y_pj;
	int c;
	/*for (c=0;c<192;c++) {
		if (In [c] < 0.96667) d_pk[c]=-1;
	  	else d_pk[c]=1;
	 }*/
	/*for (c=0;c<50;c++) {
		d_pk[c]=sin(2*3.1415*((((float) c)*8*50)/(float) (N_dat)));
	}*/

	int i, iter;

	int32_t data_t;
	int32_t data1;
	int32_t data2;
	int32_t data3;
	int32_t data4;

	for (i=0;i<80;i=i+4){
		data1 = *(lsfr);
		data2 = *(lsfr);
		data3 = *(lsfr);
		data4 = 0;

		data_t = data4 << 24 | data3 << 16 | data2 << 8 | data1;
		*(w_ji+i) = data_t;
	}
//printf("----------------------------------------------------------- \n");

	int pos,x;
	*b=dtof(-1.72); //-1.72

	for (iter=0;iter<6;iter++) {
		printf("----------------------------------------------------------- \n");
		for (pos=0;pos<N_dat;pos++){
			In[pos] = (((float) pos*5))/(float) (N_dat);
			d_pk[pos]=(float)(log(In[pos]+1));///2.0;

			*training = dtof(In[pos]);
			// llamar a la red
			*start=1;
			//output delta computing
			//printf("DPK = %f\n",d_pk[pos]);
			//delta_pk=(d_pk[pos]-ftod(*(y_pk)));
			delta_pk=(d_pk[pos]-ftod(*(y_pk)));


			//printf("Delta = %f\n",delta_pk);
			//hidden delta computing
				for (i=0;i<N_hidden;i++) {
					//printf("<pjffff: %f \n",ftod(*y_pj));
					c_w_kj = ftod(*(w_kj+i*4));
					c_y_pj = ftod(*(y_pj+i*4));
					*(w_kj+i*4) = dtof(c_w_kj + eta * delta_pk *c_y_pj);  //output weights adjustment
					//c_w_kj=ftod(*(w_kj+i*4)); //new
					delta_pj[i] = c_y_pj * ( 1 - c_y_pj) * delta_pk * c_w_kj;
					*(w_ji+i*4) = dtof(ftod(*(w_ji+i*4)) + eta * delta_pj[i] * In[pos]); // hidden weight adjustment
				}
				*b=dtof(ftod(*b) + eta * delta_pk);
				/*for (i=0;i<2*10*4;i=i+4){
					printf("%f \n", ftod(*(w_ji+i)));
				}*/
			outputs[pos] = ftod(*y_pk);
			x = *ready;
		}
	}

	for (pos=0;pos<N_dat;pos++){
		printf("%f\t%f\n",outputs[pos],d_pk[pos]);
	}

/*
float fd=ftod(0x6AAAAAAA);
printf("sal: %f",fd);

	int x = *ready;
	 *w_kj=dtof(1);
	 *w_ji=dtof(1);

	 *training=dtof(12.251);
	 //*b=1105;


	 *start=1;


	 printf("Entrada: %f \n",ftod(*training));
	 printf("Peso Oculto: %f \n",ftod(*w_ji));
	 printf("Peso Salida: %f \n",ftod(*w_kj));
	 printf("Salida: %f \n",ftod(*y_pk));

	 *w_kj=dtof(1);
	 	 *w_ji=dtof(1);

	 	 x = *ready;

	 	 *training=dtof(2);
	 	 //*b=1105;

	 	 *start=1;

	 	 printf("Entrada: %f \n",ftod(*training));
	 	 printf("Peso Oculto: %f \n",ftod(*w_ji));
	 	 printf("Peso Salida: %f \n",ftod(*w_kj));
	 	printf("Salida: %f \n",ftod(*y_pk));
	 	*/

	return 0;
}
