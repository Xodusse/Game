//Draw menu elements:

/*
 * © 2017 - Reece Warren.
 * MIT License.
 */

if (room != rm_test1){
    
    if (room == rm_main){
        //Draw clouds:
        texture_set_interpolation(true);
        draw_set_blend_mode(bm_add);
        draw_sprite_tiled_ext(spr_menu_clouds,0,-backgroundX,-backgroundY,16,16,-1,0.1);
        draw_sprite_tiled_ext(spr_menu_clouds,0,backgroundX,backgroundY,32,32,-1,0.2);
        draw_sprite_tiled_ext(spr_menu_clouds,0,backgroundX2,backgroundY2,64,64,-1,0.1);
         draw_set_blend_mode(bm_normal);       
        texture_set_interpolation(false);
        
        //Draw lighting:
        draw_sprite_ext(spr_menu_gradient,0,128,540,1,0.5,0,-1,alpha);
        draw_sprite_ext(spr_menu_gradient,0,128,540,1,0.5,0,-1,0.5);      
    
        //Draw game logo:
        draw_sprite(spr_logo_0,0,-36,160);
        draw_sprite(spr_logo_1,0,-36,160); 
        
        //Draw version:
        draw_set_font(fnt_Exudation);
        draw_set_colour($FFFFFF);
        draw_set_halign(fa_right);
        draw_text(960-32,424,string_hash_to_newline("© 2017 - Reece Warren, Jon Harvey. MIT License."));
        draw_text(960-32,448,string_hash_to_newline("Version: " + string(GM_version)));
        draw_text(960-32,424,string_hash_to_newline("© 2017 - Reece Warren, Jon Harvey. MIT License."));
        draw_text(960-32,448,string_hash_to_newline("Version: " + string(GM_version)));
        draw_set_halign(fa_left);        
        draw_set_colour(-1);
        draw_set_font(-1); 
          
    }
}

/* */
/*  */
