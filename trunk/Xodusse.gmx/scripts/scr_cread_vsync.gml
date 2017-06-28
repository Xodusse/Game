//LOAD VSYNC (Returns VSYNC variable, either 1 (true), 0 (false), or -1 (undefined):
Config_File = file_text_open_read("Config.Xodusse");

//LOAD OTHER CONFIG VARIABLES:    
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File); 

//LOAD VSYNC VARIABLE:
var str_vsync = file_text_read_string(Config_File);   

//Check the string contains a digit:
if (string_pos("0", str_vsync)) || (string_pos("1", str_vsync)){
    var real_vsync = real(string_digits(str_vsync));
    
    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_VSYNC = real_vsync;    
}

//Otherwise, define it:
else { 

    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_VSYNC = false;  
}
