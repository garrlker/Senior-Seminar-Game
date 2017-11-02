/// create_light(x,y,color,scale,obj to follow)
var light = instance_create_layer(argument0, argument1,"generatedInstances", obj_light);
with (light) {
  image_blend = argument2
  light_change_scale(argument3, argument3);
  obj = argument4
  light_update();
}