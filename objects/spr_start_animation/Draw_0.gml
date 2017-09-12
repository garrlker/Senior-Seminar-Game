/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_intro,image_index,x,y);
if(draw_message = true){
	draw_text_color(x-128,y-128,"I'm out",c_black,c_black,c_black,c_black,1)
}
if(image_index = 7){
	room_goto_next()
}