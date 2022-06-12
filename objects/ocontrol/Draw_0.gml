/// @description Insert description here
// You can write your code in this editor

draw_text(10, 10, "F1 - debug");

if (global.debugMode)
{
	if (room == r_Flee_Radius)
	{
		draw_circle(mouse_x, mouse_y, oFleeRadius.radius, true);
	}
	
}