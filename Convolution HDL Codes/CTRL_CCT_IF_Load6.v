//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 01/29/2021 05:06:57 PM
// Design Name: 
// Module Name: ctrl_sub_cct
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

module CTRL_CCT_IF_Load6 (
input 		      clk, 
input 		      reset, Counter_rst, // Asynchronous RESET and Counter LOCAL RESET
input 			  conv_enable, 		  // Reconfigurable controller Control signal 
input 	   [7:0]  N, 				  // Feature size = 256 = 8 bit
output reg [22:0] ROM_Address, 		  // Output 23 bit ROM Address
output 	      Finish 			  // FeedBack Signal to Reconfigurable controller
);
    
reg [22:0] start_address, end_address;
reg read_flag ; 
wire Internal_Finish;    
 //////////////////////////// 17 bit Counter /////////////////////////////
always@(posedge clk or posedge reset)
begin
 if(reset || Counter_rst)
 begin
      ROM_Address<= 23'b0; 
	  read_flag<=1'b0;
 end
 else if (conv_enable) 
begin
        ROM_Address <= start_address;
		read_flag<=1'b1;
end
else if (Internal_Finish || ~read_flag) 
begin
        ROM_Address<= ROM_Address;
		read_flag<=1'b0;
end
else
        ROM_Address<= ROM_Address+23'b1;
end


////////////////////////////  Comparator ///////////////////////////////// 
assign Internal_Finish = (ROM_Address == end_address);
 
//////////////////////////// Finish Feedback Signal //////////////////////
reg [1:0] Finish_Counter;
always @ (posedge clk or posedge reset)
begin 
 if (reset || Counter_rst)
      begin
        Finish_Counter <= 2'b0;
      end
 else if (Internal_Finish)
        Finish_Counter<=Finish_Counter+2'b1;
end

assign Finish = (Finish_Counter == 2'b10);

///////////////////// Start Addresses MUX ////////////////////////////////
always @(*)
begin
    case(N)
                    8'b00000101  : start_address <=23'd1 ; // N = 6 
                    8'b00000110  : start_address <=23'd1 ; 
                    8'b00000111  : start_address <=23'd12 ; 
                    8'b00001000  : start_address <=23'd28 ; 
                    8'b00001001  : start_address <=23'd51 ; 
                    8'b00001010  : start_address <=23'd83 ; 
                    8'b00001011  : start_address <=23'd126 ; 
                    8'b00001100  : start_address <=23'd182 ; 
                    8'b00001101  : start_address <=23'd253 ; 
                    8'b00001110  : start_address <=23'd341 ; 
                    8'b00001111  : start_address <=23'd448 ; 
                    8'b00010000  : start_address <=23'd576 ; 
                    8'b00010001  : start_address <=23'd727 ; 
                    8'b00010010  : start_address <=23'd903 ; 
                    8'b00010011  : start_address <=23'd1106 ; 
                    8'b00010100  : start_address <=23'd1338 ; 
                    8'b00010101  : start_address <=23'd1601 ; 
                    8'b00010110  : start_address <=23'd1897 ; 
                    8'b00010111  : start_address <=23'd2228 ; 
                    8'b00011000  : start_address <=23'd2596 ; 
                    8'b00011001  : start_address <=23'd3003 ; 
                    8'b00011010  : start_address <=23'd3451 ; 
                    8'b00011011  : start_address <=23'd3942 ; 
                    8'b00011100  : start_address <=23'd4478 ; 
                    8'b00011101  : start_address <=23'd5061 ; 
                    8'b00011110  : start_address <=23'd5693 ; 
                    8'b00011111  : start_address <=23'd6376 ; 
                    8'b00100000  : start_address <=23'd7112 ; 
                    8'b00100001  : start_address <=23'd7903 ; 
                    8'b00100010  : start_address <=23'd8751 ; 
                    8'b00100011  : start_address <=23'd9658 ; 
                    8'b00100100  : start_address <=23'd10626 ; 
                    8'b00100101  : start_address <=23'd11657 ; 
                    8'b00100110  : start_address <=23'd12753 ; 
                    8'b00100111  : start_address <=23'd13916 ; 
                    8'b00101000  : start_address <=23'd15148 ; 
                    8'b00101001  : start_address <=23'd16451 ; 
                    8'b00101010  : start_address <=23'd17827 ; 
                    8'b00101011  : start_address <=23'd19278 ; 
                    8'b00101100  : start_address <=23'd20806 ; 
                    8'b00101101  : start_address <=23'd22413 ; 
                    8'b00101110  : start_address <=23'd24101 ; 
                    8'b00101111  : start_address <=23'd25872 ; 
                    8'b00110000  : start_address <=23'd27728 ; 
                    8'b00110001  : start_address <=23'd29671 ; 
                    8'b00110010  : start_address <=23'd31703 ; 
                    8'b00110011  : start_address <=23'd33826 ; 
                    8'b00110100  : start_address <=23'd36042 ; 
                    8'b00110101  : start_address <=23'd38353 ; 
                    8'b00110110  : start_address <=23'd40761 ; 
                    8'b00110111  : start_address <=23'd43268 ; 
                    8'b00111000  : start_address <=23'd45876 ; 
                    8'b00111001  : start_address <=23'd48587 ; 
                    8'b00111010  : start_address <=23'd51403 ; 
                    8'b00111011  : start_address <=23'd54326 ; 
                    8'b00111100  : start_address <=23'd57358 ; 
                    8'b00111101  : start_address <=23'd60501 ; 
                    8'b00111110  : start_address <=23'd63757 ; 
                    8'b00111111  : start_address <=23'd67128 ; 
                    8'b01000000  : start_address <=23'd70616 ; 
                    8'b01000001  : start_address <=23'd74223 ; 
                    8'b01000010  : start_address <=23'd77951 ; 
                    8'b01000011  : start_address <=23'd81802 ; 
                    8'b01000100  : start_address <=23'd85778 ; 
                    8'b01000101  : start_address <=23'd89881 ; 
                    8'b01000110  : start_address <=23'd94113 ; 
                    8'b01000111  : start_address <=23'd98476 ; 
                    8'b01001000  : start_address <=23'd102972 ; 
                    8'b01001001  : start_address <=23'd107603 ; 
                    8'b01001010  : start_address <=23'd112371 ; 
                    8'b01001011  : start_address <=23'd117278 ; 
                    8'b01001100  : start_address <=23'd122326 ; 
                    8'b01001101  : start_address <=23'd127517 ; 
                    8'b01001110  : start_address <=23'd132853 ; 
                    8'b01001111  : start_address <=23'd138336 ; 
                    8'b01010000  : start_address <=23'd143968 ; 
                    8'b01010001  : start_address <=23'd149751 ; 
                    8'b01010010  : start_address <=23'd155687 ; 
                    8'b01010011  : start_address <=23'd161778 ; 
                    8'b01010100  : start_address <=23'd168026 ; 
                    8'b01010101  : start_address <=23'd174433 ; 
                    8'b01010110  : start_address <=23'd181001 ; 
                    8'b01010111  : start_address <=23'd187732 ; 
                    8'b01011000  : start_address <=23'd194628 ; 
                    8'b01011001  : start_address <=23'd201691 ; 
                    8'b01011010  : start_address <=23'd208923 ; 
                    8'b01011011  : start_address <=23'd216326 ; 
                    8'b01011100  : start_address <=23'd223902 ; 
                    8'b01011101  : start_address <=23'd231653 ; 
                    8'b01011110  : start_address <=23'd239581 ; 
                    8'b01011111  : start_address <=23'd247688 ; 
                    8'b01100000  : start_address <=23'd255976 ; 
                    8'b01100001  : start_address <=23'd264447 ; 
                    8'b01100010  : start_address <=23'd273103 ; 
                    8'b01100011  : start_address <=23'd281946 ; 
                    8'b01100100  : start_address <=23'd290978 ; 
                    8'b01100101  : start_address <=23'd300201 ; 
                    8'b01100110  : start_address <=23'd309617 ; 
                    8'b01100111  : start_address <=23'd319228 ; 
                    8'b01101000  : start_address <=23'd329036 ; 
                    8'b01101001  : start_address <=23'd339043 ; 
                    8'b01101010  : start_address <=23'd349251 ; 
                    8'b01101011  : start_address <=23'd359662 ; 
                    8'b01101100  : start_address <=23'd370278 ; 
                    8'b01101101  : start_address <=23'd381101 ; 
                    8'b01101110  : start_address <=23'd392133 ; 
                    8'b01101111  : start_address <=23'd403376 ; 
                    8'b01110000  : start_address <=23'd414832 ; 
                    8'b01110001  : start_address <=23'd426503 ; 
                    8'b01110010  : start_address <=23'd438391 ; 
                    8'b01110011  : start_address <=23'd450498 ; 
                    8'b01110100  : start_address <=23'd462826 ; 
                    8'b01110101  : start_address <=23'd475377 ; 
                    8'b01110110  : start_address <=23'd488153 ; 
                    8'b01110111  : start_address <=23'd501156 ; 
                    8'b01111000  : start_address <=23'd514388 ; 
                    8'b01111001  : start_address <=23'd527851 ; 
                    8'b01111010  : start_address <=23'd541547 ; 
                    8'b01111011  : start_address <=23'd555478 ; 
                    8'b01111100  : start_address <=23'd569646 ; 
                    8'b01111101  : start_address <=23'd584053 ; 
                    8'b01111110  : start_address <=23'd598701 ; 
                    8'b01111111  : start_address <=23'd613592 ; 
                    8'b10000000  : start_address <=23'd628728 ; 
                    8'b10000001  : start_address <=23'd644111 ; 
                    8'b10000010  : start_address <=23'd659743 ; 
                    8'b10000011  : start_address <=23'd675626 ; 
                    8'b10000100  : start_address <=23'd691762 ; 
                    8'b10000101  : start_address <=23'd708153 ; 
                    8'b10000110  : start_address <=23'd724801 ; 
                    8'b10000111  : start_address <=23'd741708 ; 
                    8'b10001000  : start_address <=23'd758876 ; 
                    8'b10001001  : start_address <=23'd776307 ; 
                    8'b10001010  : start_address <=23'd794003 ; 
                    8'b10001011  : start_address <=23'd811966 ; 
                    8'b10001100  : start_address <=23'd830198 ; 
                    8'b10001101  : start_address <=23'd848701 ; 
                    8'b10001110  : start_address <=23'd867477 ; 
                    8'b10001111  : start_address <=23'd886528 ; 
                    8'b10010000  : start_address <=23'd905856 ; 
                    8'b10010001  : start_address <=23'd925463 ; 
                    8'b10010010  : start_address <=23'd945351 ; 
                    8'b10010011  : start_address <=23'd965522 ; 
                    8'b10010100  : start_address <=23'd985978 ; 
                    8'b10010101  : start_address <=23'd1006721 ; 
                    8'b10010110  : start_address <=23'd1027753 ; 
                    8'b10010111  : start_address <=23'd1049076 ; 
                    8'b10011000  : start_address <=23'd1070692 ; 
                    8'b10011001  : start_address <=23'd1092603 ; 
                    8'b10011010  : start_address <=23'd1114811 ; 
                    8'b10011011  : start_address <=23'd1137318 ; 
                    8'b10011100  : start_address <=23'd1160126 ; 
                    8'b10011101  : start_address <=23'd1183237 ; 
                    8'b10011110  : start_address <=23'd1206653 ; 
                    8'b10011111  : start_address <=23'd1230376 ; 
                    8'b10100000  : start_address <=23'd1254408 ; 
                    8'b10100001  : start_address <=23'd1278751 ; 
                    8'b10100010  : start_address <=23'd1303407 ; 
                    8'b10100011  : start_address <=23'd1328378 ; 
                    8'b10100100  : start_address <=23'd1353666 ; 
                    8'b10100101  : start_address <=23'd1379273 ; 
                    8'b10100110  : start_address <=23'd1405201 ; 
                    8'b10100111  : start_address <=23'd1431452 ; 
                    8'b10101000  : start_address <=23'd1458028 ; 
                    8'b10101001  : start_address <=23'd1484931 ; 
                    8'b10101010  : start_address <=23'd1512163 ; 
                    8'b10101011  : start_address <=23'd1539726 ; 
                    8'b10101100  : start_address <=23'd1567622 ; 
                    8'b10101101  : start_address <=23'd1595853 ; 
                    8'b10101110  : start_address <=23'd1624421 ; 
                    8'b10101111  : start_address <=23'd1653328 ; 
                    8'b10110000  : start_address <=23'd1682576 ; 
                    8'b10110001  : start_address <=23'd1712167 ; 
                    8'b10110010  : start_address <=23'd1742103 ; 
                    8'b10110011  : start_address <=23'd1772386 ; 
                    8'b10110100  : start_address <=23'd1803018 ; 
                    8'b10110101  : start_address <=23'd1834001 ; 
                    8'b10110110  : start_address <=23'd1865337 ; 
                    8'b10110111  : start_address <=23'd1897028 ; 
                    8'b10111000  : start_address <=23'd1929076 ; 
                    8'b10111001  : start_address <=23'd1961483 ; 
                    8'b10111010  : start_address <=23'd1994251 ; 
                    8'b10111011  : start_address <=23'd2027382 ; 
                    8'b10111100  : start_address <=23'd2060878 ; 
                    8'b10111101  : start_address <=23'd2094741 ; 
                    8'b10111110  : start_address <=23'd2128973 ; 
                    8'b10111111  : start_address <=23'd2163576 ; 
                    8'b11000000  : start_address <=23'd2198552 ; 
                    8'b11000001  : start_address <=23'd2233903 ; 
                    8'b11000010  : start_address <=23'd2269631 ; 
                    8'b11000011  : start_address <=23'd2305738 ; 
                    8'b11000100  : start_address <=23'd2342226 ; 
                    8'b11000101  : start_address <=23'd2379097 ; 
                    8'b11000110  : start_address <=23'd2416353 ; 
                    8'b11000111  : start_address <=23'd2453996 ; 
                    8'b11001000  : start_address <=23'd2492028 ; 
                    8'b11001001  : start_address <=23'd2530451 ; 
                    8'b11001010  : start_address <=23'd2569267 ; 
                    8'b11001011  : start_address <=23'd2608478 ; 
                    8'b11001100  : start_address <=23'd2648086 ; 
                    8'b11001101  : start_address <=23'd2688093 ; 
                    8'b11001110  : start_address <=23'd2728501 ; 
                    8'b11001111  : start_address <=23'd2769312 ; 
                    8'b11010000  : start_address <=23'd2810528 ; 
                    8'b11010001  : start_address <=23'd2852151 ; 
                    8'b11010010  : start_address <=23'd2894183 ; 
                    8'b11010011  : start_address <=23'd2936626 ; 
                    8'b11010100  : start_address <=23'd2979482 ; 
                    8'b11010101  : start_address <=23'd3022753 ; 
                    8'b11010110  : start_address <=23'd3066441 ; 
                    8'b11010111  : start_address <=23'd3110548 ; 
                    8'b11011000  : start_address <=23'd3155076 ; 
                    8'b11011001  : start_address <=23'd3200027 ; 
                    8'b11011010  : start_address <=23'd3245403 ; 
                    8'b11011011  : start_address <=23'd3291206 ; 
                    8'b11011100  : start_address <=23'd3337438 ; 
                    8'b11011101  : start_address <=23'd3384101 ; 
                    8'b11011110  : start_address <=23'd3431197 ; 
                    8'b11011111  : start_address <=23'd3478728 ; 
                    8'b11100000  : start_address <=23'd3526696 ; 
                    8'b11100001  : start_address <=23'd3575103 ; 
                    8'b11100010  : start_address <=23'd3623951 ; 
                    8'b11100011  : start_address <=23'd3673242 ; 
                    8'b11100100  : start_address <=23'd3722978 ; 
                    8'b11100101  : start_address <=23'd3773161 ; 
                    8'b11100110  : start_address <=23'd3823793 ; 
                    8'b11100111  : start_address <=23'd3874876 ; 
                    8'b11101000  : start_address <=23'd3926412 ; 
                    8'b11101001  : start_address <=23'd3978403 ; 
                    8'b11101010  : start_address <=23'd4030851 ; 
                    8'b11101011  : start_address <=23'd4083758 ; 
                    8'b11101100  : start_address <=23'd4137126 ; 
                    8'b11101101  : start_address <=23'd4190957 ; 
                    8'b11101110  : start_address <=23'd4245253 ; 
                    8'b11101111  : start_address <=23'd4300016 ; 
                    8'b11110000  : start_address <=23'd4355248 ; 
                    8'b11110001  : start_address <=23'd4410951 ; 
                    8'b11110010  : start_address <=23'd4467127 ; 
                    8'b11110011  : start_address <=23'd4523778 ; 
                    8'b11110100  : start_address <=23'd4580906 ; 
                    8'b11110101  : start_address <=23'd4638513 ; 
                    8'b11110110  : start_address <=23'd4696601 ; 
                    8'b11110111  : start_address <=23'd4755172 ; 
                    8'b11111000  : start_address <=23'd4814228 ; 
                    8'b11111001  : start_address <=23'd4873771 ; 
                    8'b11111010  : start_address <=23'd4933803 ; 
                    8'b11111011  : start_address <=23'd4994326 ; 
                    8'b11111100  : start_address <=23'd5055342 ; 
                    8'b11111101  : start_address <=23'd5116853 ; 
                    8'b11111110  : start_address <=23'd5178861 ; 
                    8'b11111111  : start_address <=23'd5241368 ; 
                    default      : start_address <=23'd0 ; // N =1,2,3,4,5 are forbideen cases  
    endcase
end

///////////////////// End Addresses MUX ////////////////////////////////
always @(*)
begin
    case(N)
                    8'b00000101  : end_address <=23'd8 ; 
                    8'b00000110  : end_address <=23'd11 ; 
                    8'b00000111  : end_address <=23'd27 ; 
                    8'b00001000  : end_address <=23'd50 ; 
                    8'b00001001  : end_address <=23'd82 ; 
                    8'b00001010  : end_address <=23'd125 ; 
                    8'b00001011  : end_address <=23'd181 ; 
                    8'b00001100  : end_address <=23'd252 ; 
                    8'b00001101  : end_address <=23'd340 ; 
                    8'b00001110  : end_address <=23'd447 ; 
                    8'b00001111  : end_address <=23'd575 ; 
                    8'b00010000  : end_address <=23'd726 ; 
                    8'b00010001  : end_address <=23'd902 ; 
                    8'b00010010  : end_address <=23'd1105 ; 
                    8'b00010011  : end_address <=23'd1337 ; 
                    8'b00010100  : end_address <=23'd1600 ; 
                    8'b00010101  : end_address <=23'd1896 ; 
                    8'b00010110  : end_address <=23'd2227 ; 
                    8'b00010111  : end_address <=23'd2595 ; 
                    8'b00011000  : end_address <=23'd3002 ; 
                    8'b00011001  : end_address <=23'd3450 ; 
                    8'b00011010  : end_address <=23'd3941 ; 
                    8'b00011011  : end_address <=23'd4477 ; 
                    8'b00011100  : end_address <=23'd5060 ; 
                    8'b00011101  : end_address <=23'd5692 ; 
                    8'b00011110  : end_address <=23'd6375 ; 
                    8'b00011111  : end_address <=23'd7111 ; 
                    8'b00100000  : end_address <=23'd7902 ; 
                    8'b00100001  : end_address <=23'd8750 ; 
                    8'b00100010  : end_address <=23'd9657 ; 
                    8'b00100011  : end_address <=23'd10625 ; 
                    8'b00100100  : end_address <=23'd11656 ; 
                    8'b00100101  : end_address <=23'd12752 ; 
                    8'b00100110  : end_address <=23'd13915 ; 
                    8'b00100111  : end_address <=23'd15147 ; 
                    8'b00101000  : end_address <=23'd16450 ; 
                    8'b00101001  : end_address <=23'd17826 ; 
                    8'b00101010  : end_address <=23'd19277 ; 
                    8'b00101011  : end_address <=23'd20805 ; 
                    8'b00101100  : end_address <=23'd22412 ; 
                    8'b00101101  : end_address <=23'd24100 ; 
                    8'b00101110  : end_address <=23'd25871 ; 
                    8'b00101111  : end_address <=23'd27727 ; 
                    8'b00110000  : end_address <=23'd29670 ; 
                    8'b00110001  : end_address <=23'd31702 ; 
                    8'b00110010  : end_address <=23'd33825 ; 
                    8'b00110011  : end_address <=23'd36041 ; 
                    8'b00110100  : end_address <=23'd38352 ; 
                    8'b00110101  : end_address <=23'd40760 ; 
                    8'b00110110  : end_address <=23'd43267 ; 
                    8'b00110111  : end_address <=23'd45875 ; 
                    8'b00111000  : end_address <=23'd48586 ; 
                    8'b00111001  : end_address <=23'd51402 ; 
                    8'b00111010  : end_address <=23'd54325 ; 
                    8'b00111011  : end_address <=23'd57357 ; 
                    8'b00111100  : end_address <=23'd60500 ; 
                    8'b00111101  : end_address <=23'd63756 ; 
                    8'b00111110  : end_address <=23'd67127 ; 
                    8'b00111111  : end_address <=23'd70615 ; 
                    8'b01000000  : end_address <=23'd74222 ; 
                    8'b01000001  : end_address <=23'd77950 ; 
                    8'b01000010  : end_address <=23'd81801 ; 
                    8'b01000011  : end_address <=23'd85777 ; 
                    8'b01000100  : end_address <=23'd89880 ; 
                    8'b01000101  : end_address <=23'd94112 ; 
                    8'b01000110  : end_address <=23'd98475 ; 
                    8'b01000111  : end_address <=23'd102971 ; 
                    8'b01001000  : end_address <=23'd107602 ; 
                    8'b01001001  : end_address <=23'd112370 ; 
                    8'b01001010  : end_address <=23'd117277 ; 
                    8'b01001011  : end_address <=23'd122325 ; 
                    8'b01001100  : end_address <=23'd127516 ; 
                    8'b01001101  : end_address <=23'd132852 ; 
                    8'b01001110  : end_address <=23'd138335 ; 
                    8'b01001111  : end_address <=23'd143967 ; 
                    8'b01010000  : end_address <=23'd149750 ; 
                    8'b01010001  : end_address <=23'd155686 ; 
                    8'b01010010  : end_address <=23'd161777 ; 
                    8'b01010011  : end_address <=23'd168025 ; 
                    8'b01010100  : end_address <=23'd174432 ; 
                    8'b01010101  : end_address <=23'd181000 ; 
                    8'b01010110  : end_address <=23'd187731 ; 
                    8'b01010111  : end_address <=23'd194627 ; 
                    8'b01011000  : end_address <=23'd201690 ; 
                    8'b01011001  : end_address <=23'd208922 ; 
                    8'b01011010  : end_address <=23'd216325 ; 
                    8'b01011011  : end_address <=23'd223901 ; 
                    8'b01011100  : end_address <=23'd231652 ; 
                    8'b01011101  : end_address <=23'd239580 ; 
                    8'b01011110  : end_address <=23'd247687 ; 
                    8'b01011111  : end_address <=23'd255975 ; 
                    8'b01100000  : end_address <=23'd264446 ; 
                    8'b01100001  : end_address <=23'd273102 ; 
                    8'b01100010  : end_address <=23'd281945 ; 
                    8'b01100011  : end_address <=23'd290977 ; 
                    8'b01100100  : end_address <=23'd300200 ; 
                    8'b01100101  : end_address <=23'd309616 ; 
                    8'b01100110  : end_address <=23'd319227 ; 
                    8'b01100111  : end_address <=23'd329035 ; 
                    8'b01101000  : end_address <=23'd339042 ; 
                    8'b01101001  : end_address <=23'd349250 ; 
                    8'b01101010  : end_address <=23'd359661 ; 
                    8'b01101011  : end_address <=23'd370277 ; 
                    8'b01101100  : end_address <=23'd381100 ; 
                    8'b01101101  : end_address <=23'd392132 ; 
                    8'b01101110  : end_address <=23'd403375 ; 
                    8'b01101111  : end_address <=23'd414831 ; 
                    8'b01110000  : end_address <=23'd426502 ; 
                    8'b01110001  : end_address <=23'd438390 ; 
                    8'b01110010  : end_address <=23'd450497 ; 
                    8'b01110011  : end_address <=23'd462825 ; 
                    8'b01110100  : end_address <=23'd475376 ; 
                    8'b01110101  : end_address <=23'd488152 ; 
                    8'b01110110  : end_address <=23'd501155 ; 
                    8'b01110111  : end_address <=23'd514387 ; 
                    8'b01111000  : end_address <=23'd527850 ; 
                    8'b01111001  : end_address <=23'd541546 ; 
                    8'b01111010  : end_address <=23'd555477 ; 
                    8'b01111011  : end_address <=23'd569645 ; 
                    8'b01111100  : end_address <=23'd584052 ; 
                    8'b01111101  : end_address <=23'd598700 ; 
                    8'b01111110  : end_address <=23'd613591 ; 
                    8'b01111111  : end_address <=23'd628727 ; 
                    8'b10000000  : end_address <=23'd644110 ; 
                    8'b10000001  : end_address <=23'd659742 ; 
                    8'b10000010  : end_address <=23'd675625 ; 
                    8'b10000011  : end_address <=23'd691761 ; 
                    8'b10000100  : end_address <=23'd708152 ; 
                    8'b10000101  : end_address <=23'd724800 ; 
                    8'b10000110  : end_address <=23'd741707 ; 
                    8'b10000111  : end_address <=23'd758875 ; 
                    8'b10001000  : end_address <=23'd776306 ; 
                    8'b10001001  : end_address <=23'd794002 ; 
                    8'b10001010  : end_address <=23'd811965 ; 
                    8'b10001011  : end_address <=23'd830197 ; 
                    8'b10001100  : end_address <=23'd848700 ; 
                    8'b10001101  : end_address <=23'd867476 ; 
                    8'b10001110  : end_address <=23'd886527 ; 
                    8'b10001111  : end_address <=23'd905855 ; 
                    8'b10010000  : end_address <=23'd925462 ; 
                    8'b10010001  : end_address <=23'd945350 ; 
                    8'b10010010  : end_address <=23'd965521 ; 
                    8'b10010011  : end_address <=23'd985977 ; 
                    8'b10010100  : end_address <=23'd1006720 ; 
                    8'b10010101  : end_address <=23'd1027752 ; 
                    8'b10010110  : end_address <=23'd1049075 ; 
                    8'b10010111  : end_address <=23'd1070691 ; 
                    8'b10011000  : end_address <=23'd1092602 ; 
                    8'b10011001  : end_address <=23'd1114810 ; 
                    8'b10011010  : end_address <=23'd1137317 ; 
                    8'b10011011  : end_address <=23'd1160125 ; 
                    8'b10011100  : end_address <=23'd1183236 ; 
                    8'b10011101  : end_address <=23'd1206652 ; 
                    8'b10011110  : end_address <=23'd1230375 ; 
                    8'b10011111  : end_address <=23'd1254407 ; 
                    8'b10100000  : end_address <=23'd1278750 ; 
                    8'b10100001  : end_address <=23'd1303406 ; 
                    8'b10100010  : end_address <=23'd1328377 ; 
                    8'b10100011  : end_address <=23'd1353665 ; 
                    8'b10100100  : end_address <=23'd1379272 ; 
                    8'b10100101  : end_address <=23'd1405200 ; 
                    8'b10100110  : end_address <=23'd1431451 ; 
                    8'b10100111  : end_address <=23'd1458027 ; 
                    8'b10101000  : end_address <=23'd1484930 ; 
                    8'b10101001  : end_address <=23'd1512162 ; 
                    8'b10101010  : end_address <=23'd1539725 ; 
                    8'b10101011  : end_address <=23'd1567621 ; 
                    8'b10101100  : end_address <=23'd1595852 ; 
                    8'b10101101  : end_address <=23'd1624420 ; 
                    8'b10101110  : end_address <=23'd1653327 ; 
                    8'b10101111  : end_address <=23'd1682575 ; 
                    8'b10110000  : end_address <=23'd1712166 ; 
                    8'b10110001  : end_address <=23'd1742102 ; 
                    8'b10110010  : end_address <=23'd1772385 ; 
                    8'b10110011  : end_address <=23'd1803017 ; 
                    8'b10110100  : end_address <=23'd1834000 ; 
                    8'b10110101  : end_address <=23'd1865336 ; 
                    8'b10110110  : end_address <=23'd1897027 ; 
                    8'b10110111  : end_address <=23'd1929075 ; 
                    8'b10111000  : end_address <=23'd1961482 ; 
                    8'b10111001  : end_address <=23'd1994250 ; 
                    8'b10111010  : end_address <=23'd2027381 ; 
                    8'b10111011  : end_address <=23'd2060877 ; 
                    8'b10111100  : end_address <=23'd2094740 ; 
                    8'b10111101  : end_address <=23'd2128972 ; 
                    8'b10111110  : end_address <=23'd2163575 ; 
                    8'b10111111  : end_address <=23'd2198551 ; 
                    8'b11000000  : end_address <=23'd2233902 ; 
                    8'b11000001  : end_address <=23'd2269630 ; 
                    8'b11000010  : end_address <=23'd2305737 ; 
                    8'b11000011  : end_address <=23'd2342225 ; 
                    8'b11000100  : end_address <=23'd2379096 ; 
                    8'b11000101  : end_address <=23'd2416352 ; 
                    8'b11000110  : end_address <=23'd2453995 ; 
                    8'b11000111  : end_address <=23'd2492027 ; 
                    8'b11001000  : end_address <=23'd2530450 ; 
                    8'b11001001  : end_address <=23'd2569266 ; 
                    8'b11001010  : end_address <=23'd2608477 ; 
                    8'b11001011  : end_address <=23'd2648085 ; 
                    8'b11001100  : end_address <=23'd2688092 ; 
                    8'b11001101  : end_address <=23'd2728500 ; 
                    8'b11001110  : end_address <=23'd2769311 ; 
                    8'b11001111  : end_address <=23'd2810527 ; 
                    8'b11010000  : end_address <=23'd2852150 ; 
                    8'b11010001  : end_address <=23'd2894182 ; 
                    8'b11010010  : end_address <=23'd2936625 ; 
                    8'b11010011  : end_address <=23'd2979481 ; 
                    8'b11010100  : end_address <=23'd3022752 ; 
                    8'b11010101  : end_address <=23'd3066440 ; 
                    8'b11010110  : end_address <=23'd3110547 ; 
                    8'b11010111  : end_address <=23'd3155075 ; 
                    8'b11011000  : end_address <=23'd3200026 ; 
                    8'b11011001  : end_address <=23'd3245402 ; 
                    8'b11011010  : end_address <=23'd3291205 ; 
                    8'b11011011  : end_address <=23'd3337437 ; 
                    8'b11011100  : end_address <=23'd3384100 ; 
                    8'b11011101  : end_address <=23'd3431196 ; 
                    8'b11011110  : end_address <=23'd3478727 ; 
                    8'b11011111  : end_address <=23'd3526695 ; 
                    8'b11100000  : end_address <=23'd3575102 ; 
                    8'b11100001  : end_address <=23'd3623950 ; 
                    8'b11100010  : end_address <=23'd3673241 ; 
                    8'b11100011  : end_address <=23'd3722977 ; 
                    8'b11100100  : end_address <=23'd3773160 ; 
                    8'b11100101  : end_address <=23'd3823792 ; 
                    8'b11100110  : end_address <=23'd3874875 ; 
                    8'b11100111  : end_address <=23'd3926411 ; 
                    8'b11101000  : end_address <=23'd3978402 ; 
                    8'b11101001  : end_address <=23'd4030850 ; 
                    8'b11101010  : end_address <=23'd4083757 ; 
                    8'b11101011  : end_address <=23'd4137125 ; 
                    8'b11101100  : end_address <=23'd4190956 ; 
                    8'b11101101  : end_address <=23'd4245252 ; 
                    8'b11101110  : end_address <=23'd4300015 ; 
                    8'b11101111  : end_address <=23'd4355247 ; 
                    8'b11110000  : end_address <=23'd4410950 ; 
                    8'b11110001  : end_address <=23'd4467126 ; 
                    8'b11110010  : end_address <=23'd4523777 ; 
                    8'b11110011  : end_address <=23'd4580905 ; 
                    8'b11110100  : end_address <=23'd4638512 ; 
                    8'b11110101  : end_address <=23'd4696600 ; 
                    8'b11110110  : end_address <=23'd4755171 ; 
                    8'b11110111  : end_address <=23'd4814227 ; 
                    8'b11111000  : end_address <=23'd4873770 ; 
                    8'b11111001  : end_address <=23'd4933802 ; 
                    8'b11111010  : end_address <=23'd4994325 ; 
                    8'b11111011  : end_address <=23'd5055341 ; 
                    8'b11111100  : end_address <=23'd5116852 ; 
                    8'b11111101  : end_address <=23'd5178860 ; 
                    8'b11111110  : end_address <=23'd5241367 ; 
                    8'b11111111  : end_address <=23'd5304375 ; 
                    default      : end_address <=23'd0 ; // N = 1,2,3,4,5 are forbidden cases
    endcase
end
endmodule