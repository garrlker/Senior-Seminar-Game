/// @description test torch
rad = 96            // the radius of the light
tile_size = 16;     // size of a tile

startx = floor((lx-rad)/tile_size);
endx = floor((lx+rad)/tile_size);
starty = floor((ly-rad)/tile_size);
endy = floor((ly+rad)/tile_size);
surface_set_target(global.surf);
draw_clear_alpha(0,0);

vertex_begin(VBuffer, VertexFormat);
for(var yy=starty;yy<=endy;yy++)
{
    for(var xx=startx;xx<=endx;xx++)
    {

		var tile = instance_place(xx * tile_size,yy * tile_size,oParSolid)
		if( tile!=noone and (yy*tile_size < 320))
		{
			var px1 = tile.x
			var py1 = tile.y
			var px2 = px1+tile_size
			var py2 = py1+tile_size

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
        }
    }
}
vertex_end(VBuffer);    
vertex_submit(VBuffer,pr_trianglelist,-1);
surface_reset_target();

//shader_set(shader0);
//shader_set_uniform_f( LightPosRadius, lx,ly,rad,0.0 );
draw_surface_ext(global.surf,0,0,1,1,0,image_blend,0.5);
//shader_reset();

