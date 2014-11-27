`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:48 10/29/2014 
// Design Name: 
// Module Name:    Multiplicadormenos1 
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
module Multiplicadormenos1 #(parameter Width = 8) 
    (In,Out);

	input signed [Width-1:0] In;
	output  signed [Width-1:0] Out;
	
	
	assign Out = ((~In) + 1'b1);

endmodule
