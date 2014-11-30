`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:49 11/28/2014 
// Design Name: 
// Module Name:    multiplicadorPuntoFijo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplicadorPuntoFijo  #(parameter Width = 24, Magnitud = 4, Precision = 19, Signo = 1)
		(EnableMul,In,Coeff,OutMul,Error);
	 
	 input EnableMul;
	 input signed [Width-1:0] In,Coeff;
	 output reg signed [Width-1:0] OutMul = 0; 
	 output Error;
	 reg signed [2*Width-1:0]  AuxMul = 0; 
	 reg Overflow = 0;
	 reg Underflow = 0;
	 
	 
	 
		always @* begin //Se ejecuta la multiplicación**************************************************
			if (EnableMul) begin
				AuxMul <= In * Coeff; // Se almacena el resultado en un temporal
			end
			else begin
				AuxMul <= 0;
			end
		end
		
		always @* begin // Detección  de Overflow y underflow****************************************+
			if (~In[Width-1] && ~Coeff[Width-1] && AuxMul[2*Width -1 - Magnitud - Signo]) begin
				Overflow <= 1;
				Underflow <= 0;
			end
			else if(In[Width-1] && Coeff[Width-1] && AuxMul[2*Width -1 - Magnitud - Signo]) begin
				Overflow <= 1;
				Underflow <= 0;
			end
			else if(~In[Width-1] && Coeff[Width-1] && ~AuxMul[2*Width -1 - Magnitud - Signo]) begin
				Overflow <= 0;
				Underflow <= 1;
			end
			else if(In[Width-1] && ~Coeff[Width-1] && ~AuxMul[2*Width -1 - Magnitud - Signo]) begin
				Overflow <= 0;
				Underflow <= 1;
			end
			else begin
				Overflow <= 0;
				Underflow <= 0;
			end
		end
		
		always @* begin // Se ejecuta la salida ***************************************************************
			if (In == 0 || Coeff==0) begin
					OutMul <= 0;
			end 
			else begin
				if (Overflow) begin
					OutMul <= 2**(Width-1) -1;  // En caso que se multipliquen 2 numeros positivos y de negativo; Significa que hubo overflow 					
				end
				else begin
					if (Underflow) begin
						OutMul <= -2**(Width-1);    // En caso que se multipliquen 1 numero negativo y el otro positivo y el resultado de positivo, sugnifica que hay underflow
					end
					else begin
						OutMul <= AuxMul[2*Width -1 - Magnitud - Signo : Precision];      // Si no hay ni overflow ni underflow Salida es igual a resultado temporal
					end
				end	
			end
		end
		
		//****************************Errorrrrrrrrr*************************
		assign Error =  Overflow | Underflow;
		
	
	 //**********************************************************FIN DE EJECUCION MULTIPLICADOR*********************************************************
endmodule
