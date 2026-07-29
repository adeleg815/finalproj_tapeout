`timescale 1ns / 1ps

module draw(
    input [9:0] h_count,
    input [9:0] v_count,
    input [9:0] posX,
    input [9:0] posY,
    
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
    );
    //the character's size in pixels
    parameter size = 20;
    
    always @(*) begin
        //making the black background
            red = 0;
            green = 0;
            blue = 0;
        
        //draw the box character and making it blue
        if((h_count >= posX) && (h_count < posX + size) && (v_count >= posY) && (v_count < posY + size)) begin
            red = 0;
            green = 0;
            blue = 4'b1111;
        end
        
        //draw letter A in green
        else if( ((h_count >= 20 && h_count <= 24)&&(v_count >= 20 && v_count <= 60)) || 
                 ((h_count >= 40 && h_count <= 44)&&(v_count >= 20 && v_count <= 60)) ||
                 ((h_count >= 20 && h_count <= 44)&&(v_count >= 38 && v_count <= 42)) ||
                 ((h_count >= 20 && h_count <= 44)&&(v_count >= 20 && v_count <= 24)) ) begin
            red = 0;
            green = 4'b1111;
            blue = 0;
        end
        //draw letter G in green
        else if( ((h_count >= 70 && h_count <= 74)&&(v_count >= 20 && v_count <= 60)) || 
                 ((h_count >= 70 && h_count <= 100)&&(v_count >= 20 && v_count <= 24)) ||
                 ((h_count >= 70 && h_count <= 100)&&(v_count >= 56 && v_count <= 60)) ||
                 ((h_count >= 96 && h_count <= 100)&&(v_count >= 40 && v_count <= 60)) ||
                 ((h_count >= 85 && h_count <= 100)&&(v_count >= 38 && v_count <= 42)) ) begin
            red = 0;
            green = 4'b1111;
            blue = 0;
        end
    end
    
endmodule
