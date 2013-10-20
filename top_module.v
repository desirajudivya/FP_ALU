
module top_module(final,clk,reset,load,qnan,snan,negzero,poszero,neginfinity,posinfinity,overflow,underflow,a,b);
  input [31:0] a,b;
  output [31:0] final;
  input clk,reset,load;
  wire [31:0] finalout,sub_out,mul_out,z;
  wire [23:0] final_mantissa;
  wire [7:0] final_exponent;
  wire final_sign;
  wire [1:0] select;
  output qnan,snan,negzero,poszero,neginfinity,posinfinity,overflow,underflow;
  //executing the adder module
  fpadder3 m1(a,b,finalout,clk,reset,load);
  //executing the subtractor module
  fpsubtractor m2(a,b,sub_out,clk,reset,load);
  //executing the multiplier module
  fpmultiplier m3(a,b,mul_out);
  //executing the divider module
  final_div m4(a,b,z);
  //executing the mux module
  mux m5(finalout,sub_out,mul_out,z,select,final);

assign final_mantissa=final[22:0];
assign final_exponent=final[30:23];
assign final_sign=final[31];
assign poszero=((a[22:0]==23'b0 && a[7:0]==8'b0 && a[31]==1'b0)||(b[22:0]==23'b0 && b[7:0]==8'b0 && b[31]==1'b0)||(final_mantissa==23'b0 && final_exponent==8'b0 && final_sign==1'b0))? 1'b1: 1'b0;
assign posinfinity=((a[31]==1'b0 && a[7:0]==8'b1 && a[22:0]==23'b0)||(b[31]==1'b0 && b[7:0]==8'b1 && b[22:0]==23'b0)||(final_sign==1'b0 && final_exponent==8'b1 && final_mantissa==23'b0)) ?1'b1:1'b0;
assign snan=((a[30:23]==8'b1 && a[22]==1'b0)||(b[30:23]==8'b1 && b[22]==1'b0)||(final_exponent==8'b1 && final_mantissa==1'b0))? 1'b1:1'b0;
assign qnan=((a[30:23]==8'b1 && a[22]==1'b1)||(b[30:23]==8'b1 && b[22]==1'b1)||(final_exponent==8'b1 && final_mantissa==1'b1))? 1'b1:1'b0;
assign negzero=((a[22:0]==23'b0 && a[30:23]==8'b0 && a[31]==1'b1)||(b[22:0]==23'b0 && b[30:23]==8'b0 && b[31]==1'b1)||(final_mantissa==23'b0 && final_exponent==8'b0 && final_sign==1'b1))? 1'b1: 1'b0;
assign neginfinity=(a[31]==1'b1 && a[30:23]==8'b1 && a[22:0]==23'b0)||(a[31]==1'b1 && a[30:23]==8'b1 && a[22:0]==23'b0)||(b[31]==1'b1 && b[30:23]==8'b1 && b[22:0]==23'b0) ? 1'b1:1'b0;
assign overflow=(final_exponent==8'b10000000)?1:0;
assign underflow=(final_exponent==8'b10000010)?1:0;
endmodule
      
