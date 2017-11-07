/// @description 
if(obj!=0){
	if(instance_exists(obj)){
		x = obj.x
		y = obj.y
		light_update()
	}else{
		surface_free(sur);
		instance_destroy()
	}
}

//Update
if(fps_real > 120){
	alarm[0] = 1;
}else if(fps_real > 60){
	alarm[0] = 2;
}else{
	alarm[0] = 4;
}