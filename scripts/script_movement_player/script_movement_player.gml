/// script_movement_player(Right Control, Jump Control, Left Control)

if argument0 {
	spr_dir=1
	if(hsp < 2){
		hsp+=0.2
	}
}

if argument2 {
	spr_dir=-1
	if(hsp > -2){
		hsp-=0.2
	}
}

if argument1 {
	if(free=false){
		vsp=-6
	}
	//Walljump
	if(freemd=0 and trinfree=0 and trin=999 and free=1){
		if(spr_dir=1){
			hsp=-3
			vsp=-6
		}else{
			hsp=3
			vsp=-6
		}
	}
}else{
	if(vsp < 0){
		vsp+=0.4
	}
}

//Changes sprite
if(spr_dir=1){
	if(free=true){
		sprite_index=spr_jump_right
	}else{
		sprite_index=spr_walk_right
	}
}else{
	if(free=true){
		sprite_index=spr_jump_left
	}else{
		sprite_index=spr_walk_left
	}
}
if (free=false and hsp=0 and !argument0 and !argument2) {
	sprite_index=spr_stand
}

//The repeat function only works with absolute values. This makes the values hrep/vrep go +1 if the hsp/vsp has decimals. 
hrep=0
vrep=0

if hsp > 0 {htime+=hsp-floor(hsp)}
if hsp < 0 {htime+=abs(hsp-ceil(hsp))}
if htime>=1 {htime=-1}
hrep=abs(hsp)
if htime=-1 {hrep+=1;htime=0}

if vsp > 0 {vtime+=vsp-floor(vsp)}
if vsp < 0 {vtime+=abs(vsp-ceil(vsp))}
if vtime>=1 {vtime=-1}
vrep=abs(vsp)
if vtime=-1 {vrep+=1;vtime=0}

trin=999

//The hspeed movement (Uses repeat function)
repeat(floor(hrep)) {

	if (!place_meeting(x+sign(hsp),y,par_block) and !place_meeting(x+sign(hsp),y,par_unit)){
		trinfree=true
	}else{
		trinfree=false
	}

	if (!place_meeting(x+sign(hsp),y,par_block) and !place_meeting(x+sign(hsp),y,par_unit)){
	//Move down if slopes goes down

	if (!place_meeting(x+sign(hsp),y+1,par_block) and freemd=true and !place_meeting(x+sign(hsp),y+1,par_unit)) {
		trin=1
		y+=1
		x+=sign(hsp)
		hsp = (abs(hsp)+0.03)*sign(hsp)//////Speed goes up while moving down
	}

	if trin=999 {
		x+=sign(hsp)
	}

	}else{
		//Move up if slopes goes up
		if !place_meeting(x+sign(hsp),y-1,par_block) and trinfree=false and !place_meeting(x+sign(hsp),y-1,par_unit) {
			trin=-1
			y-=1
			x+=sign(hsp)
			hsp = max(0,abs(hsp)-0.1)*sign(hsp)//////Speed goes down while moving up
		}


		if trin=999 {
			hsp=0
		}

	}
}

//The vspeed movement (Uses repeat function)
repeat(floor(vrep)) {
	if (!place_meeting(x,y+sign(vsp),par_block) and !place_meeting(x,y+sign(vsp),par_unit)){
		col_jumpthrough = collision_line(x+1,y+16,x+15,y+16,par_jumpthrough,0,1)

		if col_jumpthrough > 0 and vsp >= 0{
			cjy=col_jumpthrough.y
			
			if y < cjy-15+vsp {
				y = cjy - 16
				vsp=0
			}else{y+=sign(vsp)}}else{y+=sign(vsp)}

	}else{vsp=0}
}

//This last part simply checks if there is ground under the player.
if place_meeting(x,y+1,par_block) or place_meeting(x,y+1,par_unit){
	free=false;freemd=true
}else{
	freemd=false
	col_jumpthrough = collision_line(x+1,y+16,x+15,y+16,par_jumpthrough,0,1)
	if col_jumpthrough > 0 and vsp >= 0{
		cjy=col_jumpthrough.y
		if y < cjy-15+vsp {
			y = cjy - 16
			free=false
		
			if !place_meeting(x,y+sign(col_jumpthrough.vsp),par_block) and !place_meeting(x,y+sign(col_jumpthrough.vsp),par_unit) {y+=col_jumpthrough.vsp}//This makes the player follow a verticalmoving platform
			if !place_meeting(x+sign(col_jumpthrough.hsp),y,par_block) and !place_meeting(x+sign(col_jumpthrough.hsp),y,par_unit) {x+=col_jumpthrough.hsp}//This makes the player follow a horizontalmoving platform
		}else{
			free=true
		}
	}else{
		free=true
	}
}

	//This is for gravity and friction. (Change vsp to make gravity go up/down)
	if free=true {
		vsp+=0.2
		hsp = max(0,abs(hsp)-0.01)*sign(hsp)//In air friction
	}

	if free=false {
		hsp = max(0,abs(hsp)-0.1)*sign(hsp)//On ground friction
	}


