///scr_lighting_draw_direct(x,y,z,color)
// © 2017 - Jon Harvey

var Axpos,Aypos,Azpos,Acolr;
Axpos = argument[0];
Aypos = argument[1];
Azpos = argument[2];
Acolr = argument[3];

var Vscal,Vleng;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;
Vleng = sqrt(sqr(Axpos)+sqr(Aypos)+sqr(Azpos));
Axpos /= Vleng;Aypos /= Vleng;Azpos /= Vleng;

surface_set_target(LSligt);
draw_set_blend_mode(bm_add);
shader_set(shdr_lighting_direct);

texture_set_stage(DUcolr,surface_get_texture(LScolr));
texture_set_stage(DUnorm,surface_get_texture(LSnorm));
shader_set_uniform_f(DUldir,Axpos,Aypos,Azpos);
shader_set_uniform_f(DUsize,GUIW*Vscal,GUIH*Vscal);

draw_set_colour(Acolr);
draw_rectangle(0,0,GUIW*Vscal,GUIH*Vscal,0);

shader_reset();
draw_set_blend_mode(bm_normal);
surface_reset_target();
