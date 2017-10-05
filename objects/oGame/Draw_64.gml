/// @description Insert description here
// You can write your code in this editor
draw_rectangle_color(0,0,144,720,c_black,c_black,c_black,c_black,false)
draw_rectangle_color(1136,0,1280,720,c_black,c_black,c_black,c_black,false)
draw_text(0,16,camera_get_view_x(cam));
draw_text(0,32,camera_get_view_y(cam));
draw_text(0,48,"FPS: "+string(fps));
draw_text(0,64,"FPS Real: "+string(fps_real));
draw_text(1160,32,"Depth: "+string(obj_depth_tracker.depth_score))
