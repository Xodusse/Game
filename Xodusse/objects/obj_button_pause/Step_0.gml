/// @description Hover highlighting
// © 2017 - Jon Harvey

/*
    This makes the button hightlight when hovering over and controls mouse clicks.
*/

//Define co-ordinates:
pH1x = x-(dcos(VIEW_ANGLE)*(Extender));
pH1y = y-(dsin(VIEW_ANGLE)*(Extender));

pH2x = x+(dcos(VIEW_ANGLE)*(Extender));
pH2y = y+(dsin(VIEW_ANGLE)*(Extender));

p1x = pH1x - (dcos(VIEW_ANGLE+90)*vDist);
p1y = pH1y - (dsin(VIEW_ANGLE+90)*vDist);

p2x = pH2x - (dcos(VIEW_ANGLE+90)*vDist);
p2y = pH2y - (dsin(VIEW_ANGLE+90)*vDist);

p3x = pH1x + (dcos(VIEW_ANGLE+90)*vDist);
p3y = pH1y + (dsin(VIEW_ANGLE+90)*vDist);

p4x = pH2x + (dcos(VIEW_ANGLE+90)*vDist);
p4y = pH2y + (dsin(VIEW_ANGLE+90)*vDist);   


//Reece - Assigned the hover state to a variable so it can be used to control animations:
Hover = point_in_triangle(mouse_x,mouse_y,p1x,p1y,p2x,p2y,p3x,p3y) || point_in_triangle(mouse_x,mouse_y,p2x,p2y,p3x,p3y,p4x,p4y);

if (Hover == true){
    if (Extender < 128){
        Extender += 8 * FRAME_DELTA;
    }    
    else {
        Extender = 128;
    }
    
    //Trigger the cursor:
    obj_controller_cursor.CURSOR_TARGETING = 1;
    
    //If pressed:
    if (mouse_check_button_released(mb_left)){
        if (BUTTON_TYPE == 0){
            PAUSED = false;          
        }
        
        else if (BUTTON_TYPE == 1){
            //Main menu:
            if (instance_exists(obj_player)){
                obj_player.Health = 0;
            }
            PAUSED = false;
            room_goto(rm_main);                    
        }            
    }
}

else {
    if (Extender > 96){
        Extender -= 16 * FRAME_DELTA;
    }
    else {
        Extender = 96;
    }
}

//Reece - Update pause buttons:

//Destroy the button if the game is unpaused:
if (PAUSED == false){
    instance_destroy();
}

//UNUSED:
/*Back to game:
if (BUTTON_TYPE == 0){    

    x = (view_xview[0]+(view_wview[0]/2));
    y = (view_yview[0]+(view_hview[0]/2));  
    
    if (Hover == true) && (mouse_check_button_released(mb_left)){
        PAUSED = false;        
    }                 
}

//Quit
else if (BUTTON_TYPE == 1){                     
    
    x = (view_xview[0]+(view_wview[0]/2))-(dcos(VIEW_ANGLE+90)*-64);
    y = (view_yview[0]+(view_hview[0]/2))-(dsin(VIEW_ANGLE+90)*-64);

    if (Hover == true) && (mouse_check_button_released(mb_left)){ 
        //Main menu:
        if (instance_exists(obj_player)){
            obj_player.Health = 0;
        }
        PAUSED = false;
        room_goto(rm_main);         
    }         
}*/



/* */
/*  */
