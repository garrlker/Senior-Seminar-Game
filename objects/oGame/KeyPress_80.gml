/// @description 
if(!pause){
	pause = true;
	screen_save(working_directory + "\pause_screen.png")
	sprite = sprite_add(working_directory + "\pause_screen.png",1,false,false,0,0);
	instance_deactivate_all(true);
}else{
	pause = false;
	sprite_delete(sprite);
	file_delete(working_directory + "\pause_screen.png");
	sprite = 0;
	instance_activate_all();
}