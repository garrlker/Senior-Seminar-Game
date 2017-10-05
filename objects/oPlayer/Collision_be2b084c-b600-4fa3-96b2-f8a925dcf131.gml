/// @description Insert description here
// You can write your code in this editor
hp -= abs(other.vspeed / 10)
vx = other.hspeed
other.vspeed = 0
if(canBeHit = true or hitByLast != other){
	audio_play_sound(snd_hit,1,false);
	canBeHit = false;
	alarm[2] = 30;
	hitByLast = other;
}