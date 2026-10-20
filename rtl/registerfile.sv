module registerfile(
  input logic clk,
  input logic rst,
  //read chosen registers' data
  input logic [4:0] register_address1,
  input logic [4:0] register_address2,
  input logic [31:0] register_data1,
  input logic [31:0] register_data2
  //write data on chosen register if write_enable = 1
  input logic write_enable,
  input logic [4:0] write_address,
  output logic [31:0] write_data,
):

  logic [31:0] registers [0:31];

  always_ff(posedge clk or negedge rst) begin
    if (!rst) //active low reset
      write_data <= 32'h0;
    else if (write_enable && write_address != 0)
      write_data <= write_address;
  end

  
    
