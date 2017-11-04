///scr_lighting_draw_level(level map,color sheet,normal sheet,property sheet,x,y)
// © 2017 - Jon Harvey

var Alevl,Acolr,Anorm,Aprop,Axpos,Aypos;
Alevl = argument[0];
Acolr = argument[1];
Anorm = argument[2];
Aprop = argument[3];
Axpos = argument[4];
Aypos = argument[5];

var Vbuvm,Vbuv1,Vbuv2,Vbuv3,Vcolr,Vnorm,Vprop,Vxpos,Vypos;
Vbuvm = background_get_uvs(Alevl);
Vbuv1 = background_get_uvs(Acolr);
Vbuv2 = background_get_uvs(Anorm);
Vbuv3 = background_get_uvs(Aprop);
Vcolr = background_get_texture(Acolr);
Vnorm = background_get_texture(Anorm);
Vprop = background_get_texture(Aprop);
Vxpos = Axpos - GUIW;
Vypos = Aypos - GUIH;

var Vscal,Vmatx;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;
Vmatx = matrix_get(matrix_view);
Vmatx[0] *= Vscal*GUIW/960;Vmatx[1] *= Vscal*GUIH/540;
Vmatx[4] *= Vscal*GUIW/960;Vmatx[5] *= Vscal*GUIH/540;
Vmatx[12] *= Vscal*GUIW/960;Vmatx[13] *= Vscal*GUIH/540;

surface_set_target_ext(0,LScolr);
surface_set_target_ext(1,LSnorm);
surface_set_target_ext(2,LSprop);
draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_one);
shader_set(shdr_lighting_maps_terrain);
matrix_set(matrix_view,Vmatx);

texture_set_stage(TUcolr,Vcolr);
texture_set_stage(TUnorm,Vnorm);
texture_set_stage(TUprop,Vprop);
shader_set_uniform_f(TUbuvm,Vbuvm[0],Vbuvm[1],Vbuvm[2],Vbuvm[3]);
shader_set_uniform_f(TUbuv1,Vbuv1[0],Vbuv1[1],Vbuv1[2],Vbuv1[3]);
shader_set_uniform_f(TUbuv2,Vbuv2[0],Vbuv2[1],Vbuv2[2],Vbuv2[3]);
shader_set_uniform_f(TUbuv3,Vbuv3[0],Vbuv3[1],Vbuv3[2],Vbuv3[3]);

for(var Mx = floor(Vxpos/2048); Mx<=ceil(Vxpos/2048);Mx++)
for(var My = floor(Vypos/2048); My<=ceil(Vypos/2048);My++)
{
    draw_primitive_begin_texture(pr_trianglestrip,1);
    draw_vertex_texture(Mx*2048,My*2048,0,0);
    draw_vertex_texture(Mx*2048+2048,My*2048,1,0);
    draw_vertex_texture(Mx*2048,My*2048+2048,0,1);
    draw_vertex_texture(Mx*2048+2048,My*2048+2048,1,1);
    draw_primitive_end();
}

shader_reset();
draw_set_blend_mode(bm_normal);
surface_reset_target();
