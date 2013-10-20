//compares the two exponent values and assigns highest value to the exp1 and the lowest to exp2
module comparator(exp1,exp2,c,d);
input [7:0] c,d;
output [7:0] exp1,exp2;
assign exp1=(c>d) || (c==d) ? c:d;
assign exp2=(c<d)?c:d;
endmodule