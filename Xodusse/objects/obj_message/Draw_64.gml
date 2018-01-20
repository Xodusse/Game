/// @description Draw message
// © 2017 - Jon Harvey

draw_set_font(FNT_EXUDATION);
draw_set_colour($FFFFFF);
draw_set_alpha(image_alpha);
draw_text(8,y,string_hash_to_newline(Message));
draw_set_alpha(1);
draw_set_colour(0);
draw_set_font(-1);

