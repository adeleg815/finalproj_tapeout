`timescale 1ns / 1ps

module horizontal(
    input pixel_clk,
    input reset,
    output reg [9:0] h_count,
    output reg hsync
    );
    
    always @(posedge pixel_clk or posedge reset) begin
        //reset horizontal counter
        if(reset) begin
            h_count <= 0;
        end
        //Horizontal counter: counts through a VGA row then goes back to 0 and counts again
        else begin
            if (h_count == 799)
                h_count <= 0;
            else
                h_count <= h_count + 1;
        end
    end
    
    //horizontal sync generation: generates the hsync pulse needed for the VGA monitor.
    always @(*) begin
        if((h_count >= 656) && (h_count < 752))
            hsync = 0;
        else
            hsync = 1;
    end
endmodule
