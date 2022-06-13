/// @description Insert description here
// You can write your code in this editor

// Initialize variables
position = new vector(x, y);
velocity = new vector(3, 0);
steering_force = new vector(0, 0);

start_path = new vector(0, room_height/2);
end_path = new vector(room_width, room_height/2);
path_radius = 40;

max_speed = 4;
max_force = 0.1;