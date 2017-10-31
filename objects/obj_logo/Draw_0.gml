/// @description Insert description here
// You can write your code in this editor
if(fade = true){
	image_alpha = image_alpha * 0.98
}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,image_alpha)
if(draw=true){
	draw_set_font(fnt_startGame);
	draw_text(x-80,y+80,"START GAME");
	draw_set_font(fnt_small);
}
