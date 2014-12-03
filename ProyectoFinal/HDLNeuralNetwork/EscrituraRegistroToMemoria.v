`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:02 12/01/2014 
// Design Name: 
// Module Name:    EscrituraRegistroToMemoriaPrueba 
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
module EscrituraRegistroToMemoria#(parameter Width = 4)
(Read,InError,Address,ListoIn,InDato,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,Coeff17,Coeff18,
Coeff19,Offset,DatoEntradaSistema,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,OutDato);
	 
	// InDato es la salida de la red Neuronal
	// DatoEntradaSistema es el dato con el que se obtuvo una salida igual a InDato  =>  InDato = f(DatoEntradaSistema)
	input Read,InError,ListoIn;
   input [8:0] Address; 
	input signed [Width-1:0] InDato,Coeff00,Coeff01,Coeff02,Coeff03,Coeff04,Coeff05,
   Coeff06,Coeff07,Coeff08,Coeff09,Coeff10,Coeff11,Coeff12,Coeff13,Coeff14,Coeff15,Coeff16,
	Coeff17,Coeff18,Coeff19,Offset,DatoEntradaSistema,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9;
	
	output reg signed [Width-1:0] OutDato;

	always @*begin // Se escribe el dato en memoria
		if(Read) begin
			if(Address==9'h000 && ListoIn==1'b1) begin  // Dirección de Indicador Dato Listo
				OutDato <= 1;
			end else if(Address==9'h004 ) begin  // Dirección del Dato Listo
				OutDato <= InDato;
			end else if(Address==9'h008 && InError==1'b1) begin   // Dato Indicandor de error
			   OutDato <= 1;
			end else if(Address==9'h00C ) begin   // CoeffEntrenamiento0
				OutDato <= Coeff00;
			end else if(Address==9'h010 ) begin   // CoeffEntrenamiento1
				OutDato <= Coeff01;
			end else if(Address==9'h014 ) begin   // CoeffEntrenamiento2
				OutDato <= Coeff02;
			end else if(Address==9'h018 ) begin   // CoeffEntrenamiento3
				OutDato <= Coeff03;
			end else if(Address==9'h01C ) begin   // CoeffEntrenamiento4
				OutDato <= Coeff04;
			end else if(Address==9'h020 ) begin   // CoeffEntrenamiento5
				OutDato <= Coeff05;
			end else if(Address==9'h024 ) begin   // CoeffEntrenamiento6
				OutDato <= Coeff06;
			end else if(Address==9'h028 ) begin   // CoeffEntrenamiento7
				OutDato <= Coeff07;
			end else if(Address==9'h02C ) begin   // CoeffEntrenamiento8
				OutDato <= Coeff08;
			end else if(Address==9'h030 ) begin   // CoeffEntrenamiento9
				OutDato <= Coeff09;
			end else if(Address==9'h034 ) begin   // CoeffEntrenamiento10
				OutDato <= Coeff10;
			end else if(Address==9'h038 ) begin   // CoeffEntrenamient11
				OutDato <= Coeff11;
			end else if(Address==9'h03C ) begin   // CoeffEntrenamiento12
				OutDato <= Coeff12;
			end else if(Address==9'h040 ) begin   // CoeffEntrenamiento13
				OutDato <= Coeff13;
			end else if(Address==9'h044 ) begin   // CoeffEntrenamiento14
				OutDato <= Coeff14;
			end else if(Address==9'h048 ) begin   // CoeffEntrenamiento15
				OutDato <= Coeff15;
			end else if(Address==9'h04C ) begin   // CoeffEntrenamiento16
				OutDato <= Coeff16;
			end else if(Address==9'h050 ) begin   // CoeffEntrenamiento17
				OutDato <= Coeff17;
			end else if(Address==9'h054 ) begin   // CoeffEntrenamiento18
				OutDato <= Coeff18;
			end else if(Address==9'h058 ) begin   // CoeffEntrenamiento19
				OutDato <= Coeff19;
			end else if(Address==9'h05C ) begin   // Offset
				OutDato <= Offset;
			end else if(Address==9'h060 ) begin   // EntradadelSistema
				OutDato <= DatoEntradaSistema;
			end else if(Address==9'h064 ) begin   // EntradadelSistema
				OutDato <= Y0;
			end else if(Address==9'h068 ) begin   // EntradadelSistema
				OutDato <= Y1;
			end else if(Address==9'h06C ) begin   // EntradadelSistema
				OutDato <= Y2;
			end else if(Address==9'h070 ) begin   // EntradadelSistema
				OutDato <= Y3;
			end else if(Address==9'h074 ) begin   // EntradadelSistema
				OutDato <= Y4;
			end else if(Address==9'h078 ) begin   // EntradadelSistema
				OutDato <= Y5;
			end else if(Address==9'h07C ) begin   // EntradadelSistema
				OutDato <= Y6;
			end else if(Address==9'h080 ) begin   // EntradadelSistema
				OutDato <= Y7;
			end else if(Address==9'h084 ) begin   // EntradadelSistema
				OutDato <= Y8;
			end else if(Address==9'h088 ) begin   // EntradadelSistema
				OutDato <= Y9;	
			end else begin
				OutDato <= 0;
			end
		end
		else begin
			OutDato <= 0;
		end
	end
endmodule

