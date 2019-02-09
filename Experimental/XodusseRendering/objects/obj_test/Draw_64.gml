///@desc Draw surfaces

surface_set_target_ext(0,Dif);
surface_set_target_ext(1,Nor);
surface_set_target_ext(2,She);
draw_clear_alpha(0,0);
shader_set(shd_map);

texture_set_stage(uNor,sprite_get_texture(spr_tree_nor,sprite_index));
texture_set_stage(uShe,sprite_get_texture(spr_tree_she,sprite_index));

var UV1 = sprite_get_uvs(spr_tree_dif,sprite_index);
shader_set_uniform_f(uUV1,UV1[0],UV1[1],UV1[2],UV1[3]);

var UV2 = sprite_get_uvs(spr_tree_nor,sprite_index);
shader_set_uniform_f(uUV2,UV2[0],UV2[1],UV2[2],UV2[3]);

var UV3 = sprite_get_uvs(spr_tree_she,sprite_index);
shader_set_uniform_f(uUV3,UV3[0],UV3[1],UV3[2],UV3[3]);

draw_primitive_begin_texture(pr_trianglestrip,1);
draw_vertex_texture(x,y,0,0);
draw_vertex_texture(x+sprite_width,y,1,0);
draw_vertex_texture(x,y+sprite_height,0,1);
draw_vertex_texture(x+sprite_width,y+sprite_height,1,1);
draw_primitive_end();


shader_reset();
surface_reset_target();

draw_surface(Dif,mouse_x*.3-room_width*.15,mouse_y*.3-room_height*.15);
draw_surface(Nor,mouse_x*.6-room_width*.30,mouse_y*.6-room_height*.30);
draw_surface(She,mouse_x*.9-room_width*.45,mouse_y*.9-room_height*.45);