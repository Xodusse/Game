draw_set_font(fnt_Exudation_Large);
draw_set_colour(c_white);
draw_set_halign(fa_left);

if (CONSOLE_ENABLED == true){
    //draw the console window
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-150),  string_hash_to_newline("/" + text));
    
    //draw the string history
    //draw_text(+32, ((view_hview[0])-180),  string0);
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-205),  string_hash_to_newline(string1));
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-230),  string_hash_to_newline(string2)); 
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-255),  string_hash_to_newline(string3)); 
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-280),  string_hash_to_newline(string4)); 
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-305),  string_hash_to_newline(string5)); 
    draw_text(16, ((__view_get( e__VW.HView, 0 ))-330),  string_hash_to_newline(string6));
    
    //Change the colour of the help title if the command is used:
    if (string_pos("--- COMMAND LIST",string7) == true){
        draw_set_colour(c_orange);
        draw_text(16, ((__view_get( e__VW.HView, 0 ))-355),  string_hash_to_newline(string7));
        draw_set_colour(c_white);
    }
    else {
        draw_text(16, ((__view_get( e__VW.HView, 0 ))-355),  string_hash_to_newline(string7));
    }
    
    //Change the colour of the next page footer if the help command is used:
    if (string_pos("Type /help 2 to view next page...",string0) == true){
        draw_set_colour(c_olive);
        draw_text(16, ((__view_get( e__VW.HView, 0 ))-180),  string_hash_to_newline(string0));
        draw_set_colour(c_white);
    }
    else {
        draw_text(+32, ((__view_get( e__VW.HView, 0 ))-180),  string_hash_to_newline(string0));
    }     
    

    var length = string_width(string_hash_to_newline(text))+10;
    //var height = string_height(text);
    var box_height = 28;  
    
    if (cursor_blink == true){
        draw_text((16)+length,((__view_get( e__VW.HView, 0 ))-150),string_hash_to_newline("_"));
        
    }
    draw_set_alpha(0.1);
    draw_rectangle(0, ((__view_get( e__VW.HView, 0 ))-155),
    ((__view_get( e__VW.WView, 0 ))-150), ((__view_get( e__VW.HView, 0 ))-155)+ box_height, 
    false);
    draw_set_alpha(1);
}

draw_set_colour(c_black);
draw_set_font(-1);

