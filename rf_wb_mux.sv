//creating the multiplexer used to write data somewhere on register file
module rf_wb_mux (
  input logic [31:0] alu_result, 
  input logic [31:0] lau_result, 
  input logic [31:0] programcounter_plus4,
  input logic [1:0] data2reg_selector,
  output logic [31:0] rf_writedown
);

  always_comb begin
    case(data2reg_selector):
      2'b00: rf_writedata = alu_result;
      2'b01: rf_writedatan = lau_result;
      2'b10: rf_writedata = programcounter_plus4;
      default: rf_writedata = 32'h0;
    endcase
  end
endmodule
