/// @description Insert description here
// You can write your code in this editor

if (room == r_Pursue_Bouncing_Ball)
{
	if (!instance_exists(oTarget))
	{
		var _xx = irandom_range(60, room_width - 60);
		var _yy = irandom_range(60, room_height - 60);
		instance_create_layer(_xx, _yy, "Instances", oTarget)
	}
}