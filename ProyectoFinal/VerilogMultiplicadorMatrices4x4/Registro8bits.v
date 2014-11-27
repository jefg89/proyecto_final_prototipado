`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:57 10/29/2014 
// Design Name: 
// Module Name:    Registro8bits 
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
module Registro8bits  #(parameter Width = 8)
(CLK, reset, Enable, In, Out);

	 input CLK, reset, Enable;
	 input signed [Width-1:0] In;
	 output reg signed [Width-1:0] Out = 0;
	 
	 always @(posedge CLK)
      if (reset) begin
          Out <= 0;
      end else if (Enable) begin
         Out <= In;
      end


endmodule
