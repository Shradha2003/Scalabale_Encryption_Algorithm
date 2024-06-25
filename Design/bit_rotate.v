
module bit_rotate(input [127:0] data_in, output wire [127:0] data_out);

    
     assign   data_out = {data_in[0], data_in[127:1]}; // Rotate left by 1 bit
    
endmodule
