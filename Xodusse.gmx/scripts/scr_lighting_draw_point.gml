///scr_lighting_draw_point(x,y,radius)
// © 2017 - Jon Harvey

var Axpos,Aypos,Aradi;
Axpos = argument[0];
Aypos = argument[1];
Aradi = argument[2];

shader_set(shdr_lighting_point);
texture_set_stage(SUcolr,surface_get_texture(LScolr));
texture_set_stage(SUnorm,surface_get_texture(LSnorm));

draw_circle(Axpos,Aypos,Aradi,0);

shader_reset();
