///scr_lighting_draw_point(x,y,z,radius,color)
// © 2017 - Jon Harvey

var Axpos,Aypos,Azpos,Aradi,Acolr;
Axpos = argument[0];
Aypos = argument[1];
Azpos = argument[2];
Aradi = argument[3];
Acolr = argument[4];

var Vscal,Vmatx;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;
Vmatx = matrix_get(matrix_view);
Vmatx[0] *= Vscal*GUIW/960;Vmatx[1] *= Vscal*GUIH/540;
Vmatx[4] *= Vscal*GUIW/960;Vmatx[5] *= Vscal*GUIH/540;
Vmatx[12] *= Vscal*GUIW/960;Vmatx[13] *= Vscal*GUIH/540;
surface_set_target(LSligt);

draw_set_blend_mode(bm_add);
shader_set(shdr_lighting_point);
matrix_set(matrix_view,Vmatx);

texture_set_stage(PUcolr,surface_get_texture(LScolr));
texture_set_stage(PUnorm,surface_get_texture(LSnorm));
texture_set_stage(PUprop,surface_get_texture(LSprop));
shader_set_uniform_f(PUlpos,Axpos,Aypos,Azpos);
shader_set_uniform_f(PUsize,GUIW*Vscal,GUIH*Vscal);

draw_primitive_begin(pr_trianglefan);
draw_vertex_colour(Axpos,Aypos,Acolr,1);
for(var Vrotn = 0;Vrotn<=360;Vrotn+=20)
{
    draw_vertex_colour(Axpos+dcos(Vrotn)*Aradi,Aypos+dsin(Vrotn)*Aradi,Acolr,0);
}
draw_primitive_end();

shader_reset();
draw_set_blend_mode(bm_normal);
surface_reset_target();
