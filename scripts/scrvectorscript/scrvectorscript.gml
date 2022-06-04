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
}