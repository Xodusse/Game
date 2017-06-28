//LOAD VSYNC (Returns VSYNC variable, either 1 (true), 0 (false), or -1 (undefined):
Config_File = file_text_open_read("Config.Xodusse");

//LOAD OTHER CONFIG VARIABLES:    
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);  

//LOAD VSYNC VARIABLE:
var str_resolution = file_text_read_string(Config_File);   

//Check the string contains a digit:
if (string_pos("0", str_resolution)) || (string_pos("1", str_resolution)) || (string_pos("2", str_resolution)) || 
   (string_pos("3", str_resolution)) || (string_pos("4", str_resolution)) || (string_pos("5", str_resolution)) ||
   (string_pos("6", str_resolution)) || (string_pos("7", str_resolution)) {
    var real_resolution = real(string_digits(str_resolution));
 
    //Resolution current - Real (Can return: [0 for 960x540], [1 for 1280x720], [2 for 1366x768], [3 for 1600x900], [4 for 1920x1080], [5 for 2560x1440], [6 for 3840x2160], [7 for DISPLAY_HRESOLUTIONxDISPLAY_VRESOLUTION]);
    //SETTING_RESOLUTION = 0;   
    SETTING_RESOLUTION = real_resolution;
           
    //Close the file:
    file_text_close(Config_File);        
}

//Otherwise, define it:
else { 

    SETTING_RESOLUTION = 0; 
    
    //Close the file:
    file_text_close(Config_File);    
 
}
