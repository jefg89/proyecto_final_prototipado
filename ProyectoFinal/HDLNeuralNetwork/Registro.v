`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:02 11/28/2014 
// Design Name: 
// Module Name:    Registro 
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
module Registro #(parameter Width = 24)
(CLK,reset,Enable,Entrada,Salida);

	input CLK,reset, Enable;
	input signed [Width-1:0] Entrada;
	output reg signed [Width-1:0] Salida;
	
   always @(posedge CLK)
	  if (reset) begin
		  Salida <= 0;
	  end else if (Enable) begin
		  Salida <= Entrada;
	  end


endmodule
