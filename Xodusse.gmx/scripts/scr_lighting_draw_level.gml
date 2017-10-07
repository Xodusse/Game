///scr_lighting_draw_level(level map,color sheet,normal sheet)
// © 2017 - Jon Harvey

var Alevl,Acolr,Anorm;
Alevl = argument[0];
Acolr = argument[1];
Anorm = argument[2];

var Vbuvm,Vbuv1,Vbuv2,Vcolr,Vnorm;
Vbuvm = background_get_uvs(Alevl);
Vbuv1 = background_get_uvs(Acolr);
Vbuv2 = background_get_uvs(Anorm);
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
shader_set(shdr_lighting_maps_terrain);
matrix_set(matrix_view,Vmatx);

texture_set_stage(LUnorm,Vnorm);
shader_set_uniform_f(TUbuvm,Vbuvm[0],Vbuvm[1],Vbuvm[2],Vbuvm[3]);
shader_set_uniform_f(TUbuv1,Vbuv1[0],Vbuv1[1],Vbuv1[2],Vbuv1[3]);
shader_set_uniform_f(TUbuv2,Vbuv2[0],Vbuv2[1],Vbuv2[2],Vbuv2[3]);

draw_primitive_begin_texture(pr_trianglestrip,1);
draw_vertex_texture(0,0,0,0);
draw_vertex_texture(2048,0,1,0);
draw_vertex_texture(0,2048,0,1);
draw_vertex_texture(2048,2048,1,1);
draw_primitive_end();
shader_reset();
draw_set_blend_mode(bm_normal);
surface_reset_target();
