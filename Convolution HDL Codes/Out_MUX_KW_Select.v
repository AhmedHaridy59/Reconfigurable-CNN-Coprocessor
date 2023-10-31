//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 04/07/2021 05:43:44 PM
// Design Name: 
// Module Name: Out_MUX_KW_Select
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


module Out_MUX_KW_Select(
input [2:0] F,
input [383:0] ROM1_out,
input [383:0] ROM2_out,
input [383:0] ROM3_out,
input [383:0] ROM4_out,
input [383:0] ROM5_out,
input [383:0] ROM6_out,
input [383:0] ROM7_out,
input [383:0] ROM8_out,
output reg [383:0] ROM_KWSelect_Out
    );
    
always @(*)
begin
    case (F)
        3'b000: ROM_KWSelect_Out <= ROM1_out;
        3'b001: ROM_KWSelect_Out <= ROM2_out;
        3'b010: ROM_KWSelect_Out <= ROM3_out;
        3'b011: ROM_KWSelect_Out <= ROM4_out;
        3'b100: ROM_KWSelect_Out <= ROM5_out;
        3'b101: ROM_KWSelect_Out <= ROM6_out;
        3'b110: ROM_KWSelect_Out <= ROM7_out;
        3'b111: ROM_KWSelect_Out <= ROM8_out;   
    endcase
end

endmodule