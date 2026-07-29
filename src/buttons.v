`timescale 1ns / 1ps

module buttons(
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    
    output up,
    output down,
    output left,
    output right
    );
    
    //assigning each of the buttons to which direction it will make the character go
    assign up = btnU;
    assign down = btnD;
    assign left = btnL;
    assign right = btnR;
    
endmodule
