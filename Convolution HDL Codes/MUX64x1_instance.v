module MUX64x1_instance (
input [64*16-1:0] Reg_Outs0,
input [5:0] MUX_Sel,
output reg [15:0] MUX_Out
  );

wire [15:0] Reg_Outs_Array [63:0];

assign {Reg_Outs_Array[63],Reg_Outs_Array[62],Reg_Outs_Array[61],Reg_Outs_Array[60],Reg_Outs_Array[59],Reg_Outs_Array[58],Reg_Outs_Array[57],Reg_Outs_Array[56],
        Reg_Outs_Array[55],Reg_Outs_Array[54],Reg_Outs_Array[53],Reg_Outs_Array[52],Reg_Outs_Array[51],Reg_Outs_Array[50],Reg_Outs_Array[49],Reg_Outs_Array[48],
        Reg_Outs_Array[47],Reg_Outs_Array[46],Reg_Outs_Array[45],Reg_Outs_Array[44],Reg_Outs_Array[43],Reg_Outs_Array[42],Reg_Outs_Array[41],Reg_Outs_Array[40],
        Reg_Outs_Array[39],Reg_Outs_Array[38],Reg_Outs_Array[37],Reg_Outs_Array[36],Reg_Outs_Array[35],Reg_Outs_Array[34],Reg_Outs_Array[33],Reg_Outs_Array[32],
        Reg_Outs_Array[31],Reg_Outs_Array[30],Reg_Outs_Array[29],Reg_Outs_Array[28],Reg_Outs_Array[27],Reg_Outs_Array[26],Reg_Outs_Array[25],Reg_Outs_Array[24],
        Reg_Outs_Array[23],Reg_Outs_Array[22],Reg_Outs_Array[21],Reg_Outs_Array[20],Reg_Outs_Array[19],Reg_Outs_Array[18],Reg_Outs_Array[17],Reg_Outs_Array[16],
        Reg_Outs_Array[15],Reg_Outs_Array[14],Reg_Outs_Array[13],Reg_Outs_Array[12],Reg_Outs_Array[11],Reg_Outs_Array[10],Reg_Outs_Array[9],Reg_Outs_Array[8],
        Reg_Outs_Array[7],Reg_Outs_Array[6],Reg_Outs_Array[5],Reg_Outs_Array[4],Reg_Outs_Array[3],Reg_Outs_Array[2],Reg_Outs_Array[1],Reg_Outs_Array[0]} = Reg_Outs0;
        
always @(*)
begin
    case (MUX_Sel)
      6'b000000: MUX_Out <=  Reg_Outs_Array[0];
      6'b000001: MUX_Out <=  Reg_Outs_Array[1];
      6'b000010: MUX_Out <=  Reg_Outs_Array[2];
      6'b000011: MUX_Out <=  Reg_Outs_Array[3];
      6'b000100: MUX_Out <=  Reg_Outs_Array[4];
      6'b000101: MUX_Out <=  Reg_Outs_Array[5];
      6'b000110: MUX_Out <=  Reg_Outs_Array[6];
      6'b000111: MUX_Out <=  Reg_Outs_Array[7];
      6'b001000: MUX_Out <=  Reg_Outs_Array[8];
      6'b001001: MUX_Out <=  Reg_Outs_Array[9];
      6'b001010: MUX_Out <=  Reg_Outs_Array[10];
      6'b001011: MUX_Out <=  Reg_Outs_Array[11];
      6'b001100: MUX_Out <=  Reg_Outs_Array[12];
      6'b001101: MUX_Out <=  Reg_Outs_Array[13];
      6'b001110: MUX_Out <=  Reg_Outs_Array[14];
      6'b001111: MUX_Out <=  Reg_Outs_Array[15];
      6'b010000: MUX_Out <=  Reg_Outs_Array[16];
      6'b010001: MUX_Out <=  Reg_Outs_Array[17];
      6'b010010: MUX_Out <=  Reg_Outs_Array[18];
      6'b010011: MUX_Out <=  Reg_Outs_Array[19];
      6'b010100: MUX_Out <=  Reg_Outs_Array[20];
      6'b010101: MUX_Out <=  Reg_Outs_Array[21];
      6'b010110: MUX_Out <=  Reg_Outs_Array[22];
      6'b010111: MUX_Out <=  Reg_Outs_Array[23];
      6'b011000: MUX_Out <=  Reg_Outs_Array[24];
      6'b011001: MUX_Out <=  Reg_Outs_Array[25];
      6'b011010: MUX_Out <=  Reg_Outs_Array[26];
      6'b011011: MUX_Out <=  Reg_Outs_Array[27];
      6'b011100: MUX_Out <=  Reg_Outs_Array[28];
      6'b011101: MUX_Out <=  Reg_Outs_Array[29];
      6'b011110: MUX_Out <=  Reg_Outs_Array[30];
      6'b011111: MUX_Out <=  Reg_Outs_Array[31];
      6'b100000: MUX_Out <=  Reg_Outs_Array[32];
      6'b100001: MUX_Out <=  Reg_Outs_Array[33];
      6'b100010: MUX_Out <=  Reg_Outs_Array[34];
      6'b100011: MUX_Out <=  Reg_Outs_Array[35];
      6'b100100: MUX_Out <=  Reg_Outs_Array[36];
      6'b100101: MUX_Out <=  Reg_Outs_Array[37];
      6'b100110: MUX_Out <=  Reg_Outs_Array[38];
      6'b100111: MUX_Out <=  Reg_Outs_Array[39];
      6'b101000: MUX_Out <=  Reg_Outs_Array[40];
      6'b101001: MUX_Out <=  Reg_Outs_Array[41];
      6'b101010: MUX_Out <=  Reg_Outs_Array[42];
      6'b101011: MUX_Out <=  Reg_Outs_Array[43];
      6'b101100: MUX_Out <=  Reg_Outs_Array[44];
      6'b101101: MUX_Out <=  Reg_Outs_Array[45];
      6'b101110: MUX_Out <=  Reg_Outs_Array[46];
      6'b101111: MUX_Out <=  Reg_Outs_Array[47];
      6'b110000: MUX_Out <=  Reg_Outs_Array[48];
      6'b110001: MUX_Out <=  Reg_Outs_Array[49];
      6'b110010: MUX_Out <=  Reg_Outs_Array[50];
      6'b110011: MUX_Out <=  Reg_Outs_Array[51];
      6'b110100: MUX_Out <=  Reg_Outs_Array[52];
      6'b110101: MUX_Out <=  Reg_Outs_Array[53];
      6'b110110: MUX_Out <=  Reg_Outs_Array[54];
      6'b110111: MUX_Out <=  Reg_Outs_Array[55];
      6'b111000: MUX_Out <=  Reg_Outs_Array[56];
      6'b111001: MUX_Out <=  Reg_Outs_Array[57];
      6'b111010: MUX_Out <=  Reg_Outs_Array[58];
      6'b111011: MUX_Out <=  Reg_Outs_Array[59];
      6'b111100: MUX_Out <=  Reg_Outs_Array[60];
      6'b111101: MUX_Out <=  Reg_Outs_Array[61];
      6'b111110: MUX_Out <=  Reg_Outs_Array[62];
      6'b111111: MUX_Out <=  Reg_Outs_Array[63];
          endcase


end  

endmodule

