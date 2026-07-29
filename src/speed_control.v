`timescale 1ns / 1ps

module speed_control(
    input sw,
    output reg [1:0] spd
    );
    
    //if the switch is high the character is fast, if it is low the character will be normal speed
    always @(*) begin
        if (sw)
            spd = 2; //faster
        else
            spd = 1; //normal
    end
    
endmodule
