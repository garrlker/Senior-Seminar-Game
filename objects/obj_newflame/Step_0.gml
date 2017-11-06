/// @description start the particle streams
//exit;
part_emitter_region(fire_sys,my_emitter,x-16,x+16,y-16,y+16,ps_shape_rectangle,ps_distr_linear);
part_emitter_burst(fire_sys,my_emitter,fire_part,25);
part_emitter_burst(fire_sys,my_emitter,cinder,15);


