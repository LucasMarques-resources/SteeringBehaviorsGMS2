/// @description Insert description here
// You can write your code in this 

// Add to the variable the steering force
if (!global.changeSteeringBehaviour)
	steering_force.add(seek_force(oArrive.x, oArrive.y));
else
	steering_force.add(flee_force(oArrive.x, oArrive.y));

// Update the vectors
velocity.add(steering_force);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_force.set(0, 0);

// Update the instance variables
x += velocity.x;
y += velocity.y;
image_angle = velocity.get_direction();