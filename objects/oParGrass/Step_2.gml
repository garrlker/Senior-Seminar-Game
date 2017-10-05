xskew = Approach(xskew, xset, 0.5); //0.5

//if (xskew == xset)
//    xset *= -0.5;
    
if (parent) {
    x = parent.x + dx;
    y = parent.y + dy; 
}

xset += 0.5;
xset = min(xset, skewmax);

if (--delay <=0) {
    skewmax = random_range(4, 8);
    delay = 4;
}

if(onFire = true){
	effect_create_below(ef_smokeup,x,y,0,c_red);
}