//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 04/04/2021 02:13:37 AM
// Design Name: 
// Module Name: CTRL_CCT_KW_OPSelect
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


module CTRL_CCT_KW_OPSelect7(
input clk, 
input reset, Counter_rst, // Asynchronous RESET and Counter LOCAL RESET
input conv_enable, // Reconfigurable controller Control signal
input [7:0] N, // Feature size
output reg [22:0] ROM_Address, // Output 23 bit ROM Address
output Finish // FeedBack Signal to Reconfigurable controller
);


reg [22:0] start_address, end_address;


 //////////////////////////// 3 bit Auxiliary Counter //////////////////////
wire Counter_enable; 
reg [2:0] Out;// temporary value of the output of the register
reg Dont_count_flag;

always@(posedge clk or posedge reset)
begin
  if(reset || conv_enable)
  begin    
	  Out<= 3'b0;
	  Dont_count_flag<=1'b0;
  end  
  
  else if((Out == 3'b111))
  begin
      Out<= 3'b0;
	  Dont_count_flag<=1'b1;
  end
  
  else if(~Dont_count_flag)
     Out<= Out+3'b001;//-> else if inc is high and out!=7 ->increment
  else 
     Out<=Out;  
end

assign Counter_enable = (Out == 3'b111); 
reg read_flag ; 
 
//////////////////////////// 23 bit Counter /////////////////////////////

always@(posedge clk or posedge reset)
begin
 if(reset || Counter_rst)
 begin
      ROM_Address<= 17'b0; 
	  read_flag<=1'b0;
 end
 else if (Counter_enable) 
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
        ROM_Address<= ROM_Address+17'b1;
end

////////////////////////////  Comparator ///////////////////////////////// 
assign Finish = (ROM_Address == end_address);     


///////////////////// Start Addresses MUX ////////////////////////////////
always @(*)
begin
    case(N)
                    8'b00000110  : start_address <=23'd1 ; 
                    8'b00000111  : start_address <=23'd1 ; 
                    8'b00001000  : start_address <=23'd5 ; 
                    8'b00001001  : start_address <=23'd14 ; 
                    8'b00001010  : start_address <=23'd30 ; 
                    8'b00001011  : start_address <=23'd55 ; 
                    8'b00001100  : start_address <=23'd91 ; 
                    8'b00001101  : start_address <=23'd140 ; 
                    8'b00001110  : start_address <=23'd204 ; 
                    8'b00001111  : start_address <=23'd285 ; 
                    8'b00010000  : start_address <=23'd385 ; 
                    8'b00010001  : start_address <=23'd506 ; 
                    8'b00010010  : start_address <=23'd650 ; 
                    8'b00010011  : start_address <=23'd819 ; 
                    8'b00010100  : start_address <=23'd1015 ; 
                    8'b00010101  : start_address <=23'd1240 ; 
                    8'b00010110  : start_address <=23'd1496 ; 
                    8'b00010111  : start_address <=23'd1785 ; 
                    8'b00011000  : start_address <=23'd2109 ; 
                    8'b00011001  : start_address <=23'd2470 ; 
                    8'b00011010  : start_address <=23'd2870 ; 
                    8'b00011011  : start_address <=23'd3311 ; 
                    8'b00011100  : start_address <=23'd3795 ; 
                    8'b00011101  : start_address <=23'd4324 ; 
                    8'b00011110  : start_address <=23'd4900 ; 
                    8'b00011111  : start_address <=23'd5525 ; 
                    8'b00100000  : start_address <=23'd6201 ; 
                    8'b00100001  : start_address <=23'd6930 ; 
                    8'b00100010  : start_address <=23'd7714 ; 
                    8'b00100011  : start_address <=23'd8555 ; 
                    8'b00100100  : start_address <=23'd9455 ; 
                    8'b00100101  : start_address <=23'd10416 ; 
                    8'b00100110  : start_address <=23'd11440 ; 
                    8'b00100111  : start_address <=23'd12529 ; 
                    8'b00101000  : start_address <=23'd13685 ; 
                    8'b00101001  : start_address <=23'd14910 ; 
                    8'b00101010  : start_address <=23'd16206 ; 
                    8'b00101011  : start_address <=23'd17575 ; 
                    8'b00101100  : start_address <=23'd19019 ; 
                    8'b00101101  : start_address <=23'd20540 ; 
                    8'b00101110  : start_address <=23'd22140 ; 
                    8'b00101111  : start_address <=23'd23821 ; 
                    8'b00110000  : start_address <=23'd25585 ; 
                    8'b00110001  : start_address <=23'd27434 ; 
                    8'b00110010  : start_address <=23'd29370 ; 
                    8'b00110011  : start_address <=23'd31395 ; 
                    8'b00110100  : start_address <=23'd33511 ; 
                    8'b00110101  : start_address <=23'd35720 ; 
                    8'b00110110  : start_address <=23'd38024 ; 
                    8'b00110111  : start_address <=23'd40425 ; 
                    8'b00111000  : start_address <=23'd42925 ; 
                    8'b00111001  : start_address <=23'd45526 ; 
                    8'b00111010  : start_address <=23'd48230 ; 
                    8'b00111011  : start_address <=23'd51039 ; 
                    8'b00111100  : start_address <=23'd53955 ; 
                    8'b00111101  : start_address <=23'd56980 ; 
                    8'b00111110  : start_address <=23'd60116 ; 
                    8'b00111111  : start_address <=23'd63365 ; 
                    8'b01000000  : start_address <=23'd66729 ; 
                    8'b01000001  : start_address <=23'd70210 ; 
                    8'b01000010  : start_address <=23'd73810 ; 
                    8'b01000011  : start_address <=23'd77531 ; 
                    8'b01000100  : start_address <=23'd81375 ; 
                    8'b01000101  : start_address <=23'd85344 ; 
                    8'b01000110  : start_address <=23'd89440 ; 
                    8'b01000111  : start_address <=23'd93665 ; 
                    8'b01001000  : start_address <=23'd98021 ; 
                    8'b01001001  : start_address <=23'd102510 ; 
                    8'b01001010  : start_address <=23'd107134 ; 
                    8'b01001011  : start_address <=23'd111895 ; 
                    8'b01001100  : start_address <=23'd116795 ; 
                    8'b01001101  : start_address <=23'd121836 ; 
                    8'b01001110  : start_address <=23'd127020 ; 
                    8'b01001111  : start_address <=23'd132349 ; 
                    8'b01010000  : start_address <=23'd137825 ; 
                    8'b01010001  : start_address <=23'd143450 ; 
                    8'b01010010  : start_address <=23'd149226 ; 
                    8'b01010011  : start_address <=23'd155155 ; 
                    8'b01010100  : start_address <=23'd161239 ; 
                    8'b01010101  : start_address <=23'd167480 ; 
                    8'b01010110  : start_address <=23'd173880 ; 
                    8'b01010111  : start_address <=23'd180441 ; 
                    8'b01011000  : start_address <=23'd187165 ; 
                    8'b01011001  : start_address <=23'd194054 ; 
                    8'b01011010  : start_address <=23'd201110 ; 
                    8'b01011011  : start_address <=23'd208335 ; 
                    8'b01011100  : start_address <=23'd215731 ; 
                    8'b01011101  : start_address <=23'd223300 ; 
                    8'b01011110  : start_address <=23'd231044 ; 
                    8'b01011111  : start_address <=23'd238965 ; 
                    8'b01100000  : start_address <=23'd247065 ; 
                    8'b01100001  : start_address <=23'd255346 ; 
                    8'b01100010  : start_address <=23'd263810 ; 
                    8'b01100011  : start_address <=23'd272459 ; 
                    8'b01100100  : start_address <=23'd281295 ; 
                    8'b01100101  : start_address <=23'd290320 ; 
                    8'b01100110  : start_address <=23'd299536 ; 
                    8'b01100111  : start_address <=23'd308945 ; 
                    8'b01101000  : start_address <=23'd318549 ; 
                    8'b01101001  : start_address <=23'd328350 ; 
                    8'b01101010  : start_address <=23'd338350 ; 
                    8'b01101011  : start_address <=23'd348551 ; 
                    8'b01101100  : start_address <=23'd358955 ; 
                    8'b01101101  : start_address <=23'd369564 ; 
                    8'b01101110  : start_address <=23'd380380 ; 
                    8'b01101111  : start_address <=23'd391405 ; 
                    8'b01110000  : start_address <=23'd402641 ; 
                    8'b01110001  : start_address <=23'd414090 ; 
                    8'b01110010  : start_address <=23'd425754 ; 
                    8'b01110011  : start_address <=23'd437635 ; 
                    8'b01110100  : start_address <=23'd449735 ; 
                    8'b01110101  : start_address <=23'd462056 ; 
                    8'b01110110  : start_address <=23'd474600 ; 
                    8'b01110111  : start_address <=23'd487369 ; 
                    8'b01111000  : start_address <=23'd500365 ; 
                    8'b01111001  : start_address <=23'd513590 ; 
                    8'b01111010  : start_address <=23'd527046 ; 
                    8'b01111011  : start_address <=23'd540735 ; 
                    8'b01111100  : start_address <=23'd554659 ; 
                    8'b01111101  : start_address <=23'd568820 ; 
                    8'b01111110  : start_address <=23'd583220 ; 
                    8'b01111111  : start_address <=23'd597861 ; 
                    8'b10000000  : start_address <=23'd612745 ; 
                    8'b10000001  : start_address <=23'd627874 ; 
                    8'b10000010  : start_address <=23'd643250 ; 
                    8'b10000011  : start_address <=23'd658875 ; 
                    8'b10000100  : start_address <=23'd674751 ; 
                    8'b10000101  : start_address <=23'd690880 ; 
                    8'b10000110  : start_address <=23'd707264 ; 
                    8'b10000111  : start_address <=23'd723905 ; 
                    8'b10001000  : start_address <=23'd740805 ; 
                    8'b10001001  : start_address <=23'd757966 ; 
                    8'b10001010  : start_address <=23'd775390 ; 
                    8'b10001011  : start_address <=23'd793079 ; 
                    8'b10001100  : start_address <=23'd811035 ; 
                    8'b10001101  : start_address <=23'd829260 ; 
                    8'b10001110  : start_address <=23'd847756 ; 
                    8'b10001111  : start_address <=23'd866525 ; 
                    8'b10010000  : start_address <=23'd885569 ; 
                    8'b10010001  : start_address <=23'd904890 ; 
                    8'b10010010  : start_address <=23'd924490 ; 
                    8'b10010011  : start_address <=23'd944371 ; 
                    8'b10010100  : start_address <=23'd964535 ; 
                    8'b10010101  : start_address <=23'd984984 ; 
                    8'b10010110  : start_address <=23'd1005720 ; 
                    8'b10010111  : start_address <=23'd1026745 ; 
                    8'b10011000  : start_address <=23'd1048061 ; 
                    8'b10011001  : start_address <=23'd1069670 ; 
                    8'b10011010  : start_address <=23'd1091574 ; 
                    8'b10011011  : start_address <=23'd1113775 ; 
                    8'b10011100  : start_address <=23'd1136275 ; 
                    8'b10011101  : start_address <=23'd1159076 ; 
                    8'b10011110  : start_address <=23'd1182180 ; 
                    8'b10011111  : start_address <=23'd1205589 ; 
                    8'b10100000  : start_address <=23'd1229305 ; 
                    8'b10100001  : start_address <=23'd1253330 ; 
                    8'b10100010  : start_address <=23'd1277666 ; 
                    8'b10100011  : start_address <=23'd1302315 ; 
                    8'b10100100  : start_address <=23'd1327279 ; 
                    8'b10100101  : start_address <=23'd1352560 ; 
                    8'b10100110  : start_address <=23'd1378160 ; 
                    8'b10100111  : start_address <=23'd1404081 ; 
                    8'b10101000  : start_address <=23'd1430325 ; 
                    8'b10101001  : start_address <=23'd1456894 ; 
                    8'b10101010  : start_address <=23'd1483790 ; 
                    8'b10101011  : start_address <=23'd1511015 ; 
                    8'b10101100  : start_address <=23'd1538571 ; 
                    8'b10101101  : start_address <=23'd1566460 ; 
                    8'b10101110  : start_address <=23'd1594684 ; 
                    8'b10101111  : start_address <=23'd1623245 ; 
                    8'b10110000  : start_address <=23'd1652145 ; 
                    8'b10110001  : start_address <=23'd1681386 ; 
                    8'b10110010  : start_address <=23'd1710970 ; 
                    8'b10110011  : start_address <=23'd1740899 ; 
                    8'b10110100  : start_address <=23'd1771175 ; 
                    8'b10110101  : start_address <=23'd1801800 ; 
                    8'b10110110  : start_address <=23'd1832776 ; 
                    8'b10110111  : start_address <=23'd1864105 ; 
                    8'b10111000  : start_address <=23'd1895789 ; 
                    8'b10111001  : start_address <=23'd1927830 ; 
                    8'b10111010  : start_address <=23'd1960230 ; 
                    8'b10111011  : start_address <=23'd1992991 ; 
                    8'b10111100  : start_address <=23'd2026115 ; 
                    8'b10111101  : start_address <=23'd2059604 ; 
                    8'b10111110  : start_address <=23'd2093460 ; 
                    8'b10111111  : start_address <=23'd2127685 ; 
                    8'b11000000  : start_address <=23'd2162281 ; 
                    8'b11000001  : start_address <=23'd2197250 ; 
                    8'b11000010  : start_address <=23'd2232594 ; 
                    8'b11000011  : start_address <=23'd2268315 ; 
                    8'b11000100  : start_address <=23'd2304415 ; 
                    8'b11000101  : start_address <=23'd2340896 ; 
                    8'b11000110  : start_address <=23'd2377760 ; 
                    8'b11000111  : start_address <=23'd2415009 ; 
                    8'b11001000  : start_address <=23'd2452645 ; 
                    8'b11001001  : start_address <=23'd2490670 ; 
                    8'b11001010  : start_address <=23'd2529086 ; 
                    8'b11001011  : start_address <=23'd2567895 ; 
                    8'b11001100  : start_address <=23'd2607099 ; 
                    8'b11001101  : start_address <=23'd2646700 ; 
                    8'b11001110  : start_address <=23'd2686700 ; 
                    8'b11001111  : start_address <=23'd2727101 ; 
                    8'b11010000  : start_address <=23'd2767905 ; 
                    8'b11010001  : start_address <=23'd2809114 ; 
                    8'b11010010  : start_address <=23'd2850730 ; 
                    8'b11010011  : start_address <=23'd2892755 ; 
                    8'b11010100  : start_address <=23'd2935191 ; 
                    8'b11010101  : start_address <=23'd2978040 ; 
                    8'b11010110  : start_address <=23'd3021304 ; 
                    8'b11010111  : start_address <=23'd3064985 ; 
                    8'b11011000  : start_address <=23'd3109085 ; 
                    8'b11011001  : start_address <=23'd3153606 ; 
                    8'b11011010  : start_address <=23'd3198550 ; 
                    8'b11011011  : start_address <=23'd3243919 ; 
                    8'b11011100  : start_address <=23'd3289715 ; 
                    8'b11011101  : start_address <=23'd3335940 ; 
                    8'b11011110  : start_address <=23'd3382596 ; 
                    8'b11011111  : start_address <=23'd3429685 ; 
                    8'b11100000  : start_address <=23'd3477209 ; 
                    8'b11100001  : start_address <=23'd3525170 ; 
                    8'b11100010  : start_address <=23'd3573570 ; 
                    8'b11100011  : start_address <=23'd3622411 ; 
                    8'b11100100  : start_address <=23'd3671695 ; 
                    8'b11100101  : start_address <=23'd3721424 ; 
                    8'b11100110  : start_address <=23'd3771600 ; 
                    8'b11100111  : start_address <=23'd3822225 ; 
                    8'b11101000  : start_address <=23'd3873301 ; 
                    8'b11101001  : start_address <=23'd3924830 ; 
                    8'b11101010  : start_address <=23'd3976814 ; 
                    8'b11101011  : start_address <=23'd4029255 ; 
                    8'b11101100  : start_address <=23'd4082155 ; 
                    8'b11101101  : start_address <=23'd4135516 ; 
                    8'b11101110  : start_address <=23'd4189340 ; 
                    8'b11101111  : start_address <=23'd4243629 ; 
                    8'b11110000  : start_address <=23'd4298385 ; 
                    8'b11110001  : start_address <=23'd4353610 ; 
                    8'b11110010  : start_address <=23'd4409306 ; 
                    8'b11110011  : start_address <=23'd4465475 ; 
                    8'b11110100  : start_address <=23'd4522119 ; 
                    8'b11110101  : start_address <=23'd4579240 ; 
                    8'b11110110  : start_address <=23'd4636840 ; 
                    8'b11110111  : start_address <=23'd4694921 ; 
                    8'b11111000  : start_address <=23'd4753485 ; 
                    8'b11111001  : start_address <=23'd4812534 ; 
                    8'b11111010  : start_address <=23'd4872070 ; 
                    8'b11111011  : start_address <=23'd4932095 ; 
                    8'b11111100  : start_address <=23'd4992611 ; 
                    8'b11111101  : start_address <=23'd5053620 ; 
                    8'b11111110  : start_address <=23'd5115124 ; 
                    8'b11111111  : start_address <=23'd5177125 ; 
                    default      : start_address <=23'd0 ; 
    endcase
end

///////////////////// End Addresses MUX ////////////////////////////////

always @(*)
begin
    case(N)
                    8'b00000110  : end_address <=23'd1 ; 
                    8'b00000111  : end_address <=23'd4 ; 
                    8'b00001000  : end_address <=23'd13 ; 
                    8'b00001001  : end_address <=23'd29 ; 
                    8'b00001010  : end_address <=23'd54 ; 
                    8'b00001011  : end_address <=23'd90 ; 
                    8'b00001100  : end_address <=23'd139 ; 
                    8'b00001101  : end_address <=23'd203 ; 
                    8'b00001110  : end_address <=23'd284 ; 
                    8'b00001111  : end_address <=23'd384 ; 
                    8'b00010000  : end_address <=23'd505 ; 
                    8'b00010001  : end_address <=23'd649 ; 
                    8'b00010010  : end_address <=23'd818 ; 
                    8'b00010011  : end_address <=23'd1014 ; 
                    8'b00010100  : end_address <=23'd1239 ; 
                    8'b00010101  : end_address <=23'd1495 ; 
                    8'b00010110  : end_address <=23'd1784 ; 
                    8'b00010111  : end_address <=23'd2108 ; 
                    8'b00011000  : end_address <=23'd2469 ; 
                    8'b00011001  : end_address <=23'd2869 ; 
                    8'b00011010  : end_address <=23'd3310 ; 
                    8'b00011011  : end_address <=23'd3794 ; 
                    8'b00011100  : end_address <=23'd4323 ; 
                    8'b00011101  : end_address <=23'd4899 ; 
                    8'b00011110  : end_address <=23'd5524 ; 
                    8'b00011111  : end_address <=23'd6200 ; 
                    8'b00100000  : end_address <=23'd6929 ; 
                    8'b00100001  : end_address <=23'd7713 ; 
                    8'b00100010  : end_address <=23'd8554 ; 
                    8'b00100011  : end_address <=23'd9454 ; 
                    8'b00100100  : end_address <=23'd10415 ; 
                    8'b00100101  : end_address <=23'd11439 ; 
                    8'b00100110  : end_address <=23'd12528 ; 
                    8'b00100111  : end_address <=23'd13684 ; 
                    8'b00101000  : end_address <=23'd14909 ; 
                    8'b00101001  : end_address <=23'd16205 ; 
                    8'b00101010  : end_address <=23'd17574 ; 
                    8'b00101011  : end_address <=23'd19018 ; 
                    8'b00101100  : end_address <=23'd20539 ; 
                    8'b00101101  : end_address <=23'd22139 ; 
                    8'b00101110  : end_address <=23'd23820 ; 
                    8'b00101111  : end_address <=23'd25584 ; 
                    8'b00110000  : end_address <=23'd27433 ; 
                    8'b00110001  : end_address <=23'd29369 ; 
                    8'b00110010  : end_address <=23'd31394 ; 
                    8'b00110011  : end_address <=23'd33510 ; 
                    8'b00110100  : end_address <=23'd35719 ; 
                    8'b00110101  : end_address <=23'd38023 ; 
                    8'b00110110  : end_address <=23'd40424 ; 
                    8'b00110111  : end_address <=23'd42924 ; 
                    8'b00111000  : end_address <=23'd45525 ; 
                    8'b00111001  : end_address <=23'd48229 ; 
                    8'b00111010  : end_address <=23'd51038 ; 
                    8'b00111011  : end_address <=23'd53954 ; 
                    8'b00111100  : end_address <=23'd56979 ; 
                    8'b00111101  : end_address <=23'd60115 ; 
                    8'b00111110  : end_address <=23'd63364 ; 
                    8'b00111111  : end_address <=23'd66728 ; 
                    8'b01000000  : end_address <=23'd70209 ; 
                    8'b01000001  : end_address <=23'd73809 ; 
                    8'b01000010  : end_address <=23'd77530 ; 
                    8'b01000011  : end_address <=23'd81374 ; 
                    8'b01000100  : end_address <=23'd85343 ; 
                    8'b01000101  : end_address <=23'd89439 ; 
                    8'b01000110  : end_address <=23'd93664 ; 
                    8'b01000111  : end_address <=23'd98020 ; 
                    8'b01001000  : end_address <=23'd102509 ; 
                    8'b01001001  : end_address <=23'd107133 ; 
                    8'b01001010  : end_address <=23'd111894 ; 
                    8'b01001011  : end_address <=23'd116794 ; 
                    8'b01001100  : end_address <=23'd121835 ; 
                    8'b01001101  : end_address <=23'd127019 ; 
                    8'b01001110  : end_address <=23'd132348 ; 
                    8'b01001111  : end_address <=23'd137824 ; 
                    8'b01010000  : end_address <=23'd143449 ; 
                    8'b01010001  : end_address <=23'd149225 ; 
                    8'b01010010  : end_address <=23'd155154 ; 
                    8'b01010011  : end_address <=23'd161238 ; 
                    8'b01010100  : end_address <=23'd167479 ; 
                    8'b01010101  : end_address <=23'd173879 ; 
                    8'b01010110  : end_address <=23'd180440 ; 
                    8'b01010111  : end_address <=23'd187164 ; 
                    8'b01011000  : end_address <=23'd194053 ; 
                    8'b01011001  : end_address <=23'd201109 ; 
                    8'b01011010  : end_address <=23'd208334 ; 
                    8'b01011011  : end_address <=23'd215730 ; 
                    8'b01011100  : end_address <=23'd223299 ; 
                    8'b01011101  : end_address <=23'd231043 ; 
                    8'b01011110  : end_address <=23'd238964 ; 
                    8'b01011111  : end_address <=23'd247064 ; 
                    8'b01100000  : end_address <=23'd255345 ; 
                    8'b01100001  : end_address <=23'd263809 ; 
                    8'b01100010  : end_address <=23'd272458 ; 
                    8'b01100011  : end_address <=23'd281294 ; 
                    8'b01100100  : end_address <=23'd290319 ; 
                    8'b01100101  : end_address <=23'd299535 ; 
                    8'b01100110  : end_address <=23'd308944 ; 
                    8'b01100111  : end_address <=23'd318548 ; 
                    8'b01101000  : end_address <=23'd328349 ; 
                    8'b01101001  : end_address <=23'd338349 ; 
                    8'b01101010  : end_address <=23'd348550 ; 
                    8'b01101011  : end_address <=23'd358954 ; 
                    8'b01101100  : end_address <=23'd369563 ; 
                    8'b01101101  : end_address <=23'd380379 ; 
                    8'b01101110  : end_address <=23'd391404 ; 
                    8'b01101111  : end_address <=23'd402640 ; 
                    8'b01110000  : end_address <=23'd414089 ; 
                    8'b01110001  : end_address <=23'd425753 ; 
                    8'b01110010  : end_address <=23'd437634 ; 
                    8'b01110011  : end_address <=23'd449734 ; 
                    8'b01110100  : end_address <=23'd462055 ; 
                    8'b01110101  : end_address <=23'd474599 ; 
                    8'b01110110  : end_address <=23'd487368 ; 
                    8'b01110111  : end_address <=23'd500364 ; 
                    8'b01111000  : end_address <=23'd513589 ; 
                    8'b01111001  : end_address <=23'd527045 ; 
                    8'b01111010  : end_address <=23'd540734 ; 
                    8'b01111011  : end_address <=23'd554658 ; 
                    8'b01111100  : end_address <=23'd568819 ; 
                    8'b01111101  : end_address <=23'd583219 ; 
                    8'b01111110  : end_address <=23'd597860 ; 
                    8'b01111111  : end_address <=23'd612744 ; 
                    8'b10000000  : end_address <=23'd627873 ; 
                    8'b10000001  : end_address <=23'd643249 ; 
                    8'b10000010  : end_address <=23'd658874 ; 
                    8'b10000011  : end_address <=23'd674750 ; 
                    8'b10000100  : end_address <=23'd690879 ; 
                    8'b10000101  : end_address <=23'd707263 ; 
                    8'b10000110  : end_address <=23'd723904 ; 
                    8'b10000111  : end_address <=23'd740804 ; 
                    8'b10001000  : end_address <=23'd757965 ; 
                    8'b10001001  : end_address <=23'd775389 ; 
                    8'b10001010  : end_address <=23'd793078 ; 
                    8'b10001011  : end_address <=23'd811034 ; 
                    8'b10001100  : end_address <=23'd829259 ; 
                    8'b10001101  : end_address <=23'd847755 ; 
                    8'b10001110  : end_address <=23'd866524 ; 
                    8'b10001111  : end_address <=23'd885568 ; 
                    8'b10010000  : end_address <=23'd904889 ; 
                    8'b10010001  : end_address <=23'd924489 ; 
                    8'b10010010  : end_address <=23'd944370 ; 
                    8'b10010011  : end_address <=23'd964534 ; 
                    8'b10010100  : end_address <=23'd984983 ; 
                    8'b10010101  : end_address <=23'd1005719 ; 
                    8'b10010110  : end_address <=23'd1026744 ; 
                    8'b10010111  : end_address <=23'd1048060 ; 
                    8'b10011000  : end_address <=23'd1069669 ; 
                    8'b10011001  : end_address <=23'd1091573 ; 
                    8'b10011010  : end_address <=23'd1113774 ; 
                    8'b10011011  : end_address <=23'd1136274 ; 
                    8'b10011100  : end_address <=23'd1159075 ; 
                    8'b10011101  : end_address <=23'd1182179 ; 
                    8'b10011110  : end_address <=23'd1205588 ; 
                    8'b10011111  : end_address <=23'd1229304 ; 
                    8'b10100000  : end_address <=23'd1253329 ; 
                    8'b10100001  : end_address <=23'd1277665 ; 
                    8'b10100010  : end_address <=23'd1302314 ; 
                    8'b10100011  : end_address <=23'd1327278 ; 
                    8'b10100100  : end_address <=23'd1352559 ; 
                    8'b10100101  : end_address <=23'd1378159 ; 
                    8'b10100110  : end_address <=23'd1404080 ; 
                    8'b10100111  : end_address <=23'd1430324 ; 
                    8'b10101000  : end_address <=23'd1456893 ; 
                    8'b10101001  : end_address <=23'd1483789 ; 
                    8'b10101010  : end_address <=23'd1511014 ; 
                    8'b10101011  : end_address <=23'd1538570 ; 
                    8'b10101100  : end_address <=23'd1566459 ; 
                    8'b10101101  : end_address <=23'd1594683 ; 
                    8'b10101110  : end_address <=23'd1623244 ; 
                    8'b10101111  : end_address <=23'd1652144 ; 
                    8'b10110000  : end_address <=23'd1681385 ; 
                    8'b10110001  : end_address <=23'd1710969 ; 
                    8'b10110010  : end_address <=23'd1740898 ; 
                    8'b10110011  : end_address <=23'd1771174 ; 
                    8'b10110100  : end_address <=23'd1801799 ; 
                    8'b10110101  : end_address <=23'd1832775 ; 
                    8'b10110110  : end_address <=23'd1864104 ; 
                    8'b10110111  : end_address <=23'd1895788 ; 
                    8'b10111000  : end_address <=23'd1927829 ; 
                    8'b10111001  : end_address <=23'd1960229 ; 
                    8'b10111010  : end_address <=23'd1992990 ; 
                    8'b10111011  : end_address <=23'd2026114 ; 
                    8'b10111100  : end_address <=23'd2059603 ; 
                    8'b10111101  : end_address <=23'd2093459 ; 
                    8'b10111110  : end_address <=23'd2127684 ; 
                    8'b10111111  : end_address <=23'd2162280 ; 
                    8'b11000000  : end_address <=23'd2197249 ; 
                    8'b11000001  : end_address <=23'd2232593 ; 
                    8'b11000010  : end_address <=23'd2268314 ; 
                    8'b11000011  : end_address <=23'd2304414 ; 
                    8'b11000100  : end_address <=23'd2340895 ; 
                    8'b11000101  : end_address <=23'd2377759 ; 
                    8'b11000110  : end_address <=23'd2415008 ; 
                    8'b11000111  : end_address <=23'd2452644 ; 
                    8'b11001000  : end_address <=23'd2490669 ; 
                    8'b11001001  : end_address <=23'd2529085 ; 
                    8'b11001010  : end_address <=23'd2567894 ; 
                    8'b11001011  : end_address <=23'd2607098 ; 
                    8'b11001100  : end_address <=23'd2646699 ; 
                    8'b11001101  : end_address <=23'd2686699 ; 
                    8'b11001110  : end_address <=23'd2727100 ; 
                    8'b11001111  : end_address <=23'd2767904 ; 
                    8'b11010000  : end_address <=23'd2809113 ; 
                    8'b11010001  : end_address <=23'd2850729 ; 
                    8'b11010010  : end_address <=23'd2892754 ; 
                    8'b11010011  : end_address <=23'd2935190 ; 
                    8'b11010100  : end_address <=23'd2978039 ; 
                    8'b11010101  : end_address <=23'd3021303 ; 
                    8'b11010110  : end_address <=23'd3064984 ; 
                    8'b11010111  : end_address <=23'd3109084 ; 
                    8'b11011000  : end_address <=23'd3153605 ; 
                    8'b11011001  : end_address <=23'd3198549 ; 
                    8'b11011010  : end_address <=23'd3243918 ; 
                    8'b11011011  : end_address <=23'd3289714 ; 
                    8'b11011100  : end_address <=23'd3335939 ; 
                    8'b11011101  : end_address <=23'd3382595 ; 
                    8'b11011110  : end_address <=23'd3429684 ; 
                    8'b11011111  : end_address <=23'd3477208 ; 
                    8'b11100000  : end_address <=23'd3525169 ; 
                    8'b11100001  : end_address <=23'd3573569 ; 
                    8'b11100010  : end_address <=23'd3622410 ; 
                    8'b11100011  : end_address <=23'd3671694 ; 
                    8'b11100100  : end_address <=23'd3721423 ; 
                    8'b11100101  : end_address <=23'd3771599 ; 
                    8'b11100110  : end_address <=23'd3822224 ; 
                    8'b11100111  : end_address <=23'd3873300 ; 
                    8'b11101000  : end_address <=23'd3924829 ; 
                    8'b11101001  : end_address <=23'd3976813 ; 
                    8'b11101010  : end_address <=23'd4029254 ; 
                    8'b11101011  : end_address <=23'd4082154 ; 
                    8'b11101100  : end_address <=23'd4135515 ; 
                    8'b11101101  : end_address <=23'd4189339 ; 
                    8'b11101110  : end_address <=23'd4243628 ; 
                    8'b11101111  : end_address <=23'd4298384 ; 
                    8'b11110000  : end_address <=23'd4353609 ; 
                    8'b11110001  : end_address <=23'd4409305 ; 
                    8'b11110010  : end_address <=23'd4465474 ; 
                    8'b11110011  : end_address <=23'd4522118 ; 
                    8'b11110100  : end_address <=23'd4579239 ; 
                    8'b11110101  : end_address <=23'd4636839 ; 
                    8'b11110110  : end_address <=23'd4694920 ; 
                    8'b11110111  : end_address <=23'd4753484 ; 
                    8'b11111000  : end_address <=23'd4812533 ; 
                    8'b11111001  : end_address <=23'd4872069 ; 
                    8'b11111010  : end_address <=23'd4932094 ; 
                    8'b11111011  : end_address <=23'd4992610 ; 
                    8'b11111100  : end_address <=23'd5053619 ; 
                    8'b11111101  : end_address <=23'd5115123 ; 
                    8'b11111110  : end_address <=23'd5177124 ; 
                    8'b11111111  : end_address <=23'd5239624 ; 
                    default      : end_address <=23'd0 ;   
    endcase
end
endmodule


