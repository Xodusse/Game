/// @description Hover highlighting
// © 2017 - Jon Harvey

/*
    This makes the button hightlight when hovering over and controls mouse clicks.
*/

//Reece - Assigned the hover state to a variable so it can be used to control animations:
var Resolution,Hover;
Resolution = obj_initialize.SETTING_RESOLUTION;
Hover = point_in_rectangle(mouse_x,mouse_y,x-96,y-16,x+96,y+16);

if (Hover == true){
    if !(Extender > 128){
        Extender += 8 * FRAME_DELTA;
    }
    
    //Trigger the cursor:
    obj_controller_cursor.CURSOR_TARGETING = 1;
    
}

else {
    if (Extender > 96){
        Extender -= 16 * FRAME_DELTA;
    }
    else {
        Extender = 96;
    }
}
    
//Detect mouse press - Reece:
if (Hover == true) && (mouse_check_button_released(mb_left)){
    ///GUI Button functions:
    //© 2017 - Reece Warren
    ///GUI Button functions:
    //© 2017 - Reece Warren
    
    //VSYNC:
    if (BUTTON_TYPE == 0){
        //Only allow the user to disable Vsync if not in fullscreen:
        if (obj_initialize.SETTING_FULLSCREEN == false){
            obj_initialize.SETTING_VSYNC = !obj_initialize.SETTING_VSYNC;
            
            display_set_gui_size(GUIW,GUIH);              
            window_set_size(GUIW,GUIH); 
                       
            __view_set( e__VW.WPort, 0, GUIW );
            __view_set( e__VW.HPort, 0, GUIH ); 
            
            display_reset(obj_initialize.SETTING_FXAA, obj_initialize.SETTING_VSYNC);
            obj_initialize.SETTING_INTERPOLATION = false;
        }
    }
    
    //Interpolation:
    else if (BUTTON_TYPE == 1){
        obj_initialize.SETTING_INTERPOLATION = !obj_initialize.SETTING_INTERPOLATION;
        texture_set_interpolation(obj_initialize.SETTING_INTERPOLATION);
    }
    
    //FXAA:
    else if (BUTTON_TYPE == 2){
        //Only allow FXAA to be modified if VSYNC is true:
        if (obj_initialize.SETTING_VSYNC = true){
                
            //0 to 2:
            if (obj_initialize.SETTING_FXAA == 0) && (obj_initialize.SETTING_FXAA_MAX > 0) && (obj_initialize.SETTING_FXAA_MAX != 12){
                obj_initialize.SETTING_FXAA = 2;
            }
            //0 to 4:
            else if (obj_initialize.SETTING_FXAA == 0) && (obj_initialize.SETTING_FXAA_MAX > 0){
                obj_initialize.SETTING_FXAA = 4;
            }
            //2 to 4:
            else if (obj_initialize.SETTING_FXAA == 2) && (obj_initialize.SETTING_FXAA_MAX >= 6){
                obj_initialize.SETTING_FXAA = 4;
            }
            //4 to 8:
            else if (obj_initialize.SETTING_FXAA == 4) && (obj_initialize.SETTING_FXAA_MAX >= 12){
                obj_initialize.SETTING_FXAA = 8;
            }
            //2 to 4:
            else if (obj_initialize.SETTING_FXAA == 4) && (obj_initialize.SETTING_FXAA_MAX == 14){
                obj_initialize.SETTING_FXAA = 8;
            }
            else {
                obj_initialize.SETTING_FXAA = 0;
            }
            //Prevents surface bugs in fullscreen:            
            obj_initialize.SETTING_VSYNC = true;
            
            display_set_gui_size(GUIW,GUIH);              
            window_set_size(GUIW,GUIH); 
                       
            __view_set( e__VW.WPort, 0, GUIW );
            __view_set( e__VW.HPort, 0, GUIH ); 
            
            display_reset(obj_initialize.SETTING_FXAA, obj_initialize.SETTING_VSYNC);
            obj_initialize.SETTING_INTERPOLATION = false;
        }                  
    }
    
    //Fullscreen
    else if (BUTTON_TYPE == 3){
        //Prevent the user from using fullscreen if FXAA is not enabled (Buggy):
        //if (obj_initialize.SETTING_FXAA != 0) || (obj_initialize.SETTING_FULLSCREEN == true){
            obj_initialize.SETTING_FULLSCREEN = !obj_initialize.SETTING_FULLSCREEN;
            window_set_fullscreen(obj_initialize.SETTING_FULLSCREEN);
            
            //If now fullscreen:
            if (obj_initialize.SETTING_FULLSCREEN){
            
                //ENABLE FULLSCREEN RESOLUTION MODE:
                GUIW = obj_initialize.DISPLAY_HRESOLUTION;
                GUIH = obj_initialize.DISPLAY_VRESOLUTION;
                obj_initialize.SETTING_RESOLUTION = 7;                            
                
                //Enables vsync automatically when toggling fullscreen to prevent the surface not drawing:
                obj_initialize.SETTING_VSYNC = true; 
            }
            
            //If now windowed:
            else{
                
                //Set window width:
                GUIW = 960;
                GUIH = 540;
                obj_initialize.SETTING_RESOLUTION = 0;                                                
            }
            
            //Reset the display after altering fullscreen mode:    
            display_reset(obj_initialize.SETTING_FXAA, obj_initialize.SETTING_VSYNC);
            obj_initialize.SETTING_INTERPOLATION = false;
        //}                              
    }
    
    //Toggle Resolution (only if not in fullscreen mode):
    else if (BUTTON_TYPE == 4) && (obj_initialize.SETTING_RESOLUTION != 7) {
        
        //Simplified code - Jon
        obj_initialize.SETTING_RESOLUTION += 1;
                
        switch(obj_initialize.SETTING_RESOLUTION)
        {
            default:
            obj_initialize.SETTING_RESOLUTION = 0;
            GUIW = 960;
            GUIH = 540;
            break;
            
            case 1:
            GUIW = 1280;
            GUIH = 720;
            break;
            
            case 2:
            GUIW = 1366;
            GUIH = 768;
            break;
            
            case 3:
            GUIW = 1600;
            GUIH = 900;
            break;
            
            case 4:
            GUIW = 1920;
            GUIH = 1080;
            break;
            
            case 5:
            GUIW = 2560;
            GUIH = 1440;
            break;
            
            case 6:
            GUIW = 3840;
            GUIH = 2160;
            break;
            
            case 7:
            GUIW = obj_initialize.DISPLAY_HRESOLUTION;
            GUIH = obj_initialize.DISPLAY_VRESOLUTION;
            break;
        }
    }
    
    //SURFACE SCALE:
    if (BUTTON_TYPE == 5){
        //Only allow the user to disable Vsync if not in fullscreen:
        if (obj_initialize.SETTING_SURFACE_SCALE == 0.5){
            obj_initialize.SETTING_SURFACE_SCALE = 1;
        }        
        
        else if (obj_initialize.SETTING_SURFACE_SCALE == 1){
            obj_initialize.SETTING_SURFACE_SCALE = 2;
        }
        
        else if (obj_initialize.SETTING_SURFACE_SCALE == 2){
            obj_initialize.SETTING_SURFACE_SCALE = 0.5;
        }
    } 
    
    //CONTROL MODE:
    if (BUTTON_TYPE == 6){
        //Toggle the control mode:
        obj_initialize.SETTING_CONTROL_MODE = !obj_initialize.SETTING_CONTROL_MODE;
    }  
    
    //Write information to the config:
    scr_cwrite();

    //Update display
    if (obj_initialize.DISPLAY_HRESOLUTION < GUIW) || (obj_initialize.DISPLAY_VRESOLUTION < GUIH){
    
        obj_initialize.SETTING_RESOLUTION = 0;
        GUIW = 960;
        GUIH = 540;
        
        if (obj_initialize.DISPLAY_HRESOLUTION < GUIW) || (obj_initialize.DISPLAY_VRESOLUTION < GUIH){
            
            obj_initialize.SETTING_RESOLUTION = 7;
            GUIW = DISPLAY_HRESOLUTION;
            GUIH = DISPLAY_VRESOLUTION;
        }
    }
    
    var Scale;
    Scale = obj_initialize.SETTING_SURFACE_SCALE;
    
    display_set_gui_size(GUIW,GUIH);
    window_set_size(GUIW,GUIH);
                
    __view_set( e__VW.WPort, 0, GUIW );
    __view_set( e__VW.HPort, 0, GUIH );
    
    with(obj_controller_cursor){
        event_user(0);
    }
    
    obj_init_display.alarm[0] = 1;
    surface_resize(application_surface,GUIW*Scale,GUIH*Scale);
        
    //Reset the display after altering the resolution:    
    display_reset(obj_initialize.SETTING_FXAA, obj_initialize.SETTING_VSYNC);
}

/* */
/*  */
