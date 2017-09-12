script_movement(ai_walk=1,ai_jump=true,ai_walk=-1);
if obj_player.x > x and floor(random(50))=0 {ai_walk=1}
if obj_player.x < x and floor(random(50))=0  {ai_walk=-1}
if obj_player.y-1 < y and floor(random(20))=0  {ai_jump=true}else{ai_jump=false}
if free=true {ai_jump=true}
