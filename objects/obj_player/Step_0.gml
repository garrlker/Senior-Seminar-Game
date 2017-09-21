script_movement_player(vk_right,vk_up,vk_left);
if(position_meeting(x + (9 * spr_dir),y,par_block)){
	colliding_with_wall = true;
	alarm[1] = 2;
}