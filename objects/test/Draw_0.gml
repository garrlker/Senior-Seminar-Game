/// @description Insert description here
// You can write your code in this editor
draw_text(0,0,keyboard_key);
draw_text(0,16,curr_hspeed);
draw_text(0,32,curr_vspeed);
draw_sprite(sprite1,-1,x,y);
draw_line_color(x,y,x+curr_hspeed*8,y+curr_vspeed*4,c_orange,c_orange);
draw_rectangle_color(x-32,y+32,x+32,y+64,c_white,c_white,c_white,c_white,true);