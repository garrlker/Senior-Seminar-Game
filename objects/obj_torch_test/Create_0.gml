/// @description init shadow casting
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();


rad = 96            // the radius of the light
tile_size = 16;     // size of a tile
tilemap = layer_tilemap_get_id("Tiles_2");
startx  = 0
endx	= 0
starty	= 0
endy	= 0
lx = x
ly = y
light_set = 0
LightPosRadius = shader_get_uniform(shader0,"u_fLightPositionRadius");
