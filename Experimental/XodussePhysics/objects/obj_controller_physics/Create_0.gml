///@desc Initialize physics

scr_physics_control_init(obj_parent_physics);

repeat(80)
{
	instance_create_depth(irandom(960),irandom(540),0,obj_circle);
}