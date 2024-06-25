




module inv_word_rotate(input [127:0]data_in,output  wire [127:0]data_out


    );
   
    assign data_out={data_in[8:0],data_in[127:9]};

endmodule
