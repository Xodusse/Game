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
file_text_readln(Config_File);

//LOAD VSYNC VARIABLE:
var str_controlmode = file_text_read_string(Config_File);     
    
//Check the string contains a digit:
if (string_pos("0", str_controlmode)) || (string_pos("1", str_controlmode)){
    var real_controlmode = real(string_digits(str_controlmode));
 
    //Control mode - Real (Can return: [0 for Q&E rotation], [1 for mouse]);  
    obj_initialize.SETTING_CONTROL_MODE = real_controlmode;
           
    //Close the file:
    file_text_close(Config_File);        
}

//Otherwise, define it:
else { 

    obj_initialize.SETTING_CONTROL_MODE = 1; 
    
    //Close the file:
    file_text_close(Config_File);    
 
}
