/// @description Insert description here
// You can write your code in this 

//show_message(position);
//show_message(string(x) + " : " + string(y));

//velocity.set(lengthdir_x(spd, dir), lengthdir_y(spd, dir));

position.add(velocity);

var _margin = sprite_width/2;
if (x + _margin >= room_width) || (x <= 0)
	velocity.x *= -1;
	
if (y + _margin >= room_height) || (y <= 0)
	velocity.y *= -1;

x += velocity.x;
y += velocity.y;