
//adder module
module fpadder3(a,b,finalout,clk,reset,load);
  input clk,reset,load;
  input [31:0] a,b;
  wire [23:0] s1,s2;
  wire msb;
  wire [23:0] sum;
  output [31:0] finalout;
  wire carry;
  wire [23:0]out;
  wire [7:0] exp1,exp2,exp;
 wire [7:0] d;
 wire [23:0] s3,s5;
 wire [23:0]s4;
 assign s1={1'b1,a[22:0]};
 assign s2={1'b1,b[22:0]};
 assign msb=a[31];
 wire aeqe,beqe;
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
 
 //depending on the difference of the exponents generated we shift the s3 d times where d is the difference of the exponents
 shiftreg m5(s3,clk,reset,load,d,s4);
 
 //add the exponents
 assign {carry,sum}=s5+s4;
 
 //if carry is generated shift the sum along with the carry one bit right else left shift the sum until it is normalized
 assign out=(carry==1)?{carry,sum[23:1]}:sum;
 
 //depending on how many bits the sum is left shited  add 1 to the exponent
 assign exp=(carry==1)?(exp1+1):exp1;
 
 //so from the final sum we get and the exponent we get we can write the finalout
 assign finalout={msb,exp,out[22:0]};
 endmodule