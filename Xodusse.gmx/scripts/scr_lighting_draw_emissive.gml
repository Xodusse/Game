///scr_lighting_draw_emissive(color sprite,property sprite,subimg,x,y,xscale,yscale,rot,color,alpha)
// © 2017 - Jon Harvey

var Acolr,Aemis,Asimg,Axpos,Aypos,Axscl,Ayscl,Arotn,Ablnd,Alpha
Acolr = argument[0];
Aemis = argument[1];
Asimg = argument[2];
Axpos = argument[3];
Aypos = argument[4];
Axscl = argument[5];
Ayscl = argument[6];
Arotn = argument[7];
Ablnd = argument[8];
Alpha = argument[9];

var Vsuv1,Vcolr,Vemis,Vxoff,Vyoff,Vxscl,Vyscl,Vxrot,Vyrot;
Vsuv1 = sprite_get_uvs(Acolr,Asimg);
Vcolr = sprite_get_texture(Acolr,Asimg);
Vemis = sprite_get_texture(Aemis,Asimg);
Vxoff = sprite_get_xoffset(Acolr)*Axscl*Vsuv1[6];
Vyoff = sprite_get_yoffset(Acolr)*Ayscl*Vsuv1[7];
Vxscl = sprite_get_width(Acolr)*Axscl*Vsuv1[6]-Vxoff;
Vyscl = sprite_get_height(Acolr)*Ayscl*Vsuv1[7]-Vyoff;
Vxrot = dcos(Arotn);
Vyrot = dsin(Arotn);

var Vscal,Vmatx;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;
Vmatx = matrix_get(matrix_view);
Vmatx[0] *= Vscal*GUIW/960;Vmatx[1] *= Vscal*GUIH/540;
Vmatx[4] *= Vscal*GUIW/960;Vmatx[5] *= Vscal*GUIH/540;
Vmatx[12] *= Vscal*GUIW/960;Vmatx[13] *= Vscal*GUIH/540;

surface_set_target(LSligt);
matrix_set(matrix_view,Vmatx);
draw_set_blend_mode(bm_add);
draw_set_alpha(Alpha);

draw_primitive_begin_texture(pr_trianglestrip,Vcolr);
draw_vertex_texture(Axpos-Vxoff*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot+Vxoff*Vyrot,0,0);
draw_vertex_texture(Axpos+Vxscl*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot-Vxscl*Vyrot,1,0);
draw_vertex_texture(Axpos-Vxoff*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot+Vxoff*Vyrot,0,1);
draw_vertex_texture(Axpos+Vxscl*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot-Vxscl*Vyrot,1,1);
draw_primitive_end();
surface_reset_target();

surface_set_target(LSprop);
matrix_set(matrix_view,Vmatx);
draw_set_colour_write_enable(0,0,1,0);

draw_primitive_begin_texture(pr_trianglestrip,Vemis);
draw_vertex_texture(Axpos-Vxoff*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot+Vxoff*Vyrot,0,0);
draw_vertex_texture(Axpos+Vxscl*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot-Vxscl*Vyrot,1,0);
draw_vertex_texture(Axpos-Vxoff*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot+Vxoff*Vyrot,0,1);
draw_vertex_texture(Axpos+Vxscl*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot-Vxscl*Vyrot,1,1);
draw_primitive_end();

draw_set_alpha(1);
draw_set_colour($FFFFFF);
draw_set_colour_write_enable(1,1,1,1);
draw_set_blend_mode(bm_normal);
surface_reset_target();
