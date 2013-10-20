module simple_division(a2,t,p1,p,p2,t1,b_mantissa);
input [24:0] t,p,p1,p2,t1;
input [22:0] b_mantissa;
output a2;
//we call this module 25 times
//if msb bit of t is o we assign 1 to a2 else 0
assign a2=(t[24]==1'b0)? 1:0;
//if msb bit of t is 0 we assign t tp 0 else p will remani as it is
assign p1 = (t[24]==1'b0)? t:p;
assign p2={p1[23:0],1'b0};
 assign t1=p2-{2'b01,b_mantissa};
 endmodule
