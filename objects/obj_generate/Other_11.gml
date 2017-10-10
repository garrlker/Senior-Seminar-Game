/// @description Insert description here
// You can write your code in this editor
oPlayer.y -= 2880
oPlayer.generateBoundry -= 2880
obj_depth_tracker.current_max_depth = oPlayer.y

with(oBlock){
	y -= 2880
	if(y < 0){
		instance_destroy()
	}
}
with(obj_darkPlayer){
	y -= 2880
}
with(oBlockBoundary){
	y -= 2880
	if(y < 0){
		instance_destroy()
	}
}
with(obj_newflame){
	y -= 2880
	if(y < 0){
		instance_destroy()
	}
}

//camera_set_view_pos(oGame.cam,camera_get_view_x(oGame.cam),camera_get_view_y(oGame.cam) - 2880);
