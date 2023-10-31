//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy 
// 
// Create Date: 04/09/2021 05:21:02 PM
// Design Name: 
// Module Name: CTRL_CCT_KW_Load
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


module CTRL_CCT_KW_Load(
input 		      clk, 
input 		      reset, Counter_rst, // Asynchronous RESET and Counter LOCAL RESET
input 			  conv_enable, 		  // Reconfigurable controller Control signal
input      [2:0]  F, 				  // Filter Size
output reg [6:0] ROM_Address 
    );
    
reg [6:0] start_address, end_address;
reg read_flag ; 
wire Finish;    
 //////////////////////////// 5 bit Counter /////////////////////////////
always@(posedge clk or posedge reset)
begin
 if(reset || Counter_rst)
 begin
      ROM_Address<= 7'b0; 
	  read_flag<=1'b0;
 end
 else if (conv_enable) 
begin
        ROM_Address <= start_address;
		read_flag<=1'b1;
end
else if (Finish || ~read_flag) 
begin
        ROM_Address<= ROM_Address;
		read_flag<=1'b0;
end
else
        ROM_Address<= ROM_Address+7'b1;
end


////////////////////////////  Comparator ///////////////////////////////// 
assign Finish = (ROM_Address == end_address); 
    
///////////////////// Start Addresses MUX ////////////////////////////////
always @(*)
begin
    case (F)
        3'b000: start_address <= 7'd1; // F = 1
        3'b001: start_address <= 7'd9; // F = 2
        3'b010: start_address <= 7'd17; // F = 3
        3'b011: start_address <= 7'd25; // F = 4
        3'b100: start_address <= 7'd33; // F = 5
        3'b101: start_address <= 7'd41; // F = 6
        3'b110: start_address <= 7'd49; // F = 7
        3'b111: start_address <= 7'd57; // F = 8
    endcase
end

///////////////////// End Addresses MUX ////////////////////////////////
always @(*)
begin
    case (F)
        3'b000: end_address <= 7'd8; // F = 1
        3'b001: end_address <= 7'd16; // F = 2
        3'b010: end_address <= 7'd24; // F = 3
        3'b011: end_address <= 7'd32; // F = 4
        3'b100: end_address <= 7'd40; // F = 5
        3'b101: end_address <= 7'd48; // F = 6
        3'b110: end_address <= 7'd56; // F = 7
        3'b111: end_address <= 7'd64; // F = 8
    endcase
end
endmodule 
