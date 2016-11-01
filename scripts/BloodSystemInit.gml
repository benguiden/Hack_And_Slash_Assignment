///Initalize the blood particle system
global.bloodParticle = part_type_create();
var pt = global.bloodSystem;


//Settings for particle system
part_type_shape(pt, pt_shape_disk);
part_type_size(pt, .05, .075, 0, 0);
part_type_colour1(pt, make_color_hsv(random(8), 196 + random(64), 64 + random(64)));
part_type_speed(pt, 3, 5, -0.01, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_gravity(pt, 0, 0);
part_type_life(pt, 15, 20);
