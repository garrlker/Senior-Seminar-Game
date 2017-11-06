/// @description call the particle creation script
//init_fire_projectile_parts();
//Move globals to locals for performance reasons
fire_sys  = global.partsys_fire;
fire_part = global.part_proj_fire; 
cinder    = global.part_proj_cinder;
//set up the particle emitter
my_emitter = part_emitter_create(fire_sys);
part_emitter_region(fire_sys,my_emitter,mouse_x-16,mouse_x+16,mouse_y-16,mouse_y+16,ps_shape_rectangle,ps_distr_linear);



ttl = 1

create_light(x,y,c_orange,.5,instance_id);