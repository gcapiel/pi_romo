pi_romo
=======

Raspberry Pi Control library for 2nd generation Romotive protocol

We went back to the drawing board and completely revamped the firmware. The new protocol is a PWM signal sent over the audio channel that gives the robot 255 speeds on each motor, along with the ability to have each AUX channel go forward, back, and stop.

The PWM signal is comprised two channels, the left used for the clock signal and the right for the data signal. The PWM signal is generated as a square wave of 1000hz.

The left channel clock signal comprises of 12 bits. In order to trigger the circuit, the start the square wave has to be low. The peak of each wave denotes a bit. A full 12 bits denotes one command.

The right channel data signal comprises of first 3 bits for the address, the next 8 bits for the  actual command, and the last bit as an even parity bit.

For the first 3 bits, the motor addresses are:

001 – Left motor
010 – Right Motor
011 – All 3 Auxiliary Motors
For the next 8 bits, the commands range from 0 to 255.

0 (00000000) is full reverse
128 (10000000) is stop
255 (11111111) is full forward
Any thing in between those values will give you a partial speed.

The last bit is a parity bit that keep the entire frame even. For example, if you have an address of 001 (left motor) and you want to send it in full reverse (00000000), the last bit has to be 1 to make the entire frame even. So the command for that would be 001000000001.

Each motor is triggered separately. It only seems that they move together because of the short duration of the audio signal sent.
