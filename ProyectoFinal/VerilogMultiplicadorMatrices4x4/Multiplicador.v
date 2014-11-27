`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:45 10/29/2014 
// Design Name: 
// Module Name:    Multiplicador 
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
module Multiplicador #(parameter Width = 8) 
	(OperandoA,OperandoB,Result,Error);
	
	input signed  [Width-1:0] OperandoA;
	input signed [Width-1:0] OperandoB;
	output reg signed [Width-1:0] Result = 0;
	output Error;
	
	reg signed [2*Width-1:0] AuxMul = 0;
	reg underflow = 0;
	reg overflow = 0;
	
	
	
	always @* begin
		AuxMul <= OperandoA * OperandoB; // Se almacena el resultado en un temporal
	end
	
	always @* begin // UnderFlow detection
		if(OperandoA[Width-1] && ~OperandoB[Width-1] &&  (AuxMul < (-2**(Width-1)))) begin
			underflow <= 1'b1;
		end
		else if(~OperandoA[Width-1] && OperandoB[Width-1] &&  (AuxMul < (-2**(Width-1)))) begin
			underflow <= 1'b1;
		end
		else begin
		 underflow <= 1'b0;
		end
	end
	
	always @* begin // Overflow detection
		if (~OperandoA[Width-1] && ~OperandoB[Width-1] && (AuxMul > (2**(Width-1) -1))) begin
			overflow <= 1'b1;
		end
		else if(OperandoA[Width-1] && OperandoB[Width-1] && (AuxMul > (2**(Width-1) -1))) begin
			overflow <= 1'b1;
		end
		else begin
		 overflow <= 1'b0;
		end
	end
	
	always @*  begin // Se asigna la salida
		if (overflow) begin
			Result <= 2**(Width-1) -1;
		end
		else if(underflow) begin
			Result <= -2**(Width-1);
		end
		else begin
			Result <= AuxMul[Width-1 : 0];      // Si no hay ni overflow ni underflow Salida es igual a resultado temporal
		end
	end
	
	assign Error = overflow | underflow;
endmodule

