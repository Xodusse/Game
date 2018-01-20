//© 2017 - Reece Warren, All rights reserved.
//Debugger visibility.

//CHECK IF DEBUGGER IS TOGGLED:
if (Kdebug){
    DEBUG_VISIBLE = !DEBUG_VISIBLE;
}

//UPDATE PLAYER X/Y:
if (instance_exists(obj_player)){

    player_x = round(obj_player.x);
    player_y = round(obj_player.y);
    
    player_dir = round(darctan2(-obj_player.SpeedY,obj_player.SpeedX)+360) % 360;
    //Added player speed variable - Jon.

    player_speed = round(sqrt(sqr(obj_player.SpeedX)+sqr(obj_player.SpeedY)));
}
//Get the current game memory usage in Kilobytes:
memory_v = ((scr_get_memory_virtual()/8)/1024);    
memory_p = ((scr_get_memory_physical()/8)/1024); 

//UPDATE VIEW ROTATION VARIABLE:
view_a =(round(__view_get( e__VW.Angle, 0 ))+360) mod 360;

//UPDATE FPS COUNTER:
FPS_Counter -= (1/60) * FRAME_DELTA;
if (FPS_Counter <= 0){
    FPS_Counter = 0.5;
    FPS = floor(fps);
    dF = FRAME_DELTA;
}



