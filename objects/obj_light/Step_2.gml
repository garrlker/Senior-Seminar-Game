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