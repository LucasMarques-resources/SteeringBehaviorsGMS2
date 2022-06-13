/// @description Insert description here
// You can write your code in this editor

draw_self();

if (global.debugMode)
{
	// Draw path radius
	draw_set_alpha(0.5);
	draw_line(start_path.x, start_path.y - path_radius, end_path.x, end_path.y - path_radius);
	draw_line(start_path.x, start_path.y + path_radius, end_path.x, end_path.y + path_radius);
	draw_set_alpha(1);
}

// Draw path
draw_line(start_path.x, start_path.y, end_path.x, end_path.y);

apply_force(path_following(start_path, end_path, path_radius));