// MUST HAVE: Draw all the lights to the surface
if(!surface_exists(sur)){
	sur = surface_create(room_width,room_height);
}
surface_set_target(sur);
draw_clear(c_black);
draw_set_blend_mode(bm_add);
with (obj_light) {
	if(!surface_exists(sur)){
		surface_reset_target();
		light_change_scale(1, 1);
		// Update the light, so it's surface is drawn correctly
		light_update();
		surface_set_target(sur);
	}
	draw_surface_ext(sur, x - sprite_width / 2, y - sprite_height / 2, 1, 1, 0, image_blend, 1);
}
draw_set_blend_mode(bm_normal);
surface_reset_target();

