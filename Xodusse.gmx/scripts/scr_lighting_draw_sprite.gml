///scr_lighting_draw_sprite(color sprite,normal sprite,subimg,x,y,xscale,yscale,rot,color,alpha)
// © 2017 - Jon Harvey

var Acolr,Anorm,Asimg,Axpos,Aypos,Axscl,Ayscl,Arotn,Ablnd,Alpha
Acolr = argument[0];
Anorm = argument[1];
Asimg = argument[2];
Axpos = argument[3];
Aypos = argument[4];
Axscl = argument[5];
Ayscl = argument[6];
Arotn = argument[7];
Ablnd = argument[8];
Alpha = argument[9];

var Vsuv1,Vsuv2;
Vsuv1 = sprite_get_uvs(Acolr,Asimg);
Vsuv2 = sprite_get_uvs(Anorm,Asimg);

surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);

shader_set(shdr_lighting_maps);
texture_set_stage(LUnorm,sprite_get_texture(Anorm,Asimg));
shader_set_uniform_f(LUrotn,degtorad(Arotn));
shader_set_uniform_f(LUsuv1,Vsuv1[0],Vsuv1[1],Vsuv1[2],Vsuv1[3]);
shader_set_uniform_f(LUsuv2,Vsuv2[0],Vsuv2[1],Vsuv2[2],Vsuv2[3]);

draw_sprite_ext(Acolr,Asimg,Axpos,Aypos,Axscl,Ayscl,Arotn,Ablnd,Alpha);

shader_reset();
surface_reset_target();
