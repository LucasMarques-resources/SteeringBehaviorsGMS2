/// @description Insert description here
// You can write your code in this editor

// Initialize variables
position = new vector(x, y);
velocity = new vector(3, 0);
steering_force = new vector(0, 0);

paths = 
[
	[160, 447, 160, 128],
	[160, 128, 639, 128],
	[639, 128, 639, 447],
	[639, 447, 160, 447]
]

current_path = 0;

start_path = new vector(0, 0);
end_path = new vector(0, 0);
path_radius = 40;

max_speed = 4;
max_force = 0.1;