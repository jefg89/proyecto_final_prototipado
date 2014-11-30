`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:19 11/28/2014 
// Design Name: 
// Module Name:    sumadorPuntoFijo 
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
module sumadorPuntoFijo#(parameter Width = 24, Magnitud = 4, Precision = 19, Signo = 1)
		(EnableSum,In,Acumulador,OutSum,Error);
	 
	 input EnableSum;
	 input signed [Width-1:0] In,Acumulador;
	 output reg signed [Width-1:0] OutSum = 0; 
	 output Error;
	 reg signed [Width-1:0]  AuxSum = 0; 
	 reg Overflow = 0;
	 reg Underflow = 0;
	 
	 
	 
	 always @*  begin // Proceso suma o resta********************************	
		if(EnableSum) 
			AuxSum <= Acumulador + In; 
		else
			AuxSum <= 0;
	 end
		
	 always @* begin  // Verifica overflow y underflow y satura la salida en caso de existir
		if (~Acumulador[Width-1] && ~AuxSum[Width-1] && AuxSum[Width-1]) begin
			//OutY <= 2**(Width-1) -1;  // En caso de overflow adquiere este valor de saturación hacia arriba
			//OutY <= 24'sb0111_1111_1111_1111_1111_1111;  // En caso de overflow adquiere este valor de saturación hacia arriba
			Overflow <= 1;
			Underflow <= 0;
		end
		else if(Acumulador[Width-1] && AuxSum[Width-1] && ~AuxSum[Width-1]) begin
			//OutY <= -2**(Width);    // En caso de underflow adquiere este valor de saturación hacia abajo
			//OutY <= 24'sb1000_0000_0000_0000_0000_0000;    // En caso de underflow adquiere este valor de saturación hacia abajo
			Overflow <= 0;
			Underflow <= 1;
		end
		else begin
			//OutY <= auxSUM;      // Si no hay ni overflow ni underflow Salida es igual a resultado temporal
		   Overflow <= 0;
			Underflow <= 0;
		end
	 end
	 
	 always @* begin  // Se actualiza la salida***********************************************
		if(Overflow) begin
			OutSum <= 2**(Width-1) -1; 
		end
		else begin
			if(Underflow) begin
				OutSum <= -2**(Width-1);
			end
			else begin
				OutSum <= AuxSum;
			end
		end
	 end
	 
	 
	 // En caso de error*************************************
	 assign Error = Overflow | Underflow;


endmodule
