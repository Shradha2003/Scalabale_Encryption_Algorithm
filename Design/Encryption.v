module Encryption (
    input [255:0] data_in,
    input [127:0] key_in,
    output wire [255:0] data_out
);
    wire [127:0] data_outr;
    wire [127:0] data_outl;
    wire [127:0] datal;
    wire [127:0] datar;
    wire [127:0] add_out;
    wire [127:0] sub_out;
    wire [127:0] bit_out;
    wire [127:0] xor_out;
    wire [127:0] word_out;

    assign data_out = {data_outl, data_outr};
    assign datal = data_in[255:128];
    assign datar = data_in[127:0];
    assign data_outl = datal;
    assign data_outr = word_out;

    add_oper inst_add(.rval(datar), .keyval(key_in), .add_val(add_out));
    final_sub_box inst_sub(.data_in(add_out), .data_out(sub_out));
   bit_rotate inst_bit(.data_in(sub_out), .data_out(bit_out));
    xor_oper inst_xor(.data1(bit_out), .data2(datal), .data_out(xor_out));
    word_rotate inst_word(.data_in(xor_out), .data_out(word_out));
endmodule
