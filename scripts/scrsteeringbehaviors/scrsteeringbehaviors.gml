// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function apply_force(_force, _weight = 1) {
	_force.multiply(_weight);
	steering_force.add(_force);
}

function seek_force(_x, _y)
{
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	_vec.set_magnitude(max_speed);
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}

function flee_force(_x, _y)
{
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	_vec.set_magnitude(max_speed);
	_vec.negate();
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}

function flee_force_radius(_x, _y, _radius, _slow_down_amount)
{
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	if (_vec.get_magnitude() < _radius)
	{
		_vec.set_magnitude(max_speed);
		_vec.negate();
		_vec.subtract(velocity);
		_vec.limit_magnitude(max_force);
		//show_debug_message("IN");
		return _vec;
	}
	else
	{
		//show_debug_message("OUT");
		slow_down(_slow_down_amount);
		return new vector(0, 0);
	}
}

function slow_down(_amount)
{
	velocity.x = lerp(velocity.x, 0, _amount);
	velocity.y = lerp(velocity.y, 0, _amount);
}

function pursue_force(_inst)
{
	var _vec = vector_copy(_inst.velocity);
	// Get the future position
	_vec.multiply(20);
	_vec.add(_inst.position);
	
	// Debug
	//draw_line(_inst.x, _inst.y, _vec.x, _vec.y);
	
	return seek_force(_vec.x, _vec.y);
}

function evade_force(_inst)
{
	var _vec = vector_copy(_inst.velocity);
	// Get the future position
	_vec.multiply(20);
	_vec.add(_inst.position);
	return flee_force(_vec.x, _vec.y);
}

function arrive_force(_x, _y, _slowing_radius)
{
	var _vec = new vector(_x, _y);
	_vec.subtract(position);
	
	var _dist = _vec.get_magnitude();
	// Outside the circle
	if (_dist > _slowing_radius) {
		_vec.set_magnitude(max_speed);	
	} else { // Inside the circle
		_vec.set_magnitude(max_speed * (_dist / _slowing_radius));
	}
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}

function wander_force()
{
	var _vec = vector_copy(velocity);
	_vec.set_magnitude(wander_distance);
	_vec.add(new vector_lengthdir(wander_power, image_angle + wander_angle));
	_vec.limit_magnitude(max_force);
	
	wander_angle += random_range(-wander_change, wander_change);
	
	return _vec;
}

function align_force(_obj = object_index, _max_dist = 200)
{
	var _vec = new vector(0, 0);
	var _count = 0;
	
	with (_obj)
	{
		// Make sure the vehicle doesn't count it self
		// "continue" skips to the next instance
		if (id == other.id)
			continue;
		
		// Check if the vehicle is outside a certain radius
		// If it is, skips to the next instance
		if (point_distance(position.x, position.y, other.position.x, other.position.y) > _max_dist)
			continue;
		
		_vec.add(velocity);
		_count += 1;
	}
	
	if (_count > 0)
	{
		_vec.set_magnitude(max_force);
	}
	
	return _vec;
}

function cohesion_force(_obj = object_index, _max_dist = 200)
{
	var _vec = new vector(0, 0);
	var _count = 0;
	
	with (_obj)
	{
		// Make sure the vehicle doesn't count it self
		// "continue" skips to the next instance
		if (id == other.id)
			continue;
		
		if (point_distance(position.x, position.y, other.position.x, other.position.y) > _max_dist)
			continue;
		
		_vec.add(position);
		_count += 1;
	}
	
	if (_count > 0)
	{
		_vec.divide(_count);
		_vec = seek_force(_vec.x, _vec.y);
	}
	
	return _vec;
}

function separation_force(_obj = object_index, _max_dist = 200)
{
	var _vec = new vector(0, 0);
	var _count = 0;
	var _vec_to;
	
	with (_obj)
	{
		if (id == other.id)
			continue;
		
		if (point_distance(position.x, position.y, other.position.x, other.position.y) > _max_dist)
			continue;
		
		_vec_to = vector_subtract(other.position, position);
		
		var _dist = min(_vec_to.get_magnitude(), 200);
		var _scale = (1 - (_dist/200));
		_vec_to.multiply(_scale);
		_vec.add(_vec_to);
		_count += 1;
	}
	
	if (_count > 0)
	{
		_vec.set_magnitude(max_force);
	}
	
	return _vec;
}

function path_following(_start, _end, _radius)
{
	var _future = vector_copy(velocity);
	// Get the future position
	_future.multiply(20);
	_future.add(position);
	
	var _target = findProjection(_start, _future, _end);
	var _target_future = vector_copy(_target);
	var _ahead = vector_subtract(end_path, start_path);
	_ahead.set_magnitude(30);
	_target_future.add(_ahead);
	
	if (global.debugMode)
	{
		draw_circle_color(_future.x, _future.y, 5, c_red, c_red, false);
		draw_circle_color(_target.x, _target.y, 5, c_green, c_green, false);
		draw_circle_color(_target_future.x, _target_future.y, 5, c_blue, c_blue, false);
	}
	
	var _dist = point_distance(_future.x, _future.y, _target.x, _target.y);
	//show_debug_message("dist " + string(_dist));
	//show_debug_message("radius " + string(_radius));
	if (_dist > _radius)
	{
		return seek_force(_target_future.x, _target_future.y);
	}
	else
		return new vector(0, 0);
}

// Path following with different paths
// In a bad and tricky way
function paths_following(_start, _end, _radius)
{
	var _future = vector_copy(velocity);
	// Get the future position
	_future.multiply(20);
	_future.add(position);
	
	var _target = findProjection(_start, _future, _end);
	var _target_future = vector_copy(_target);
	var _ahead = vector_subtract(_end, _start);
	_ahead.set_magnitude(30);
	_target_future.add(_ahead);
	
	if (point_distance(_target.x, _target.y, _end.x, _end.y) < 5)
	{	
		if (current_path < array_length(paths) - 1)
			current_path += 1;
		else
			current_path = 0;
	}
		
	if (global.debugMode)
	{
		draw_line(position.x, position.y, _future.x, _future.y);
		draw_line(_future.x, _future.y, _target.x, _target.y);
		draw_circle_color(_future.x, _future.y, 5, c_red, c_red, false);
		draw_circle_color(_target.x, _target.y, 5, c_green, c_green, false);
		draw_circle_color(_target_future.x, _target_future.y, 5, c_blue, c_blue, false);
	}
	
	var _dist = point_distance(_future.x, _future.y, _target.x, _target.y);
	if (_dist > _radius)
	{
		return seek_force(_target_future.x, _target_future.y);
	}
	else
		return new vector(0, 0);
}