//LOAD VSYNC (Returns VSYNC variable, either 1 (true), 0 (false), or -1 (undefined):
Config_File = file_text_open_read("Config.Xodusse");

//LOAD OTHER CONFIG VARIABLES:    
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File); 

//LOAD VSYNC VARIABLE:
var str_interp = file_text_read_string(Config_File);   

//Check the string contains a digit:
if (string_pos("0", str_interp)) || (string_pos("1", str_interp)){
    var real_interp = real(string_digits(str_interp));
    
    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_INTERPOLATION = real_interp;    
}

//Otherwise, define it:
else { 

    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_INTERPOLATION = true;  
}
