module mux(finalout,sub_out,mul_out,z,select,final);
  output reg [31:0] final;
  input [31:0] finalout,sub_out,mul_out,z;
  input [1:0] select;
  always @(select)
  case (select)
  
  //if select is 2'b00 we select finalout output of adder
  0: final=finalout;
  
  //if select is 2'b01 we select sub_out output of subtractor
  1:final=sub_out;
  
  //if select is 2'b10 we select mul_out output of multiplier
  2: final=mul_out;
  
  //if select is 2'b11 we select z output of divider 
  3: final=z;
endcase
endmodule
  




