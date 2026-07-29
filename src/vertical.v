`timescale 1ns / 1ps

module vertical(
    input pixel_clk,
    input reset,
    input [9:0] h_count,
    
    output reg [9:0] v_count,
    output reg vsync
    );
    
    always @(posedge pixel_clk or posedge reset) begin
        //reset the vertical counter
        if(reset) begin
            v_count <= 0;
        end
        //Vertical counter: increases one time for every horizontal row completed
        else begin
            if(h_count == 799) begin
                if(v_count == 524)
                    v_count <= 0;
                else
                    v_count <= v_count +1;
            end
        end
    end
    
    //Vertical sync generation: generates the vsync pulse needed for the VGA monitor.
    always @(*) begin
        if(v_count >= 490 && v_count < 492)
            vsync = 0;
        else
            vsync = 1;
    end
endmodule
