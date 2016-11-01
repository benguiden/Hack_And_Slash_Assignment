///Initalize the blood particle
var xx = argument0;
var yy = argument1;
var number = argument2;
var dir = argument3;
var spread = argument4;

part_type_direction(global.bloodParticle, dir-abs(spread/2), dir+abs(spread/2), 0, 0);

for (i=0; i < number; i++){
    part_type_colour1(global.bloodParticle, make_color_hsv(random(8), 196 + random(64), 64 + random(64)));
    part_particles_create(global.bloodSystem, xx, yy, global.bloodParticle, 1);
}
