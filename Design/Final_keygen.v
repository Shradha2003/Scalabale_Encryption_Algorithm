

module final_keygen(input[255:0]key_in,output wire[255:0]key_out

    );
    
    wire[127:0]key_outr;
     wire[127:0]key_outl;
      wire[127:0]key_l;
       wire[127:0]key_r;
wire[127:0]add_out;
wire[127:0]sub_out;
wire[127:0]bit_out;
wire[127:0]xor_out;
wire[127:0]word_out;
              assign key_out={key_outr,key_outl};
              assign key_l=key_in[255:128];
               assign key_r=key_in[127:0];
                assign key_outr=key_l;
               assign key_outl=xor_out;
    add_oper inst_add(.rval(key_r), .keyval(128'd1), .add_val(add_out));
    final_sub_box inst_sub(.data_in(add_out), .data_out(sub_out));
    bit_rotate inst_bit(.data_in(sub_out), .data_out(bit_out));
    word_rotate inst_word(.data_in(bit_out), .data_out(word_out));
xor_oper inst_xor1(.data1(word_out),.data2(key_l),.data_out(xor_out));
            
        
endmodule

