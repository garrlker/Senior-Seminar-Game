/// @description Main Platforming physics code
// You can write your code in this editor

//Horizontal Movement
curr_hspeed -= (curr_hspeed * fric)//This is a basic friction, if I don't press A or D then since there is no acceleration going on the player will slow down

//Since our horizontal speed can be pos or negative, and just so happens to coincide with our position next frame
//Let's use that to check if theres a wall in that position, if so we need to stop
//if(!collision_line(x,y,x+32+curr_hspeed,y,obj_wall_par,false,true))
if(!collision_rectangle(x,y-24,x+(32 * sign(curr_hspeed))+curr_hspeed,y+24,obj_wall_par,false,true)){
	x += curr_hspeed
}else{
	curr_hspeed = curr_hspeed / 2;
}


//Vertical Movement
y += curr_vspeed

//Upwards collision
if(collision_rectangle(x+curr_hspeed-16,y-32+curr_vspeed,x+curr_hspeed+16,y-48+curr_vspeed,obj_wall_par,false,true)){
	curr_vspeed = 0
}

//Gravity
if(!collision_rectangle(x-32,y+32,x+32,y+32+(32 * curr_vspeed/max_vspeed),obj_wall_par,false,true)){
	curr_vspeed += grav
}else{
	can_jump = true;
	curr_vspeed = curr_vspeed / 2
}
	