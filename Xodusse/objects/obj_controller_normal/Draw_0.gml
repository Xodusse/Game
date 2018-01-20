/// @description Draw normal map lighting
// © 2017 - Jon Harvey

if instance_exists(obj_player){
    
    scr_lighting_draw_level(bac_level,bac_sheet,bac_sheet_n,bac_sheet_she,obj_player.x,obj_player.y);
    
    scr_lighting_draw_direct(1,3,0,$383528);
    scr_lighting_draw_point(obj_player.x,obj_player.y,80,256,$C6C497);
    scr_lighting_draw_point_mask(spr_light,0,obj_player.x,obj_player.y,100,2,2,obj_player.GunDirection,$FFFFFF,1);
    
    scr_lighting_draw_point(1392,704,90,110,$7CD3FF);
    scr_lighting_draw_point(1264,704,90,110,$7CD3FF);
      
    //Triggered in obj_item obj_player_collision - line 31:
    //Turned off in event_user(0);
    if (Light_Visible){
        var light1;
        light1 = (dsin(current_time/2) * 96) + 16;          
        scr_lighting_draw_point(1120,608,light1,128,$7CD3FF);
    }
}

with(obj_explosion){
    
    scr_lighting_draw_point(x,y,100,512*Scale*sqr(Timer*2),$AACCDD);
}

with(obj_projectiles){
    
    scr_lighting_draw_point(x,y,100,64,$447788);
}

//scr_lighting_draw_final($080508,1,1);
scr_lighting_draw_final(0,0,0);

