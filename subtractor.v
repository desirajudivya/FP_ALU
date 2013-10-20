//from the comparator module we have the highest module in exp1 and the lowest in exp2 so we take the difference of exp1 and exp2 and we get a positive value 
module subtractor(d,exp1,exp2);
output [7:0] d;
input [7:0] exp1,exp2;
assign d=exp1-exp2;
endmodule