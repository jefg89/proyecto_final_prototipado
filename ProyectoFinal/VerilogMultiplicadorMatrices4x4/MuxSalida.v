`timescale 1ns / 1ps

module MuxSalida #(parameter Width = 8)
(Read,Address,
A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,
A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,
A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,
A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag,
Start,
Out11Real,Out11Imag,Out12Real,Out12Imag,Out13Real,Out13Imag,Out14Real,Out14Imag,
Out21Real,Out21Imag,Out22Real,Out22Imag,Out23Real,Out23Imag,Out24Real,Out24Imag,
Out31Real,Out31Imag,Out32Real,Out32Imag,Out33Real,Out33Imag,Out34Real,Out34Imag,
Out41Real,Out41Imag,Out42Real,Out42Imag,Out43Real,Out43Imag,Out44Real,Out44Imag,OutMux);
	
	input Read;
   input [8:0] Address; 
	output reg signed [Width-1:0] OutMux;
	
	input signed [Width-1:0] Out11Real,Out11Imag,Out12Real,Out12Imag,Out13Real,Out13Imag,Out14Real,Out14Imag,
Out21Real,Out21Imag,Out22Real,Out22Imag,Out23Real,Out23Imag,Out24Real,Out24Imag,
Out31Real,Out31Imag,Out32Real,Out32Imag,Out33Real,Out33Imag,Out34Real,Out34Imag,
Out41Real,Out41Imag,Out42Real,Out42Imag,Out43Real,Out43Imag,Out44Real,Out44Imag;

	input signed [Width-1:0] A11InReal,A11InImag,A12InReal,A12InImag,A13InReal,A13InImag,A14InReal,A14InImag,
		B11InReal,B11InImag,B21InReal,B21InImag,B31InReal,B31InImag,B41InReal,B41InImag,
		A21InReal,A21InImag,A22InReal,A22InImag,A23InReal,A23InImag,A24InReal,A24InImag,
		B12InReal,B12InImag,B22InReal,B22InImag,B32InReal,B32InImag,B42InReal,B42InImag,
		A31InReal,A31InImag,A32InReal,A32InImag,A33InReal,A33InImag,A34InReal,A34InImag,
		B13InReal,B13InImag,B23InReal,B23InImag,B33InReal,B33InImag,B43InReal,B43InImag,
		A41InReal,A41InImag,A42InReal,A42InImag,A43InReal,A43InImag,A44InReal,A44InImag,
		B14InReal,B14InImag,B24InReal,B24InImag,B34InReal,B34InImag,B44InReal,B44InImag;
		
	input signed [Width-1:0] Start;
	
	always @(Address, A11InReal , Out11Real,Out11Imag,Out12Real,Out12Imag,Out13Real,Out13Imag,Out14Real,Out14Imag,
Out21Real,Out21Imag,Out22Real,Out22Imag,Out23Real,Out23Imag,Out24Real,Out24Imag,
Out31Real,Out31Imag,Out32Real,Out32Imag,Out33Real,Out33Imag,Out34Real,Out34Imag,
Out41Real,Out41Imag,Out42Real,Out42Imag,Out43Real,Out43Imag,Out44Real,Out44Imag,Read)
      if (Read) begin
		case (Address)
			9'h000: OutMux <= A11InReal;
			9'h004: OutMux <= A11InImag;
			9'h008: OutMux <= A12InReal;
			9'h00C: OutMux <= A12InImag;
			9'h010: OutMux <= A13InReal;
			9'h014: OutMux <= A13InImag;
			9'h018: OutMux <= A14InReal;
			9'h01C: OutMux <= A14InImag;
			9'h020: OutMux <= A21InReal;
			9'h024: OutMux <= A21InImag;
			9'h028: OutMux <= A22InReal;
			9'h02C: OutMux <= A22InImag;
			9'h030: OutMux <= A23InReal;
			9'h034: OutMux <= A23InImag;
			9'h038: OutMux <= A24InReal;
			9'h03C: OutMux <= A24InImag;
			9'h040: OutMux <= A31InReal;
			9'h044: OutMux <= A31InImag;
			9'h048: OutMux <= A32InReal;
			9'h04C: OutMux <= A32InImag;
			9'h050: OutMux <= A33InReal;
			9'h054: OutMux <= A33InImag;
			9'h058: OutMux <= A34InReal;
			9'h05C: OutMux <= A34InImag;
			9'h060: OutMux <= A41InReal;
			9'h064: OutMux <= A41InImag;
			9'h068: OutMux <= A42InReal;
			9'h06C: OutMux <= A42InImag;
			9'h070: OutMux <= A43InReal;
			9'h074: OutMux <= A43InImag;
			9'h078: OutMux <= A44InReal;
			9'h07C: OutMux <= A44InImag;
			
			9'h080: OutMux <= B11InReal;
			9'h084: OutMux <= B11InImag;
			9'h088: OutMux <= B12InReal;
			9'h08C: OutMux <= B12InImag;
			9'h090: OutMux <= B13InReal;
			9'h094: OutMux <= B13InImag;
			9'h098: OutMux <= B14InReal;
			9'h09C: OutMux <= B14InImag;
			9'h0A0: OutMux <= B21InReal;
			9'h0A4: OutMux <= B21InImag;
			9'h0A8: OutMux <= B22InReal;
			9'h0AC: OutMux <= B22InImag;
			9'h0B0: OutMux <= B23InReal;
			9'h0B4: OutMux <= B23InImag;
			9'h0B8: OutMux <= B24InReal;
			9'h0BC: OutMux <= B24InImag;
			9'h0C0: OutMux <= B31InReal;
			9'h0C4: OutMux <= B31InImag;
			9'h0C8: OutMux <= B32InReal;
			9'h0CC: OutMux <= B32InImag;
			9'h0D0: OutMux <= B33InReal;
			9'h0D4: OutMux <= B33InImag;
			9'h0D8: OutMux <= B34InReal;
			9'h0DC: OutMux <= B34InImag;
			9'h0E0: OutMux <= B41InReal;
			9'h0E4: OutMux <= B41InImag;
			9'h0E8: OutMux <= B42InReal;
			9'h0EC: OutMux <= B42InImag;
			9'h0F0: OutMux <= B43InReal;
			9'h0F4: OutMux <= B43InImag;
			9'h0F8: OutMux <= B44InReal;
			9'h0FC: OutMux <= B44InImag;
			
         9'h100: OutMux <= Out11Real;
         9'h104: OutMux <= Out11Imag;
         9'h108: OutMux <= Out12Real;
         9'h10C: OutMux <= Out12Imag;
         9'h110: OutMux <= Out13Real;
         9'h114: OutMux <= Out13Imag;
         9'h118: OutMux <= Out14Real;
         9'h11C: OutMux <= Out14Imag;
			9'h120: OutMux <= Out21Real;
         9'h124: OutMux <= Out21Imag;
         9'h128: OutMux <= Out22Real;
         9'h12C: OutMux <= Out22Imag;
         9'h130: OutMux <= Out23Real;
         9'h134: OutMux <= Out23Imag;
         9'h138: OutMux <= Out24Real;
         9'h13C: OutMux <= Out24Imag;
			9'h140: OutMux <= Out31Real;
         9'h144: OutMux <= Out31Imag;
         9'h148: OutMux <= Out32Real;
         9'h14C: OutMux <= Out32Imag;
         9'h150: OutMux <= Out33Real;
         9'h154: OutMux <= Out33Imag;
         9'h158: OutMux <= Out34Real;
         9'h15C: OutMux <= Out34Imag;
			9'h160: OutMux <= Out41Real;
         9'h164: OutMux <= Out41Imag;
         9'h168: OutMux <= Out42Real;
         9'h16C: OutMux <= Out42Imag;
         9'h170: OutMux <= Out43Real;
         9'h174: OutMux <= Out43Imag;
         9'h178: OutMux <= Out44Real;
         9'h17C: OutMux <= Out44Imag;
			9'h180: OutMux <= {31'h0,Start};
			default: OutMux <= {23'h0,Address};
      endcase
	end
	else begin
		OutMux <= 0;
	end
	 
	

endmodule
