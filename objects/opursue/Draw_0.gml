/// @description Insert description here
// You can write your code in this editor

draw_self();

// Add to the variable the steering force
if (instance_exists(oTarget)) steering_force.add(pursue_force(oTarget));