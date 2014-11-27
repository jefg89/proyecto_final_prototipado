`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:13 10/29/2014 
// Design Name: 
// Module Name:    FSMControlMultFilColum 
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
module FSMControlMultFilColum
(CLK,ErrorIn,MasterReset,Enable, Start,Op,SELMUXFila,SELMUXColum,ResetAcum,EnableAcum,EnableRegisterOutParteReal,
EnableRegisterOutParteImag,EnableRegisterIn,Listo,ResetRegisterOutParteImag,ResetRegisterOutParteReal,
ResetRegisterIn,ResetError);
	 
	 
	 input ErrorIn,CLK,MasterReset,Enable,Start;
	 output reg Op=0,ResetAcum=0,EnableAcum=0,EnableRegisterOutParteReal=0,
    EnableRegisterOutParteImag=0,EnableRegisterIn=0,Listo=0,ResetRegisterOutParteImag=0,
	 ResetRegisterOutParteReal=0,ResetRegisterIn=0,ResetError=0;
	 
	 output reg [2:0] SELMUXFila =0,SELMUXColum=0;
	 
	 reg[4:0] State = 0;
	 reg [4:0] NextState = 0;
	 parameter STATERESET=5'd0, STATEStart=5'd1, S2=5'd2, S3=5'd3, S4=5'd4, S5=5'd5, S6=5'd6, S7=5'd7,
	 S8=5'd8, S9=5'd9, S10=5'd10, S11=5'd11,S12=5'd12, S13=5'd13, S14=5'd14, S15=5'd15, S16=5'd16, 
	 S17=5'd17, S18=5'd18,S19=5'd19, S20=5'd20, S21=5'd21, S22=5'd22, S23=5'd23,S24=5'd24;
	 
	 // Registro de estado *********************************************************
	 always @(posedge CLK) 
		begin
			if(MasterReset) begin	
				State <= STATERESET;
			end else if (Enable) begin		
				State<=NextState;
			end
		end 
		
	
	
	// Lógica combinacional de estado siguiente ************************************
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
				S3: begin   // Estado de Multiplica A11Real*B11Real y suma 0      
					NextState <= S4;
				end
				S4: begin   // Estado de   Acumulado - A11Imag*B11Imag             
					NextState <= S5;
				end
				S5: begin  // Estado de  Acumulado + A12Real*B21Real 
					NextState <= S6;
				end
				S6: begin  // Estado de multiplica  Acumulado - A12Imag*B21Imag 
					NextState <= S7;
				end
				S7: begin  // Estado de multiplica  Acumulado + A13Real*B31Real 
					NextState <= S8;
				end
				S8: begin   // Estado de multiplica  Acumulado - A13Imag*B31Imag
					NextState <= S9;
				end
				S9: begin  // Estado de multiplica  Acumulado + A14Real*B41Real 
					NextState <= S10;
				end
				S10: begin // Estado de multiplica  Acumulado - A14Imag*B41Imag
					NextState <= S11;
				end
				S11: begin // Estado de Habilita Enable de registro de salida Parte Real
					NextState <= S12;
				end
				S12: begin // Estado de resetea acumulador
					NextState <= S13;
				end
				S13: begin // Estado de Multiplica A11Real*B11Imag  y suma 0
					NextState <= S14;
				end
				S14: begin // Estado de multiplica  Acumulado + A11Imag* B11Real
					NextState <= S15;
				end
				S15: begin // Estado de multiplica  Acumulado + A12Real*B21Imag
					NextState <= S16;
				end
				S16: begin // Estado de multiplica  Acumulado + A12Imag* B21Real
					NextState <= S17;
				end
				S17: begin // Estado de multiplica  Acumulado + A13Real*B31Imag 
					NextState <= S18;
				end
				S18: begin // Estado de multiplica  Acumulado +A13Imag* B31Real
					NextState <= S19;
				end
				S19: begin // Estado de multiplica  Acumulado +A14Real*B41Imag 
					NextState <= S20;
				end
				S20: begin // Estado de multiplica  Acumulado +A14Imag* B41Real 
					NextState <= S21;
				end
				S21: begin // Habilita enable del registro parte imaginaria 
					NextState <= S22; 
				end
				S22: begin // Reset del registro acumulador y registro de entrada 
					if (ErrorIn) NextState <= STATERESET;
					else NextState <= S23; 
				end
				S23: begin // Levanta la bandera de listo 
					NextState <= S24;
				end
				S24: begin // Levanta la bandera de listo
					NextState <= STATERESET;
				end
				default: begin  
					NextState <= STATERESET;
				end
			endcase		
		end
		
		// 	InicioReductor <= 1'b0;  
		
	// ******************************+++ LOGICA DE ESTADO SIGUIENTE**********************************++++
	always @*
		begin
			case(State)
				STATERESET: begin  //***********ESTADO DE RESET DEL SISTEMA
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b1; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b1; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b1; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0; 
					ResetError <= 1'b1;
				end
				STATEStart: begin  // Estado de espera un start
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b1; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b1; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b1; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0; 
					ResetError <= 1'b1;
				end
				S2: begin   // Estado de Habilita Enable de Entrada del Sistema
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b1;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b1;
				end   
				S3: begin   // Estado de Multiplica A11Real*B11Real y suma 0      
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S4: begin   // Estado de   Acumulado - A11Imag*B11Imag  
					SELMUXFila<= 3'd1; 
					SELMUXColum<= 3'd1;
					Op <= 1'b1; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S5: begin  // Estado de  Acumulado + A12Real*B21Real 
					SELMUXFila<= 3'd2; 
					SELMUXColum<= 3'd2;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;	
					ResetError <= 1'b0;
				end
				S6: begin  // Estado de multiplica  Acumulado - A12Imag*B21Imag 
					SELMUXFila<= 3'd3; 
					SELMUXColum<= 3'd3;
					Op <= 1'b1; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;	
					ResetError <= 1'b0;
				end
				S7: begin  // Estado de multiplica  Acumulado + A13Real*B31Real 
					SELMUXFila<= 3'd4; 
					SELMUXColum<= 3'd4;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S8: begin   // Estado de multiplica  Acumulado - A13Imag*B31Imag
					SELMUXFila<= 3'd5; 
					SELMUXColum<= 3'd5;
					Op <= 1'b1; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S9: begin  // Estado de multiplica  Acumulado + A14Real*B41Real 
					SELMUXFila<= 3'd6; 
					SELMUXColum<= 3'd6;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S10: begin // Estado de multiplica  Acumulado - A14Imag*B41Imag
					SELMUXFila<= 3'd7; 
					SELMUXColum<= 3'd7;
					Op <= 1'b1; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S11: begin // Estado de Habilita Enable de registro de salida Parte Real
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd1;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b1; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S12: begin // Estado de resetea acumulador
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd1;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S13: begin // Estado de Multiplica A11Real*B11Imag  y suma 0
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd1;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S14: begin // Estado de multiplica  Acumulado + A11Imag* B11Real
					SELMUXFila<= 3'd1; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S15: begin // Estado de multiplica  Acumulado + A12Real*B21Imag
					SELMUXFila<= 3'd2; 
					SELMUXColum<= 3'd3;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S16: begin // Estado de multiplica  Acumulado + A12Imag* B21Real
					SELMUXFila<= 3'd3; 
					SELMUXColum<= 3'd2;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S17: begin // Estado de multiplica  Acumulado + A13Real*B31Imag 
					SELMUXFila<= 3'd4; 
					SELMUXColum<= 3'd5;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S18: begin // Estado de multiplica  Acumulado +A13Imag* B31Real
					SELMUXFila<= 3'd5; 
					SELMUXColum<= 3'd4;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S19: begin // Estado de multiplica  Acumulado +A14Real*B41Imag 
					SELMUXFila<= 3'd6; 
					SELMUXColum<= 3'd7;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S20: begin // Estado de multiplica  Acumulado +A14Imag* B41Real 
					SELMUXFila<= 3'd7; 
					SELMUXColum<= 3'd6;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b1; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S21: begin // Habilita enable del registro parte imaginaria 
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b0; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b1;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S22: begin // Reset del registro acumulador y registro de entrada 
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0;
					ResetError <= 1'b0;
				end
				S23: begin // Levanta la bandera de listo 
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b1;
					ResetError <= 1'b0;
				end
				S24: begin // Levanta la bandera de listo 
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b0; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b0; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b0; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b1;
					ResetError <= 1'b0;
				end
				default: begin  
					SELMUXFila<= 3'd0; 
					SELMUXColum<= 3'd0;
					Op <= 1'b0; 
					ResetRegisterIn<= 1'b1; 
					EnableRegisterIn<= 1'b0;
					ResetAcum<= 1'b1; 
					EnableAcum<= 1'b0; 
					ResetRegisterOutParteReal<= 1'b1; 
					EnableRegisterOutParteReal<= 1'b0; 
					ResetRegisterOutParteImag<= 1'b1; 
					EnableRegisterOutParteImag<= 1'b0;
					Listo<= 1'b0; 
					ResetError <= 1'b1;
				end
			endcase
		end
		
		// ********************************************* CONTADOR DE SIMBOLOS ******************************************	
endmodule

