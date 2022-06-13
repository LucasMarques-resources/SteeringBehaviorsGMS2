// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Main vector struct
function vector(_x, _y) constructor
{
	x = _x;
	y = _y;
	
	static set = function(_x, _y)
	{
		x = _x;
		y = _y;
	}
	
	// Add two vectors
	static add = function(_vector)
	{
		x += _vector.x;
		y += _vector.y;
	}
	
	// Subtract two vectors
	static subtract = function(_vector)
	{
		x -= _vector.x;
		y -= _vector.y;	
	}
	
	// Multiply two vectors (scaling the vector by a scalar value)
	static multiply = function(_scalar)
	{
		x *= _scalar;
		y *= _scalar;
	}
	
	// Divide two vectors (scaling the vector by a scalar value)
	static divide = function(_scalar)
	{
		x /= _scalar;
		y /= _scalar;
	}
	
	// Rotate the vector 180 degrees (flip it)
	static negate = function()
	{
		x = -x;
		y = -y;
	}
	
	
	// Get the magnitude / length of the vector
	static get_magnitude = function()
	{
		return sqrt((x * x) + (y * y));
		// or
		// point_distance(0, 0, x, y);
    }
	
	static get_direction = function()
	{
		return point_direction(0, 0, x, y);	
	}
	
	// Make the vector a unit vector (unit vector has magnitude of 1)
	static normalize = function()
	{
		// Check if at least one part of the vector it's not 0 (can't divide by 0)
		if ((x != 0) || (y != 0))
		{
			var _factor = 1/sqrt((x * x) + (y * y));
			x *= _factor;
			y *= _factor;
		}
	}
	
	// Change the magnitude of the vector by setting its magnitude to 1 and then multiplying it by the scalar value
	static set_magnitude = function(_scalar)
	{
		normalize();
		multiply(_scalar);
	}
	
	// Limit magnitude of the vector by changing its magnitude to the limit
	static limit_magnitude = function(_limit)
	{
		if (get_magnitude() > _limit)
		{
			set_magnitude(_limit);	
		}
	}
	
	static copy = function(_vector)
	{
		x = _vector.x;
		y = _vector.y;
	}
}


// Children of the main vector struct
// Creates a vector with a random angle
// By default the length is 1 (unit vector)
function vector_random(_length = 1) : vector() constructor
{
	var _dir = random(360);
    x = lengthdir_x(_length, _dir);
    y = lengthdir_y(_length, _dir);
}

function vector_lengthdir(_length, _dir) : vector() constructor {
    x = lengthdir_x(_length, _dir);
    y = lengthdir_y(_length, _dir);
}

// Vector functions that dont modify the original vector
function vector_copy(_vector)
{
	return new vector(_vector.x, _vector.y);
}

function vector_subtract(_vector_a, _vector_b)
{
	return new vector((_vector_a.x - _vector_b.x), (_vector_a.y - _vector_b.y));
}