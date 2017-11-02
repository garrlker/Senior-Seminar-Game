
if(light_set = 0){
	lx = mouse_x;       // the light position, based around the mouse location
	ly = mouse_y;
}
rad = 96            // the radius of the light
tile_size = 16;     // size of a tile
tilemap = layer_tilemap_get_id("Tiles_2");


startx = floor((lx-rad)/tile_size);
endx = floor((lx+rad)/tile_size);
starty = floor((ly-rad)/tile_size);
endy = floor((ly+rad)/tile_size);
var draw = false
surface_set_target(global.surf);
draw_clear_alpha(0,0);

vertex_begin(VBuffer, VertexFormat);
for(var yy=starty;yy<=endy;yy++)
{
    for(var xx=startx;xx<=endx;xx++)
    {
        //var tile = tilemap_get(tilemap,xx,yy);
        //var tile = position_meeting(xx * tile_size,yy * tile_size,oParSolid)
		//var tile = position_empty(xx * tile_size,yy * tile_size);
		var tile = instance_place(xx * tile_size,yy * tile_size,oParSolid)
		//var tile = place_meeting(xx * tile_size,yy * tile_size,oParSolid)
		//if(tile!=true)
		if( tile!=noone and (yy*tile_size < 320))
		{
			//show_message("X: "+string(xx)+" #Y: "+string(yy))
            // get corners of the 
            //var px1 = xx*tile_size;     // top left
            //var py1 = yy*tile_size;
            //var px2 = px1+tile_size;    // bottom right
            //var py2 = py1+tile_size;
			var px1 = tile.x
			var py1 = tile.y
			var px2 = px1+tile_size
			var py2 = py1+tile_size
			
			//draw_rectangle_color(px1,py1,px2,py2,c_white,c_white,c_white,c_white,false)

                if( !SignTest( px1,py1, px2,py1, lx,ly) ){
			        ProjectShadow(VBuffer,  px1,py1, px2,py1, lx,ly );
			    }
				if( !SignTest( px2,py1, px2,py2, lx,ly) ){
					ProjectShadow(VBuffer,  px2,py1, px2,py2, lx,ly );
			    }
				if( !SignTest( px2,py2, px1,py2, lx,ly) ){
					ProjectShadow(VBuffer,  px2,py2, px1,py2, lx,ly );
			    }
				if( !SignTest( px1,py2, px1,py1, lx,ly) ){
					ProjectShadow(VBuffer,  px1,py2, px1,py1, lx,ly );                      
			    }                   
        }else{
			draw = true
		}
    }
}
vertex_end(VBuffer);    
vertex_submit(VBuffer,pr_trianglelist,-1);
surface_reset_target();

shader_set(shader0);
shader_set_uniform_f( LightPosRadius, lx,ly,rad,0.0 );
draw_surface_ext(global.surf,0,0,1,1,0,image_blend,0.5);
shader_reset();

if(draw == true){
	draw_text(mouse_x+32,mouse_y,"Blah")
}
