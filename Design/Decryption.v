module Decryption(input[255:0]data_in,
input[127:0]key_in,output wire[255:0]data_out);


wire[127:0]data_outr;
wire[127:0]data_outl;
wire[127:0]datal;
wire[127:0]datar;
wire[127:0]word_out;
wire[127:0]sub_out;
wire[127:0]bit_out;
wire[127:0]xor_out;
wire[127:0]add_out;
assign data_out={data_outl,data_outr};
assign datal=data_in[255:128];
assign datar=data_in[127:0];
assign data_outr=add_out;
assign data_outl=datal;
inv_add_oper inst_add(.rval(sub_out),.keyval(key_in),.add_val(add_out));
final_inv_sub_box inst_sub(.data_in(bit_out),.data_out(sub_out));
inv_bit_rotate inst_bit(.data_in(xor_out),.data_out(bit_out));
xor_oper inst_xor2(.data1(word_out),.data2(datal),.data_out(xor_out));
inv_word_rotate inst_word(.data_in(datar),.data_out(word_out));




endmodule 
