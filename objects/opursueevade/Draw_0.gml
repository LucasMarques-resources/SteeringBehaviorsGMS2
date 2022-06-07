/// @description Insert description here
// You can write your code in this editor

draw_self();
/*
if (global.debugMode)
{
	var yy = 20;
	draw_text(5, yy, "x : " + string(x));
	draw_text(5, yy * 2, "y : " + string(y));
	draw_text(5, yy * 3, "VECTORS (NOT BY SCALE)");
	draw_text(5, yy * 4, "velocity : " + string(velocity));
	draw_text(5, yy * 5, "acceleration : " + string(acceleration));
	
	draw_line_color(x, y, x + (velocity.x * 100), y + (velocity.y * 100), c_red, c_red);

	draw_line_color(x, y, x + (acceleration.x * 5000), y + (acceleration.y * 5000), c_green, c_green);
}