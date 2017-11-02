// MUST HAVE: Create a surface for drawing all the lights
sur = surface_create(room_width, room_height);

// Create a light
m = instance_create_layer(100, 100,"generatedInstances", obj_light);
with (m) {
  light_change_scale(1, 1);
  // Update the light, so it's surface is drawn correctly
  light_update();
}
// Create a light
m = instance_create_layer(540, 100,"generatedInstances", obj_light);
with (m) {
  light_change_scale(1, 1);
  // Update the light, so it's surface is drawn correctly
  light_update();
}
// Create a light
m = instance_create_layer(100, 200,"generatedInstances", obj_light);
with (m) {
  light_change_scale(1, 1);
  // Update the light, so it's surface is drawn correctly
  light_update();
}
// Create a light
m = instance_create_layer(540, 200,"generatedInstances", obj_light);
with (m) {
  light_change_scale(1, 1);
  // Update the light, so it's surface is drawn correctly
  light_update();
}

create_light(x,y,c_yellow,0.5,oPlayer)

