///scr_lighting_draw_final(enable)
// © 2017 - Jon Harvey

var Aenbl;
Aenbl = argument[0];

surface_set_target(application_surface);
draw_surface(LScolr,0,0);
if Aenbl{
    
    draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_src_colour);
    draw_surface(LSligt,0,0);
    draw_set_blend_mode(bm_normal);
}
surface_reset_target();
