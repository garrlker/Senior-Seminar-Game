repeat (abs(hsp)) {
if !place_meeting(x+sign(hsp),y,par_block) and !place_meeting(x+sign(hsp),y,par_jumpthrough) {x+=hsp}else{hsp=-hsp}
}

repeat (abs(vsp)) {
if !place_meeting(x,y+sign(vsp),par_block) and !place_meeting(x,y+sign(vsp),par_jumpthrough) {y+=vsp}else{
if alarm[0] < 0 {alarm[0]=2} //This makes the player able to react
}}

