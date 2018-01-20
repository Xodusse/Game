//© 2017 - Reece Warren, All rights reserved.
//Console cursor blink.

blink_speed -= (1/60) * FRAME_DELTA;

if (blink_speed <= 0){

    blink_speed = 0.5;
    cursor_blink = !cursor_blink;    
}

if (Kconsole == true){
    CONSOLE_ENABLED = true;
}

if (Kescape == true){
    CONSOLE_ENABLED = false;
}

if (COMMAND_EXECUTED == true){
    text = "";
    COMMAND_EXECUTED = false;
    CONSOLE_ENABLED = false;
}

