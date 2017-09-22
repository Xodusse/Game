///scr_lighting_update()
// © 2017 - Jon Harvey

var Vscal;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;

if !surface_exists(LScolr) LScolr = surface_create(GUIW*Vscal,GUIH*Vscal);
if !surface_exists(LSnorm) LSnorm = surface_create(GUIW*Vscal,GUIH*Vscal);
if !surface_exists(LSligt) LSligt = surface_create(GUIW*Vscal,GUIH*Vscal);

surface_set_target(LSligt);
draw_clear_alpha($111111,0);
surface_reset_target();


surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);
draw_clear_alpha(0,0);
surface_reset_target();
