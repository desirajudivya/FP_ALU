module shiftreg_sub(s6,clk,reset,load,d,s4);
  output reg [23:0] s4;
  input [23:0] s6;
  input [7:0] d;
  input reset,clk,load;
  always @(posedge clk)
  
   //initially s4 will have a value 0
  if(reset==1) s4<=0;
  
  //later we give the value of s6 to s4
  else if (load==1) s4<=s6;
  else begin
    case (d)
      
      //if the difference is zero no shift occurs
      8'b00000000:s4<=s4;
      
      //if the difference is not 8'b00000000 we have to shift s4 d bits left,shifting in 1's 
      8'b00000001: s4 <={1'b1,s4[23:1]};
      8'b00000010: s4 <={2'b11,s4[23:2]};
      8'b00000011: s4 <={3'b111,s4[23:3]};
      8'b00000100: s4 <={4'b1111,s4[23:4]};
      8'b00000101: s4 <={5'b11111,s4[23:5]};
      8'b00000110: s4 <={6'b111111,s4[23:6]};
      8'b00000111: s4 <={7'b1111111,s4[23:7]};
      8'b00001000: s4 <={8'b11111111,s4[23:8]};
      8'b00001001: s4 <={9'b111111111,s4[23:9]};
      8'b00001010: s4 <={10'b111111111,s4[23:10]};
      8'b00001011: s4 <={11'b1111111111,s4[23:11]};
      8'b00001100: s4 <={12'b11111111111,s4[23:12]};
      8'b00001101: s4 <={13'b111111111111,s4[23:13]};
      8'b00001110: s4 <={14'b1111111111111,s4[23:14]};
      8'b00001111: s4 <={15'b11111111111111,s4[23:15]};
      8'b00010000: s4 <={16'b111111111111111,s4[23:16]};
      8'b00010001: s4 <={17'b1111111111111111,s4[23:17]};
      8'b00010010: s4 <={18'b11111111111111111,s4[23:18]};
      8'b00010011: s4 <={19'b111111111111111111,s4[23:19]};
      8'b00010100: s4 <={20'b1111111111111111111,s4[23:20]};
      8'b00010101: s4 <={21'b11111111111111111111,s4[23:21]};
      8'b00010110: s4 <={22'b111111111111111111111,s4[23:22]};
      8'b00010111: s4 <={23'b1111111111111111111111,s4[23]};
      default: s4 <=24'b111111111111111111111111;
    endcase
    end
  endmodule
