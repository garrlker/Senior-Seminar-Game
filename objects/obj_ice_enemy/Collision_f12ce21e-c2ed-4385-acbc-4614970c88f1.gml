/// @description 
with(other){
	instance_destroy();
}
hp -= 100;
audio_play_sound(snd_hit,1,0);
effect_create_above(ef_explosion,x,y,0,c_aqua);