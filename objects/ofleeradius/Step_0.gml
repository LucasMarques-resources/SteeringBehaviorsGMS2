/// @description Insert description here
// You can write your code in this 

// Add to the variable the steering force
apply_force(flee_force_radius(mouse_x, mouse_y, 150, 0.03));
apply_force(separation_force(object_index, 30));

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