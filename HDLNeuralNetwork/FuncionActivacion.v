`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:40:11 11/29/2014 
// Design Name: 
// Module Name:    FuncionActivacion 
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
module FuncionActivacion #(parameter Width = 32, Magnitud = 7, Precision = 24, Signo = 1, A00= 0, 
A01= 1, A02 = 2, A03 = 3, A04 = 4, A05 = 5, A06 = 6, A07 = 7, A08 = 8, A09 = 9,
A10= 10, A11= 11, A12 = 12, A13 = 13, A14 = 14, A15 = 15, A16 = 16, A17 = 17, A18 = 18, A19 = 19,
A20= 20, A21= 21,A22 = 22, A23 = 23, A24 = 24, A25 = 25, A26 = 26, A27 = 27, A28 = 28, A29 = 29, 
A30 = 30, M01= 1, 
M02 = 2, M03 = 3, M04 = 4, M05 = 5, M06 = 6, M07 = 7, M08 = 8, M09 = 9,
M10= 10, M11= 11, M12 = 12, M13 = 13, M14 = 14, M15 = 15, M16 = 16, M17 = 17, M18 = 18, M19 = 19,
M20= 20, M21= 21,M22 = 22, M23 = 23, M24 = 24, M25 = 25, M26 = 26, M27 = 27, M28 = 28, M29 = 29, 
M30 = 30,B01= 1, 
B02 = 2, B03 = 3, B04 = 4, B05 = 5, B06 = 6, B07 = 7, B08 = 8, B09 = 9,
B10= 10, B11= 11, B12 = 12, B13 = 13, B14 = 14, B15 = 15, B16 = 16, B17 = 17, B18 = 18, B19 = 19,
B20= 20, B21= 21,B22 = 22, B23 = 23, B24 = 24, B25 = 25, B26 = 26, B27 = 27, B28 = 28, B29 = 29, 
B30 = 30)
(Entrada,Enable,Error,Salida);
	 
	 input signed [Width-1:0] Entrada;
	 input Enable;
	 output Error;
	 output signed [Width-1:0] Salida;
	 
	 wire [4:0] SELMUX;
	 wire signed [Width-1:0] M,B;
	 
	 Comparador #( .Width(Width) , .A00(A00), .A01(A01),.A02(A02), .A03(A03), .A04(A04), .A05(A05), 
	 .A06(A06), .A07(A07), .A08(A08), .A09(A09),.A10(A10), .A11(A11), .A12(A12), .A13(A13), .A14(A14), 
	 .A15(A15), .A16(A16), .A17(A17), .A18(A18), .A19(A19),.A20(A20), .A21(A21),.A22(A22), .A23(A23), 
	 .A24(A24), .A25(A25), .A26(A26), .A27(A27), .A28(A28), .A29(A29), .A30(A30))
	 COmparadorcopia (
    .A(Entrada), 
    .OutComp(SELMUX)
    );
	 
	 
	 multiplexor32a1 #(.Width(Width)) multiplexor32a1coeffPendientes (
    .coeff00(0), 
    .coeff01(M01), 
    .coeff02(M02), 
    .coeff03(M03), 
    .coeff04(M04), 
    .coeff05(M05), 
    .coeff06(M06), 
    .coeff07(M07), 
    .coeff08(M08), 
    .coeff09(M09), 
    .coeff10(M10), 
    .coeff11(M11), 
    .coeff12(M12), 
    .coeff13(M13), 
    .coeff14(M14), 
    .coeff15(M15), 
    .coeff16(M16), 
    .coeff17(M17), 
    .coeff18(M18), 
    .coeff19(M19), 
    .coeff20(M20), 
    .coeff21(M21), 
    .coeff22(M22), 
    .coeff23(M23), 
    .coeff24(M24), 
    .coeff25(M25), 
    .coeff26(M26), 
    .coeff27(M27), 
    .coeff28(M28), 
    .coeff29(M29), 
    .coeff30(M30), 
    .coeff31(0), 
    .SEL(SELMUX), 
    .outMUX(M)
    );
	 
	 multiplexor32a1 #(.Width(Width)) multiplexor32a1coeffInterseccion (
    .coeff00(0), 
    .coeff01(B01), 
    .coeff02(B02), 
    .coeff03(B03), 
    .coeff04(B04), 
    .coeff05(B05), 
    .coeff06(B06), 
    .coeff07(B07), 
    .coeff08(B08), 
    .coeff09(B09), 
    .coeff10(B10), 
    .coeff11(B11), 
    .coeff12(B12), 
    .coeff13(B13), 
    .coeff14(B14), 
    .coeff15(B15), 
    .coeff16(B16), 
    .coeff17(B17), 
    .coeff18(B18), 
    .coeff19(B19), 
    .coeff20(B20), 
    .coeff21(B21), 
    .coeff22(B22), 
    .coeff23(B23), 
    .coeff24(B24), 
    .coeff25(B25), 
    .coeff26(B26), 
    .coeff27(B27), 
    .coeff28(B28), 
    .coeff29(B29), 
    .coeff30(B30), 
    .coeff31(0), 
    .SEL(SELMUX), 
    .outMUX(B)
    );
	 
	 
	 ALUfuncionActivacion #(.Width(Width), .Magnitud(Magnitud), .Precision(Precision),.Signo(Signo)) 
	 ALUfuncionActivacioncopia (
    .SELMUX(SELMUX), 
    .Enable(Enable), 
    .M(M), 
    .B(B), 
    .In(Entrada), 
    .Out(Salida), 
    .Error(Error)
    );





endmodule
