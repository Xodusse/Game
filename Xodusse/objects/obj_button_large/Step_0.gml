/// @description Hover highlighting
// © 2017 - Jon Harvey

/*
    This makes the button hightlight when hovering over and controls mouse clicks.
*/

//Reece - Assigned the hover state to a variable so it can be used to control animations:
Hover = point_in_rectangle(mouse_x,mouse_y,x-128,y-16,x+128,y+16);

if (Hover == true){
    if !(Extender > 128){
        Extender += 8 * FRAME_DELTA;
    }
    
    //Trigger the cursor:
    obj_controller_cursor.CURSOR_TARGETING = 1;    
}

else {
    if (Extender > 64){
        Extender -= 16 * FRAME_DELTA;
    }
    else {
        Extender = 64;
    }
}
    
//Detect mouse press - Reece:
if (Hover == true) && (mouse_check_button_released(mb_left)){
    ///GUI Button functions:
    //© 2017 - Reece Warren
    
    //Play Solo:
    if (BUTTON_TYPE == 0){
        room_goto(rm_game_0);
        
        //Resets the wave controller:
        AlienCountRemaining = AlienCountInitial;
    }
    
    //Play Coop:
    else if (BUTTON_TYPE == 1){
        room_goto(rm_game);
    }
    
    //Options:
    else if (BUTTON_TYPE == 2){
        room_goto(rm_options);
    }
    
    //Quit:
    else if (BUTTON_TYPE == 3){
        game_end();
    }
    
    //Back to main:
    else if (BUTTON_TYPE == 4){
        room_goto(rm_main);
    }
}

/* */
/*  */
