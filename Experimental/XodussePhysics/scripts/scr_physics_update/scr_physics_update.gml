///@desc scr_physics_update

x += physics_speed_x * Delta;
y += physics_speed_y * Delta

physics_speed_x *= power(.2,Delta);
physics_speed_y *= power(.2,Delta);