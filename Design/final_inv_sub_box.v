module final_inv_sub_box(
    input [127:0] data_in,
    output wire [127:0] data_out
);

    inv_sub_box inst1(data_in[3:0], data_out[3:0]);
    inv_sub_box inst2(data_in[7:4], data_out[7:4]);
    inv_sub_box inst3(data_in[11:8], data_out[11:8]);
    inv_sub_box inst4(data_in[15:12], data_out[15:12]);
    inv_sub_box inst5(data_in[19:16], data_out[19:16]);
    inv_sub_box inst6(data_in[23:20], data_out[23:20]);
    inv_sub_box inst7(data_in[27:24], data_out[27:24]);
    inv_sub_box inst8(data_in[31:28], data_out[31:28]);
    inv_sub_box inst9(data_in[35:32], data_out[35:32]);
    inv_sub_box inst10(data_in[39:36], data_out[39:36]);
    inv_sub_box inst11(data_in[43:40], data_out[43:40]);
    inv_sub_box inst12(data_in[47:44], data_out[47:44]);
      inv_sub_box inst13(data_in[51:48], data_out[51:48]);
    inv_sub_box inst14(data_in[55:52], data_out[55:52]);
    inv_sub_box inst15(data_in[59:56], data_out[59:56]);
    inv_sub_box inst16(data_in[63:60], data_out[63:60]);
        inv_sub_box inst17(data_in[67:64], data_out[67:64]);
    inv_sub_box inst18(data_in[71:68], data_out[71:68]);
    inv_sub_box inst19(data_in[75:72], data_out[75:72]);
    inv_sub_box inst20(data_in[79:76], data_out[79:76]);
    inv_sub_box inst21(data_in[83:80], data_out[83:80]);
    inv_sub_box inst22(data_in[87:84], data_out[87:84]);
    inv_sub_box inst23(data_in[91:88], data_out[91:88]);
    inv_sub_box inst24(data_in[95:92], data_out[95:92]);
    inv_sub_box inst25(data_in[99:96], data_out[99:96]);
    inv_sub_box inst26(data_in[103:100], data_out[103:100]);
    inv_sub_box inst27(data_in[107:104], data_out[107:104]);
    inv_sub_box inst28(data_in[111:108], data_out[111:108]);
    inv_sub_box inst29(data_in[115:112], data_out[115:112]);
    inv_sub_box inst30(data_in[119:116], data_out[119:116]);
    inv_sub_box inst31(data_in[123:120], data_out[123:120]);
    inv_sub_box inst32(data_in[127:124], data_out[127:124]);

  

endmodule
