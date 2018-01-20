///scr_vertex_init()

globalvar Vformat;
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();
vertex_format_add_textcoord();
Vformat = vertex_format_end();
