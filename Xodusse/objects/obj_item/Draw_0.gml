/// @description Draw item
// © 2017 - Jon Harvey

if Id<=Idoubles*2{

    scr_lighting_draw_sprite(spr_items,spr_items_n,spr_items_she,Id-1,x-image_xscale*16*dcos(image_angle),y+image_xscale*16*dsin(image_angle),
    image_xscale/2,image_yscale/2,image_angle,-1,1);
    
    scr_lighting_draw_sprite(spr_items,spr_items_n,spr_items_she,Id,x+image_xscale*16*dcos(image_angle),y-image_xscale*16*dsin(image_angle),
    image_xscale/2,image_yscale/2,image_angle,-1,1);
    
    //draw_sprite_ext(spr_items,Id-1,x-image_xscale*16*dcos(image_angle),y+image_xscale*16*dsin(image_angle),image_xscale/2,image_yscale/2,image_angle,-1,1);
    //draw_sprite_ext(spr_items,Id,x+image_xscale*16*dcos(image_angle),y-image_xscale*16*dsin(image_angle),image_xscale/2,image_yscale/2,image_angle,-1,1);
}
else{

    scr_lighting_draw_sprite(spr_items,spr_items_n,spr_items_she,Id-1,x,y,image_xscale/2,image_yscale/2,image_angle,-1,1);

    //draw_sprite_ext(spr_items,Id-1,x,y,image_xscale/2,image_yscale/2,image_angle,-1,1);
}

