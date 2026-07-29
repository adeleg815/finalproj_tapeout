`timescale 1ns / 1ps

module position(
    input slow_clk,
    input reset,
    
    input up,
    input down,
    input left,
    input right,
    input [1:0] spd,
    
    output reg [9:0] posX,
    output reg [9:0] posY
    );
    //this module if for holding and changing the position of the block
    
    
    always @(posedge slow_clk or posedge reset) begin
        //if reset then go to the center of the screen
        if(reset) begin
            posX <= 320;
            posY <= 240;
        end
        else begin
            //move left
            if(left && posX > 0)
                posX <= posX - spd;
            //move right
            if(right && posX < 620)
                posX <= posX + spd;
            //move up
            if(up && posY > 0)
                posY <= posY - spd;
            //move down
            if(down && posY < 460)
                posY <= posY + spd;
        end
     end
    
endmodule
