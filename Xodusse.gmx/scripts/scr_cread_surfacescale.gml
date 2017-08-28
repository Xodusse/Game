//LOAD VSYNC (Returns VSYNC variable, either 1 (true), 0 (false), or -1 (undefined):
Config_File = file_text_open_read("Config.Xodusse");

//LOAD OTHER CONFIG VARIABLES:    
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);  
file_text_readln(Config_File);

//LOAD VSYNC VARIABLE:
var str_surfacescale = file_text_read_string(Config_File);   

//Check the string contains a digit:
if (string_pos("1", str_surfacescale)) || (string_pos("2", str_surfacescale)) || (string_pos("4", str_surfacescale)){
    var real_surfacescale = real(string_digits(str_surfacescale));
 
    //Resolution current - Real (Can return: [0 for 960x540], [1 for 1280x720], [2 for 1366x768], [3 for 1600x900], [4 for 1920x1080], [5 for 2560x1440], [6 for 3840x2160], [7 for DISPLAY_HRESOLUTIONxDISPLAY_VRESOLUTION]);
    //SETTING_RESOLUTION = 0;   
    obj_initialize.SETTING_SURFACE_SCALE = real_surfacescale;
           
    //Close the file:
    file_text_close(Config_File);        
}

//Otherwise, define it:
else { 

    obj_initialize.SETTING_SURFACE_SCALE = 1; 
    
    //Close the file:
    file_text_close(Config_File);    
 
}
