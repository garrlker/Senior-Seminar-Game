/// @description start the particle streams
part_emitter_region(global.partsys_fire,my_emitter,x-16,x+16,y-16,y+16,ps_shape_rectangle,ps_distr_linear);
part_emitter_burst(global.partsys_fire,my_emitter,global.part_proj_fire,10);
part_emitter_burst(global.partsys_fire,my_emitter,global.part_proj_cinder,-5);


