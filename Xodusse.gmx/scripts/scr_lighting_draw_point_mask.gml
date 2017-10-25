///scr_lighting_draw_point_mask(color sprite,subimg,x,y,z,xscale,yscale,rot,color,alpha)
// © 2017 - Jon Harvey

var Acolr,Asimg,Axpos,Aypos,Azpos,Axscl,Ayscl,Arotn,Ablnd,Ainty;
Acolr = argument[0];
Asimg = argument[1];
Axpos = argument[2];
Aypos = argument[3];
Azpos = argument[4];
Axscl = argument[5];
Ayscl = argument[6];
Arotn = argument[7];
Ablnd = argument[8];
Ainty = argument[9];

var Vsuv1,Vcolr,Vwidt,Vheig,Vxoff,Vyoff,Vxscl,Vyscl,Vxrot,Vyrot;
Vsuv1 = sprite_get_uvs(Acolr,Asimg);
Vcolr = sprite_get_texture(Acolr,Asimg);
Vwidt = sprite_get_width(Acolr);
Vheig = sprite_get_height(Acolr);
Vxoff = sprite_get_xoffset(Acolr)*Axscl*Vsuv1[6];
Vyoff = sprite_get_yoffset(Acolr)*Ayscl*Vsuv1[7];
Vxscl = Vwidt*Vsuv1[6]*Axscl-Vxoff;
Vyscl = Vheig*Vsuv1[7]*Ayscl-Vyoff;
Vxrot = dcos(Arotn);
Vyrot = dsin(Arotn);

var Vscal,Vmatx;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;
Vmatx = matrix_get(matrix_view);
Vmatx[0] *= Vscal*GUIW/960;Vmatx[1] *= Vscal*GUIH/540;
Vmatx[4] *= Vscal*GUIW/960;Vmatx[5] *= Vscal*GUIH/540;
Vmatx[12] *= Vscal*GUIW/960;Vmatx[13] *= Vscal*GUIH/540;
surface_set_target(LSligt);
draw_set_blend_mode(bm_add);
shader_set(shdr_lighting_point_mask);
matrix_set(matrix_view,Vmatx);

texture_set_stage(MUcolr,surface_get_texture(LScolr));
texture_set_stage(MUnorm,surface_get_texture(LSnorm));
texture_set_stage(MUprop,surface_get_texture(LSprop));
shader_set_uniform_f(MUlpos,Axpos,Aypos,Azpos);
shader_set_uniform_f(MUsize,GUIW*Vscal,GUIH*Vscal);

draw_set_colour(Ablnd);
draw_set_alpha(Ainty);
draw_primitive_begin_texture(pr_trianglestrip,Vcolr);
draw_vertex_texture(Axpos-Vxoff*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot+Vxoff*Vyrot,0,0);
draw_vertex_texture(Axpos+Vxscl*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot-Vxscl*Vyrot,1,0);
draw_vertex_texture(Axpos-Vxoff*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot+Vxoff*Vyrot,0,1);
draw_vertex_texture(Axpos+Vxscl*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot-Vxscl*Vyrot,1,1);
draw_primitive_end();
draw_set_alpha(1);

shader_reset();
draw_set_blend_mode(bm_normal);
surface_reset_target();
