`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:15:29 10/30/2014
// Design Name:   MultiplicadorMatrices
// Module Name:   D:/MultiplicadorMatrices/MultiplicadorMatrix/prueba1.v
// Project Name:  MultiplicadorMatrix
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MultiplicadorMatrices
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba1;

	// Inputs
	reg CLK;
	reg Enable;
	reg MasterReset;
	reg Start;
	reg [7:0] A11InReal;
	reg [7:0] A11InImag;
	reg [7:0] A12InReal;
	reg [7:0] A12InImag;
	reg [7:0] A13InReal;
	reg [7:0] A13InImag;
	reg [7:0] A14InReal;
	reg [7:0] A14InImag;
	reg [7:0] B11InReal;
	reg [7:0] B11InImag;
	reg [7:0] B21InReal;
	reg [7:0] B21InImag;
	reg [7:0] B31InReal;
	reg [7:0] B31InImag;
	reg [7:0] B41InReal;
	reg [7:0] B41InImag;
	reg [7:0] A21InReal;
	reg [7:0] A21InImag;
	reg [7:0] A22InReal;
	reg [7:0] A22InImag;
	reg [7:0] A23InReal;
	reg [7:0] A23InImag;
	reg [7:0] A24InReal;
	reg [7:0] A24InImag;
	reg [7:0] B12InReal;
	reg [7:0] B12InImag;
	reg [7:0] B22InReal;
	reg [7:0] B22InImag;
	reg [7:0] B32InReal;
	reg [7:0] B32InImag;
	reg [7:0] B42InReal;
	reg [7:0] B42InImag;
	reg [7:0] A31InReal;
	reg [7:0] A31InImag;
	reg [7:0] A32InReal;
	reg [7:0] A32InImag;
	reg [7:0] A33InReal;
	reg [7:0] A33InImag;
	reg [7:0] A34InReal;
	reg [7:0] A34InImag;
	reg [7:0] B13InReal;
	reg [7:0] B13InImag;
	reg [7:0] B23InReal;
	reg [7:0] B23InImag;
	reg [7:0] B33InReal;
	reg [7:0] B33InImag;
	reg [7:0] B43InReal;
	reg [7:0] B43InImag;
	reg [7:0] A41InReal;
	reg [7:0] A41InImag;
	reg [7:0] A42InReal;
	reg [7:0] A42InImag;
	reg [7:0] A43InReal;
	reg [7:0] A43InImag;
	reg [7:0] A44InReal;
	reg [7:0] A44InImag;
	reg [7:0] B14InReal;
	reg [7:0] B14InImag;
	reg [7:0] B24InReal;
	reg [7:0] B24InImag;
	reg [7:0] B34InReal;
	reg [7:0] B34InImag;
	reg [7:0] B44InReal;
	reg [7:0] B44InImag;

	// Outputs
	wire [7:0] Out11Real;
	wire [7:0] Out11Imag;
	wire [7:0] Out12Real;
	wire [7:0] Out12Imag;
	wire [7:0] Out13Real;
	wire [7:0] Out13Imag;
	wire [7:0] Out14Real;
	wire [7:0] Out14Imag;
	wire [7:0] Out21Real;
	wire [7:0] Out21Imag;
	wire [7:0] Out22Real;
	wire [7:0] Out22Imag;
	wire [7:0] Out23Real;
	wire [7:0] Out23Imag;
	wire [7:0] Out24Real;
	wire [7:0] Out24Imag;
	wire [7:0] Out31Real;
	wire [7:0] Out31Imag;
	wire [7:0] Out32Real;
	wire [7:0] Out32Imag;
	wire [7:0] Out33Real;
	wire [7:0] Out33Imag;
	wire [7:0] Out34Real;
	wire [7:0] Out34Imag;
	wire [7:0] Out41Real;
	wire [7:0] Out41Imag;
	wire [7:0] Out42Real;
	wire [7:0] Out42Imag;
	wire [7:0] Out43Real;
	wire [7:0] Out43Imag;
	wire [7:0] Out44Real;
	wire [7:0] Out44Imag;
	wire Listo;
	wire Error;

	// Instantiate the Unit Under Test (UUT)
	MultiplicadorMatrices uut (
		.CLK(CLK), 
		.Enable(Enable), 
		.MasterReset(MasterReset), 
		.Start(Start), 
		.A11InReal(A11InReal), 
		.A11InImag(A11InImag), 
		.A12InReal(A12InReal), 
		.A12InImag(A12InImag), 
		.A13InReal(A13InReal), 
		.A13InImag(A13InImag), 
		.A14InReal(A14InReal), 
		.A14InImag(A14InImag), 
		.B11InReal(B11InReal), 
		.B11InImag(B11InImag), 
		.B21InReal(B21InReal), 
		.B21InImag(B21InImag), 
		.B31InReal(B31InReal), 
		.B31InImag(B31InImag), 
		.B41InReal(B41InReal), 
		.B41InImag(B41InImag), 
		.A21InReal(A21InReal), 
		.A21InImag(A21InImag), 
		.A22InReal(A22InReal), 
		.A22InImag(A22InImag), 
		.A23InReal(A23InReal), 
		.A23InImag(A23InImag), 
		.A24InReal(A24InReal), 
		.A24InImag(A24InImag), 
		.B12InReal(B12InReal), 
		.B12InImag(B12InImag), 
		.B22InReal(B22InReal), 
		.B22InImag(B22InImag), 
		.B32InReal(B32InReal), 
		.B32InImag(B32InImag), 
		.B42InReal(B42InReal), 
		.B42InImag(B42InImag), 
		.A31InReal(A31InReal), 
		.A31InImag(A31InImag), 
		.A32InReal(A32InReal), 
		.A32InImag(A32InImag), 
		.A33InReal(A33InReal), 
		.A33InImag(A33InImag), 
		.A34InReal(A34InReal), 
		.A34InImag(A34InImag), 
		.B13InReal(B13InReal), 
		.B13InImag(B13InImag), 
		.B23InReal(B23InReal), 
		.B23InImag(B23InImag), 
		.B33InReal(B33InReal), 
		.B33InImag(B33InImag), 
		.B43InReal(B43InReal), 
		.B43InImag(B43InImag), 
		.A41InReal(A41InReal), 
		.A41InImag(A41InImag), 
		.A42InReal(A42InReal), 
		.A42InImag(A42InImag), 
		.A43InReal(A43InReal), 
		.A43InImag(A43InImag), 
		.A44InReal(A44InReal), 
		.A44InImag(A44InImag), 
		.B14InReal(B14InReal), 
		.B14InImag(B14InImag), 
		.B24InReal(B24InReal), 
		.B24InImag(B24InImag), 
		.B34InReal(B34InReal), 
		.B34InImag(B34InImag), 
		.B44InReal(B44InReal), 
		.B44InImag(B44InImag), 
		.Out11Real(Out11Real), 
		.Out11Imag(Out11Imag), 
		.Out12Real(Out12Real), 
		.Out12Imag(Out12Imag), 
		.Out13Real(Out13Real), 
		.Out13Imag(Out13Imag), 
		.Out14Real(Out14Real), 
		.Out14Imag(Out14Imag), 
		.Out21Real(Out21Real), 
		.Out21Imag(Out21Imag), 
		.Out22Real(Out22Real), 
		.Out22Imag(Out22Imag), 
		.Out23Real(Out23Real), 
		.Out23Imag(Out23Imag), 
		.Out24Real(Out24Real), 
		.Out24Imag(Out24Imag), 
		.Out31Real(Out31Real), 
		.Out31Imag(Out31Imag), 
		.Out32Real(Out32Real), 
		.Out32Imag(Out32Imag), 
		.Out33Real(Out33Real), 
		.Out33Imag(Out33Imag), 
		.Out34Real(Out34Real), 
		.Out34Imag(Out34Imag), 
		.Out41Real(Out41Real), 
		.Out41Imag(Out41Imag), 
		.Out42Real(Out42Real), 
		.Out42Imag(Out42Imag), 
		.Out43Real(Out43Real), 
		.Out43Imag(Out43Imag), 
		.Out44Real(Out44Real), 
		.Out44Imag(Out44Imag), 
		.Listo(Listo), 
		.Error(Error)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		Enable = 1;
		MasterReset = 1;
		Start = 0;
		A11InReal = 1;
		A11InImag = 1;
		A12InReal = 1;
		A12InImag = 1;
		A13InReal = 1;
		A13InImag = 1;
		A14InReal = 1;
		A14InImag = 1;
		B11InReal = 1;
		B11InImag = 1;
		B21InReal = 1;
		B21InImag = 1;
		B31InReal = 1;
		B31InImag = 1;
		B41InReal = 1;
		B41InImag = 1;
		A21InReal = 1;
		A21InImag = 1;
		A22InReal = 1;
		A22InImag = 1;
		A23InReal = 1;
		A23InImag = 1;
		A24InReal = 1;
		A24InImag = 1;
		B12InReal = 1;
		B12InImag = 1;
		B22InReal = 1;
		B22InImag = 1;
		B32InReal = 1;
		B32InImag = 1;
		B42InReal = 1;
		B42InImag = 1;
		A31InReal = 1;
		A31InImag = 1;
		A32InReal = 1;
		A32InImag = 1;
		A33InReal = 1;
		A33InImag = 1;
		A34InReal = 1;
		A34InImag = 1;
		B13InReal = 1;
		B13InImag = 1;
		B23InReal = 1;
		B23InImag = 1;
		B33InReal = 1;
		B33InImag = 1;
		B43InReal = 1;
		B43InImag = 1;
		A41InReal = 1;
		A41InImag = 1;
		A42InReal = 1;
		A42InImag = 1;
		A43InReal = 1;
		A43InImag = 1;
		A44InReal = 1;
		A44InImag = 1;
		B14InReal = 1;
		B14InImag = 1;
		B24InReal = 1;
		B24InImag = 1;
		B34InReal = 1;
		B34InImag = 1;
		B44InReal = 1;
		B44InImag = 1;
	
		#100 MasterReset = 0;
		#100 Start = 1;
		#40 Start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	initial forever #10 CLK = ~CLK;
      
endmodule

