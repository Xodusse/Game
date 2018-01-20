//© 2017 - Reece Warren
//GUI Buttons:

//draw_self();

draw_set_colour($000000);

//Set draw settings:
draw_set_font(fnt_Exudation_Large);

//Animate on hover:
if (Hover == true){
    //Extend the button if it is not the full size:
    if !(Extender > 96){
        draw_rectangle_colour(x-Extender,y-16,x+Extender,y+16,$000000,$000000,$000000,$000000,false);
        //Right Triangle
        draw_triangle_colour(x+Extender,y-16-1,x+Extender,y+16,x+Extender+16,y-16-1,$F6D22A,$F6D22A,$F6D22A,false);
        draw_triangle_colour(x+Extender,y-16-1,x+Extender-16,y+16,x+Extender,y+16,$F6D22A,$F6D22A,$F6D22A,false);
        //Left Triangle
        draw_triangle_colour(x-Extender,y-16-1,x-Extender,y+16,x-Extender-16,y-16-1,$F6D22A,$F6D22A,$F6D22A,false);
        draw_triangle_colour(x-Extender,y-16-1,x-Extender+16,y+16,x-Extender,y+16,$F6D22A,$F6D22A,$F6D22A,false);        
        
        draw_set_colour($FFFF00);
    }
    //Otherwise, draw it at a fixed size:
    else {
        draw_rectangle_colour(x-128,y-16,x+Extender,y+16,$000000,$000000,$000000,$000000,false);
        //Right Triangle
        draw_triangle_colour(x+Extender,y-16-1,x+Extender,y+16,x+Extender+16,y-16-1,$F6D22A,$F6D22A,$F6D22A,false);
        draw_triangle_colour(x+Extender,y-16-1,x+Extender-16,y+16,x+Extender,y+16,$F6D22A,$F6D22A,$F6D22A,false);
        //Left Triangle
        draw_triangle_colour(x-Extender,y-16-1,x-Extender,y+16,x-Extender-16,y-16-1,$F6D22A,$F6D22A,$F6D22A,false);
        draw_triangle_colour(x-Extender,y-16-1,x-Extender+16,y+16,x-Extender,y+16,$F6D22A,$F6D22A,$F6D22A,false);
                
        draw_set_colour($FFFF00);
    }    
}

//If not hovered on, draw a standard button:
else {
    draw_rectangle(x-Extender,y-16,x+Extender,y+16,false);
    draw_triangle(x+Extender,y-16-1,x+Extender,y+16,x+Extender+16,y-16-1,false);
    draw_triangle(x-Extender-1,y-16-1,x-Extender-1,y+16,x-Extender-16-1,y-16-1,false);
    draw_set_colour($FFFFFF);
}

//Draw the button text draw configuration:
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw button text:

//Vsync:
if (BUTTON_TYPE == 0){
    if (obj_initialize.SETTING_VSYNC == true){
        draw_text(x,y,string_hash_to_newline("V-SYNC: ON"));
    }
    else {
        draw_text(x,y,string_hash_to_newline("V-SYNC: OFF"));
    }
}

//Interpolation:
else if (BUTTON_TYPE == 1){
    if (obj_initialize.SETTING_INTERPOLATION == true){
        draw_text(x,y,string_hash_to_newline("Texture Interp: ON"));
    }
    else {
        draw_text(x,y,string_hash_to_newline("Texture Interp: OFF"));
    }
}

//FXAA:
else if (BUTTON_TYPE == 2){
    draw_text(x,y,string_hash_to_newline("FXAA: " + string(obj_initialize.SETTING_FXAA)));
}

//Fullscreen mode:
else if (BUTTON_TYPE == 3){
    if (obj_initialize.SETTING_FULLSCREEN == true){
        draw_text(x,y,string_hash_to_newline("Fullscreen: ON"));
    }
    else {
        draw_text(x,y,string_hash_to_newline("Fullscreen: OFF"));
    }
}

//Resolution:
else if (BUTTON_TYPE == 4){
    if (obj_initialize.SETTING_RESOLUTION == 0){
        draw_text(x,y,string_hash_to_newline("Resolution: 960x540"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 1){
        draw_text(x,y,string_hash_to_newline("Resolution: 1280x720"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 2){
        draw_text(x,y,string_hash_to_newline("Resolution: 1366x768"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 3){
        draw_text(x,y,string_hash_to_newline("Resolution: 1600x900"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 4){
        draw_text(x,y,string_hash_to_newline("Resolution: 1920x1080"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 5){
        draw_text(x,y,string_hash_to_newline("Resolution: 2560x1440"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 6){
        draw_text(x,y,string_hash_to_newline("Resolution: 3840x2160"));
    }
    else if (obj_initialize.SETTING_RESOLUTION == 7){
        draw_text(x,y,string_hash_to_newline("Resolution: " + string(obj_initialize.DISPLAY_HRESOLUTION) + "x" + string(obj_initialize.DISPLAY_VRESOLUTION)));
    }
}

//Surface Scale:
else if (BUTTON_TYPE == 5){
    draw_text(x,y,string_hash_to_newline("Surface Scale: " + string(obj_initialize.SETTING_SURFACE_SCALE) + "x"));
}

//Surface Scale:
else if (BUTTON_TYPE == 6){
    if (obj_initialize.SETTING_CONTROL_MODE == 0){
        draw_text(x,y,string_hash_to_newline("Rotation Control: Q&E"));
    }
    else {
        draw_text(x,y,string_hash_to_newline("Rotation Control: Mouse"));
    }
}

//Revert draw settings:
draw_set_font(-1);
draw_set_colour(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

