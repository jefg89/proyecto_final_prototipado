`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:03 12/03/2014 
// Design Name: 
// Module Name:    LimitadorSalidaFuctActivacion 
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
module LimitadorSalidaFuctActivacion #(parameter Width = 32)
(inData,OutData);

	 input signed [Width-1:0] inData;
	 output reg signed [Width-1:0] OutData;
	 
	 always@* begin
		if (32'b00000000000000000000000000000000 < inData)
         OutData<= 32'sb00000000000000000000000000000000;
      else if (inData > 32'sb00000001000000000000000000000000)
         OutData <= 32'sb00000001000000000000000000000000;
		else 
			OutData <= inData;
	 end
endmodule
