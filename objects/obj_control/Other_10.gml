// Create a light on mouse position
with (instance_create_layer(mouse_x, mouse_y,"generatedInstances", obj_light)) {
  image_blend = make_color_rgb(200 + irandom(55), 200 + irandom(55), 200 + irandom(55));
  light_change_scale(2, 2);
  light_update();
}

