/// @description 
if (other.y < y and dead = 0){
	audio_play_sound(snd_hit,1,0)
	other.vy = -5
	dead = 1
	alarm[0] = 30
}else{
	with(other){
		vy = 2.5
		if(canBeHit=true){
			canBeHit = false;
			hp -= 1;
			alarm[2] = 60;
		}
		//audio_play_sound(snd_hit,1,0)
	}
}