/// @description Animate explosion
// © 2017 - Jon Harvey

for(var p = 0;p<40;p++){

    var Frame;
    Frame = clamp(Par[p]*2-.1,0,2);
    scr_lighting_draw_emissive(spr_explosion,Frame,x+Pax[p],y+Pay[p],Par[p],Par[p],Paa[p],-1,(Timer-Par[p]*.1)*10);
}

