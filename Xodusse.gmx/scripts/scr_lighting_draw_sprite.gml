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

var Vsuv1,Vsuv2,Vcolr,Vnorm,Vxoff,Vyoff,Vxscl,Vyscl,Vxrot,Vyrot;
Vsuv1 = sprite_get_uvs(Acolr,Asimg);
Vsuv2 = sprite_get_uvs(Anorm,Asimg);
Vcolr = sprite_get_texture(Acolr,Asimg);
Vnorm = sprite_get_texture(Anorm,Asimg);
Vxoff = sprite_get_xoffset(Acolr)*Axscl*Vsuv1[6];
Vyoff = sprite_get_yoffset(Acolr)*Ayscl*Vsuv1[7];
Vxscl = sprite_get_width(Acolr)*Axscl*Vsuv1[6]-Vxoff;
Vyscl = sprite_get_height(Acolr)*Ayscl*Vsuv1[7]-Vyoff;
Vxrot = dcos(Arotn);
Vyrot = dsin(Arotn);

var View = matrix_get(matrix_view);
surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);
matrix_set(matrix_view,View);
shader_set(shdr_lighting_maps);

texture_set_stage(LUnorm,Vnorm);
shader_set_uniform_f(LUmatx,dcos(-Arotn)*Axscl,dsin(-Arotn)*Ayscl,dsin(-Arotn)*Axscl,-dcos(-Arotn)*Ayscl);
shader_set_uniform_f(LUsuv1,Vsuv1[0],Vsuv1[1],Vsuv1[2],Vsuv1[3]);
shader_set_uniform_f(LUsuv2,Vsuv2[0],Vsuv2[1],Vsuv2[2],Vsuv2[3]);

draw_set_colour(Ablnd);
draw_set_alpha(Alpha);
draw_primitive_begin_texture(pr_trianglestrip,1);
draw_vertex_texture(Axpos-Vxoff*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot+Vxoff*Vyrot,0,0);
draw_vertex_texture(Axpos+Vxscl*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot-Vxscl*Vyrot,1,0);
draw_vertex_texture(Axpos-Vxoff*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot+Vxoff*Vyrot,0,1);
draw_vertex_texture(Axpos+Vxscl*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot-Vxscl*Vyrot,1,1);
draw_primitive_end();
draw_set_alpha(1);

shader_reset();
surface_reset_target();
