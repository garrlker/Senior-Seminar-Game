/// @description Insert description here
// You can write your code in this editor
hp -= 1
effect_create_above(ef_explosion,x,y,0,c_dkgray);
with(other){
	instance_destroy()
}
if(hp = 0){
	instance_destroy()
}