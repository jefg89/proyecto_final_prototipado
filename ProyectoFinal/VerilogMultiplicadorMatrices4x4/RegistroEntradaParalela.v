`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:24 10/29/2014 
// Design Name: 
// Module Name:    RegistroEntradaParalela 
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
module RegistroEntradaParalela #(parameter Width = 8)
(
CLK,reset,Enable,
A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,

A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,

A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,

A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag,

A11OutReal,A11OutImag,A12OutReal,A12OutImag,A13OutReal,A13OutImag,A14OutReal,A14OutImag,
B11OutReal,B11OutImag,B21OutReal,B21OutImag,B31OutReal,B31OutImag,B41OutReal,B41OutImag,

A21OutReal,A21OutImag,A22OutReal,A22OutImag,A23OutReal,A23OutImag,A24OutReal,A24OutImag,
B12OutReal,B12OutImag,B22OutReal,B22OutImag,B32OutReal,B32OutImag,B42OutReal,B42OutImag,

A31OutReal,A31OutImag,A32OutReal,A32OutImag,A33OutReal,A33OutImag,A34OutReal,A34OutImag,
B13OutReal,B13OutImag,B23OutReal,B23OutImag,B33OutReal,B33OutImag,B43OutReal,B43OutImag,

A41OutReal,A41OutImag,A42OutReal,A42OutImag,A43OutReal,A43OutImag,A44OutReal,A44OutImag,
B14OutReal,B14OutImag,B24OutReal,B24OutImag,B34OutReal,B34OutImag,B44OutReal,B44OutImag
);

	input CLK, reset, Enable;
	input signed [Width-1:0] A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,
	A14InReal,A14InImag,B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,
	A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
	B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,
	A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
	B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,
	A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
	B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag;
	
	output reg signed [Width-1:0] A11OutReal=0,A11OutImag=0,A12OutReal=0,A12OutImag=0,A13OutReal=0,
	A13OutImag=0,A14OutReal=0,A14OutImag=0,B11OutReal=0,B11OutImag=0,B21OutReal=0,B21OutImag=0,
	B31OutReal=0,B31OutImag=0,B41OutReal=0,B41OutImag=0,
	A21OutReal=0,A21OutImag=0,A22OutReal=0,A22OutImag=0,A23OutReal=0,A23OutImag=0,A24OutReal=0,A24OutImag=0,
	B12OutReal=0,B12OutImag=0,B22OutReal=0,B22OutImag=0,B32OutReal=0,B32OutImag=0,B42OutReal=0,B42OutImag=0,
	A31OutReal=0,A31OutImag=0,A32OutReal=0,A32OutImag=0,A33OutReal=0,A33OutImag=0,A34OutReal=0,A34OutImag=0,
	B13OutReal=0,B13OutImag=0,B23OutReal=0,B23OutImag=0,B33OutReal=0,B33OutImag=0,B43OutReal=0,B43OutImag=0,
	A41OutReal=0,A41OutImag=0,A42OutReal=0,A42OutImag=0,A43OutReal=0,A43OutImag=0,A44OutReal=0,A44OutImag=0,
	B14OutReal=0,B14OutImag=0,B24OutReal=0,B24OutImag=0,B34OutReal=0,B34OutImag=0,B44OutReal=0,B44OutImag=0;
	
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
			A21OutReal <= 0;
			A21OutImag <= 0;
			A22OutReal <= 0;
			A22OutImag <= 0;
			A23OutReal <= 0;
			A23OutImag <= 0;
			A24OutReal <= 0;
			A24OutImag <= 0;
			B12OutReal <= 0;
			B12OutImag <= 0;
			B22OutReal <= 0;
			B22OutImag <= 0;
			B32OutReal <= 0;
			B32OutImag <= 0;
			B42OutReal <= 0;
			B42OutImag <= 0;
			A31OutReal <= 0;
			A31OutImag <= 0;
			A32OutReal <= 0;
			A32OutImag <= 0;
			A33OutReal <= 0;
			A33OutImag <= 0;
			A34OutReal <= 0;
			A34OutImag <= 0;
			B13OutReal <= 0;
			B13OutImag <= 0;
			B23OutReal <= 0;
			B23OutImag <= 0;
			B33OutReal <= 0;
			B33OutImag <= 0;
			B43OutReal <= 0;
			B43OutImag <= 0;
			A41OutReal <= 0;
			A41OutImag <= 0;
			A42OutReal <= 0;
			A42OutImag <= 0;
			A43OutReal <= 0;
			A43OutImag <= 0;
			A44OutReal <= 0;
			A44OutImag <= 0;
			B14OutReal <= 0;
			B14OutImag <= 0;
			B24OutReal <= 0;
			B24OutImag <= 0;
			B34OutReal <= 0;
			B34OutImag <= 0;
			B44OutReal <= 0;
			B44OutImag <= 0;
			
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
			A21OutReal <= A21InReal;
			A21OutImag <= A21InImag;
			A22OutReal <= A22InReal;
			A22OutImag <= A22InImag;
			A23OutReal <= A23InReal;
			A23OutImag <= A23InImag;
			A24OutReal <= A24InReal;
			A24OutImag <= A24InImag;
			B12OutReal <= B12InReal;
			B12OutImag <= B12InImag;
			B22OutReal <= B22InReal;
			B22OutImag <= B22InImag;
			B32OutReal <= B32InReal;
			B32OutImag <= B32InImag;
			B42OutReal <= B42InReal;
			B42OutImag <= B42InImag;
			A31OutReal <= A31InReal;
			A31OutImag <= A31InImag;
			A32OutReal <= A32InReal;
			A32OutImag <= A32InImag;
			A33OutReal <= A33InReal;
			A33OutImag <= A33InImag;
			A34OutReal <= A34InReal;
			A34OutImag <= A34InImag;
			B13OutReal <= B13InReal;
			B13OutImag <= B13InImag;
			B23OutReal <= B23InReal;
			B23OutImag <= B23InImag;
			B33OutReal <= B33InReal;
			B33OutImag <= B33InImag;
			B43OutReal <= B43InReal;
			B43OutImag <= B43InImag;
			A41OutReal <= A41InReal;
			A41OutImag <= A41InImag;
			A42OutReal <= A42InReal;
			A42OutImag <= A42InImag;
			A43OutReal <= A43InReal;
			A43OutImag <= A43InImag;
			A44OutReal <= A44InReal;
			A44OutImag <= A44InImag;
			B14OutReal <= B14InReal;
			B14OutImag <= B14InImag;
			B24OutReal <= B24InReal;
			B24OutImag <= B24InImag;
			B34OutReal <= B34InReal;
			B34OutImag <= B34InImag;
			B44OutReal <= B44InReal;
			B44OutImag <= B44InImag;	
		end


endmodule
