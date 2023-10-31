module IF_Map_BUF(
input clk,
input reset,
input [15:0] Rd_data0,
input [15:0] Rd_data1,
input [15:0] Rd_data2,
input [15:0] Rd_data3,
input [15:0] Rd_data4,
input [15:0] Rd_data5,
input [15:0] Rd_data6,
input [15:0] Rd_data7,
input [63:0] Reg_loads, // register loads
input [64*3-1:0] Mux_Sel, // Mux selection that gets data in registers
input [63:0] Local_Reset, // to reset unused registers 
output [64*16-1:0] MAC_IN1
);
//Declaration of Register Array for IF_MAP_Buffer
wire [15:0] IF_MAP_Array [63:0];

//Registers Logic from R0 -> R63
//R0
IF_Map_instance IFMi0(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[0],Mux_Sel[2:0], Local_Reset[0],IF_MAP_Array[0]);
//R1
IF_Map_instance IFMi1(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[1],Mux_Sel[5:3], Local_Reset[1],IF_MAP_Array[1]);
//R2
IF_Map_instance IFMi2(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[2],Mux_Sel[8:6], Local_Reset[2],IF_MAP_Array[2]);
//R3
IF_Map_instance IFMi3(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[3],Mux_Sel[11:9], Local_Reset[3],IF_MAP_Array[3]);
//R4
IF_Map_instance IFMi4(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[4],Mux_Sel[14:12], Local_Reset[4],IF_MAP_Array[4]);
//R5
IF_Map_instance IFMi5(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[5],Mux_Sel[17:15], Local_Reset[5],IF_MAP_Array[5]);
//R6
IF_Map_instance IFMi6(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[6],Mux_Sel[20:18], Local_Reset[6],IF_MAP_Array[6]);
//R7
IF_Map_instance IFMi7(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[7],Mux_Sel[23:21], Local_Reset[7],IF_MAP_Array[7]);
//R8
IF_Map_instance IFMi8(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[8],Mux_Sel[26:24], Local_Reset[8],IF_MAP_Array[8]);
//R9
IF_Map_instance IFMi9(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[9],Mux_Sel[29:27], Local_Reset[9],IF_MAP_Array[9]);
//R10
IF_Map_instance IFMi10(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[10],Mux_Sel[32:30], Local_Reset[10],IF_MAP_Array[10]);
//R11
IF_Map_instance IFMi11(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[11],Mux_Sel[35:33], Local_Reset[11],IF_MAP_Array[11]);
//R12
IF_Map_instance IFMi12(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[12],Mux_Sel[38:36], Local_Reset[12],IF_MAP_Array[12]);
//R13
IF_Map_instance IFMi13(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[13],Mux_Sel[41:39], Local_Reset[13],IF_MAP_Array[13]);
//R14
IF_Map_instance IFMi14(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[14],Mux_Sel[44:42], Local_Reset[14],IF_MAP_Array[14]);
//R15
IF_Map_instance IFMi15(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[15],Mux_Sel[47:45], Local_Reset[15],IF_MAP_Array[15]);
//R16
IF_Map_instance IFMi16(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[16],Mux_Sel[50:48], Local_Reset[16],IF_MAP_Array[16]);
//R17
IF_Map_instance IFMi17(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[17],Mux_Sel[53:51], Local_Reset[17],IF_MAP_Array[17]);
//R18
IF_Map_instance IFMi18(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[18],Mux_Sel[56:54], Local_Reset[18],IF_MAP_Array[18]);
//R19
IF_Map_instance IFMi19(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[19],Mux_Sel[59:57], Local_Reset[19],IF_MAP_Array[19]);
//R20
IF_Map_instance IFMi20(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[20],Mux_Sel[62:60], Local_Reset[20],IF_MAP_Array[20]);
//R21
IF_Map_instance IFMi21(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[21],Mux_Sel[65:63], Local_Reset[21],IF_MAP_Array[21]);
//R22
IF_Map_instance IFMi22(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[22],Mux_Sel[68:66], Local_Reset[22],IF_MAP_Array[22]);
//R23
IF_Map_instance IFMi23(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[23],Mux_Sel[71:69], Local_Reset[23],IF_MAP_Array[23]);
//R24
IF_Map_instance IFMi24(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[24],Mux_Sel[74:72], Local_Reset[24],IF_MAP_Array[24]);
//R25
IF_Map_instance IFMi25(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[25],Mux_Sel[77:75], Local_Reset[25],IF_MAP_Array[25]);
//R26
IF_Map_instance IFMi26(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[26],Mux_Sel[80:78], Local_Reset[26],IF_MAP_Array[26]);
//R27
IF_Map_instance IFMi27(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[27],Mux_Sel[83:81], Local_Reset[27],IF_MAP_Array[27]);
//R28
IF_Map_instance IFMi28(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[28],Mux_Sel[86:84], Local_Reset[28],IF_MAP_Array[28]);
//R29
IF_Map_instance IFMi29(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[29],Mux_Sel[89:87], Local_Reset[29],IF_MAP_Array[29]);
//R30
IF_Map_instance IFMi30(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[30],Mux_Sel[92:90], Local_Reset[30],IF_MAP_Array[30]);
//R31
IF_Map_instance IFMi31(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[31],Mux_Sel[95:93], Local_Reset[31],IF_MAP_Array[31]);
//R32
IF_Map_instance IFMi32(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[32],Mux_Sel[98:96], Local_Reset[32],IF_MAP_Array[32]);
//R33
IF_Map_instance IFMi33(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[33],Mux_Sel[101:99], Local_Reset[33],IF_MAP_Array[33]);
//R34
IF_Map_instance IFMi34(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[34],Mux_Sel[104:102], Local_Reset[34],IF_MAP_Array[34]);
//R35
IF_Map_instance IFMi35(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[35],Mux_Sel[107:105], Local_Reset[35],IF_MAP_Array[35]);
//R36
IF_Map_instance IFMi36(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[36],Mux_Sel[110:108], Local_Reset[36],IF_MAP_Array[36]);
//R37
IF_Map_instance IFMi37(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[37],Mux_Sel[113:111], Local_Reset[37],IF_MAP_Array[37]);
//R38
IF_Map_instance IFMi38(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[38],Mux_Sel[116:114], Local_Reset[38],IF_MAP_Array[38]);
//R39
IF_Map_instance IFMi39(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[39],Mux_Sel[119:117], Local_Reset[39],IF_MAP_Array[39]);
//R40
IF_Map_instance IFMi40(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[40],Mux_Sel[122:120], Local_Reset[40],IF_MAP_Array[40]);
//R41
IF_Map_instance IFM41(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[41],Mux_Sel[125:123], Local_Reset[41],IF_MAP_Array[41]);
//R42
IF_Map_instance IFMi42(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[42],Mux_Sel[128:126], Local_Reset[42],IF_MAP_Array[42]);
//R43
IF_Map_instance IFMi43(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[43],Mux_Sel[131:129], Local_Reset[43],IF_MAP_Array[43]);
//R44
IF_Map_instance IFMi44(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[44],Mux_Sel[134:132], Local_Reset[44],IF_MAP_Array[44]);
//R45
IF_Map_instance IFMi45(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[45],Mux_Sel[137:135], Local_Reset[45],IF_MAP_Array[45]);
//R46
IF_Map_instance IFMi46(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[46],Mux_Sel[140:138], Local_Reset[46],IF_MAP_Array[46]);
//R47
IF_Map_instance IFMi47(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[47],Mux_Sel[143:141], Local_Reset[47],IF_MAP_Array[47]);
//R48
IF_Map_instance IFMi48(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[48],Mux_Sel[146:144], Local_Reset[48],IF_MAP_Array[48]);
//R49
IF_Map_instance IFMi49(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[49],Mux_Sel[149:147], Local_Reset[49],IF_MAP_Array[49]);
//R50
IF_Map_instance IFMi50(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[50],Mux_Sel[152:150], Local_Reset[50],IF_MAP_Array[50]);
//R51
IF_Map_instance IFMi51(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[51],Mux_Sel[155:153], Local_Reset[51],IF_MAP_Array[51]);
//R52
IF_Map_instance IFMi52(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[52],Mux_Sel[158:156], Local_Reset[52],IF_MAP_Array[52]);
//R53
IF_Map_instance IFMi53(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[53],Mux_Sel[161:159], Local_Reset[53],IF_MAP_Array[53]);
//R54
IF_Map_instance IFMi54(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[54],Mux_Sel[164:162], Local_Reset[54],IF_MAP_Array[54]);
//R55
IF_Map_instance IFMi55(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[55],Mux_Sel[167:165], Local_Reset[55],IF_MAP_Array[55]);
//R56
IF_Map_instance IFMi56(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[56],Mux_Sel[170:168], Local_Reset[56],IF_MAP_Array[56]);
//R57
IF_Map_instance IFMi57(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[57],Mux_Sel[173:171], Local_Reset[57],IF_MAP_Array[57]);
//R58
IF_Map_instance IFMi58(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[58],Mux_Sel[176:174], Local_Reset[58],IF_MAP_Array[58]);
//R59
IF_Map_instance IFMi59(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[59],Mux_Sel[179:177], Local_Reset[59],IF_MAP_Array[59]);
//R60
IF_Map_instance IFMi60(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[60],Mux_Sel[182:180], Local_Reset[60],IF_MAP_Array[60]);
//R61
IF_Map_instance IFMi61(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[61],Mux_Sel[185:183], Local_Reset[61],IF_MAP_Array[61]);
//R62
IF_Map_instance IFMi62(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[62],Mux_Sel[188:186], Local_Reset[62],IF_MAP_Array[62]);
//R63
IF_Map_instance IFMi63(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[63],Mux_Sel[191:189], Local_Reset[63],IF_MAP_Array[63]);
// Assignment of the Output and Input of MAC
assign MAC_IN1 = {IF_MAP_Array[63],IF_MAP_Array[62],IF_MAP_Array[61],IF_MAP_Array[60],IF_MAP_Array[59],IF_MAP_Array[58],IF_MAP_Array[57],IF_MAP_Array[56],
                  IF_MAP_Array[55],IF_MAP_Array[54],IF_MAP_Array[53],IF_MAP_Array[52],IF_MAP_Array[51],IF_MAP_Array[50],IF_MAP_Array[49],IF_MAP_Array[48],
                  IF_MAP_Array[47],IF_MAP_Array[46],IF_MAP_Array[45],IF_MAP_Array[44],IF_MAP_Array[43],IF_MAP_Array[42],IF_MAP_Array[41],IF_MAP_Array[40],
                  IF_MAP_Array[39],IF_MAP_Array[38],IF_MAP_Array[37],IF_MAP_Array[36],IF_MAP_Array[35],IF_MAP_Array[34],IF_MAP_Array[33],IF_MAP_Array[32],
                  IF_MAP_Array[31],IF_MAP_Array[30],IF_MAP_Array[29],IF_MAP_Array[28],IF_MAP_Array[27],IF_MAP_Array[26],IF_MAP_Array[25],IF_MAP_Array[24],
                  IF_MAP_Array[23],IF_MAP_Array[22],IF_MAP_Array[21],IF_MAP_Array[20],IF_MAP_Array[19],IF_MAP_Array[18],IF_MAP_Array[17],IF_MAP_Array[16],
                  IF_MAP_Array[15],IF_MAP_Array[14],IF_MAP_Array[13],IF_MAP_Array[12],IF_MAP_Array[11],IF_MAP_Array[10],IF_MAP_Array[9],IF_MAP_Array[8],
                  IF_MAP_Array[7],IF_MAP_Array[6],IF_MAP_Array[5],IF_MAP_Array[4],IF_MAP_Array[3],IF_MAP_Array[2],IF_MAP_Array[1],IF_MAP_Array[0]}; 

endmodule

