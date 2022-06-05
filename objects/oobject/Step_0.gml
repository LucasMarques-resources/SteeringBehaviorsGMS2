/// @description Insert description here
// You can write your code in this editor

var _dir, _accel_x, _accel_y;
// Get direction
_dir = point_direction(x, y, mouse_x, mouse_y);
// Converting a vector represented by a length and a direction
// to a vector represented by an x and a y
_accel_x = lengthdir_x(accel_force, _dir);
_accel_y = lengthdir_y(accel_force, _dir);

// Update the vectors
acceleration.set(_accel_x, _accel_y);
velocity.add(acceleration);
velocity.limit_magnitude(max_speed);

// Update the instance variables
x += velocity.x;
y += velocity.y;
image_angle = point_direction(0, 0, velocity.x, velocity.y);