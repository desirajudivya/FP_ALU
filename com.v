// this module compares the highest exponent with the first input"a"'s exponent and if they are same we get an output of 1 else0
module com(exp1,e,eeqe);
  input [7:0] e,exp1;
  output eeqe;
  assign eeqe=(exp1==e)?1:0;
  endmodule
  