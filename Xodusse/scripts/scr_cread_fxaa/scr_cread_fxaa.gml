//Anti-aliasing max - Real (Can return: [0 for unsupported], [2 for 2xAA], [6 for 2xAA & 4xAA], [12 for 4xAA & 8xAA] and [14 for 2xAA,4xAA & 8xAA]);
SETTING_FXAA_MAX = display_aa;

//LOAD VSYNC (Returns VSYNC variable, either 1 (true), 0 (false), or -1 (undefined):
Config_File = file_text_open_read("Config.Xodusse");

//LOAD OTHER CONFIG VARIABLES:    
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);
file_text_readln(Config_File);  

//LOAD VSYNC VARIABLE:
var str_fxaa = file_text_read_string(Config_File);   

//Check the string contains a digit and set that digit to a real:
var fxaa_current_real = real(string_digits(str_fxaa));

if ((string_pos("0", str_fxaa)) || (string_pos("2", str_fxaa)) || (string_pos("4", str_fxaa)) || (string_pos("8", str_fxaa)))  &&  (fxaa_current_real < SETTING_FXAA_MAX) {
    var real_fxaa = real(string_digits(str_fxaa));
    
    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_FXAA = real_fxaa;    
}

//Otherwise, define it:
else { 

    //Close the file:
    file_text_close(Config_File);    
    
    SETTING_FXAA = 0;  
}
