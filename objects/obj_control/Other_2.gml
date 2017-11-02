// MUST HAVE: Create a surface for drawing all the lights
sur = surface_create(room_width, room_height);

// Create a light
m = instance_create_layer(0, 0,"generatedInstances", obj_light);
with (m) {
  light_change_scale(3, 3);
  // Update the light, so it's surface is drawn correctly
  light_update();
}

