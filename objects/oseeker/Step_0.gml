/// @description Insert description here
// You can write your code in this 

// Add to the variable the steering force
steering_force.add(arrive_force(mouse_x, mouse_y, 100));

// Update the vectors
velocity.add(steering_force);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_force.set(0, 0);

// Update the instance variables
x += velocity.x;
y += velocity.y;
image_angle = velocity.get_direction();


/* A way to create seek behaviour

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