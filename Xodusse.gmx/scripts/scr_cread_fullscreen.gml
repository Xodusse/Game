//LOAD VSYNC (Returns VSYNC variable, either 1 (true), 0 (false), or -1 (undefined):
Config_File = file_text_open_read("Config.Xodusse");

//LOAD OTHER CONFIG VARIABLES:    
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);  

//LOAD VSYNC VARIABLE:
var str_fullscreen = file_text_read_string(Config_File);   

//Check the string contains a digit:
if (string_pos("0", str_fullscreen)) || (string_pos("1", str_fullscreen)){
    var real_fullscreen = real(string_digits(str_fullscreen));
    
    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_FULLSCREEN = real_fullscreen;    
}

//Otherwise, define it:
else { 

    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_FULLSCREEN = false;  
}
