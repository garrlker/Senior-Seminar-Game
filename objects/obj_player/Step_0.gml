/// @description Movement Code
// You can write your code in this editor
//Eventually I will move this into a 'check input' function that will dynamically check depending on if we're on keyboard, if caps is accidentally up
//Or if there is a controller plugged in, etc. But for now we need something on screen and thats it

if(keyboard_check(ord("W"))){
	if(can_jump = true){
		can_jump = false;
		curr_vspeed = -15
	}
}
if(keyboard_check(ord("A"))){
	if(abs(curr_hspeed) < max_hspeed){
		curr_hspeed -= (max_hspeed - abs(curr_hspeed))/accel //Accelerate towards the left with 10 of the different between your max and current speed
	}
}
if(keyboard_check(ord("S"))){
	//Fall through platform or something
}
if(keyboard_check(ord("D"))){
	if(curr_hspeed < max_hspeed){
		curr_hspeed += (max_hspeed - curr_hspeed)/accel //Accelerate towards the right with 10 of the different between your max and current speed
	}
}
