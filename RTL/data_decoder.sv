module data_decoder (
    input  logic [3:0] data,
    output logic [6:0] Display
);

  always_comb begin
    case (data)  //abcdefg
      4'b0000: Display = 7'b0000001;  // "0"     
      4'b0001: Display = 7'b1001111;  // "1" 
      4'b0010: Display = 7'b0010010;  // "2" 
      4'b0011: Display = 7'b0000110;  // "3" 
      4'b0100: Display = 7'b1001100;  // "4" 
      4'b0101: Display = 7'b0100100;  // "5" 
      4'b0110: Display = 7'b0100000;  // "6" 
      4'b0111: Display = 7'b0001111;  // "7" 
      4'b1000: Display = 7'b0000000;  // "8"     
      4'b1001: Display = 7'b0000100;  // "9"
      4'b1010: Display = 7'b0001000;  // "A"     
      4'b1011: Display = 7'b1100000;  // "b"     
      4'b1100: Display = 7'b0110001;  // "C"     
      4'b1101: Display = 7'b1000010;  // "d"     
      4'b1110: Display = 7'b0110000;  // "E"     
      4'b1111: Display = 7'b0111000;  // "F"     
      default: Display = 7'b1111111;
    endcase
  end

endmodule
