/// @description Insert description here
// You can write your code in this

perlin_position += increment;

// Add to the variable the steering force
var _angle = (perlin_noise(perlin_position) * wander_power) + image_angle;
steering_force.add(new vector_lengthdir(max_force, _angle));

// Update the vectors
velocity.add(steering_force);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_force.set(0, 0);

// Update the instance variables
x += velocity.x;
y += velocity.y;
image_angle = velocity.get_direction();

edge_wrap();