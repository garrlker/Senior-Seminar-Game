// Update one light to follow the mouse
m.x = mouse_x;
m.y = mouse_y;

// Update this light to draw the correct shadows
with (m)
  light_update();

