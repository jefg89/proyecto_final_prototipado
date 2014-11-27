`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:04:22 10/30/2014 
// Design Name: 
// Module Name:    FSMMatrices 
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
module FSMMatrices(CLK,MasterReset,Start,Enable,InError,ListoIn,SELMUXColumna,SELMUXFila,ResetIn,EnableIn,
ResetOutRegisters,EnableRegisterOut11,EnableRegisterOut12,EnableRegisterOut13,EnableRegisterOut14,
EnableRegisterOut21,EnableRegisterOut22,EnableRegisterOut23,EnableRegisterOut24,
EnableRegisterOut31,EnableRegisterOut32,EnableRegisterOut33,EnableRegisterOut34,
EnableRegisterOut41,EnableRegisterOut42,EnableRegisterOut43,EnableRegisterOut44, Listo,StartCalculo, EnableCalculo,ResetCalculo
    );

	 input CLK,MasterReset,Start,Enable,InError,ListoIn;
	 output reg ResetIn=0,EnableIn=0, ResetOutRegisters=0, Listo=0,StartCalculo=0, EnableCalculo=0,ResetCalculo=0;
	 
	 output EnableRegisterOut11,EnableRegisterOut12,EnableRegisterOut13,EnableRegisterOut14,
EnableRegisterOut21,EnableRegisterOut22,EnableRegisterOut23,EnableRegisterOut24,
EnableRegisterOut31,EnableRegisterOut32,EnableRegisterOut33,EnableRegisterOut34,
EnableRegisterOut41,EnableRegisterOut42,EnableRegisterOut43,EnableRegisterOut44;
	 
	 output [1:0] SELMUXColumna,SELMUXFila;
	 
	 
	 reg[3:0] State = 0;
	 reg [3:0] NextState = 0;
	 
	 reg [1:0] ContadorFila=0,ContadorColumna=0;
	 reg resetContadoresFilaColumna=0;
	 
	 
	 parameter STATERESET=4'd0, STATEStart=4'd1, S2=4'd2, S3=4'd3, S4=4'd4, S5=4'd5, S6=4'd6, S7=4'd7,
	 S8=4'd8, S9=4'd9, S10=4'd10, ManejoError=4'd11;
	 
	 // Registro de estado *********************************************************
	 always @(posedge CLK) 
		begin
			if(MasterReset) begin	
				State <= STATERESET;
			end else if (Enable) begin		
				State<=NextState;
			end
		end 
		
	
	
	// L�gica combinacional de estado siguiente ************************************
	always @*
		begin
			case(State)
				STATERESET: begin  //***********ESTADO DE RESET DEL SISTEMA
					if (MasterReset) NextState <= STATERESET;
					else NextState <= STATEStart;
				end
				STATEStart: begin  // Estado de espera un start
					if (Start) NextState <= S2;
					else NextState <= STATEStart;  
				end
				S2: begin   // Estado de Habilita Enable de Entrada del Sistema
					NextState <= S3;
				end   
				S3: begin   // Fila1MatrizA * Columna1MatrizB, Da un start     
					NextState <= S4;
				end
				S4: begin   // Fila1MatrizA * Columna1MatrizB, EsperaListo             
					if (ListoIn) NextState <= S5;
					else if(InError)NextState <= ManejoError;  
					else NextState <= S4;
				end
				S5: begin  // Habilita Enable Fila 1 Columna 1
					NextState <= S6;
				end
				S6: begin  // Da un reset al sistema 
					NextState <= S7;
				end
				S7: begin  // Actualiza Contador Fila Quita el reset
					NextState <= S8;
				end
				S8: begin  // Actualiza Contador Columna
					NextState <= S9;
				end
				S9: begin  // Revisa si hay fin
					if ((ContadorFila==2'd0) & (ContadorColumna==2'd0)) NextState <= S10;
					else NextState <= S3; 
				end
				S10: begin  // Levanta la bandera de Fin
					NextState <= STATEStart; 
				end
				ManejoError: begin  // Se resetea el sistema xq hay overflow o underflow
					NextState <= STATERESET; 
				end
				default: begin  
					NextState <= STATERESET;
				end
			endcase		
		end
		
		// 	InicioReductor <= 1'b0;  
		
	// ******************************+++ LOGICA DE SALIDA**********************************++++
	always @*
		begin
			case(State)
				STATERESET: begin  //***********ESTADO DE RESET DEL SISTEMA
					ResetIn <= 1;
					EnableIn <= 0;
					ResetCalculo <= 1;
					resetContadoresFilaColumna <= 1;
					ResetOutRegisters <= 0; ////////////
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 0;
				end
				STATEStart: begin  // Estado de espera un start
					ResetIn <= 0;
					ResetCalculo <= 1;
					EnableIn <= 0;
					resetContadoresFilaColumna <= 1;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S2: begin   // Estado de Habilita Enable de Entrada del Sistema
					ResetIn <= 0;
					EnableIn <= 1;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0; 
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end   
				S3: begin   // Fila1MatrizA * Columna1MatrizB, Da un start     
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 1; 
					EnableCalculo <= 1;
				end
				S4: begin   // Fila1MatrizA * Columna1MatrizB, EsperaListo             
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0; 
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S5: begin  // Habilita Enable Fila 1 Columna 1
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S6: begin  // Da un reset al sistema 
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 1;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0; 
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S7: begin  // Actualiza Contador Fila Quita el reset
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S8: begin  // Actualiza Contador Columna
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S9: begin  // Revisa si hay fin
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				S10: begin  // Levanta la bandera de Fin
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0; 
					Listo <= 1;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				ManejoError: begin  // Se resetea el sistema xq hay overflow o underflow
					ResetIn <= 0;
					EnableIn <= 0;
					ResetCalculo <= 0;
					resetContadoresFilaColumna <= 0;
					ResetOutRegisters <= 0;
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 1;
				end
				default: begin  
					ResetIn <= 1;
					EnableIn <= 0;
					ResetCalculo <= 1;
					resetContadoresFilaColumna <= 1;
					ResetOutRegisters <= 1; 
					Listo <= 0;
					StartCalculo <= 0; 
					EnableCalculo <= 0;
				end
			endcase
		end
		
		
		// (State == 4'd8)  & (ContadorColumna == 2'd3)
   
		always @(posedge CLK)
			if (resetContadoresFilaColumna)
				ContadorFila <= 0;
			else if ((State == 4'd7)  & (ContadorColumna == 2'd3))
				ContadorFila <= ContadorFila + 1'b1;
				
		 always @(posedge CLK)
				if (resetContadoresFilaColumna)
					ContadorColumna <= 0;
				else if (State == 4'd8)
					ContadorColumna <= ContadorColumna + 1'b1;
		
		
		assign SELMUXColumna = ContadorColumna;
		assign SELMUXFila = ContadorFila;
		
		
	assign EnableRegisterOut11 = (State == 4'd5)& (ContadorFila == 4'd0)&(ContadorColumna == 2'd0)? 1'b1: 1'b0;
	assign EnableRegisterOut12 = (State == 4'd5)& (ContadorFila == 4'd0)&(ContadorColumna == 2'd1)? 1'b1: 1'b0;
	assign EnableRegisterOut13 = (State == 4'd5)& (ContadorFila == 4'd0)&(ContadorColumna == 2'd2)? 1'b1: 1'b0;
	assign EnableRegisterOut14 = (State == 4'd5)& (ContadorFila == 4'd0)&(ContadorColumna == 2'd3)? 1'b1: 1'b0;
	assign EnableRegisterOut21 = (State == 4'd5)& (ContadorFila == 4'd1)&(ContadorColumna == 2'd0)? 1'b1: 1'b0;
	assign EnableRegisterOut22 = (State == 4'd5)& (ContadorFila == 4'd1)&(ContadorColumna == 2'd1)? 1'b1: 1'b0;
	assign EnableRegisterOut23 = (State == 4'd5)& (ContadorFila == 4'd1)&(ContadorColumna == 2'd2)? 1'b1: 1'b0;
	assign EnableRegisterOut24 = (State == 4'd5)& (ContadorFila == 4'd1)&(ContadorColumna == 2'd3)? 1'b1: 1'b0;
	assign EnableRegisterOut31 = (State == 4'd5)& (ContadorFila == 4'd2)&(ContadorColumna == 2'd0)? 1'b1: 1'b0;
	assign EnableRegisterOut32 = (State == 4'd5)& (ContadorFila == 4'd2)&(ContadorColumna == 2'd1)? 1'b1: 1'b0;
	assign EnableRegisterOut33 = (State == 4'd5)& (ContadorFila == 4'd2)&(ContadorColumna == 2'd2)? 1'b1: 1'b0;
	assign EnableRegisterOut34 = (State == 4'd5)& (ContadorFila == 4'd2)&(ContadorColumna == 2'd3)? 1'b1: 1'b0;
	assign EnableRegisterOut41 = (State == 4'd5)& (ContadorFila == 4'd3)&(ContadorColumna == 2'd0)? 1'b1: 1'b0;
	assign EnableRegisterOut42 = (State == 4'd5)& (ContadorFila == 4'd3)&(ContadorColumna == 2'd1)? 1'b1: 1'b0;
	assign EnableRegisterOut43 = (State == 4'd5)& (ContadorFila == 4'd3)&(ContadorColumna == 2'd2)? 1'b1: 1'b0;
	assign EnableRegisterOut44 = (State == 4'd5)& (ContadorFila == 4'd3)&(ContadorColumna == 2'd3)? 1'b1: 1'b0;
	
		
		
		
			
endmodule

