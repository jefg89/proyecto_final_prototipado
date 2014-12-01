`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:23:59 11/30/2014 
// Design Name: 
// Module Name:    EscrituraRegistroToMemoria 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:  Este modulo Si en la dirección de listo escribe un 1 en decimal,
// significa que el dato ya esta listo, Ahora si en la dirección del error se escribe un 1,
// significa que si hubo un overflow en algún punto durante el proceso.
//////////////////////////////////////////////////////////////////////////////////
module EscrituraRegistroToMemoria #(parameter Width = 24)
(Read,InError,Address,ListoIn,InDato,OutDato);
	 
	input Read,InError,ListoIn;
   input [8:0] Address; 
	input signed [Width-1:0] InDato;
	output reg signed [Width-1:0] OutDato;

	always @*begin // Se escribe el dato en memoria
		if(Read) begin
			if(Address==9'h000 && ListoIn==1'b1) begin  // Dirección de Indicador Dato Listo
				OutDato <= 1;
			end else if(Address==9'h001 ) begin  // Dirección del Dato Listo
				OutDato <= InDato;
			end else if(Address==9'h004 && InError==1'b1) begin   // Dato Indicandor de error
			   OutDato <= 1;
			end else begin
				OutDato <= 0;
			end
		end
		else begin
			OutDato <= 0;
		end
	end
endmodule
