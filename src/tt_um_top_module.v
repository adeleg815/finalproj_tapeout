`timescale 1ns / 1ps

module tt_um_top_module(
    input clk,
    input reset,
    
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    
    input sw,
    
    output hsync,
    output vsync,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue
    );
    
    wire pixel_clk;
    wire slow_clk;
    wire [9:0] h_count;
    wire [9:0] v_count;
    wire up;
    wire down;
    wire left;
    wire right;
    wire [1:0] spd;
    wire [9:0] posX;
    wire [9:0] posY;
    
    //generates VGA clock and the clock for movement
    clock_div U1(clk, reset, pixel_clk, slow_clk);
    
    //generates horizontal pixel count and sync
    horizontal U2(pixel_clk, reset, h_count, hsync);
    
    //generates vertical pixel count and sync
    vertical U3(pixel_clk, reset, h_count, v_count, vsync);
    
    //converts the button pressed into driections
    buttons U4(btnU, btnD, btnL, btnR, up, down, left, right);
    
    //reads the switch input and changes the speed
    speed_control U5(sw, spd);
    
    //updates the character position based on movement inputs
    position U6(slow_clk, reset, up, down, left, right, spd, posX, posY);
    
    //determines the screen color for each pixel
    draw U7(h_count, v_count, posX, posY, red, green, blue);
    
endmodule
