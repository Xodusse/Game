///scr_lighting_update()
// © 2017 - Jon Harvey

if !surface_exists(LScolr) LScolr = surface_create(GUIW,GUIH);
if !surface_exists(LSnorm) LSnorm = surface_create(GUIW,GUIH);
if !surface_exists(LSligt) LSligt = surface_create(GUIW,GUIH);

surface_set_target(LSligt);
surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);
draw_clear_alpha(0,0);
surface_reset_target();
surface_reset_target();
