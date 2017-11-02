//set up the particle system
//global.partsys_fire = part_system_create();
//part_system_depth(global.partsys_fire,0);

//set up the basic fire particle
global.part_proj_fire = part_type_create();

    //how it looks
    part_type_sprite(global.part_proj_fire,spr_fire,0,0,1);
    //part_type_size(global.part_proj_fire,1.5,3,-.05,0);
    //part_type_size(global.part_proj_fire,0.3,0.8,-.05,0);
    part_type_size(global.part_proj_fire,0.1,0.27,-.03,0);
    part_type_orientation(global.part_proj_fire,0,360,2,0,0);
    part_type_color2(global.part_proj_fire,c_orange,c_red);
    part_type_alpha3(global.part_proj_fire,1,1,0);
    part_type_blend(global.part_proj_fire,1);
    
    //how it moves
    part_type_direction(global.part_proj_fire,85,95,0,0);
    //part_type_speed(global.part_proj_fire,2,10,-.1,0);
	//part_type_speed(global.part_proj_fire,1,5,-.1,0);
	part_type_speed(global.part_proj_fire,.5,2.5,-.1,0);

    //how long it lasts
    part_type_life(global.part_proj_fire,25,35);
    
//set up an extra cinder particle for a nice added effect
global.part_proj_cinder = part_type_create();

    //how it looks
    part_type_sprite(global.part_proj_cinder,spr_cinder,0,0,1);
    //part_type_size(global.part_proj_cinder,.5,.75,-.001,0);
    //part_type_size(global.part_proj_cinder,.175,.25,-.001,0);
    part_type_size(global.part_proj_cinder,.06,.8,-.001,0);
    part_type_orientation(global.part_proj_cinder,0,360,.05,0,0);
    part_type_color2(global.part_proj_cinder,c_orange,c_red);
    part_type_alpha3(global.part_proj_cinder,1,1,0);
    part_type_blend(global.part_proj_cinder,1);
    
    //how it moves
    part_type_direction(global.part_proj_cinder,85,125,.01,.01);
    //part_type_speed(global.part_proj_cinder,6,8,0,0);
	//part_type_speed(global.part_proj_cinder,3,4,0,0);
	part_type_speed(global.part_proj_cinder,1.5,2,0,0);

    //how long it lasts
    part_type_life(global.part_proj_cinder,45,75);
    
    
    
    

