
module xor_oper(input [127:0]data1,input [127:0]data2,  output wire [127:0]data_out


    );
  
    assign data_out=data1^data2;
endmodule
