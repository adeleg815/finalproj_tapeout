<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project is a custom VGA display engine featuring a movable character block controlled by external buttons. It includes a clock divider that breaks down the clock into a pixel clock and a slower movement clock. Horizontal and vertical sync modules calculate active pixel positions to handle standard VGA video timings. A speed control module which adjusts how fast the character coordinates update on the screen. Finally, a dedicated drawing module evaluates the coordinate positions against the active video counts to output color paths to the VGA monitor.

## How to test

1. Ensure the master clock is active and the rst_n reset pin is held high (1) to run normally.
2. Monitor the hsync and vsync output lines on an oscilloscope or video breakout adapter to verify active VGA video signaling.
3. Toggle the button input bits inside the ui_in bus to change the character direction: bit 0 for Up, bit 1 for Down, bit 2 for Left, and bit 3 for Right.
4. Toggle input bit 4 (the switch pin) to change the character's movement velocity between slow and fast states.
5. Observe the uo_out output pins to verify that the color data bits shift dynamically when directional buttons are pressed.

## External hardware

- Standard digital pushbuttons for directional inputs (connected to ui_in[3:0]).
- A toggle switch for speed modification (connected to ui_in[4]).
- A 2-bit TinyTapeout VGA PMOD or custom resistor-ladder breakout board connected to the 8 output pins (uo_out) to interface with a standard VGA monitor display.
