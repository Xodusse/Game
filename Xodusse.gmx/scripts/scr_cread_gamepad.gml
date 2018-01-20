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
file_text_readln(Config_File);

//LOAD VSYNC VARIABLE:
var str_gamepad = file_text_read_string(Config_File);     
    
//Check the string contains a digit:
if (string_pos("0", str_gamepad)) || (string_pos("1", str_gamepad)){
    var real_gamepad = real(string_digits(str_gamepad));
 
    //Control mode - Real (Can return: [0 for Q&E rotation], [1 for mouse]);  
    if (real_gamepad == 0) || (real_gamepad == 1){
        obj_initialize.SETTING_GAMEPAD_ENABLED = real_gamepad;
    }   
    //Otherwise, define it:
    else { 
        obj_initialize.SETTING_GAMEPAD_ENABLED = 0;  
    }   
           
    //Close the file:
    file_text_close(Config_File);        
}

//Otherwise, define it:
else { 

    obj_initialize.SETTING_GAMEPAD_ENABLED = 0; 
    
    //Close the file:
    file_text_close(Config_File);    
 
}
