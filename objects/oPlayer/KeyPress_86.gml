/// @description demo
repeat(5){
		var atk = instance_create(x,y,obj_newflame);
		atk.speed = 7;
		atk.direction = 270
		create_light(x,y,c_red,.25,atk);
	}