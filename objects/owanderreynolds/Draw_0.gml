/// @description Insert description here
// You can write your code in this editor

draw_self();

if (global.debugMode)
{
	var _wander_distance_x = x + lengthdir_x(wander_distance, image_angle);
	var _wander_distance_y = y + lengthdir_y(wander_distance, image_angle);
	var _circle_point_x = _wander_distance_x + lengthdir_x(wander_power, image_angle + wander_angle);
	var _circle_point_y = _wander_distance_y + lengthdir_y(wander_power, image_angle + wander_angle);

	draw_line(x, y, _wander_distance_x, _wander_distance_y);

	draw_circle_color(_wander_distance_x, _wander_distance_y, wander_power, c_red, c_red, true);

	draw_line_color(_wander_distance_x, _wander_distance_y, _circle_point_x, _circle_point_y, c_green, c_green);

	draw_circle(_circle_point_x, _circle_point_y, 5, false);

	draw_line(x, y, _circle_point_x, _circle_point_y);
}