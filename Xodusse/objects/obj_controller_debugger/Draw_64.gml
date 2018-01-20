//© 2017 - Reece Warren, All rights reserved.
//Draw debug screen.

if (DEBUG_VISIBLE == true){

    draw_set_colour(c_white);
    
    draw_set_font(FNT_EXUDATION_LARGE);

    
    // -- LEFT --
    
    //Version number:
    draw_text(8, 10, string_hash_to_newline("#V"+string(GM_version)));
    
    //Copyright:
    draw_text(8, 35, string_hash_to_newline("#© 2017 - Reece Warren, Jon Harvey. MIT License."));
        
    //X & Y & R:
    draw_text(8, 85, string_hash_to_newline("#X = " + string(player_x) + "  Y = " + string(player_y) + "  R = " + string(view_a)));
        
    //Speed and Direction:
    draw_text(8, 110, string_hash_to_newline("#P_Dir = " + string(player_dir) + " P_Speed = " + string(player_speed)));
    
    // -- RIGHT --    
            
    draw_set_halign(fa_right);
    
    //FPS:
    draw_text(GUIW - 8, 10, string_hash_to_newline("#FPS = " + string(FPS) + " dF = " + string(dF)));
        
    //Virtual Memory:
    //draw_text(GUIW - 8, 35,
    //    "Memory_Vir = " + string(memory_v) + "kB");
        
    //Physical Memory:
    //draw_text(GUIW - 8, 60,
    //     "Memory_Phy = " + string(memory_p) + "kB");
         
    //Current alien count:
    draw_text(GUIW - 8, 110, string_hash_to_newline("#AlienCountCurrent: " + string(AlienCountCurrent))); 
         
    //Current alien max:
    draw_text(GUIW - 8, 135, string_hash_to_newline("#AlienMax: " + string(AlienMax)));
         
    //Current aliens remaining:
    draw_text(GUIW - 8, 160, string_hash_to_newline("#AlienCountRemaining: " + string(AlienCountRemaining)));
         
    /*Draw the keyboard key:
    draw_text(view_wview[0] - 8, 160,
         string(keyboard_key));*/
         
    //Wave:
    draw_text(GUIW - 8, 210, string_hash_to_newline("#Wave: " + string(Wave)));
         
    //Wave:
    draw_text(GUIW - 8, 235, string_hash_to_newline("#Surface Scale: " + string(obj_initialize.SETTING_SURFACE_SCALE) + "x"));
    
    if (CHEAT_GODMODE){
        draw_set_colour(c_red);
        draw_text(GUIW - 8, 310, string_hash_to_newline("#GOD MODE ENABLED"));
        draw_set_colour(c_white);
    }        
         
    // -- RESET --
    draw_set_halign(fa_left);
        
    draw_set_colour(c_black); 
    
    draw_set_font(-1);
    
}
   

/* */
/*  */
