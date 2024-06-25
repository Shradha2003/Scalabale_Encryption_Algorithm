

module word_rotate(input [127:0]data_in,output wire [127:0]data_out


    );
    
    assign data_out = {data_in[118:0], data_in[127:119]};


endmodule

