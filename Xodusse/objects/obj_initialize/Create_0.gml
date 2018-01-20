/// @description Initialize the game.

/*
    © 2017 - Jon Harvey, Reece Warren.
    MIT License.

    Game initialization event.

    obj_initialize is a persistent object that contains variables required
    for the game to run. This object is only created once through the creation code
    of rm_initialize.
*/

//DELTA TIMING:

globalvar DESIRED_FPS, DELTA, FRAME_DELTA, FRAME_DELTA_OVERRIDE, S90, S98,
F1, F1H, F1Q, F10, F30, F60;

DESIRED_FPS = 60;
DELTA = 1;
FRAME_DELTA = 1;

FRAME_DELTA_OVERRIDE = 1;

//SMOOTH DELTA TIMING.
S90 = power(0.90,FRAME_DELTA);
S98 = power(0.98,FRAME_DELTA);

//Seed:

//Fixed seed setting to real random - Jon
random_set_seed(7);
SEED = random_get_seed();

//show_debug_overlay(1);


/*
    -- Create Controller Objects:
 */

//Add key controlller - Jon
instance_create(0,0,obj_controller_keys);

//Add gun controlller - Jon
instance_create(0,0,obj_controller_guns);

//Add level controller - Reece
instance_create(0,0,obj_controller_level_selector);

//Add debug profiler - Reece
instance_create(0,0,obj_controller_debugger);

//Add wave controller - Reece
instance_create(0,0,obj_controller_wave);

//Add console controller - Reece
instance_create(0,0,obj_controller_console);

//Add menu controller - Reece
instance_create(0,0,obj_controller_menu);

//GAME SETTINGS:
globalvar DEBUG_VISIBLE, CONSOLE_ENABLED, CHEAT_GODMODE;

CONSOLE_ENABLED = false;

DEBUG_VISIBLE = false;

CHEAT_GODMODE = false;

//GAME MEMORY USAGE:
//globalvar GM_MEMORY_USAGE_VIRTUAL, GM_MEMORY_USAGE_PHYSICAL, GM_CPU_USAGE;

//GM_MEMORY_USAGE_VIRTUAL = external_define("GM_Memory_Usage_Virtual.dll", "dll_get_memory_virtual", dll_cdecl, ty_real, 0);
//GM_MEMORY_USAGE_PHYSICAL = external_define("GM_Memory_Usage_Physical.dll", "dll_get_memory_physical", dll_cdecl, ty_real, 0); 

//DEFINE FONTS:
globalvar FNT_EXUDATION_LARGE, FNT_EXUDATION;

FNT_EXUDATION_LARGE = fnt_Exudation_Large;
FNT_EXUDATION = fnt_Exudation;

//DEFINE OTHER GAME VARIABLES:
globalvar PAUSED, VIEW_ANGLE;

PAUSED = false;
VIEW_ANGLE = 0;

//Set the cursor sprite:
window_set_cursor(cr_none);
//cursor_sprite = spr_Cursor_Free;

//GAME CONFIGURATION:

//LOADS VARIABLES FROM CONFIG:
//DEFINES VARIABLES IF CONFIG DOESN'T EXIST OR CANNOT BE READ:

if (file_exists("Config.Xodusse")){

    // -----
    
    DISPLAY_HRESOLUTION = display_get_width();
    DISPLAY_VRESOLUTION = display_get_height();
    DISPLAY_ASPECT = DISPLAY_HRESOLUTION / DISPLAY_VRESOLUTION;
    
    //LOAD VSYNC:
    scr_cread_vsync();  
  
    //LOAD INTERPOLATION:
    scr_cread_interpolation();
    
    //LOAD FXAA:
    scr_cread_fxaa();
    
    //LOAD FULLSCREEN
    scr_cread_fullscreen();
    
    //LOAD RESOLUTION:
    scr_cread_resolution();
    
    //LOAD SURFACE SCALE:
    scr_cread_surfacescale(); 
    
    //LOAD CONTROL MODE:
    scr_cread_controlmode();
    
}



//CREATE CONFIG FILE:
else {

    //DEFINE SETTINGS:
    // -----    
    
    DISPLAY_HRESOLUTION = display_get_width();
    DISPLAY_VRESOLUTION = display_get_height();
    DISPLAY_ASPECT = DISPLAY_HRESOLUTION / DISPLAY_VRESOLUTION;
    
    //VSync - Boolean;
    SETTING_VSYNC = true;
      
    //Texture interpolation - Boolean;
    SETTING_INTERPOLATION = true;
    
    //Anti-aliasing max - Real (Can return: [0 for unsupported], [2 for 2xAA], [6 for 2xAA & 4xAA], [12 for 4xAA & 8xAA] and [14 for 2xAA,4xAA & 8xAA]);
    SETTING_FXAA_MAX = display_aa;
    
    //Anti-aliasing current - Real;
    SETTING_FXAA = 0;
    
    //Fullscreen - Boolean;
    SETTING_FULLSCREEN = false;
    
    //Resolution current - Real (Can return: [0 for 960x540], [1 for 1280x720], [2 for 1366x768], [3 for 1600x900], [4 for 1920x1080], [5 for 2560x1440], [6 for 3840x2160], [7 for DISPLAY_HRESOLUTIONxDISPLAY_VRESOLUTION]);
    SETTING_RESOLUTION = 0;
    
    //Surface Scale - Real (Can return: [1 for 1x], [2 for 2x], [4 for 4x].)
    SETTING_SURFACE_SCALE = 1;
    
    //Mouse control mode (Can return: [0 for Q&E rotation], [1 for Mouse].):
    SETTING_CONTROL_MODE = 0;     
        
    // -----

    //WRITE SETTINGS TO CONFIG:
    
    var Config_File = file_text_open_write(working_directory + "Config.Xodusse");
    
    //Assign Settings:
    var C_Vsync = SETTING_VSYNC;
    var C_Interpolation = SETTING_INTERPOLATION;
    var C_FXAA = SETTING_FXAA;
    var C_Fullscreen = SETTING_FULLSCREEN;
    var C_Resolution = SETTING_RESOLUTION;
    var C_SurfaceScale = SETTING_SURFACE_SCALE;
    var C_ControlMode = SETTING_CONTROL_MODE;
    
    //Write Settings:
    file_text_write_string(Config_File, "[ XODUSSE CONFIGURATION ]");
    file_text_writeln(Config_File);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "VSYNC: ");
    file_text_write_real(Config_File, C_Vsync);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "INTERPOLATION: ");    
    file_text_write_real(Config_File, C_Interpolation);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "FXAA: ");
    file_text_write_real(Config_File, C_FXAA);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "FULLSCREEN: ");
    file_text_write_real(Config_File, C_Fullscreen);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "RESOLUTION: ");
    file_text_write_real(Config_File, C_Resolution);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "SURFACE SCALE: ");
    file_text_write_real(Config_File, C_SurfaceScale);
    file_text_writeln(Config_File);
    
    file_text_write_string(Config_File, "CONTROL MODE: ");
    file_text_write_real(Config_File, C_ControlMode);
    file_text_writeln(Config_File);
    
    file_text_close(Config_File);
}

globalvar GUIW,GUIH;

//Set window width: Can return: [0 for 960x540], [1 for 1280x720], [2 for 1366x768], [3 for 1600x900], [4 for 1920x1080], [5 for 2560x1440], [6 for 3840x2160], [7 for DISPLAY_HRESOLUTIONxDISPLAY_VRESOLUTION]
switch(SETTING_RESOLUTION){

    default:
    SETTING_RESOLUTION = 0;
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
    GUIW = DISPLAY_HRESOLUTION;
    GUIH = DISPLAY_VRESOLUTION;
    break;
}
    
if (SETTING_FULLSCREEN == true){   
    SETTING_RESOLUTION = 7;
    GUIW = DISPLAY_HRESOLUTION;
    GUIH = DISPLAY_VRESOLUTION;
}
  
if (DISPLAY_HRESOLUTION < GUIW) || (DISPLAY_VRESOLUTION < GUIH){

    SETTING_RESOLUTION = 0;
    GUIW = 960;
    GUIH = 540;
    
    if (DISPLAY_HRESOLUTION < GUIW) || (DISPLAY_VRESOLUTION < GUIH){
        
        SETTING_RESOLUTION = 7;
        GUIW = DISPLAY_HRESOLUTION;
        GUIH = DISPLAY_VRESOLUTION;
    }
}

var Scale;
Scale = SETTING_SURFACE_SCALE;

display_set_gui_size(GUIW,GUIH);
window_set_size(GUIW,GUIH);
            
__view_set( e__VW.WPort, 0, GUIW );
__view_set( e__VW.HPort, 0, GUIH );

surface_resize(application_surface,GUIW*Scale,GUIH*Scale);


//Reset the display:
display_reset(SETTING_FXAA, SETTING_VSYNC);
 
//Turn off texture interpolation:
texture_set_interpolation(SETTING_INTERPOLATION);

//Set fullscreen mode:
window_set_fullscreen(SETTING_FULLSCREEN);

//Add cursor controller - Reece
instance_create(0,0,obj_controller_cursor);

/* */
/*  */
