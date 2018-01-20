if (CONSOLE_ENABLED == true){

    //If the - key is pressed:
    if (keyboard_check_pressed(189)){    
        text += "-";      
    }
    
    else if (string_count(chr(keyboard_key), enabled_keys)) && (string_length(chr(keyboard_key)) == 1){
        //Reset the cursor blinking:
        cursor_blink = true;
        Alarm[0] = blink_speed;
        
        switch(keyboard_key){
            
            case "#" : text += "\\#"; break;
            
            default: text += string(keyboard_lastchar); break;
        }
               
    }   
    
    //If control isn't being held:
    if (!keyboard_check(vk_control)){
        switch(keyboard_key){
            case vk_backspace: text = string_copy(text, 0, string_length(text) - 1); break;
            
            case vk_enter:
                
                scr_command_help2();                
                
                scr_command_help();
                
                scr_command_tp();
                                
                scr_command_clear();
                
                scr_command_god();
                
                scr_command_killall();
                
                scr_command_alienmax();                                                                                  
                
            break;
            
            default: break;
        }
    }
    
    //Otherwise, can paste:
    else{
        switch(keyboard_key){
            case ord("V"): text += clipboard_get_text(); break;
            default: break;
        }
    }
}


