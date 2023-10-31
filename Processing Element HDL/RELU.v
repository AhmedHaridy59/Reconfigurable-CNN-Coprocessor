//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ahmed Haridy
// 
// Create Date: 07/12/2021 06:13:49 PM
// Design Name: 
// Module Name: RelU
// Project Name: ReLU
 
//////////////////////////////////////////////////////////////////////////////////
module Relu
#(
	parameter No_bits = 16
 )
(  
  // Common Inputs
  input Reset, // Asynchronous Reset
  input clock,
  
  // Controller Signals
  input Local_reset,
  input Enable, // Enable the Circuit to work 
  input [7:0] N, // Dimension of processed Square Matrix = N x N
  
  // Data input and Output
    input [No_bits-1:0] in,
    output reg [No_bits-1:0] out,
	
  // Feedback signals	
	output Finish
    );

//////////////////////////////////// Internal Signals ////////////////////////////////
reg [15:0] End_address;
reg [No_bits-1] internal_out;    
//////////////////////////// ReLU Logic with output Register /////////////////////////  	
	always@(posedge clock or posedge Reset)
	begin
	   out <= internal_out;
	   if (Reset || Local_reset)
	   begin
	     internal_out <= 0;
		 out <= 0;
	   end
	   else if (Enable)
	     case(in[No_bits-1])
		   1'b0: internal_out <= in; // Input is positive
		   1'b1: internal_out <= 0;  // input is negative
		 endcase
	   else 
	      internal_out<=internal_out;
	end
	
	

 ///////////////////////////////// 16 bit Counter //////////////////////////////////////////
 // Counter that determine finish signal 
 
 reg [15:0] Counter_out;  
 always @ (posedge clock or posedge Reset)
 begin
  if (Reset || Local_reset)
      begin
      Counter_out <= 16'b0;
      end
  // in above case, we Resetting the counter.  
            else if (Finish)
            begin
               Counter_out <= Counter_out;
            end
  // in above case, we have to disable the counter.               
                else if (Enable)
                begin
                  Counter_out <= Counter_out+16'b1;
                end
  // in above case, we have to make the counter count up           
                   else
                begin
                  Counter_out <= Counter_out;
                end                   
  // in above case, if nothing of above is 1, we have to disable counter and maintain same state of counter.
 end

 ////////////////////Control Sub Circuit ////////////////////////////
 // to produce Finish signal to disable Counter after Certian time according to N

assign Finish = (Counter_out == End_address); // Comparator

always @(*)
begin
    case(N)
            8'b00000000  : End_address <=16'b0000000000000000 ; 
            8'b00000001  : End_address <=16'b0000000000000011 ; 
            8'b00000010  : End_address <=16'b0000000000001000 ; 
            8'b00000011  : End_address <=16'b0000000000001111 ; 
            8'b00000100  : End_address <=16'b0000000000011000 ; 
            8'b00000101  : End_address <=16'b0000000000100011 ; 
            8'b00000110  : End_address <=16'b0000000000110000 ; 
            8'b00000111  : End_address <=16'b0000000000111111 ; 
            8'b00001000  : End_address <=16'b0000000001010000 ; 
            8'b00001001  : End_address <=16'b0000000001100011 ; 
            8'b00001010  : End_address <=16'b0000000001111000 ; 
            8'b00001011  : End_address <=16'b0000000010001111 ; 
            8'b00001100  : End_address <=16'b0000000010101000 ; 
            8'b00001101  : End_address <=16'b0000000011000011 ; 
            8'b00001110  : End_address <=16'b0000000011100000 ; 
            8'b00001111  : End_address <=16'b0000000011111111 ; 
            8'b00010000  : End_address <=16'b0000000100100000 ; 
            8'b00010001  : End_address <=16'b0000000101000011 ; 
            8'b00010010  : End_address <=16'b0000000101101000 ; 
            8'b00010011  : End_address <=16'b0000000110001111 ; 
            8'b00010100  : End_address <=16'b0000000110111000 ; 
            8'b00010101  : End_address <=16'b0000000111100011 ; 
            8'b00010110  : End_address <=16'b0000001000010000 ; 
            8'b00010111  : End_address <=16'b0000001000111111 ; 
            8'b00011000  : End_address <=16'b0000001001110000 ; 
            8'b00011001  : End_address <=16'b0000001010100011 ; 
            8'b00011010  : End_address <=16'b0000001011011000 ; 
            8'b00011011  : End_address <=16'b0000001100001111 ; 
            8'b00011100  : End_address <=16'b0000001101001000 ; 
            8'b00011101  : End_address <=16'b0000001110000011 ; 
            8'b00011110  : End_address <=16'b0000001111000000 ; 
            8'b00011111  : End_address <=16'b0000001111111111 ; 
            8'b00100000  : End_address <=16'b0000010001000000 ; 
            8'b00100001  : End_address <=16'b0000010010000011 ; 
            8'b00100010  : End_address <=16'b0000010011001000 ; 
            8'b00100011  : End_address <=16'b0000010100001111 ; 
            8'b00100100  : End_address <=16'b0000010101011000 ; 
            8'b00100101  : End_address <=16'b0000010110100011 ; 
            8'b00100110  : End_address <=16'b0000010111110000 ; 
            8'b00100111  : End_address <=16'b0000011000111111 ; 
            8'b00101000  : End_address <=16'b0000011010010000 ; 
            8'b00101001  : End_address <=16'b0000011011100011 ; 
            8'b00101010  : End_address <=16'b0000011100111000 ; 
            8'b00101011  : End_address <=16'b0000011110001111 ; 
            8'b00101100  : End_address <=16'b0000011111101000 ; 
            8'b00101101  : End_address <=16'b0000100001000011 ; 
            8'b00101110  : End_address <=16'b0000100010100000 ; 
            8'b00101111  : End_address <=16'b0000100011111111 ; 
            8'b00110000  : End_address <=16'b0000100101100000 ; 
            8'b00110001  : End_address <=16'b0000100111000011 ; 
            8'b00110010  : End_address <=16'b0000101000101000 ; 
            8'b00110011  : End_address <=16'b0000101010001111 ; 
            8'b00110100  : End_address <=16'b0000101011111000 ; 
            8'b00110101  : End_address <=16'b0000101101100011 ; 
            8'b00110110  : End_address <=16'b0000101111010000 ; 
            8'b00110111  : End_address <=16'b0000110000111111 ; 
            8'b00111000  : End_address <=16'b0000110010110000 ; 
            8'b00111001  : End_address <=16'b0000110100100011 ; 
            8'b00111010  : End_address <=16'b0000110110011000 ; 
            8'b00111011  : End_address <=16'b0000111000001111 ; 
            8'b00111100  : End_address <=16'b0000111010001000 ; 
            8'b00111101  : End_address <=16'b0000111100000011 ; 
            8'b00111110  : End_address <=16'b0000111110000000 ; 
            8'b00111111  : End_address <=16'b0000111111111111 ; 
            8'b01000000  : End_address <=16'b0001000010000000 ; 
            8'b01000001  : End_address <=16'b0001000100000011 ; 
            8'b01000010  : End_address <=16'b0001000110001000 ; 
            8'b01000011  : End_address <=16'b0001001000001111 ; 
            8'b01000100  : End_address <=16'b0001001010011000 ; 
            8'b01000101  : End_address <=16'b0001001100100011 ; 
            8'b01000110  : End_address <=16'b0001001110110000 ; 
            8'b01000111  : End_address <=16'b0001010000111111 ; 
            8'b01001000  : End_address <=16'b0001010011010000 ; 
            8'b01001001  : End_address <=16'b0001010101100011 ; 
            8'b01001010  : End_address <=16'b0001010111111000 ; 
            8'b01001011  : End_address <=16'b0001011010001111 ; 
            8'b01001100  : End_address <=16'b0001011100101000 ; 
            8'b01001101  : End_address <=16'b0001011111000011 ; 
            8'b01001110  : End_address <=16'b0001100001100000 ; 
            8'b01001111  : End_address <=16'b0001100011111111 ; 
            8'b01010000  : End_address <=16'b0001100110100000 ; 
            8'b01010001  : End_address <=16'b0001101001000011 ; 
            8'b01010010  : End_address <=16'b0001101011101000 ; 
            8'b01010011  : End_address <=16'b0001101110001111 ; 
            8'b01010100  : End_address <=16'b0001110000111000 ; 
            8'b01010101  : End_address <=16'b0001110011100011 ; 
            8'b01010110  : End_address <=16'b0001110110010000 ; 
            8'b01010111  : End_address <=16'b0001111000111111 ; 
            8'b01011000  : End_address <=16'b0001111011110000 ; 
            8'b01011001  : End_address <=16'b0001111110100011 ; 
            8'b01011010  : End_address <=16'b0010000001011000 ; 
            8'b01011011  : End_address <=16'b0010000100001111 ; 
            8'b01011100  : End_address <=16'b0010000111001000 ; 
            8'b01011101  : End_address <=16'b0010001010000011 ; 
            8'b01011110  : End_address <=16'b0010001101000000 ; 
            8'b01011111  : End_address <=16'b0010001111111111 ; 
            8'b01100000  : End_address <=16'b0010010011000000 ; 
            8'b01100001  : End_address <=16'b0010010110000011 ; 
            8'b01100010  : End_address <=16'b0010011001001000 ; 
            8'b01100011  : End_address <=16'b0010011100001111 ; 
            8'b01100100  : End_address <=16'b0010011111011000 ; 
            8'b01100101  : End_address <=16'b0010100010100011 ; 
            8'b01100110  : End_address <=16'b0010100101110000 ; 
            8'b01100111  : End_address <=16'b0010101000111111 ; 
            8'b01101000  : End_address <=16'b0010101100010000 ; 
            8'b01101001  : End_address <=16'b0010101111100011 ; 
            8'b01101010  : End_address <=16'b0010110010111000 ; 
            8'b01101011  : End_address <=16'b0010110110001111 ; 
            8'b01101100  : End_address <=16'b0010111001101000 ; 
            8'b01101101  : End_address <=16'b0010111101000011 ; 
            8'b01101110  : End_address <=16'b0011000000100000 ; 
            8'b01101111  : End_address <=16'b0011000011111111 ; 
            8'b01110000  : End_address <=16'b0011000111100000 ; 
            8'b01110001  : End_address <=16'b0011001011000011 ; 
            8'b01110010  : End_address <=16'b0011001110101000 ; 
            8'b01110011  : End_address <=16'b0011010010001111 ; 
            8'b01110100  : End_address <=16'b0011010101111000 ; 
            8'b01110101  : End_address <=16'b0011011001100011 ; 
            8'b01110110  : End_address <=16'b0011011101010000 ; 
            8'b01110111  : End_address <=16'b0011100000111111 ; 
            8'b01111000  : End_address <=16'b0011100100110000 ; 
            8'b01111001  : End_address <=16'b0011101000100011 ; 
            8'b01111010  : End_address <=16'b0011101100011000 ; 
            8'b01111011  : End_address <=16'b0011110000001111 ; 
            8'b01111100  : End_address <=16'b0011110100001000 ; 
            8'b01111101  : End_address <=16'b0011111000000011 ; 
            8'b01111110  : End_address <=16'b0011111100000000 ; 
            8'b01111111  : End_address <=16'b0011111111111111 ; 
            8'b10000000  : End_address <=16'b0100000100000000 ; 
            8'b10000001  : End_address <=16'b0100001000000011 ; 
            8'b10000010  : End_address <=16'b0100001100001000 ; 
            8'b10000011  : End_address <=16'b0100010000001111 ; 
            8'b10000100  : End_address <=16'b0100010100011000 ; 
            8'b10000101  : End_address <=16'b0100011000100011 ; 
            8'b10000110  : End_address <=16'b0100011100110000 ; 
            8'b10000111  : End_address <=16'b0100100000111111 ; 
            8'b10001000  : End_address <=16'b0100100101010000 ; 
            8'b10001001  : End_address <=16'b0100101001100011 ; 
            8'b10001010  : End_address <=16'b0100101101111000 ; 
            8'b10001011  : End_address <=16'b0100110010001111 ; 
            8'b10001100  : End_address <=16'b0100110110101000 ; 
            8'b10001101  : End_address <=16'b0100111011000011 ; 
            8'b10001110  : End_address <=16'b0100111111100000 ; 
            8'b10001111  : End_address <=16'b0101000011111111 ; 
            8'b10010000  : End_address <=16'b0101001000100000 ; 
            8'b10010001  : End_address <=16'b0101001101000011 ; 
            8'b10010010  : End_address <=16'b0101010001101000 ; 
            8'b10010011  : End_address <=16'b0101010110001111 ; 
            8'b10010100  : End_address <=16'b0101011010111000 ; 
            8'b10010101  : End_address <=16'b0101011111100011 ; 
            8'b10010110  : End_address <=16'b0101100100010000 ; 
            8'b10010111  : End_address <=16'b0101101000111111 ; 
            8'b10011000  : End_address <=16'b0101101101110000 ; 
            8'b10011001  : End_address <=16'b0101110010100011 ; 
            8'b10011010  : End_address <=16'b0101110111011000 ; 
            8'b10011011  : End_address <=16'b0101111100001111 ; 
            8'b10011100  : End_address <=16'b0110000001001000 ; 
            8'b10011101  : End_address <=16'b0110000110000011 ; 
            8'b10011110  : End_address <=16'b0110001011000000 ; 
            8'b10011111  : End_address <=16'b0110001111111111 ; 
            8'b10100000  : End_address <=16'b0110010101000000 ; 
            8'b10100001  : End_address <=16'b0110011010000011 ; 
            8'b10100010  : End_address <=16'b0110011111001000 ; 
            8'b10100011  : End_address <=16'b0110100100001111 ; 
            8'b10100100  : End_address <=16'b0110101001011000 ; 
            8'b10100101  : End_address <=16'b0110101110100011 ; 
            8'b10100110  : End_address <=16'b0110110011110000 ; 
            8'b10100111  : End_address <=16'b0110111000111111 ; 
            8'b10101000  : End_address <=16'b0110111110010000 ; 
            8'b10101001  : End_address <=16'b0111000011100011 ; 
            8'b10101010  : End_address <=16'b0111001000111000 ; 
            8'b10101011  : End_address <=16'b0111001110001111 ; 
            8'b10101100  : End_address <=16'b0111010011101000 ; 
            8'b10101101  : End_address <=16'b0111011001000011 ; 
            8'b10101110  : End_address <=16'b0111011110100000 ; 
            8'b10101111  : End_address <=16'b0111100011111111 ; 
            8'b10110000  : End_address <=16'b0111101001100000 ; 
            8'b10110001  : End_address <=16'b0111101111000011 ; 
            8'b10110010  : End_address <=16'b0111110100101000 ; 
            8'b10110011  : End_address <=16'b0111111010001111 ; 
            8'b10110100  : End_address <=16'b0111111111111000 ; 
            8'b10110101  : End_address <=16'b1000000101100011 ; 
            8'b10110110  : End_address <=16'b1000001011010000 ; 
            8'b10110111  : End_address <=16'b1000010000111111 ; 
            8'b10111000  : End_address <=16'b1000010110110000 ; 
            8'b10111001  : End_address <=16'b1000011100100011 ; 
            8'b10111010  : End_address <=16'b1000100010011000 ; 
            8'b10111011  : End_address <=16'b1000101000001111 ; 
            8'b10111100  : End_address <=16'b1000101110001000 ; 
            8'b10111101  : End_address <=16'b1000110100000011 ; 
            8'b10111110  : End_address <=16'b1000111010000000 ; 
            8'b10111111  : End_address <=16'b1000111111111111 ; 
            8'b11000000  : End_address <=16'b1001000110000000 ; 
            8'b11000001  : End_address <=16'b1001001100000011 ; 
            8'b11000010  : End_address <=16'b1001010010001000 ; 
            8'b11000011  : End_address <=16'b1001011000001111 ; 
            8'b11000100  : End_address <=16'b1001011110011000 ; 
            8'b11000101  : End_address <=16'b1001100100100011 ; 
            8'b11000110  : End_address <=16'b1001101010110000 ; 
            8'b11000111  : End_address <=16'b1001110000111111 ; 
            8'b11001000  : End_address <=16'b1001110111010000 ; 
            8'b11001001  : End_address <=16'b1001111101100011 ; 
            8'b11001010  : End_address <=16'b1010000011111000 ; 
            8'b11001011  : End_address <=16'b1010001010001111 ; 
            8'b11001100  : End_address <=16'b1010010000101000 ; 
            8'b11001101  : End_address <=16'b1010010111000011 ; 
            8'b11001110  : End_address <=16'b1010011101100000 ; 
            8'b11001111  : End_address <=16'b1010100011111111 ; 
            8'b11010000  : End_address <=16'b1010101010100000 ; 
            8'b11010001  : End_address <=16'b1010110001000011 ; 
            8'b11010010  : End_address <=16'b1010110111101000 ; 
            8'b11010011  : End_address <=16'b1010111110001111 ; 
            8'b11010100  : End_address <=16'b1011000100111000 ; 
            8'b11010101  : End_address <=16'b1011001011100011 ; 
            8'b11010110  : End_address <=16'b1011010010010000 ; 
            8'b11010111  : End_address <=16'b1011011000111111 ; 
            8'b11011000  : End_address <=16'b1011011111110000 ; 
            8'b11011001  : End_address <=16'b1011100110100011 ; 
            8'b11011010  : End_address <=16'b1011101101011000 ; 
            8'b11011011  : End_address <=16'b1011110100001111 ; 
            8'b11011100  : End_address <=16'b1011111011001000 ; 
            8'b11011101  : End_address <=16'b1100000010000011 ; 
            8'b11011110  : End_address <=16'b1100001001000000 ; 
            8'b11011111  : End_address <=16'b1100001111111111 ; 
            8'b11100000  : End_address <=16'b1100010111000000 ; 
            8'b11100001  : End_address <=16'b1100011110000011 ; 
            8'b11100010  : End_address <=16'b1100100101001000 ; 
            8'b11100011  : End_address <=16'b1100101100001111 ; 
            8'b11100100  : End_address <=16'b1100110011011000 ; 
            8'b11100101  : End_address <=16'b1100111010100011 ; 
            8'b11100110  : End_address <=16'b1101000001110000 ; 
            8'b11100111  : End_address <=16'b1101001000111111 ; 
            8'b11101000  : End_address <=16'b1101010000010000 ; 
            8'b11101001  : End_address <=16'b1101010111100011 ; 
            8'b11101010  : End_address <=16'b1101011110111000 ; 
            8'b11101011  : End_address <=16'b1101100110001111 ; 
            8'b11101100  : End_address <=16'b1101101101101000 ; 
            8'b11101101  : End_address <=16'b1101110101000011 ; 
            8'b11101110  : End_address <=16'b1101111100100000 ; 
            8'b11101111  : End_address <=16'b1110000011111111 ; 
            8'b11110000  : End_address <=16'b1110001011100000 ; 
            8'b11110001  : End_address <=16'b1110010011000011 ; 
            8'b11110010  : End_address <=16'b1110011010101000 ; 
            8'b11110011  : End_address <=16'b1110100010001111 ; 
            8'b11110100  : End_address <=16'b1110101001111000 ; 
            8'b11110101  : End_address <=16'b1110110001100011 ; 
            8'b11110110  : End_address <=16'b1110111001010000 ; 
            8'b11110111  : End_address <=16'b1111000000111111 ; 
            8'b11111000  : End_address <=16'b1111001000110000 ; 
            8'b11111001  : End_address <=16'b1111010000100011 ; 
            8'b11111010  : End_address <=16'b1111011000011000 ; 
            8'b11111011  : End_address <=16'b1111100000001111 ; 
            8'b11111100  : End_address <=16'b1111101000001000 ; 
            8'b11111101  : End_address <=16'b1111110000000011 ; 
            8'b11111110  : End_address <=16'b1111111000000000 ; 
            8'b11111111  : End_address <=16'b1111111111111111 ;
    endcase
end 

endmodule
