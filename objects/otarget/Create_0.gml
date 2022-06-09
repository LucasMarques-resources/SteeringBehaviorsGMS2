/// @description Insert description here
// You can write your code in this editor

// Initialize variables
dir = irandom_range(0, 359);
spd = 3;
position = new vector(x, y);
velocity = new vector(lengthdir_x(spd, dir), lengthdir_y(spd, dir));

image_blend = c_red;