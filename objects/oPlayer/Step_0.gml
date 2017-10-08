/// @description  Movement

// Input //////////////////////////////////////////////////////////////////////

var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kAction, kBlock, kRollL, kRollR, tempAccel, tempFric;

kLeft        = keyboard_check(vk_left)  || gamepad_axis_value(0, gp_axislh) < -0.4;
kRight       = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) >  0.4;
kUp          = keyboard_check(vk_up)    || gamepad_axis_value(0, gp_axislv) < -0.4;
//kDown        = keyboard_check(vk_down)  || gamepad_axis_value(0, gp_axislv) >  0.4;	//Don't really care for this
kDown = false;

kJump        = keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face1);

kAction      = keyboard_check_pressed(ord("X"))  || gamepad_button_check_pressed(0, gp_face3);
kBlock       = keyboard_check(ord("C"))          || gamepad_button_check(0, gp_face2);
kRollL       = keyboard_check_pressed(ord("A"))  || gamepad_button_check_pressed(0, gp_shoulderlb);
kRollR       = keyboard_check_pressed(ord("D"))  || gamepad_button_check_pressed(0, gp_shoulderrb);

if (instance_exists(oTouchCompatible)) {
    // Disable double-click (increases input accuracy)
    device_mouse_dbclick_enable(false);
    
    // LOL, magic numbers
    
    for (var i = 0; i < 8; ++i) {
        if (!kLeft)
            kLeft = device_mouse_check_button(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 16 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 16 + 64 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;
        if (!kRight)
        kRight = device_mouse_check_button(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 16 + 80 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 16 + 64 + 80 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;   
        
        if (!kJump)
            kJump = device_mouse_check_button_pressed(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 640 - 64 - 16 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 640 - 16 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;
        if (!kJumpRelease)
            kJumpRelease = device_mouse_check_button_released(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 640 - 64 - 16 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 640 - 16 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;
        
        if (!kAction)
            kAction = device_mouse_check_button_pressed(i, mb_left) && device_mouse_x(i) > __view_get( e__VW.XView, 0 ) + 640 - 64 - 16 - 80 && device_mouse_x(i) < __view_get( e__VW.XView, 0 ) + 640 - 16 - 80 && device_mouse_y(i) > __view_get( e__VW.YView, 0 ) + 280 && device_mouse_y(i) < __view_get( e__VW.YView, 0 ) + 280 + 64;
    }
     
    //draw_sprite(sJumpButton, 0, view_xview[0] + 640 - 64 - 16, view_yview[0] + 280);
    //draw_sprite(sAtkButton, 0, view_xview[0] + 640 - 64 - 96, view_yview[0] + 280); 
}

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
if (onGround) {  
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Reset wall cling
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
}   

// Cling to wall
if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;       
}

// Handle gravity
if (!onGround) {
    if ((cLeft || cRight) && vy >= 0) {
        // Wall slide
        vy = Approach(vy, vyMax, gravSlide);
    } else {
        // Fall normally
        vy = Approach(vy, vyMax, gravNorm);
		
		if(room = rm_fall){
			if(y > generateBoundry - 200){
				with(obj_generate){
					event_user(0)
				}
				generateBoundry = y + 800
			}
			if(y > 4000){
				with(obj_generate){
					event_user(1)
				}
			}
		}
	}
}

if (state != ROLL) {
// Left 
if (kLeft && !kRight && !sticking) {
    facing = -1;
    state  = RUN;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, -vxMax, tempAccel);
// Right
} else if (kRight && !kLeft && !sticking) {
    facing = 1;
    state  = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, vxMax, tempAccel);
}
}

// Friction
if (!kRight && !kLeft) {
    vx = Approach(vx, 0, tempFric);
    
    if (state != ROLL)
        state = IDLE;
} 
       
// Wall jump
if (kJump && cLeft && !onGround) {
    yscale = 1.33;
    xscale = 0.67;
            
    if (kLeft) {
        vy = -jumpHeight * 1.2;
        vx =  jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx =  vxMax; 
    }  
}

if (kJump && cRight && !onGround) {
    yscale = 1.33;
    xscale = 0.67;
    
    if (kRight) {
        vy = -jumpHeight * 1.2;
        vx = -jumpHeight * .66;
    } else {
        vy = -jumpHeight * 1.1;
        vx = -vxMax;
    }  
}
 
// Jump 
if (kJump) { 
    if (onGround) {
        // Fall thru platform
        if (kDown) {
            if (place_meeting(x, y + 1, oParJumpThru))
                ++y;
        } else {
		audio_play_sound(snd_jump,1,false);
            vy = -jumpHeight;
            
            yscale = 1.33;
            xscale = 0.67;
        }
    }
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0)
        vy *= 0.25;
}

// Jump state
if (!onGround)
    state = JUMP;
// Run particles
else if (random(100) > 85 && abs(vx) > 0.5)
    instance_create(x, y + 8, oParticlePlayer);

// Swap facing during wall slide
if (cRight && !onGround)
    facing = -1;
else if (cLeft && !onGround)
    facing = 1;

// Roll
if (onGround && !attacking) {
    if (state != ROLL) {
        if (kRollL) {
            facing = -1;
            
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRoll;
            
            state = ROLL;
        } else if (kRollR) {
            facing = 1;
            
            image_index  = 0;
            image_speed  = 0.5;
            sprite_index = sPlayerRoll;
            
            state = ROLL;
        }
    }
}

// Roll speed
if (state == ROLL) {
    vx = facing * 3;
    
    // Break out of roll
    if (!onGround || (cLeft || cRight)) {
        state = IDLE;
        if (!attacking)
            alarm[1] = -1;
    }
}
    
// Action
if (!kBlock && kAction) {
    if (!attacking) {
        // Attack out of roll
        if (onGround && state == ROLL) {
            image_index  = 0;
            image_speed  = 0.25;
            sprite_index = sPlayerRollSlash;
            
            alarm[1]  = 8; 
            attacking = true;       
        // Jab in place
        } else /*if (onGround && !kRight && !kLeft)*/ {
            image_index  = 0;
            image_speed  = 0.16;
            sprite_index = sPlayerJab;
            
            attacking = true;
        }
    }
	
	/*if(powerup = 1){
		var atk = instance_create(x,y,obj_flame);
		atk.image_xscale = facing
		//atk.speed = 8 * facing
		atk.speed = 8
		atk.direction = point_direction(0,0,gamepad_axis_value(0, gp_axislh),gamepad_axis_value(0, gp_axislv));
	}
	if(powerup = 2){
		var atk = instance_create(x,y,obj_ice);
		atk.image_xscale = facing
		//atk.speed = 8 * facing
		atk.speed = 8
		atk.direction = point_direction(0,0,gamepad_axis_value(0, gp_axislh),gamepad_axis_value(0, gp_axislv));
	}*/
}

if(gamepad_button_check(0, gp_face3) and (abs(gamepad_axis_value(0, gp_axislh)) > 0.15 or abs(gamepad_axis_value(0, gp_axislv)) > 0.15)){
	if(!audio_is_playing(snd_fire)){
		audio_play_sound(snd_fire,1,false)
	}
	repeat(5){
		var atk = instance_create(x,y,obj_newflame);
		atk.speed = 7;
		atk.direction = point_direction(0,0,gamepad_axis_value(0, gp_axislh),gamepad_axis_value(0, gp_axislv)) + random(10) - random(10);
	}
}
if(mouse_check_button(mb_left)){
	repeat(5){
		var atk = instance_create(x,y,obj_newflame);
		atk.speed = 7;
		atk.direction = point_direction(x,y,mouse_x,mouse_y) + random(10) - random(10);
	}
}

blocking = kBlock;

/* */
/// Squash + stretch

xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);

/* */
/// Hitbox

with (oPlayerAtkBox)
    instance_destroy();

// Dash out of roll
if (sprite_index == sPlayerRollSlash) {    
    with (instance_create(x, y, oPlayerAtkBox)) {
        bboxleft  = min(other.x + (5 * other.facing), other.x + (24 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (24 * other.facing));
        
        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8; 
    }
}
    
// Jab
if (sprite_index == sPlayerJab && round(image_index) > 0) {    
    with (instance_create(x, y, oPlayerAtkBox)) {
        bboxleft  = min(other.x + (5 * other.facing), other.x + (30 * other.facing));
        bboxright = max(other.x + (5 * other.facing), other.x + (30 * other.facing));
        
        bboxtop    = other.y - 1;
        bboxbottom = other.y + 8; 
    }
}

/* */
/*  */
