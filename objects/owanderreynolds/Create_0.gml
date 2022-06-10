/// @description Insert description here
// You can write your code in this editor

// Initialize variables
position = new vector(x, y);
velocity = new vector_random(3);
steering_force = new vector(0, 0);

max_speed = 3;
max_force = 0.1;

wander_angle = random(360);
wander_distance = 100;
wander_power = 60;
wander_change = 20;