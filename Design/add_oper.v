
module add_oper (
    input [127:0] rval,
    input [127:0] keyval,
    output wire [127:0] add_val
);
    assign add_val = rval + keyval;
endmodule
