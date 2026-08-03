'timescale 1ns / 1ps

module tt_um_top_module (
  input wire [7:0] ui_in,
  input wire [7:0] uio_in,
  input wire ena,
  input wire clk,
  input wire rst_n,
  
  output wire [7:0] uo_out,
  output wire [7:0] uio_out,
  output wire [7:0] uio_oe
);

  wire [3:0] full_red;
  wire [3:0] full_green;
  wire [3:0] full_blue;
  wire hsync_out;
  wire vsync_out;

  top_module my_original_design (
    .clk(clk),
    .reset(!rst_n),

    .btnU(ui_in[0]),
    .btnD(ui_in[1]),
    .btnL(ui_in[2]),
    .btnR(ui_in[3]),
    .sw(ui_in[4]),

    .hsync(hsync_out),
    .vsync(vsync_out),
    .red(full_red),
    .green(full_green),
    .blue(full_blue)
  );

  assign uo_out[0] = hsync_out;
  assign uo_out[1] = vsync_out;
  assign uo_out[3:2] = full_red[3:2];
  assign uo_out[5:4] = full_green[3:2];
  assign uo_out[7:6] = full_blue[3:2];

  assign uio_out = 8'b0;
  assign uio_oe = 8'b0;

endmodule
