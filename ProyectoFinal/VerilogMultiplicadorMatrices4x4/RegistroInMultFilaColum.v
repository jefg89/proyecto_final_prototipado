`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:29:54 10/29/2014 
// Design Name: 
// Module Name:    RegistroInMultiplicador 
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
module RegistroInMultiplicador #(parameter Width = 8)(
CLK,reset,Enable,
A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,

A11OutReal,A11OutImag,A12OutReal,A12OutImag,A13OutReal,A13OutImag,A14OutReal,A14OutImag,
B11OutReal,B11OutImag,B21OutReal,B21OutImag,B31OutReal,B31OutImag,B41OutReal,B41OutImag
);

	input CLK, reset, Enable;
	input signed [Width-1:0] A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,
	A14InReal,A14InImag,B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag;

	output reg signed [Width-1:0] A11OutReal=0,A11OutImag=0,A12OutReal=0,A12OutImag=0,A13OutReal=0,
A13OutImag=0,A14OutReal=0,A14OutImag=0,B11OutReal=0,B11OutImag=0,B21OutReal=0,B21OutImag=0,
B31OutReal=0,B31OutImag=0,B41OutReal=0,B41OutImag=0;
	 
	always @(posedge CLK)
		if (reset) begin
			A11OutReal <= 0;
			A11OutImag <= 0;
			A12OutReal <= 0;
			A12OutImag <= 0;
			A13OutReal <= 0;
			A13OutImag <= 0;
			A14OutReal <= 0;
			A14OutImag <= 0;
			B11OutReal <= 0;
			B11OutImag <= 0;
			B21OutReal <= 0;
			B21OutImag <= 0;
			B31OutReal <= 0;
			B31OutImag <= 0;
			B41OutReal <= 0;
			B41OutImag <= 0;
			
		end else if (Enable) begin
			A11OutReal <= A11InReal;
			A11OutImag <= A11InImag;
			A12OutReal <= A12InReal;
			A12OutImag <= A12InImag;
			A13OutReal <= A13InReal;
			A13OutImag <= A13InImag;
			A14OutReal <= A14InReal;
			A14OutImag <= A14InImag;
			B11OutReal <= B11InReal;
			B11OutImag <= B11InImag;
			B21OutReal <= B21InReal;
			B21OutImag <= B21InImag;
			B31OutReal <= B31InReal;
			B31OutImag <= B31InImag;
			B41OutReal <= B41InReal;
			B41OutImag <= B41InImag;
			
		end


endmodule
