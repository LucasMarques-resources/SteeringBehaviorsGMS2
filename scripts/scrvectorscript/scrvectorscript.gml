// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
	
	// Get the magnitude of the vector
	static get_magnitude = function() {
		return sqrt((x * x) + (y * y));
    }
	
	// Make the vector a unit vector (unit vector has magnitude of 1)
	static normalize = function() {
		// Check if at least one part of the vector it's not 0 (can't divide by 0)
		if ((x != 0) || (y != 0)) {
			var _factor = 1/sqrt((x * x) + (y * y));
			x *= _factor;
			y *= _factor;
		}
	}
	
	// Change the magnitude of the vector by setting its magnitude to 1 and then multiplying it by the scalar value
	static set_magnitude = function(_scalar) {
		normalize();
		multiply(_scalar);
	}
	
	// Limit magnitude of the vector by changing its magnitude to the limit
	static limit_magnitude = function(_limit) {
		if (get_magnitude() > _limit) {
			set_magnitude(_limit);	
		}
	}
}