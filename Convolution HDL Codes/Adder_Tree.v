//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 07/12/2021 02:23:29 PM
// Design Name: 
// Module Name: Adder_tree
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

module adder_tree 
#(parameter N = 32) // Data Width 
(
//inputs
input clk, reset,local_reset,
input [2047:0] data_in, //from multiplier
//output
output [N-1:0] result,
output Overflow_Add
);

wire [N-1:0] in [63:0]; //local array
assign {in[0], in[1],in[2],in[3],in[4],in[5],in[6],in[7],in[8],in[9],in[10],in[11],in[12],in[13],in[14],in[15],in[16],in[17],in[18],in[19],in[20],in[21],in[22],in[23],in[24],
          in[25],in[26],in[27],in[28],in[29],in[30],in[31],in[32],in[33],in[34],in[35],in[36],in[37],in[38], in[39], in[40], in[41], in[42], in[43], in[44], in[45], in[46],in[47], in[48],
          in[49], in[50], in[51], in[52], in[53], in[54], in[55], in[56], in[57], in[58], in[59], in[60], in[61], in[62], in[63]} = data_in ;
//internal wires
wire [N-1:0] s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32;
wire [N-1:0] s2_1,s2_2,s2_3,s2_4,s2_5,s2_6, s2_7,s2_8,s2_9,s2_10,s2_11,s2_12,s2_13,s2_14,s2_15,s2_16 ;
wire [N-1:0] s3_1,s3_2,s3_3,s3_4,s3_5,s3_6,s3_7,s3_8;
wire [N-1:0] s4_1,s4_2,s4_3,s4_4;
wire [N-1:0] s5_1,s5_2;
wire [62:0] Overflow;

//first level
Adder_Combo l1_1 (.in1(in[0]),  .in2(in[1]),  .sum(s1[N-1:0]),  .overflow(Overflow[0]));
Adder_Combo l1_2 (.in1(in[2]),  .in2(in[3]),  .sum(s2[N-1:0]),  .overflow(Overflow[1]));
Adder_Combo l1_3 (.in1(in[4]),  .in2(in[5]),  .sum(s3[N-1:0]),  .overflow(Overflow[2]));
Adder_Combo l1_4 (.in1(in[6]),  .in2(in[7]),  .sum(s4[N-1:0]),  .overflow(Overflow[3]));
Adder_Combo l1_5 (.in1(in[8]),  .in2(in[9]),  .sum(s5[N-1:0]),  .overflow(Overflow[4]));
Adder_Combo l1_6 (.in1(in[10]), .in2(in[11]), .sum(s6[N-1:0]),  .overflow(Overflow[5]));
Adder_Combo l1_7 (.in1(in[12]), .in2(in[13]), .sum(s7[N-1:0]),  .overflow(Overflow[6]));
Adder_Combo l1_8 (.in1(in[14]), .in2(in[15]), .sum(s8[N-1:0]),  .overflow(Overflow[7]));
Adder_Combo l1_9 (.in1(in[16]), .in2(in[17]), .sum(s9[N-1:0]),  .overflow(Overflow[8]));
Adder_Combo l1_10(.in1(in[18]), .in2(in[19]), .sum(s10[N-1:0]), .overflow(Overflow[9]));
Adder_Combo l1_11(.in1(in[20]), .in2(in[21]), .sum(s11[N-1:0]), .overflow(Overflow[10]));
Adder_Combo l1_12(.in1(in[22]), .in2(in[23]), .sum(s12[N-1:0]), .overflow(Overflow[11]));
Adder_Combo l1_13(.in1(in[24]), .in2(in[25]), .sum(s13[N-1:0]), .overflow(Overflow[12]));
Adder_Combo l1_14(.in1(in[26]), .in2(in[27]), .sum(s14[N-1:0]), .overflow(Overflow[13]));
Adder_Combo l1_15(.in1(in[28]), .in2(in[29]), .sum(s15[N-1:0]), .overflow(Overflow[14]));
Adder_Combo l1_16(.in1(in[30]), .in2(in[31]), .sum(s16[N-1:0]), .overflow(Overflow[15]));
Adder_Combo l1_17(.in1(in[32]), .in2(in[33]), .sum(s17[N-1:0]), .overflow(Overflow[16]));
Adder_Combo l1_18(.in1(in[34]), .in2(in[35]), .sum(s18[N-1:0]), .overflow(Overflow[17]));
Adder_Combo l1_19(.in1(in[36]), .in2(in[37]), .sum(s19[N-1:0]), .overflow(Overflow[18]));
Adder_Combo l1_20(.in1(in[38]), .in2(in[39]), .sum(s20[N-1:0]), .overflow(Overflow[19]));
Adder_Combo l1_21(.in1(in[40]), .in2(in[41]), .sum(s21[N-1:0]), .overflow(Overflow[20]));
Adder_Combo l1_22(.in1(in[42]), .in2(in[43]), .sum(s22[N-1:0]), .overflow(Overflow[21]));
Adder_Combo l1_23(.in1(in[44]), .in2(in[45]), .sum(s23[N-1:0]), .overflow(Overflow[22]));
Adder_Combo l1_24(.in1(in[46]), .in2(in[47]), .sum(s24[N-1:0]), .overflow(Overflow[23]));
Adder_Combo l1_25(.in1(in[48]), .in2(in[49]), .sum(s25[N-1:0]), .overflow(Overflow[24]));
Adder_Combo l1_26(.in1(in[50]), .in2(in[51]), .sum(s26[N-1:0]), .overflow(Overflow[25]));
Adder_Combo l1_27(.in1(in[52]), .in2(in[53]), .sum(s27[N-1:0]), .overflow(Overflow[26]));
Adder_Combo l1_28(.in1(in[54]), .in2(in[55]), .sum(s28[N-1:0]), .overflow(Overflow[27]));
Adder_Combo l1_29(.in1(in[56]), .in2(in[57]), .sum(s29[N-1:0]), .overflow(Overflow[28]));
Adder_Combo l1_30(.in1(in[58]), .in2(in[59]), .sum(s30[N-1:0]), .overflow(Overflow[29]));
Adder_Combo l1_31(.in1(in[60]), .in2(in[61]), .sum(s31[N-1:0]), .overflow(Overflow[30]));
Adder_Combo l1_32(.in1(in[62]), .in2(in[63]), .sum(s32[N-1:0]), .overflow(Overflow[31]));

//second level
Adder_Combo l2_1 (.in1(s1),  .in2(s2), .sum(s2_1[N-1:0]), .overflow(Overflow[32]));
Adder_Combo l2_2 (.in1(s3),  .in2(s4), .sum(s2_2[N-1:0]), .overflow(Overflow[33]));
Adder_Combo l2_3 (.in1(s5),  .in2(s6), .sum(s2_3[N-1:0]), .overflow(Overflow[34]));
Adder_Combo l2_4 (.in1(s7),  .in2(s8), .sum(s2_4[N-1:0]), .overflow(Overflow[35]));
Adder_Combo l2_5 (.in1(s9),  .in2(s10),.sum(s2_5[N-1:0]), .overflow(Overflow[36]));
Adder_Combo l2_6 (.in1(s11), .in2(s12),.sum(s2_6[N-1:0]), .overflow(Overflow[37]));
Adder_Combo l2_7 (.in1(s13), .in2(s14),.sum(s2_7[N-1:0]), .overflow(Overflow[38]));
Adder_Combo l2_8 (.in1(s15), .in2(s16),.sum(s2_8[N-1:0]), .overflow(Overflow[39]));
Adder_Combo l2_9 (.in1(s17), .in2(s18),.sum(s2_9[N-1:0]), .overflow(Overflow[40]));
Adder_Combo l2_10(.in1(s19), .in2(s20),.sum(s2_10[N-1:0]),.overflow(Overflow[41]));
Adder_Combo l2_11(.in1(s21), .in2(s22),.sum(s2_11[N-1:0]),.overflow(Overflow[42]));
Adder_Combo l2_12(.in1(s23), .in2(s24),.sum(s2_12[N-1:0]),.overflow(Overflow[43]));
Adder_Combo l2_13(.in1(s25), .in2(s26),.sum(s2_13[N-1:0]),.overflow(Overflow[44]));
Adder_Combo l2_14(.in1(s27), .in2(s28),.sum(s2_14[N-1:0]),.overflow(Overflow[45]));
Adder_Combo l2_15(.in1(s29), .in2(s30),.sum(s2_15[N-1:0]),.overflow(Overflow[46]));
Adder_Combo l2_16(.in1(s31), .in2(s32),.sum(s2_16[N-1:0]),.overflow(Overflow[47]));

//third level
Adder_Combo l3_1 (.in1(s2_1),  .in2(s2_2),  .sum(s3_1[N-1:0]),.overflow(Overflow[48]));
Adder_Combo l3_2 (.in1(s2_3),  .in2(s2_4),  .sum(s3_2[N-1:0]),.overflow(Overflow[49]));
Adder_Combo l3_3 (.in1(s2_5),  .in2(s2_6),  .sum(s3_3[N-1:0]),.overflow(Overflow[50]));
Adder_Combo l3_4 (.in1(s2_7),  .in2(s2_8),  .sum(s3_4[N-1:0]),.overflow(Overflow[51]));
Adder_Combo l3_5 (.in1(s2_9),  .in2(s2_10), .sum(s3_5[N-1:0]),.overflow(Overflow[52]));
Adder_Combo l3_6 (.in1(s2_11), .in2(s2_12), .sum(s3_6[N-1:0]),.overflow(Overflow[53]));
Adder_Combo l3_7 (.in1(s2_13), .in2(s2_14), .sum(s3_7[N-1:0]),.overflow(Overflow[54]));
Adder_Combo l3_8 (.in1(s2_15), .in2(s2_16), .sum(s3_8[N-1:0]),.overflow(Overflow[55]));

//fourth level
Adder_Combo l4_1 (.in1(s3_1), .in2(s3_2), .sum(s4_1[N-1:0]),.overflow(Overflow[56]));
Adder_Combo l4_2 (.in1(s3_3), .in2(s3_4), .sum(s4_2[N-1:0]),.overflow(Overflow[57]));
Adder_Combo l4_3 (.in1(s3_5), .in2(s3_6), .sum(s4_3[N-1:0]),.overflow(Overflow[58]));
Adder_Combo l4_4 (.in1(s3_7), .in2(s3_8), .sum(s4_4[N-1:0]),.overflow(Overflow[59]));
//fifth level
Adder_Combo l5_1 (.in1(s4_1), .in2(s4_2), .sum(s5_1[N-1:0]),.overflow(Overflow[60]));
Adder_Combo l5_2 (.in1(s4_3), .in2(s4_4),  .sum(s5_2[N-1:0]),.overflow(Overflow[61]));

//last level
Adder_Seq l6_1 (.clk(clk),.reset(reset),.local_reset(local_reset),.add_en(addq_en),.in1(s5_1), .in2(s5_2), .sum_f(result), .overflow(Overflow[62]));

// Overflow 
assign Overflow_Add = Overflow[0]  || Overflow[1]  || Overflow[2]  || Overflow[3]  || Overflow[4]  || Overflow[5]  || Overflow[6]  || Overflow[7]  || 
				      Overflow[8]  || Overflow[9]  || Overflow[10] || Overflow[11] || Overflow[12] || Overflow[13] || Overflow[14] || Overflow[15] ||
					  Overflow[16] || Overflow[17] || Overflow[18] || Overflow[19] || Overflow[20] || Overflow[21] || Overflow[22] || Overflow[23] || 
					  Overflow[24] || Overflow[25] || Overflow[26] || Overflow[27] || Overflow[28] || Overflow[29] || Overflow[30] || Overflow[31] ||
					  Overflow[32] || Overflow[33] || Overflow[34] || Overflow[35] || Overflow[36] || Overflow[37] || Overflow[38] || Overflow[39] || 
					  Overflow[40] || Overflow[41] || Overflow[42] || Overflow[43] || Overflow[44] || Overflow[45] || Overflow[46] || Overflow[47] || 
					  Overflow[48] || Overflow[49] || Overflow[50] || Overflow[51] || Overflow[52] || Overflow[53] || Overflow[54] || Overflow[55] ||
					  Overflow[56] || Overflow[57] || Overflow[58] || Overflow[59] || Overflow[60] || Overflow[61] || Overflow[62];



endmodule