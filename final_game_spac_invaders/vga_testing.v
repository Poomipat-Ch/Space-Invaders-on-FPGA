`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:45:48 12/12/2020 
// Design Name: 
// Module Name:    vga_testing 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vga_testing(
    input CLK_I,
    output VGA_HS_O,
    output VGA_VS_O,
    output VGA_RED_O,
    output VGA_GREEN_O,
    output VGA_BLUE_O,
	 output [11:0] X,
	 output [11:0] Y,
	 input R,
	 input G,
	 input B
    );

reg [11:0]X;
reg [11:0]Y;

integer FRAME_WIDTH = 400;
integer FRAME_HEIGHT = 600;

integer H_FP = 20;
integer H_PW = 64;
integer H_MAX = 528;

integer V_FP = 1;
integer V_PW = 4;
integer V_MAX = 628;

localparam  H_POL = 1;
localparam  V_POL = 1;

reg pxl_clk;
reg active;

reg [11:0] h_cntr_reg = 0;
reg [11:0] v_cntr_reg = 0;

reg h_sync_reg = ~H_POL;
reg v_sync_reg = ~V_POL;

reg vga_red_reg = 0;
reg vga_green_reg = 0;
reg vga_blue_reg = 0;

always @(posedge CLK_I)
begin
	if (h_cntr_reg == (H_MAX - 1))
		h_cntr_reg <= 0;
	else
		h_cntr_reg <= h_cntr_reg + 1;
end

always @(posedge CLK_I)
begin
	if ((h_cntr_reg == (H_MAX - 1)) && (v_cntr_reg == (V_MAX - 1)))
		v_cntr_reg <= 0;
	else if (h_cntr_reg == (H_MAX - 1))
		v_cntr_reg <= v_cntr_reg + 1;
end

always @(posedge CLK_I)
begin
if ((h_cntr_reg >= (H_FP + FRAME_WIDTH - 1)) && (h_cntr_reg < (H_FP + FRAME_WIDTH + H_PW - 1)))
		h_sync_reg <= H_POL;
else
	h_sync_reg <= ~H_POL;
end

always @(posedge CLK_I)
begin
if ((v_cntr_reg >= (V_FP + FRAME_HEIGHT - 1)) && (v_cntr_reg < (V_FP + FRAME_HEIGHT + V_PW - 1)))
	v_sync_reg <= V_POL;
else
	v_sync_reg <= ~V_POL;
end

always @(posedge CLK_I)
begin
if (h_cntr_reg < FRAME_WIDTH && v_cntr_reg < FRAME_HEIGHT)
begin
 X <= h_cntr_reg;
 Y <= v_cntr_reg;
 vga_red_reg <= R;
 vga_green_reg <= G;
 vga_blue_reg <= B;
 end
else
begin
 vga_red_reg <= 0;
 vga_green_reg <= 0;
 vga_blue_reg <= 0;
end
end

 assign VGA_HS_O = h_sync_reg;
 assign VGA_VS_O = v_sync_reg;
 assign VGA_RED_O = vga_red_reg;
 assign VGA_GREEN_O = vga_green_reg;
 assign VGA_BLUE_O = vga_blue_reg;

endmodule
