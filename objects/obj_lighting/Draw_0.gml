exit;
var lx = mouse_x;       // the light position, based around the mouse location
var ly = mouse_y;
rad = 96            // the radius of the light
tile_size = 16;     // size of a tile
tilemap = layer_tilemap_get_id("Tiles_2");


var startx = floor((lx-rad)/tile_size);
var endx = floor((lx+rad)/tile_size);
var starty = floor((ly-rad)/tile_size);
var endy = floor((ly+rad)/tile_size);

vertex_begin(VBuffer, VertexFormat);
for(var yy=starty;yy<=endy;yy++)
{
    for(var xx=startx;xx<=endx;xx++)
    {
        //var tile = tilemap_get(tilemap,xx,yy);
        var tile = position_meeting(xx,yy,oBlock)
		//var tile = position_empty(xx,yy);
		//if( tile!=0 )
        if(tile!=noone)
		{
            // get corners of the 
            var px1 = xx*tile_size;     // top left
            var py1 = yy*tile_size;
            var px2 = px1+tile_size;    // bottom right
            var py2 = py1+tile_size;


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