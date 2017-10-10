/// @description Insert description here
// You can write your code in this editor

var mode = choose(0,1,2)
var i = 0;
var xx = 0;
//var yy = camera_get_view_y(oGame.cam) + 540;
var yy = oPlayer.y + 360
		
switch(mode){
	case 0:
		var xx = random(480) - random(640)
		repeat(40){
			instance_create_layer(xx + 16 * i,yy,"generatedInstances",oBlock)
			i += 1;
		}
	break;
	case 1:
		xx = 88
		instance_create_layer(xx,yy - 16,"generatedInstances",oBlock);
		repeat(3){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}
		xx += 48
		repeat(3){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}
		instance_create_layer(xx,yy,"generatedInstances",oBlock);
		instance_create_layer(xx + 16,yy,"generatedInstances",oBlock);
		instance_create_layer(xx + 16,yy - 16,"generatedInstances",oBlock);
	break;
	case 2:
		xx = 88
		repeat(20){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}

		for(j = 1;j < 6;j+=1){
			xx = 88
			repeat(5){
				instance_create_layer(xx,yy-(16 * j),"generatedInstances",oBlock);
				xx += 48;
			}
		}
		xx += 176
		
		repeat(4){
			instance_create_layer(xx,yy,"generatedInstances",oBlock);
			xx += 16;
		}
		
		xx = 504
		j = 0
		repeat(5){
			instance_create_layer(xx,yy-(16 * j),"generatedInstances",oBlock);
			xx += 48;
			j += 1
		}
	break;	
		default:
		
		break;
}

//Boundaries
//for(i=camera_get_view_y(oGame.cam);i<camera_get_view_y(oGame.cam)+1160;i+=16){
for(i=yy - 540;i<yy + 620;i+=16){
	instance_create_layer(72,i,"Instances_1",oBlockBoundary)
	instance_create_layer(552,i,"Instances_1",oBlockBoundary)
}


