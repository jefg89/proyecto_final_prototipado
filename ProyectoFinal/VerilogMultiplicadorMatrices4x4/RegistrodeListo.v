`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:28:16 10/30/2014 
// Design Name: 
// Module Name:    RegistrodeListo 
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
module RegistrodeListo (CLK,ResetMaster,Write,Address,EnableListo,Out);
	 
	 input CLK,ResetMaster,Write,EnableListo;
	 output reg Out = 0;
	 input [8:0] Address;
	 
	 always @(posedge CLK) begin
		if(Address==9'h184) begin
			if ((ResetMaster & Write)) begin
				Out <= 1'b0;
			end
		end 
		else if (EnableListo) begin
			Out <= 1'b1;
		end

	 end

endmodule
