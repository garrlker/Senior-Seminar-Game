// MUST HAVE: Draw the surface to the screen
draw_set_blend_mode_ext(bm_dest_color, bm_zero);
draw_surface_ext(sur, 0, 0, 1, 1, 0, c_white, 1);
draw_set_blend_mode(bm_normal);

// Draw info
draw_set_color(c_white);
draw_text(0, 0, string_hash_to_newline(string(fps) + "fps#" + string(instance_number(obj_light)) + " lights#" + string(instance_number(oParSolid)) + " casters"));
draw_set_color(c_black);

