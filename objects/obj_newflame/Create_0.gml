/// @description call the particle creation script
//init_fire_projectile_parts();

//set up the particle emitter
my_emitter = part_emitter_create(global.partsys_fire);
part_emitter_region(global.partsys_fire,my_emitter,mouse_x-16,mouse_x+16,mouse_y-16,mouse_y+16,ps_shape_rectangle,ps_distr_linear);



ttl = 1

create_light(x,y,c_orange,.5,self);