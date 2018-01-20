/// @description Mouse cursor variables:
//© 2017 - Reece Warren.

Cursor_Frame = 0;
Cursor_Counter = 1;
Cursor_Sprite = spr_Cursor_Free;
Cursor_Angle = 0;
Cursor_Zoom = true;
Cursor_Scale = 1;

CURSOR_TARGETING = false;

Screen_Centre_X = GUIW/2;
Screen_Centre_Y = GUIH/2;

Mouse_X_Room = mouse_x;
Mouse_Y_Room = mouse_y;

dist = 0;
dir = 0;

Mouse_X_True = 0;
Mouse_Y_True = 0;

//Used to determine the distance from the centre of the screen (according to screen resolution);
resolution_scaling_factor = GUIW / __view_get( e__VW.WView, view_current );

