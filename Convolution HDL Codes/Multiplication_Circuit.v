//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 07/12/2021 02:23:29 PM
// Design Name: 
// Module Name: Multiplication_Circuit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Multiplication_Circuit (
input clk,
input [63:0] MUL_EN,
input [1023:0] IF_map_Out,
input [1023:0] KW_map_Out,
output [2047:0] Mult_out,
output Overflow_Mul
);

//////////////////// Internal signals //////////////////////
wire [63:0] ovr;
wire [15:0] IF_map_array [63:0]; // local array
wire [15:0] KW_map_array [63:0]; // local array
wire [31:0] Mult_out_array [63:0]; // local array
 //Assign Local Arrays to Inputs;

assign {IF_map_array[63],IF_map_array[62],IF_map_array[61],IF_map_array[60],IF_map_array[59],
        IF_map_array[58],IF_map_array[57],IF_map_array[56],IF_map_array[55],IF_map_array[54],
        IF_map_array[53],IF_map_array[52],IF_map_array[51],IF_map_array[50],IF_map_array[49],
        IF_map_array[48],IF_map_array[47],IF_map_array[46],IF_map_array[45],IF_map_array[44],
        IF_map_array[43],IF_map_array[42],IF_map_array[41],IF_map_array[40],IF_map_array[39],
        IF_map_array[38],IF_map_array[37],IF_map_array[36],IF_map_array[35],IF_map_array[34],
        IF_map_array[33],IF_map_array[32],IF_map_array[31],IF_map_array[30],IF_map_array[29],
        IF_map_array[28],IF_map_array[27],IF_map_array[26],IF_map_array[25],IF_map_array[24],
        IF_map_array[23],IF_map_array[22],IF_map_array[21],IF_map_array[20],IF_map_array[19],
        IF_map_array[18],IF_map_array[17],IF_map_array[16],IF_map_array[15],IF_map_array[14],
        IF_map_array[13],IF_map_array[12],IF_map_array[11],IF_map_array[10],IF_map_array[9],
        IF_map_array[8],IF_map_array[7],IF_map_array[6],IF_map_array[5],IF_map_array[4],
        IF_map_array[3],IF_map_array[2],IF_map_array[1],IF_map_array[0]} =  IF_map_Out;

assign {KW_map_array[63],KW_map_array[62],KW_map_array[61],KW_map_array[60],KW_map_array[59],
        KW_map_array[58],KW_map_array[57],KW_map_array[56],KW_map_array[55],KW_map_array[54],
        KW_map_array[53],KW_map_array[52],KW_map_array[51],KW_map_array[50],KW_map_array[49],
        KW_map_array[48],KW_map_array[47],KW_map_array[46],KW_map_array[45],KW_map_array[44],
        KW_map_array[43],KW_map_array[42],KW_map_array[41],KW_map_array[40],KW_map_array[39],
        KW_map_array[38],KW_map_array[37],KW_map_array[36],KW_map_array[35],KW_map_array[34],
        KW_map_array[33],KW_map_array[32],KW_map_array[31],KW_map_array[30],KW_map_array[29],
        KW_map_array[28],KW_map_array[27],KW_map_array[26],KW_map_array[25],KW_map_array[24],
        KW_map_array[23],KW_map_array[22],KW_map_array[21],KW_map_array[20],KW_map_array[19],
        KW_map_array[18],KW_map_array[17],KW_map_array[16],KW_map_array[15],KW_map_array[14],
        KW_map_array[13],KW_map_array[12],KW_map_array[11],KW_map_array[10],KW_map_array[9],
        KW_map_array[8],KW_map_array[7],KW_map_array[6],KW_map_array[5],KW_map_array[4],
        KW_map_array[3],KW_map_array[2],KW_map_array[1],KW_map_array[0]} =  KW_map_Out;
        
assign  Mult_out ={Mult_out_array[63],Mult_out_array[62],Mult_out_array[61],Mult_out_array[60],Mult_out_array[59],
        Mult_out_array[58],Mult_out_array[57],Mult_out_array[56],Mult_out_array[55],Mult_out_array[54],
        Mult_out_array[53],Mult_out_array[52],Mult_out_array[51],Mult_out_array[50],Mult_out_array[49],
        Mult_out_array[48],Mult_out_array[47],Mult_out_array[46],Mult_out_array[45],Mult_out_array[44],
        Mult_out_array[43],Mult_out_array[42],Mult_out_array[41],Mult_out_array[40],Mult_out_array[39],
        Mult_out_array[38],Mult_out_array[37],Mult_out_array[36],Mult_out_array[35],Mult_out_array[34],
        Mult_out_array[33],Mult_out_array[32],Mult_out_array[31],Mult_out_array[30],Mult_out_array[29],
        Mult_out_array[28],Mult_out_array[27],Mult_out_array[26],Mult_out_array[25],Mult_out_array[24],
        Mult_out_array[23],Mult_out_array[22],Mult_out_array[21],Mult_out_array[20],Mult_out_array[19],
        Mult_out_array[18],Mult_out_array[17],Mult_out_array[16],Mult_out_array[15],Mult_out_array[14],
        Mult_out_array[13],Mult_out_array[12],Mult_out_array[11],Mult_out_array[10],Mult_out_array[9],
        Mult_out_array[8],Mult_out_array[7],Mult_out_array[6],Mult_out_array[5],Mult_out_array[4],
        Mult_out_array[3],Mult_out_array[2],Mult_out_array[1],Mult_out_array[0]} ;


Multiplier M0(.out(Mult_out_array [0]),.clk(clk),.mul_en(MUL_EN[0]),.a(IF_map_array[0]),.b(KW_map_array[0]),.ovr(ovr[0]));
Multiplier M1(.out(Mult_out_array [1]),.clk(clk),.mul_en(MUL_EN[1]),.a(IF_map_array[1]),.b(KW_map_array[1]),.ovr(ovr[1]));
Multiplier M2(.out(Mult_out_array [2]),.clk(clk),.mul_en(MUL_EN[2]),.a(IF_map_array[2]),.b(KW_map_array[2]),.ovr(ovr[2]));
Multiplier M3(.out(Mult_out_array [3]),.clk(clk),.mul_en(MUL_EN[3]),.a(IF_map_array[3]),.b(KW_map_array[3]),.ovr(ovr[3]));
Multiplier M4(.out(Mult_out_array [4]),.clk(clk),.mul_en(MUL_EN[4]),.a(IF_map_array[4]),.b(KW_map_array[4]),.ovr(ovr[4]));
Multiplier M5(.out(Mult_out_array [5]),.clk(clk),.mul_en(MUL_EN[5]),.a(IF_map_array[5]),.b(KW_map_array[5]),.ovr(ovr[5]));
Multiplier M6(.out(Mult_out_array [6]),.clk(clk),.mul_en(MUL_EN[6]),.a(IF_map_array[6]),.b(KW_map_array[6]),.ovr(ovr[6]));
Multiplier M7(.out(Mult_out_array [7]),.clk(clk),.mul_en(MUL_EN[7]),.a(IF_map_array[7]),.b(KW_map_array[7]),.ovr(ovr[7]));
Multiplier M8(.out(Mult_out_array [8]),.clk(clk),.mul_en(MUL_EN[8]),.a(IF_map_array[8]),.b(KW_map_array[8]),.ovr(ovr[8]));
Multiplier M9(.out(Mult_out_array [9]),.clk(clk),.mul_en(MUL_EN[9]),.a(IF_map_array[9]),.b(KW_map_array[9]),.ovr(ovr[9]));
Multiplier M10(.out(Mult_out_array [10]),.clk(clk),.mul_en(MUL_EN[10]),.a(IF_map_array[10]),.b(KW_map_array[10]),.ovr(ovr[10]));
Multiplier M11(.out(Mult_out_array [11]),.clk(clk),.mul_en(MUL_EN[11]),.a(IF_map_array[11]),.b(KW_map_array[11]),.ovr(ovr[11]));
Multiplier M12(.out(Mult_out_array [12]),.clk(clk),.mul_en(MUL_EN[12]),.a(IF_map_array[12]),.b(KW_map_array[12]),.ovr(ovr[12]));
Multiplier M13(.out(Mult_out_array [13]),.clk(clk),.mul_en(MUL_EN[13]),.a(IF_map_array[13]),.b(KW_map_array[13]),.ovr(ovr[13]));
Multiplier M14(.out(Mult_out_array [14]),.clk(clk),.mul_en(MUL_EN[14]),.a(IF_map_array[14]),.b(KW_map_array[14]),.ovr(ovr[14]));
Multiplier M15(.out(Mult_out_array [15]),.clk(clk),.mul_en(MUL_EN[15]),.a(IF_map_array[15]),.b(KW_map_array[15]),.ovr(ovr[15]));
Multiplier M16(.out(Mult_out_array [16]),.clk(clk),.mul_en(MUL_EN[16]),.a(IF_map_array[16]),.b(KW_map_array[16]),.ovr(ovr[16]));
Multiplier M17(.out(Mult_out_array [17]),.clk(clk),.mul_en(MUL_EN[17]),.a(IF_map_array[17]),.b(KW_map_array[17]),.ovr(ovr[17]));
Multiplier M18(.out(Mult_out_array [18]),.clk(clk),.mul_en(MUL_EN[18]),.a(IF_map_array[18]),.b(KW_map_array[18]),.ovr(ovr[18]));
Multiplier M19(.out(Mult_out_array [19]),.clk(clk),.mul_en(MUL_EN[19]),.a(IF_map_array[19]),.b(KW_map_array[19]),.ovr(ovr[19]));
Multiplier M20(.out(Mult_out_array [20]),.clk(clk),.mul_en(MUL_EN[20]),.a(IF_map_array[20]),.b(KW_map_array[20]),.ovr(ovr[20]));
Multiplier M21(.out(Mult_out_array [21]),.clk(clk),.mul_en(MUL_EN[21]),.a(IF_map_array[21]),.b(KW_map_array[21]),.ovr(ovr[21]));
Multiplier M22(.out(Mult_out_array [22]),.clk(clk),.mul_en(MUL_EN[22]),.a(IF_map_array[22]),.b(KW_map_array[22]),.ovr(ovr[22]));
Multiplier M23(.out(Mult_out_array [23]),.clk(clk),.mul_en(MUL_EN[23]),.a(IF_map_array[23]),.b(KW_map_array[23]),.ovr(ovr[23]));
Multiplier M24(.out(Mult_out_array [24]),.clk(clk),.mul_en(MUL_EN[24]),.a(IF_map_array[24]),.b(KW_map_array[24]),.ovr(ovr[24]));
Multiplier M25(.out(Mult_out_array [25]),.clk(clk),.mul_en(MUL_EN[25]),.a(IF_map_array[25]),.b(KW_map_array[25]),.ovr(ovr[25]));
Multiplier M26(.out(Mult_out_array [26]),.clk(clk),.mul_en(MUL_EN[26]),.a(IF_map_array[26]),.b(KW_map_array[26]),.ovr(ovr[26]));
Multiplier M27(.out(Mult_out_array [27]),.clk(clk),.mul_en(MUL_EN[27]),.a(IF_map_array[27]),.b(KW_map_array[27]),.ovr(ovr[27]));
Multiplier M28(.out(Mult_out_array [28]),.clk(clk),.mul_en(MUL_EN[28]),.a(IF_map_array[28]),.b(KW_map_array[28]),.ovr(ovr[28]));
Multiplier M29(.out(Mult_out_array [29]),.clk(clk),.mul_en(MUL_EN[29]),.a(IF_map_array[29]),.b(KW_map_array[29]),.ovr(ovr[29]));
Multiplier M30(.out(Mult_out_array [30]),.clk(clk),.mul_en(MUL_EN[30]),.a(IF_map_array[30]),.b(KW_map_array[30]),.ovr(ovr[30]));
Multiplier M31(.out(Mult_out_array [31]),.clk(clk),.mul_en(MUL_EN[31]),.a(IF_map_array[31]),.b(KW_map_array[31]),.ovr(ovr[31]));
Multiplier M32(.out(Mult_out_array [32]),.clk(clk),.mul_en(MUL_EN[32]),.a(IF_map_array[32]),.b(KW_map_array[32]),.ovr(ovr[32]));
Multiplier M33(.out(Mult_out_array [33]),.clk(clk),.mul_en(MUL_EN[33]),.a(IF_map_array[33]),.b(KW_map_array[33]),.ovr(ovr[33]));
Multiplier M34(.out(Mult_out_array [34]),.clk(clk),.mul_en(MUL_EN[34]),.a(IF_map_array[34]),.b(KW_map_array[34]),.ovr(ovr[34]));
Multiplier M35(.out(Mult_out_array [35]),.clk(clk),.mul_en(MUL_EN[35]),.a(IF_map_array[35]),.b(KW_map_array[35]),.ovr(ovr[35]));
Multiplier M36(.out(Mult_out_array [36]),.clk(clk),.mul_en(MUL_EN[36]),.a(IF_map_array[36]),.b(KW_map_array[36]),.ovr(ovr[36]));
Multiplier M37(.out(Mult_out_array [37]),.clk(clk),.mul_en(MUL_EN[37]),.a(IF_map_array[37]),.b(KW_map_array[37]),.ovr(ovr[37]));
Multiplier M38(.out(Mult_out_array [38]),.clk(clk),.mul_en(MUL_EN[38]),.a(IF_map_array[38]),.b(KW_map_array[38]),.ovr(ovr[38]));
Multiplier M39(.out(Mult_out_array [39]),.clk(clk),.mul_en(MUL_EN[39]),.a(IF_map_array[39]),.b(KW_map_array[39]),.ovr(ovr[39]));
Multiplier M40(.out(Mult_out_array [40]),.clk(clk),.mul_en(MUL_EN[40]),.a(IF_map_array[40]),.b(KW_map_array[40]),.ovr(ovr[40]));
Multiplier M41(.out(Mult_out_array [41]),.clk(clk),.mul_en(MUL_EN[41]),.a(IF_map_array[41]),.b(KW_map_array[41]),.ovr(ovr[41]));
Multiplier M42(.out(Mult_out_array [42]),.clk(clk),.mul_en(MUL_EN[42]),.a(IF_map_array[42]),.b(KW_map_array[42]),.ovr(ovr[42]));
Multiplier M43(.out(Mult_out_array [43]),.clk(clk),.mul_en(MUL_EN[43]),.a(IF_map_array[43]),.b(KW_map_array[43]),.ovr(ovr[43]));
Multiplier M44(.out(Mult_out_array [44]),.clk(clk),.mul_en(MUL_EN[44]),.a(IF_map_array[44]),.b(KW_map_array[44]),.ovr(ovr[44]));
Multiplier M45(.out(Mult_out_array [45]),.clk(clk),.mul_en(MUL_EN[45]),.a(IF_map_array[45]),.b(KW_map_array[45]),.ovr(ovr[45]));
Multiplier M46(.out(Mult_out_array [46]),.clk(clk),.mul_en(MUL_EN[46]),.a(IF_map_array[46]),.b(KW_map_array[46]),.ovr(ovr[46]));
Multiplier M47(.out(Mult_out_array [47]),.clk(clk),.mul_en(MUL_EN[47]),.a(IF_map_array[47]),.b(KW_map_array[47]),.ovr(ovr[47]));
Multiplier M48(.out(Mult_out_array [48]),.clk(clk),.mul_en(MUL_EN[48]),.a(IF_map_array[48]),.b(KW_map_array[48]),.ovr(ovr[48]));
Multiplier M49(.out(Mult_out_array [49]),.clk(clk),.mul_en(MUL_EN[49]),.a(IF_map_array[49]),.b(KW_map_array[49]),.ovr(ovr[49]));
Multiplier M50(.out(Mult_out_array [50]),.clk(clk),.mul_en(MUL_EN[50]),.a(IF_map_array[50]),.b(KW_map_array[50]),.ovr(ovr[50]));
Multiplier M51(.out(Mult_out_array [51]),.clk(clk),.mul_en(MUL_EN[51]),.a(IF_map_array[51]),.b(KW_map_array[51]),.ovr(ovr[51]));
Multiplier M52(.out(Mult_out_array [52]),.clk(clk),.mul_en(MUL_EN[52]),.a(IF_map_array[52]),.b(KW_map_array[52]),.ovr(ovr[52]));
Multiplier M53(.out(Mult_out_array [53]),.clk(clk),.mul_en(MUL_EN[53]),.a(IF_map_array[53]),.b(KW_map_array[53]),.ovr(ovr[53]));
Multiplier M54(.out(Mult_out_array [54]),.clk(clk),.mul_en(MUL_EN[54]),.a(IF_map_array[54]),.b(KW_map_array[54]),.ovr(ovr[54]));
Multiplier M55(.out(Mult_out_array [55]),.clk(clk),.mul_en(MUL_EN[55]),.a(IF_map_array[55]),.b(KW_map_array[55]),.ovr(ovr[55]));
Multiplier M56(.out(Mult_out_array [56]),.clk(clk),.mul_en(MUL_EN[56]),.a(IF_map_array[56]),.b(KW_map_array[56]),.ovr(ovr[56]));
Multiplier M57(.out(Mult_out_array [57]),.clk(clk),.mul_en(MUL_EN[57]),.a(IF_map_array[57]),.b(KW_map_array[57]),.ovr(ovr[57]));
Multiplier M58(.out(Mult_out_array [58]),.clk(clk),.mul_en(MUL_EN[58]),.a(IF_map_array[58]),.b(KW_map_array[58]),.ovr(ovr[58]));
Multiplier M59(.out(Mult_out_array [59]),.clk(clk),.mul_en(MUL_EN[59]),.a(IF_map_array[59]),.b(KW_map_array[59]),.ovr(ovr[59]));
Multiplier M60(.out(Mult_out_array [60]),.clk(clk),.mul_en(MUL_EN[60]),.a(IF_map_array[60]),.b(KW_map_array[60]),.ovr(ovr[60]));
Multiplier M61(.out(Mult_out_array [61]),.clk(clk),.mul_en(MUL_EN[61]),.a(IF_map_array[61]),.b(KW_map_array[61]),.ovr(ovr[61]));
Multiplier M62(.out(Mult_out_array [62]),.clk(clk),.mul_en(MUL_EN[62]),.a(IF_map_array[62]),.b(KW_map_array[62]),.ovr(ovr[62]));
Multiplier M63(.out(Mult_out_array [63]),.clk(clk),.mul_en(MUL_EN[63]),.a(IF_map_array[63]),.b(KW_map_array[63]),.ovr(ovr[63]));

assign Overflow_Mul = ovr[0]  || ovr[1]  || ovr[2]  || ovr[3]  || ovr[4]  || ovr[5]  || ovr[6]  || ovr[7]  || 
				      ovr[8]  || ovr[9]  || ovr[10] || ovr[11] || ovr[12] || ovr[13] || ovr[14] || ovr[15] ||
					  ovr[16] || ovr[17] || ovr[18] || ovr[19] || ovr[20] || ovr[21] || ovr[22] || ovr[23] || 
					  ovr[24] || ovr[25] || ovr[26] || ovr[27] || ovr[28] || ovr[29] || ovr[30] || ovr[31] ||
					  ovr[32] || ovr[33] || ovr[34] || ovr[35] || ovr[36] || ovr[37] || ovr[38] || ovr[39] || 
					  ovr[40] || ovr[41] || ovr[42] || ovr[43] || ovr[44] || ovr[45] || ovr[46] || ovr[47] || 
					  ovr[48] || ovr[49] || ovr[50] || ovr[51] || ovr[52] || ovr[53] || ovr[54] || ovr[55] ||
					  ovr[56] || ovr[57] || ovr[58] || ovr[59] || ovr[60] || ovr[61] || ovr[62] || ovr[63];
endmodule