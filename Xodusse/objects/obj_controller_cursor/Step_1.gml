/// @description Update the cursor location:
//© 2017 - Reece warren

//Update the mouse position for drawing on the GUI:

//Get the centre of the screen for mouse location calculation:
Screen_Centre_X = __view_get( e__VW.XView, view_current )+(__view_get( e__VW.WView, view_current )/2);
Screen_Centre_Y = __view_get( e__VW.YView, view_current )+(__view_get( e__VW.HView, view_current )/2);

//Get the position of the mouse in the room for location calculation:
Mouse_X_Room = mouse_x;
Mouse_Y_Room = mouse_y;

//Calculate the distance between the two points:
dist = point_distance(Screen_Centre_X,Screen_Centre_Y,Mouse_X_Room,Mouse_Y_Room) * resolution_scaling_factor;
dir = point_direction(Screen_Centre_X,Screen_Centre_Y,Mouse_X_Room,Mouse_Y_Room) + VIEW_ANGLE;

//Calculate the final mouse position (relative to draw GUI):
Mouse_X_True = GUIW/2 + (((dcos(dir) * dist)));
Mouse_Y_True = GUIH/2 - (((dsin(dir) * dist)));

CURSOR_TARGETING = 0;

//Trigger cursor:
if instance_exists(obj_enemy){
    if (position_meeting(mouse_x,mouse_y,obj_enemy)){
        CURSOR_TARGETING = 1;
    }
}

//Otherwise draw a regular cursor:
/*else {
    Cursor_Sprite = spr_Cursor_Free;
    Cursor_Frame = 0;
    Cursor_Angle = 0;
    Cursor_Scale = 1;
}*/

/* */
/*  */
