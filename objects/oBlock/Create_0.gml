/// @description Insert description here
// You can write your code in this editor
hp = 4
frozen = false

//
// How far to draw the shadow
height = 16;
// Fade the shadow
fade = true;

// Define the points of the shadow caster
points = 4;

px[0] = lengthdir_x(sprite_xoffset, image_angle + 180) + lengthdir_x(sprite_yoffset, image_angle + 90);
py[0] = lengthdir_y(sprite_xoffset, image_angle + 180) + lengthdir_y(sprite_yoffset, image_angle + 90);

px[1] = lengthdir_x(sprite_width - sprite_xoffset, image_angle) + lengthdir_x(sprite_yoffset, image_angle + 90);
py[1] = lengthdir_y(sprite_width - sprite_xoffset, image_angle) + lengthdir_y(sprite_yoffset, image_angle + 90);

px[2] = lengthdir_x(sprite_width - sprite_xoffset, image_angle) + lengthdir_x(sprite_height - sprite_yoffset, image_angle - 90);
py[2] = lengthdir_y(sprite_width - sprite_xoffset, image_angle) + lengthdir_y(sprite_height - sprite_yoffset, image_angle - 90);

px[3] = lengthdir_x(sprite_xoffset, image_angle + 180) + lengthdir_x(sprite_height - sprite_yoffset, image_angle - 90);
py[3] = lengthdir_y(sprite_xoffset, image_angle + 180) + lengthdir_y(sprite_height - sprite_yoffset, image_angle - 90);


