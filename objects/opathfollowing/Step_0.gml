/// @description Insert description here
// You can write your code in this

function findProjection(_start, _future, _end)
{
	var _vecA = vector_subtract(_future, _start);
	var _vecB = vector_subtract(_end, _start);
	_vecB.normalize();
	// Calculating the scalar projection using the dot product
	var _scalarProj = (_vecA.x * _vecB.x) + (_vecA.y * _vecB.y);
	_vecB.multiply(_scalarProj);
	_vecB.add(_start);
	return _vecB;
}

end_path.y = mouse_y;

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