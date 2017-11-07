/// @description 
var move = 0;
if(oPlayer.x > x){
	move = 1;
}else{
	move = -1;
}

image_xscale = move;
//hsp = move * walksp;
if(can_jump = 1){
	charge += abs(move) * walksp
}

if(charge > 120 and can_jump = 1){
	charge = 0;
	can_jump = 0;
	vsp = -3;
	hsp = 3 * move;
}

vsp = vsp + grv

//Horizontal
if(place_meeting(x+hsp,y,oParSolid)){
	while(!place_meeting(x+sign(hsp),y,oParSolid)){
		x = x + sign(hsp)
	}
	
	hsp = 0;
}

x = x + hsp;

//Vertical
if(place_meeting(x,y+vsp,oParSolid)){
	while(!place_meeting(x,y+sign(vsp),oParSolid)){
		y = y + sign(vsp)
	}
	var wall = instance_place(x,y+vsp,oParSolid);
	with(wall){
		frozen = 1;
		sprite_index = spr_platform_ice;
		image_index = choose(1,2,3)
	}
	can_jump = 1;
	vsp = 0;
	hsp = 0;
}

y = y + vsp;

if(hp < 1){
	instance_destroy()
}

if(oPlayer.y - y > 900){
	instance_destroy()
}