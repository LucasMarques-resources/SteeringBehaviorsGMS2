/// @description Insert description here
// You can write your code in this editor

draw_self();

for (var i = 0; i < array_length(paths); i++)
{
	//for (var j = 0; j < array_length(paths[i]); j++)
	var _start_path = new vector(paths[i][0], paths[i][1]);
	var _end_path = new vector(paths[i][2], paths[i][3]);
	draw_line(_start_path.x, _start_path.y, _end_path.x, _end_path.y);
}

start_path.set(paths[current_path][0], paths[current_path][1]);
end_path.set(paths[current_path][2], paths[current_path][3]);

apply_force(paths_following(start_path, end_path, path_radius));

show_debug_message("start path " + string(start_path));
show_debug_message("end path " + string(end_path));