`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:09 10/29/2014 
// Design Name: 
// Module Name:    MuXFilasMAtrizA 
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
module MuXFilasMAtrizA#(parameter Width = 8)(
SEL,In11Real,In11Imag,In12Real,In12Imag,In13Real,In13Imag,In14Real,In14Imag,
In21Real,In21Imag,In22Real,In22Imag,In23Real,In23Imag,In24Real,In24Imag,
In31Real,In31Imag,In32Real,In32Imag,In33Real,In33Imag,In34Real,In34Imag,
In41Real,In41Imag,In42Real,In42Imag,In43Real,In43Imag,In44Real,In44Imag,
OutX1Real,OutX1Imag,OutX2Real,OutX2Imag,OutX3Real,OutX3Imag,OutX4Real,OutX4Imag
    );
	 
	input [1:0] SEL;
	input signed  [Width-1:0] In11Real,In11Imag,In12Real,In12Imag,In13Real,In13Imag,In14Real,In14Imag,
	In21Real,In21Imag,In22Real,In22Imag,In23Real,In23Imag,In24Real,In24Imag,
	In31Real,In31Imag,In32Real,In32Imag,In33Real,In33Imag,In34Real,In34Imag,
	In41Real,In41Imag,In42Real,In42Imag,In43Real,In43Imag,In44Real,In44Imag;
	
	output reg signed [Width-1:0] OutX1Real =0,OutX1Imag =0,OutX2Real =0,OutX2Imag =0,OutX3Real =0,
	OutX3Imag =0,OutX4Real =0,OutX4Imag =0;

	 
	 always @*
		begin
			case(SEL)
				2'd0: begin  
					OutX1Real <= In11Real;
					OutX1Imag <= In11Imag;
					OutX2Real <= In12Real;
					OutX2Imag <= In12Imag;
					OutX3Real <= In13Real;
					OutX3Imag <= In13Imag;
					OutX4Real <= In14Real;
					OutX4Imag <= In14Imag;
				end
				2'd1: begin  
					OutX1Real <= In21Real;
					OutX1Imag <= In21Imag;
					OutX2Real <= In22Real;
					OutX2Imag <= In22Imag;
					OutX3Real <= In23Real;
					OutX3Imag <= In23Imag;
					OutX4Real <= In24Real;
					OutX4Imag <= In24Imag;
				end
				2'd2: begin   
					OutX1Real <= In31Real;
					OutX1Imag <= In31Imag;
					OutX2Real <= In32Real;
					OutX2Imag <= In32Imag;
					OutX3Real <= In33Real;
					OutX3Imag <= In33Imag;
					OutX4Real <= In34Real;
					OutX4Imag <= In34Imag;
				end   
				2'd3: begin      
					OutX1Real <= In41Real;
					OutX1Imag <= In41Imag;
					OutX2Real <= In42Real;
					OutX2Imag <= In42Imag;
					OutX3Real <= In43Real;
					OutX3Imag <= In43Imag;
					OutX4Real <= In44Real;
					OutX4Imag <= In44Imag;
				end
			endcase
		end


endmodule
