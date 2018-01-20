/// @description Draw enemy debug lines:
if (DEBUG_VISIBLE) && (instance_exists(obj_player)) && (instance_exists(obj_enemy)){
    with(obj_enemy){
        draw_set_colour($FFFFFF);
        draw_line(x,y,obj_player.x,obj_player.y);
        draw_set_colour(-1);
    }
}

