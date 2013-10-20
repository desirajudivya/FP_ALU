module fpsubtractor(a,b,sub_out,clk,reset,load);
  input clk,reset,load;
  input [31:0] a,b;
  wire [23:0] s1,s2;
  wire msb;
  wire [23:0] sum;
  output [31:0] sub_out;
  wire carry;
  wire [23:0]out;
  wire [7:0] exp1,exp2,exp;
 wire[7:0] d;
 wire [23:0] s3,s5;
 wire [23:0]s4,s6;
 wire sign;
 assign sign=(a[30:0]>b[30:0])?a[31]:b[31];
 
 
 //assigning values to the significand including the hidden 1bit
 assign s1={1'b1,a[22:0]};
 assign s2={1'b1,b[22:0]};
 wire aeqe;
 
 //we get highest exponent from this module
 comparator m1(exp1,exp2,a[30:23],b[30:23]); 
 
 //we see from  this module if the highest exponent is equal to the first input exponents value
 com m2(exp1,a[30:23],aeqe);
 
 //here we subtract the highest exponent from the lowest exponent
 subtractor m4(d,exp1,exp2);
 
 //we assign the significand of the input which contains the lowest exponent value to s3
 assign s3=(aeqe==1)?s2:s1;
 
 //we assign the significand of the input which contains the highest exponent value to s5
 assign s5=(aeqe==1)?s1:s2;
 assign s6=~s3+1;
 
 //depending on the difference of the exponents generated we shift the 1 in to s3 d times where d is the difference of the exponents

 shiftreg_sub m5(s6,clk,reset,load,d,s4);
 assign {carry,sum}=s5+s4;
 
 //if no carry is generated and if msb bit is zero and if the inputs are different signs compliment the mantissa
 assign out=(carry==0)&& (sum[23]==1)? ~sum+1:sum;
 assign exp=(sum[23]==0)?(exp1-1):exp1;
 assign sub_out=(out[23]==0)?{sign,exp,out[21:0],1'b0}:{sign,exp,out[22:0]};
 
 endmodule


