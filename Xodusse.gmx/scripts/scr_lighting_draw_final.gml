///scr_lighting_draw_final(enable,ambient color)
// © 2017 - Jon Harvey

var Aenbl,Aacol;
Aenbl = argument[0];
Aacol = argument[1];

var Vscal;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;

if !surface_exists(LScolr) LScolr = surface_create(GUIW*Vscal,GUIH*Vscal);
if !surface_exists(LSnorm) LSnorm = surface_create(GUIW*Vscal,GUIH*Vscal);
if !surface_exists(LSligt) LSligt = surface_create(GUIW*Vscal,GUIH*Vscal);

surface_set_target(application_surface);
draw_surface(LScolr,0,0);
if Aenbl{
    
    draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_src_colour);
    draw_surface(LSligt,0,0);
    draw_set_blend_mode(bm_normal);
}
surface_reset_target();

surface_set_target(LSligt);
draw_clear(Aacol);
surface_reset_target();

surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);
draw_clear_alpha(0,0);
surface_reset_target();
