/// @description Insert description here
// You can write your code in this editor
hp-=1
if(sprite_index = sBlockIce){
	sprite_index = sBlock16;
	frozen = false;
}
image_index+=1
if(abs(other.y - y) < 16){
	with(other){
		instance_destroy()
	}
}
effect_create_above(ef_explosion,x,y,0,c_dkgray);
if(hp=0){
	instance_destroy()
}