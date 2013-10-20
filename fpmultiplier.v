module fpmultiplier(a,b,mul_out);
input [31:0] a,b;
wire [47:0] f;
wire [23:0] s1,s2;
wire [7:0] e1,e2;
wire [7:0] exp,exp1;
wire [23:0] reg1,reg2,reg3;
wire [22:0] final;
wire msb;
xor(msb,a[31],b[31]);
output [31:0] mul_out;

//denormalize the significands
assign s1={1'b1,a[22:0]};
assign s2={1'b1,b[22:0]};
assign e1=a[30:23];
assign e2=b[30:23];

//we add the exponents and subtract 127 for biasing purpose
assign exp=e1+e2-127;

//multiply the significands
assign f=s1*s2;
assign reg2=f[23:0];
assign reg1=f[47:24];

//if the final matissa has 0 as the 24th bit left shift it and take the remaning 22 bits excluding the most significand bit. this is called normalization
assign reg3=((reg1[23]==0) ? {reg1[22:0],reg2[23]}:reg1);

//depending on how many bits shifted assign the value to the exponent
assign exp1=(reg1[23]==0) ? exp:exp+1;
assign final=reg3[22:0];

//from the above obtained values we can then write mul_out
assign mul_out={msb,exp1,final};
endmodule


