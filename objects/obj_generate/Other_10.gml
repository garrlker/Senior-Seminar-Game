/// @description Insert description here
// You can write your code in this editor

var mode = choose(0,1,2,3)
var i = 0;
var xx = 0;
var yy = camera_get_view_y(oGame.cam) + 360;
		
switch(mode){
	case 0:
		var xx = random(480) - random(640)
		repeat(40){
			instance_create(xx + 16 * i,yy,oBlock)
			i += 1;
		}
	break;
	case 1:
		xx = 88
		instance_create(xx,yy - 16,oBlock);
		repeat(3){
			instance_create(xx,yy,oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create(xx,yy,oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create(xx,yy,oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create(xx,yy,oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create(xx,yy,oBlock);
			xx += 16;
		}
		instance_create(xx,yy,oBlock);
		instance_create(xx + 16,yy,oBlock);
		instance_create(xx + 16,yy - 16,oBlock);
		
		default:
		
		break;
}

//Boundaries
for(i=camera_get_view_y(oGame.cam);i<camera_get_view_y(oGame.cam)+1160;i+=16){
	instance_create_layer(72,i,"Instances_1",oBlockBoundary)
	instance_create_layer(552,i,"Instances_1",oBlockBoundary)
}


