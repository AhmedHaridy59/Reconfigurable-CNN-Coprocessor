//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2021 08:20:39 PM
// Design Name: 
// Module Name: Finish_MUX
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


module Finish_MUX(
input Finish_1,
input Finish_2,
input Finish_3,
input Finish_4,
input Finish_5,
input Finish_6,
input Finish_7,
input Finish_8,
input F,
output reg Finish
    );
    
    always@(*)
    begin
      case (F)
        3'b000: Finish <= Finish_1;
        3'b001: Finish <= Finish_2;
        3'b010: Finish <= Finish_3;
        3'b011: Finish <= Finish_4;
        3'b100: Finish <= Finish_5;
        3'b101: Finish <= Finish_6;
        3'b110: Finish <= Finish_7;
        3'b111: Finish <= Finish_8;
     endcase           
    end
    
    
endmodule



