/// @description Determine the resolution scaling factor:
//© 2017 - Reece Warren;

//This event is triggered when toggling the resolution using
//obj_button_small step in game:

//Used to determine the distance from the centre of the screen (according to screen resolution);
resolution_scaling_factor = GUIW / __view_get( e__VW.WView, view_current ); 

