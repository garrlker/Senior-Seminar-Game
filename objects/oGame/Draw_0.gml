/// @description Insert description here
// You can write your code in this editor
var xx = camera_get_view_x(oGame.cam);
var yy = camera_get_view_y(oGame.cam);
draw_set_color(c_white)
if(room = rm_fall){
	draw_rectangle_color(xx,yy,xx + 72,yy + 360,c_black,c_black,c_black,c_black,false)
	draw_rectangle_color(xx + 568,yy,xx + 640,yy + 360,c_black,c_black,c_black,c_black,false)
	draw_set_font(fnt_small);
	draw_text(xx,yy,"Depth: "+string(obj_depth_tracker.depth_score))

}else{
	//Put Stuff Here
}
//surface_set_target(obj_control.sur);
//draw_text(xx,yy + 16,camera_get_view_x(cam));
//draw_text(xx,yy + 32,camera_get_view_y(cam));
//draw_text(xx,yy + 48,"FPS: "+string(fps));
//draw_text(xx,yy + 64,"FPS Real: "+string(fps_real));
//draw_text(xx,yy + 80,"Particles: "+string(part_particles_count(global.partsys_fire)));
//surface_reset_target();
//show_debug_overlay(true)

