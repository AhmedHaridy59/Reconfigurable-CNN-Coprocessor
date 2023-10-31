module KW_Map_BUF(
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
input [191:0] Mux_Sel , // 8x1 MUX Select
input [63:0] Local_Reset, // to reset unused registers 
input [64*6-1:0] Out_Mux_Sel, // each mux takes regs content and decide which parameter go where 
output [64*16-1:0] MAC_IN2
);
//Declaration of Register Array for IF_MAP_Buffer
wire [15:0] KW_MAP_Array [63:0];
wire [64*16-1:0] Reg_Outs;
wire [15:0] MUX_Out [63:0];
//Registers Logic from R0 -> R63
//R0
KW_Map_instance KWMi0(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[0],Mux_Sel[2:0], Local_Reset[0],KW_MAP_Array[0]);
//R1
KW_Map_instance KWMi1(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[1],Mux_Sel[5:3], Local_Reset[1],KW_MAP_Array[1]);
//R2
KW_Map_instance KWMi2(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[2],Mux_Sel[8:6], Local_Reset[2],KW_MAP_Array[2]);
//R3
KW_Map_instance KWMi3(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[3],Mux_Sel[11:9], Local_Reset[3],KW_MAP_Array[3]);
//R4
KW_Map_instance KWMi4(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[4],Mux_Sel[14:12], Local_Reset[4],KW_MAP_Array[4]);
//R5
KW_Map_instance KWMi5(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[5],Mux_Sel[17:15], Local_Reset[5],KW_MAP_Array[5]);
//R6
KW_Map_instance KWMi6(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[6],Mux_Sel[20:18], Local_Reset[6],KW_MAP_Array[6]);
//R7
KW_Map_instance KWMi7(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[7],Mux_Sel[23:21], Local_Reset[7],KW_MAP_Array[7]);
//R8
KW_Map_instance KWMi8(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[8],Mux_Sel[26:24], Local_Reset[8],KW_MAP_Array[8]);
//R9
KW_Map_instance KWMi9(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[9],Mux_Sel[29:27], Local_Reset[9],KW_MAP_Array[9]);
//R10
KW_Map_instance KWMi10(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[10],Mux_Sel[32:30], Local_Reset[10],KW_MAP_Array[10]);
//R11
KW_Map_instance KWMi11(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[11],Mux_Sel[35:33], Local_Reset[11],KW_MAP_Array[11]);
//R12
KW_Map_instance KWMi12(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[12],Mux_Sel[38:36], Local_Reset[12],KW_MAP_Array[12]);
//R13
KW_Map_instance KWMi13(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[13],Mux_Sel[41:39], Local_Reset[13],KW_MAP_Array[13]);
//R14
KW_Map_instance KWMi14(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[14],Mux_Sel[44:42], Local_Reset[14],KW_MAP_Array[14]);
//R15
KW_Map_instance KWMi15(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[15],Mux_Sel[47:45], Local_Reset[15],KW_MAP_Array[15]);
//R16
KW_Map_instance KWMi16(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[16],Mux_Sel[50:48], Local_Reset[16],KW_MAP_Array[16]);
//R17
KW_Map_instance KWMi17(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[17],Mux_Sel[53:51], Local_Reset[17],KW_MAP_Array[17]);
//R18
KW_Map_instance KWMi18(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[18],Mux_Sel[56:54], Local_Reset[18],KW_MAP_Array[18]);
//R19
KW_Map_instance KWMi19(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[19],Mux_Sel[59:57], Local_Reset[19],KW_MAP_Array[19]);
//R20
KW_Map_instance KWMi20(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[20],Mux_Sel[62:60], Local_Reset[20],KW_MAP_Array[20]);
//R21
KW_Map_instance KWMi21(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[21],Mux_Sel[65:63], Local_Reset[21],KW_MAP_Array[21]);
//R22
KW_Map_instance KWMi22(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[22],Mux_Sel[68:66], Local_Reset[22],KW_MAP_Array[22]);
//R23
KW_Map_instance KWMi23(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[23],Mux_Sel[71:69], Local_Reset[23],KW_MAP_Array[23]);
//R24
KW_Map_instance KWMi24(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[24],Mux_Sel[74:72], Local_Reset[24],KW_MAP_Array[24]);
//R25
KW_Map_instance KWMi25(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[25],Mux_Sel[77:75], Local_Reset[25],KW_MAP_Array[25]);
//R26
KW_Map_instance KWMi26(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[26],Mux_Sel[80:78], Local_Reset[26],KW_MAP_Array[26]);
//R27
KW_Map_instance KWMi27(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[27],Mux_Sel[83:81], Local_Reset[27],KW_MAP_Array[27]);
//R28
KW_Map_instance KWMi28(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[28],Mux_Sel[86:84], Local_Reset[28],KW_MAP_Array[28]);
//R29
KW_Map_instance KWMi29(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[29],Mux_Sel[89:87], Local_Reset[29],KW_MAP_Array[29]);
//R30
KW_Map_instance KWMi30(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[30],Mux_Sel[92:90], Local_Reset[30],KW_MAP_Array[30]);
//R31
KW_Map_instance KWMi31(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[31],Mux_Sel[95:93], Local_Reset[31],KW_MAP_Array[31]);
//R32
KW_Map_instance KWMi32(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[32],Mux_Sel[98:96], Local_Reset[32],KW_MAP_Array[32]);
//R33
KW_Map_instance KWMi33(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[33],Mux_Sel[101:99], Local_Reset[33],KW_MAP_Array[33]);
//R34
KW_Map_instance KWMi34(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[34],Mux_Sel[104:102], Local_Reset[34],KW_MAP_Array[34]);
//R35
KW_Map_instance KWMi35(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[35],Mux_Sel[107:105], Local_Reset[35],KW_MAP_Array[35]);
//R36
KW_Map_instance KWMi36(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[36],Mux_Sel[110:108], Local_Reset[36],KW_MAP_Array[36]);
//R37
KW_Map_instance KWMi37(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[37],Mux_Sel[113:111], Local_Reset[37],KW_MAP_Array[37]);
//R38
KW_Map_instance KWMi38(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[38],Mux_Sel[116:114], Local_Reset[38],KW_MAP_Array[38]);
//R39
KW_Map_instance KWMi39(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[39],Mux_Sel[119:117], Local_Reset[39],KW_MAP_Array[39]);
//R40
KW_Map_instance KWMi40(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[40],Mux_Sel[122:120], Local_Reset[40],KW_MAP_Array[40]);
//R41
KW_Map_instance KWM41(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[41],Mux_Sel[125:123], Local_Reset[41],KW_MAP_Array[41]);
//R42
KW_Map_instance KWMi42(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[42],Mux_Sel[128:126], Local_Reset[42],KW_MAP_Array[42]);
//R43
KW_Map_instance KWMi43(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[43],Mux_Sel[131:129], Local_Reset[43],KW_MAP_Array[43]);
//R44
KW_Map_instance KWMi44(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[44],Mux_Sel[134:132], Local_Reset[44],KW_MAP_Array[44]);
//R45
KW_Map_instance KWMi45(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[45],Mux_Sel[137:135], Local_Reset[45],KW_MAP_Array[45]);
//R46
KW_Map_instance KWMi46(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[46],Mux_Sel[140:138], Local_Reset[46],KW_MAP_Array[46]);
//R47
KW_Map_instance KWMi47(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[47],Mux_Sel[143:141], Local_Reset[47],KW_MAP_Array[47]);
//R48
KW_Map_instance KWMi48(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[48],Mux_Sel[146:144], Local_Reset[48],KW_MAP_Array[48]);
//R49
KW_Map_instance KWMi49(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[49],Mux_Sel[149:147], Local_Reset[49],KW_MAP_Array[49]);
//R50
KW_Map_instance KWMi50(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[50],Mux_Sel[152:150], Local_Reset[50],KW_MAP_Array[50]);
//R51
KW_Map_instance KWMi51(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[51],Mux_Sel[155:153], Local_Reset[51],KW_MAP_Array[51]);
//R52
KW_Map_instance KWMi52(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[52],Mux_Sel[158:156], Local_Reset[52],KW_MAP_Array[52]);
//R53
KW_Map_instance KWMi53(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[53],Mux_Sel[161:159], Local_Reset[53],KW_MAP_Array[53]);
//R54
KW_Map_instance KWMi54(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[54],Mux_Sel[164:162], Local_Reset[54],KW_MAP_Array[54]);
//R55
KW_Map_instance KWMi55(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[55],Mux_Sel[167:165], Local_Reset[55],KW_MAP_Array[55]);
//R56
KW_Map_instance KWMi56(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[56],Mux_Sel[170:168], Local_Reset[56],KW_MAP_Array[56]);
//R57
KW_Map_instance KWMi57(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[57],Mux_Sel[173:171], Local_Reset[57],KW_MAP_Array[57]);
//R58
KW_Map_instance KWMi58(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[58],Mux_Sel[176:174], Local_Reset[58],KW_MAP_Array[58]);
//R59
KW_Map_instance KWMi59(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[59],Mux_Sel[179:177], Local_Reset[59],KW_MAP_Array[59]);
//R60
KW_Map_instance KWMi60(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[60],Mux_Sel[182:180], Local_Reset[60],KW_MAP_Array[60]);
//R61
KW_Map_instance KWMi61(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[61],Mux_Sel[185:183], Local_Reset[61],KW_MAP_Array[61]);
//R62
KW_Map_instance KWMi62(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[62],Mux_Sel[188:186], Local_Reset[62],KW_MAP_Array[62]);
//R63
KW_Map_instance KWMi63(clk, reset, Rd_data0, Rd_data1, Rd_data2, Rd_data3, Rd_data4, Rd_data5, Rd_data6, Rd_data7,
                      Reg_loads[63],Mux_Sel[191:189], Local_Reset[63],KW_MAP_Array[63]);
// Assignment of the intput to Output MUXs
assign Reg_Outs = {KW_MAP_Array[63],KW_MAP_Array[62],KW_MAP_Array[61],KW_MAP_Array[60],KW_MAP_Array[59],KW_MAP_Array[58],KW_MAP_Array[57],KW_MAP_Array[56],
                  KW_MAP_Array[55],KW_MAP_Array[54],KW_MAP_Array[53],KW_MAP_Array[52],KW_MAP_Array[51],KW_MAP_Array[50],KW_MAP_Array[49],KW_MAP_Array[48],
                  KW_MAP_Array[47],KW_MAP_Array[46],KW_MAP_Array[45],KW_MAP_Array[44],KW_MAP_Array[43],KW_MAP_Array[42],KW_MAP_Array[41],KW_MAP_Array[40],
                  KW_MAP_Array[39],KW_MAP_Array[38],KW_MAP_Array[37],KW_MAP_Array[36],KW_MAP_Array[35],KW_MAP_Array[34],KW_MAP_Array[33],KW_MAP_Array[32],
                  KW_MAP_Array[31],KW_MAP_Array[30],KW_MAP_Array[29],KW_MAP_Array[28],KW_MAP_Array[27],KW_MAP_Array[26],KW_MAP_Array[25],KW_MAP_Array[24],
                  KW_MAP_Array[23],KW_MAP_Array[22],KW_MAP_Array[21],KW_MAP_Array[20],KW_MAP_Array[19],KW_MAP_Array[18],KW_MAP_Array[17],KW_MAP_Array[16],
                  KW_MAP_Array[15],KW_MAP_Array[14],KW_MAP_Array[13],KW_MAP_Array[12],KW_MAP_Array[11],KW_MAP_Array[10],KW_MAP_Array[9],KW_MAP_Array[8],
                  KW_MAP_Array[7],KW_MAP_Array[6],KW_MAP_Array[5],KW_MAP_Array[4],KW_MAP_Array[3],KW_MAP_Array[2],KW_MAP_Array[1],KW_MAP_Array[0]};

// 64x1 MUXs
MUX64x1_instance MUXi0 (Reg_Outs,Out_Mux_Sel[5:0], MUX_Out[0]);  
MUX64x1_instance MUXi1 (Reg_Outs, Out_Mux_Sel[11:6], MUX_Out[1]);
MUX64x1_instance MUXi2 (Reg_Outs, Out_Mux_Sel[17:12], MUX_Out[2]);  
MUX64x1_instance MUXi3 (Reg_Outs, Out_Mux_Sel[23:18], MUX_Out[3]);
MUX64x1_instance MUXi4 (Reg_Outs, Out_Mux_Sel[29:24], MUX_Out[4]);  
MUX64x1_instance MUXi5 (Reg_Outs, Out_Mux_Sel[35:30], MUX_Out[5]);
MUX64x1_instance MUXi6 (Reg_Outs, Out_Mux_Sel[41:36], MUX_Out[6]);  
MUX64x1_instance MUXi7 (Reg_Outs, Out_Mux_Sel[47:42], MUX_Out[7]);
MUX64x1_instance MUXi8 (Reg_Outs, Out_Mux_Sel[53:48], MUX_Out[8]);  
MUX64x1_instance MUXi9 (Reg_Outs, Out_Mux_Sel[59:54], MUX_Out[9]);
MUX64x1_instance MUXi10(Reg_Outs, Out_Mux_Sel[65:60], MUX_Out[10]);  
MUX64x1_instance MUXi11(Reg_Outs, Out_Mux_Sel[71:66], MUX_Out[11]);
MUX64x1_instance MUXi12(Reg_Outs, Out_Mux_Sel[77:72], MUX_Out[12]);  
MUX64x1_instance MUXi13(Reg_Outs, Out_Mux_Sel[83:78], MUX_Out[13]);
MUX64x1_instance MUXi14(Reg_Outs, Out_Mux_Sel[89:84], MUX_Out[14]);  
MUX64x1_instance MUXi15(Reg_Outs, Out_Mux_Sel[95:90], MUX_Out[15]);
MUX64x1_instance MUXi16(Reg_Outs, Out_Mux_Sel[101:96],MUX_Out[16]);  
MUX64x1_instance MUXi17(Reg_Outs, Out_Mux_Sel[107:102],MUX_Out[17]);
MUX64x1_instance MUXi18(Reg_Outs, Out_Mux_Sel[113:108],MUX_Out[18]);  
MUX64x1_instance MUXi19(Reg_Outs, Out_Mux_Sel[119:114],MUX_Out[19]);
MUX64x1_instance MUXi20(Reg_Outs, Out_Mux_Sel[125:120], MUX_Out[20]);  
MUX64x1_instance MUXi21(Reg_Outs, Out_Mux_Sel[131:126], MUX_Out[21]);
MUX64x1_instance MUXi22(Reg_Outs, Out_Mux_Sel[137:132], MUX_Out[22]);  
MUX64x1_instance MUXi23(Reg_Outs, Out_Mux_Sel[143:138], MUX_Out[23]);
MUX64x1_instance MUXi24(Reg_Outs, Out_Mux_Sel[149:144], MUX_Out[24]);  
MUX64x1_instance MUXi25(Reg_Outs, Out_Mux_Sel[155:150], MUX_Out[25]);
MUX64x1_instance MUXi26(Reg_Outs, Out_Mux_Sel[161:156], MUX_Out[26]);  
MUX64x1_instance MUXi27(Reg_Outs, Out_Mux_Sel[167:162], MUX_Out[27]);
MUX64x1_instance MUXi28(Reg_Outs, Out_Mux_Sel[173:168], MUX_Out[28]);  
MUX64x1_instance MUXi29(Reg_Outs, Out_Mux_Sel[179:174], MUX_Out[29]);
MUX64x1_instance MUXi30(Reg_Outs, Out_Mux_Sel[185:180], MUX_Out[30]);  
MUX64x1_instance MUXi31(Reg_Outs, Out_Mux_Sel[191:186], MUX_Out[31]);
MUX64x1_instance MUXi32(Reg_Outs, Out_Mux_Sel[197:192], MUX_Out[32]);  
MUX64x1_instance MUXi33(Reg_Outs, Out_Mux_Sel[203:198], MUX_Out[33]);
MUX64x1_instance MUXi34(Reg_Outs, Out_Mux_Sel[209:204], MUX_Out[34]);  
MUX64x1_instance MUXi35(Reg_Outs, Out_Mux_Sel[215:210], MUX_Out[35]);
MUX64x1_instance MUXi36(Reg_Outs, Out_Mux_Sel[221:216], MUX_Out[36]);  
MUX64x1_instance MUXi37(Reg_Outs, Out_Mux_Sel[227:222], MUX_Out[37]);
MUX64x1_instance MUXi38(Reg_Outs, Out_Mux_Sel[233:228], MUX_Out[38]);  
MUX64x1_instance MUXi39(Reg_Outs, Out_Mux_Sel[239:234], MUX_Out[39]);
MUX64x1_instance MUXi40(Reg_Outs, Out_Mux_Sel[245:240], MUX_Out[40]);  
MUX64x1_instance MUXi41(Reg_Outs, Out_Mux_Sel[251:246], MUX_Out[41]);
MUX64x1_instance MUXi42(Reg_Outs, Out_Mux_Sel[257:252], MUX_Out[42]);  
MUX64x1_instance MUXi43(Reg_Outs, Out_Mux_Sel[263:258], MUX_Out[43]);
MUX64x1_instance MUXi44(Reg_Outs, Out_Mux_Sel[269:264], MUX_Out[44]);  
MUX64x1_instance MUXi45(Reg_Outs, Out_Mux_Sel[275:270], MUX_Out[45]);
MUX64x1_instance MUXi46(Reg_Outs, Out_Mux_Sel[281:276], MUX_Out[46]);  
MUX64x1_instance MUXi47(Reg_Outs, Out_Mux_Sel[287:282], MUX_Out[47]);
MUX64x1_instance MUXi48(Reg_Outs, Out_Mux_Sel[293:288], MUX_Out[48]);  
MUX64x1_instance MUXi49(Reg_Outs, Out_Mux_Sel[299:294], MUX_Out[49]);
MUX64x1_instance MUXi50(Reg_Outs, Out_Mux_Sel[305:300], MUX_Out[50]);  
MUX64x1_instance MUXi51(Reg_Outs, Out_Mux_Sel[311:306], MUX_Out[51]);
MUX64x1_instance MUXi52(Reg_Outs, Out_Mux_Sel[317:312], MUX_Out[52]);  
MUX64x1_instance MUXi53(Reg_Outs, Out_Mux_Sel[323:318], MUX_Out[53]);
MUX64x1_instance MUXi54(Reg_Outs, Out_Mux_Sel[329:324], MUX_Out[54]);  
MUX64x1_instance MUXi55(Reg_Outs, Out_Mux_Sel[335:330], MUX_Out[55]);
MUX64x1_instance MUXi56(Reg_Outs, Out_Mux_Sel[341:336], MUX_Out[56]);  
MUX64x1_instance MUXi57(Reg_Outs, Out_Mux_Sel[347:342], MUX_Out[57]);
MUX64x1_instance MUXi58(Reg_Outs, Out_Mux_Sel[353:348], MUX_Out[58]);  
MUX64x1_instance MUXi59(Reg_Outs, Out_Mux_Sel[359:354], MUX_Out[59]);
MUX64x1_instance MUXi60(Reg_Outs, Out_Mux_Sel[365:360], MUX_Out[60]);  
MUX64x1_instance MUXi61(Reg_Outs, Out_Mux_Sel[371:366], MUX_Out[61]);
MUX64x1_instance MUXi62(Reg_Outs, Out_Mux_Sel[377:372], MUX_Out[62]);  
MUX64x1_instance MUXi63(Reg_Outs, Out_Mux_Sel[383:378], MUX_Out[63]);

// Assignment of the Output and Input of MAC
assign MAC_IN2 = {MUX_Out[63],MUX_Out[62],MUX_Out[61],MUX_Out[60],MUX_Out[59],MUX_Out[58],MUX_Out[57],MUX_Out[56],
                  MUX_Out[55],MUX_Out[54],MUX_Out[53],MUX_Out[52],MUX_Out[51],MUX_Out[50],MUX_Out[49],MUX_Out[48],
                  MUX_Out[47],MUX_Out[46],MUX_Out[45],MUX_Out[44],MUX_Out[43],MUX_Out[42],MUX_Out[41],MUX_Out[40],
                  MUX_Out[39],MUX_Out[38],MUX_Out[37],MUX_Out[36],MUX_Out[35],MUX_Out[34],MUX_Out[33],MUX_Out[32],
                  MUX_Out[31],MUX_Out[30],MUX_Out[29],MUX_Out[28],MUX_Out[27],MUX_Out[26],MUX_Out[25],MUX_Out[24],
                  MUX_Out[23],MUX_Out[22],MUX_Out[21],MUX_Out[20],MUX_Out[19],MUX_Out[18],MUX_Out[17],MUX_Out[16],
                  MUX_Out[15],MUX_Out[14],MUX_Out[13],MUX_Out[12],MUX_Out[11],MUX_Out[10],MUX_Out[9],MUX_Out[8],
                  MUX_Out[7],MUX_Out[6],MUX_Out[5],MUX_Out[4],MUX_Out[3],MUX_Out[2],MUX_Out[1],MUX_Out[0]}; 

endmodule

