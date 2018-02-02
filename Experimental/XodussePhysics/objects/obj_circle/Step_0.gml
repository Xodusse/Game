///@desc Move if selected

if mouse_check_button_pressed(mb_left) && (point_distance(x,y,mouse_x,mouse_y)<physics_radius)
{
	Select = 1;	
}
else
if mouse_check_button_released(mb_left)
{
	Select = 0;
}

if Select
{
	scr_physics_force((mouse_x-x)*.1,(mouse_y-y)*.1);
}

if mouse_check_button(mb_right)
{
	scr_physics_force((mouse_x-x)*.02,(mouse_y-y)*.02);
}
scr_physics_update();