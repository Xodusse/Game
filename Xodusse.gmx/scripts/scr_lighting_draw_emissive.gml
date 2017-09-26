///scr_lighting_draw_emissive(emissive sprite,subimg,x,y,xscale,yscale,rot,color,alpha)
// © 2017 - Jon Harvey

var Aemis,Asimg,Axpos,Aypos,Axscl,Ayscl,Arotn,Ablnd,Alpha
Aemis = argument[0];
Asimg = argument[1];
Axpos = argument[2];
Aypos = argument[3];
Axscl = argument[4];
Ayscl = argument[5];
Arotn = argument[6];
Ablnd = argument[7];
Alpha = argument[8];

var Vsuv1,Vemis,Vxoff,Vyoff,Vxscl,Vyscl,Vxrot,Vyrot;
Vsuv1 = sprite_get_uvs(Aemis,Asimg);
Vemis = sprite_get_texture(Aemis,Asimg);
Vxoff = sprite_get_xoffset(Aemis)*Axscl*Vsuv1[6];
Vyoff = sprite_get_yoffset(Aemis)*Ayscl*Vsuv1[7];
Vxscl = sprite_get_width(Aemis)*Axscl*Vsuv1[6]-Vxoff;
Vyscl = sprite_get_height(Aemis)*Ayscl*Vsuv1[7]-Vyoff;
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

draw_set_colour(Ablnd);
draw_set_alpha(Alpha);
draw_primitive_begin_texture(pr_trianglestrip,Vemis);
draw_vertex_texture(Axpos-Vxoff*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot+Vxoff*Vyrot,0,0);
draw_vertex_texture(Axpos+Vxscl*Vxrot-Vyoff*Vyrot,Aypos-Vyoff*Vxrot-Vxscl*Vyrot,1,0);
draw_vertex_texture(Axpos-Vxoff*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot+Vxoff*Vyrot,0,1);
draw_vertex_texture(Axpos+Vxscl*Vxrot+Vyscl*Vyrot,Aypos+Vyscl*Vxrot-Vxscl*Vyrot,1,1);
draw_primitive_end();
draw_set_alpha(1);

draw_set_blend_mode(bm_normal);
surface_reset_target();
