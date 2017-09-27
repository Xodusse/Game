///scr_lighting_draw_background(color background,normal background)
// © 2017 - Jon Harvey

var Acolr,Anorm;
Acolr = argument[0];
Anorm = argument[1];

var Vsuv1,Vsuv2,Vcolr,Vnorm;
Vsuv1 = background_get_uvs(Acolr);
Vsuv2 = background_get_uvs(Anorm);
Vcolr = background_get_texture(Acolr);
Vnorm = background_get_texture(Anorm);

var Vscal,Vmatx;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;
Vmatx = matrix_get(matrix_view);
Vmatx[0] *= Vscal*GUIW/960;Vmatx[1] *= Vscal*GUIH/540;
Vmatx[4] *= Vscal*GUIW/960;Vmatx[5] *= Vscal*GUIH/540;
Vmatx[12] *= Vscal*GUIW/960;Vmatx[13] *= Vscal*GUIH/540;

surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);
draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_one);
shader_set(shdr_lighting_maps);
matrix_set(matrix_view,Vmatx);

texture_set_stage(LUnorm,Vnorm);
shader_set_uniform_f(LUmatx,1,0,0,1);
shader_set_uniform_f(LUsuv1,Vsuv1[0],Vsuv1[1],Vsuv1[2],Vsuv1[3]);
shader_set_uniform_f(LUsuv2,Vsuv2[0],Vsuv2[1],Vsuv2[2],Vsuv2[3]);

draw_primitive_begin_texture(pr_trianglestrip,1);
draw_vertex_texture(-32000,32000,0,0);
draw_vertex_texture(32000,32000,2000,0);
draw_vertex_texture(-32000,-32000,0,2000);
draw_vertex_texture(32000,-32000,2000,2000);
draw_primitive_end();
shader_reset();
draw_set_blend_mode(bm_normal);
surface_reset_target();
