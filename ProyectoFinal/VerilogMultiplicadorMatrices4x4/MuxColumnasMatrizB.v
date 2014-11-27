`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:57 10/29/2014 
// Design Name: 
// Module Name:    MuxColumnasMatrizB 
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
module MuxColumnasMatrizB #(parameter Width = 8)(
SEL,In11Real,In11Imag,In12Real,In12Imag,In13Real,In13Imag,In14Real,In14Imag,
In21Real,In21Imag,In22Real,In22Imag,In23Real,In23Imag,In24Real,In24Imag,
In31Real,In31Imag,In32Real,In32Imag,In33Real,In33Imag,In34Real,In34Imag,
In41Real,In41Imag,In42Real,In42Imag,In43Real,In43Imag,In44Real,In44Imag,
Out1XReal,Out1XImag,Out2XReal,Out2XImag,Out3XReal,Out3XImag,Out4XReal,Out4XImag
    );
	 
	input [1:0] SEL;
	input signed  [Width-1:0] In11Real,In11Imag,In12Real,In12Imag,In13Real,In13Imag,In14Real,In14Imag,
	In21Real,In21Imag,In22Real,In22Imag,In23Real,In23Imag,In24Real,In24Imag,
	In31Real,In31Imag,In32Real,In32Imag,In33Real,In33Imag,In34Real,In34Imag,
	In41Real,In41Imag,In42Real,In42Imag,In43Real,In43Imag,In44Real,In44Imag;
	
	output reg signed [Width-1:0] Out1XReal =0,Out1XImag =0,Out2XReal =0,Out2XImag =0,Out3XReal =0,
	Out3XImag =0,Out4XReal =0,Out4XImag =0;
	
	always @*
		begin
			case(SEL)
				2'd0: begin  
					Out1XReal <= In11Real;
					Out1XImag <= In11Imag;
					Out2XReal <= In21Real;
					Out2XImag <= In21Imag;
					Out3XReal <= In31Real;
					Out3XImag <= In31Imag;
					Out4XReal <= In41Real;
					Out4XImag <= In41Imag;
				end
				2'd1: begin  
					Out1XReal <= In12Real;
					Out1XImag <= In12Imag;
					Out2XReal <= In22Real;
					Out2XImag <= In22Imag;
					Out3XReal <= In32Real;
					Out3XImag <= In32Imag;
					Out4XReal <= In42Real;
					Out4XImag <= In42Imag;
				end
				2'd2: begin   
					Out1XReal <= In13Real;
					Out1XImag <= In13Imag;
					Out2XReal <= In23Real;
					Out2XImag <= In23Imag;
					Out3XReal <= In33Real;
					Out3XImag <= In33Imag;
					Out4XReal <= In43Real;
					Out4XImag <= In43Imag;
				end   
				2'd3: begin      
					Out1XReal <= In14Real;
					Out1XImag <= In14Imag;
					Out2XReal <= In24Real;
					Out2XImag <= In24Imag;
					Out3XReal <= In34Real;
					Out3XImag <= In34Imag;
					Out4XReal <= In44Real;
					Out4XImag <= In44Imag;
				end
			endcase
		end


endmodule
