
//division module
module final_div(x,b,z);
input [31:0] x,b;
output [31:0] z;
wire[22:0] z_mantissa;
wire [7:0] z_exponent;
wire z_sign;
wire [22:0] x_mantissa,b_mantissa;
wire x_sign,b_sign;
wire [7:0] x_exponent,b_exponent;
wire [8:0] exp,exp1;
wire [25:0] a2,a1;
wire [24:0] t,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25;
wire [24:0] p,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40,p41,p42,p43,p44,p45,p46,p47,p48,p49,p50;   
assign x_mantissa=x[22:0];
assign x_exponent=x[30:23];
assign x_sign=x[31];
assign b_mantissa=b[22:0];
assign b_exponent=b[30:23];
assign b_sign=b[31];
xor(z_sign,x_sign,b_sign);
assign exp={1'b0,x_exponent}-{1'b0,b_exponent}+127;
assign p ={2'b01,x_mantissa};
assign t=p-{2'b01,b_mantissa};
//submodule of division module

// these modules are used instead of loop instruction
simple_division m1(a2[0],t,p1,p,p2,t1,b_mantissa);
simple_division m2(a2[1],t1,p3,p2,p4,t2,b_mantissa);
simple_division m3(a2[2],t2,p5,p4,p6,t3,b_mantissa);
simple_division m4(a2[3],t3,p7,p6,p8,t4,b_mantissa);
simple_division m5(a2[4],t4,p9,p8,p10,t5,b_mantissa);
simple_division m6(a2[5],t5,p11,p10,p12,t6,b_mantissa);
simple_division m7(a2[6],t6,p13,p12,p14,t7,b_mantissa);
simple_division m8(a2[7],t7,p15,p14,p16,t8,b_mantissa);
simple_division m9(a2[8],t8,p17,p16,p18,t9,b_mantissa);
simple_division m10(a2[9],t9,p19,p18,p20,t10,b_mantissa);
simple_division m11(a2[10],t10,p21,p20,p22,t11,b_mantissa);
simple_division m12(a2[11],t11,p23,p22,p24,t12,b_mantissa);
simple_division m13(a2[12],t12,p25,p24,p26,t13,b_mantissa);
simple_division m14(a2[13],t13,p27,p26,p28,t14,b_mantissa);
simple_division m15(a2[14],t14,p29,p28,p30,t15,b_mantissa);
simple_division m16(a2[15],t15,p31,p30,p32,t16,b_mantissa);
simple_division m17(a2[16],t16,p33,p32,p34,t17,b_mantissa);
simple_division m18(a2[17],t17,p35,p34,p36,t18,b_mantissa);
simple_division m19(a2[18],t18,p37,p36,p38,t19,b_mantissa);
simple_division m20(a2[19],t19,p39,p38,p40,t20,b_mantissa);
simple_division m21(a2[20],t20,p41,p40,p42,t21,b_mantissa);
simple_division m22(a2[21],t21,p43,p42,p44,t22,b_mantissa);
simple_division m23(a2[22],t22,p45,p44,p46,t23,b_mantissa);
simple_division m24(a2[23],t23,p47,p46,p48,t24,b_mantissa);
simple_division m25(a2[24],t24,p49,p48,p50,t25,b_mantissa);
assign a2[25]=(t25[24]==1'b0)? 1:0;
assign a1=a2;
assign z_mantissa=(a2[25]==1)? a1[24:2]:a1[23:1];
assign exp1=(a1[25]==1)? exp-1:exp;
assign z_exponent=exp1[7:0];
assign z={z_sign,z_exponent,z_mantissa};
endmodule