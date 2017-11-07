/// @description start the particle streams
//exit;
alrm -= 1;
if(alrm == 0){
	part_emitter_region(fire_sys,my_emitter,x-16,x+16,y-16,y+16,ps_shape_rectangle,ps_distr_linear);
	part_emitter_burst(fire_sys,my_emitter,fire_part,15);
	part_emitter_burst(fire_sys,my_emitter,cinder,8);

	if(fps_real > 120){
		alrm = 1;
	}else if(fps_real > 60){
		alrm = 2;
	}else{
		alrm = 4;
	}
}
