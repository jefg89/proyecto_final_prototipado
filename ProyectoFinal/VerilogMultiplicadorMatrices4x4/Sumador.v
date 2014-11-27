`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:12 10/29/2014 
// Design Name: 
// Module Name:    Sumador 
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
module Sumador #(parameter Width = 8) 
	(OperandoA,OperandoB,Result,Error);
	input signed  [Width-1:0] OperandoA;
	input signed [Width-1:0] OperandoB;
	output reg signed [Width-1:0] Result = 0;
	output Error;
	
	reg signed [Width-1:0] AuxSum = 0;
	reg underflow = 0;
	reg overflow = 0;
	
	always @* begin  // Se ejecuta la suma
		AuxSum <= OperandoA + OperandoB;
	end
	
	always @* begin  // Se detecta overflow 
		if(~OperandoA[Width-1] && ~OperandoB[Width-1] &&   AuxSum[Width-1]) begin//(AuxSum > (2**(Width-1) -1))) begin
			overflow <= 1'b1;
		end
		else begin
			overflow <= 1'b0;
		end
	end
	
	always @* begin  // Se detecta underflow 
		if(OperandoA[Width-1] && OperandoB[Width-1] &&  ~AuxSum[Width-1]) begin//(AuxSum < (-2**(Width-1)))) begin
			underflow <= 1'b1;
		end
		else begin
			underflow <= 1'b0;
		end
	end
	
	always @*  begin // Se asigna la salida
		if (overflow) begin
			Result <= (2**(Width-1) -1);
		end
		else if(underflow) begin
			Result <= -2**(Width-1);
		end
		else begin
			Result <= AuxSum;      // Si no hay ni overflow ni underflow Salida es igual a resultado temporal
		end
	end
	
	assign Error = overflow | underflow;


endmodule

