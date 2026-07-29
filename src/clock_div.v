`timescale 1ns / 1ps

module clock_div(
    input clk,
    input reset,
    output reg pixel_clk,
    output reg slow_clk
    );
    
    reg [1:0] pixel_count;
    reg [31:0] slow_count;
    
    always @(posedge clk or posedge reset) begin
        //reset logic: resets all of the counters and the clock to 0
        if(reset) begin
            pixel_count <= 0;
            pixel_clk <= 0;
        end
        
        //Pixel clock divider: divides 100 Mhz clock down for the VGA timing
        else begin
            pixel_count <= pixel_count + 1;
            if (pixel_count == 1) begin
                pixel_clk <= ~pixel_clk;
                pixel_count <= 0;
            end
            
            //slow clock divider: used to slow down the character's movement
            slow_count <= slow_count +1;
            if (slow_count == 500000) begin
                slow_clk <= ~slow_clk;
                slow_count <= 0;
            end
        end   
    end
endmodule
