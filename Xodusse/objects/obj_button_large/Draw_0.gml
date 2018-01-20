//© 2017 - Reece Warren
//GUI Buttons:

//draw_self();

draw_set_colour($000000);

//Set draw settings:
draw_set_font(fnt_Exudation_Large);

//Draw the button styling:

//Animate on hover:
if (Hover == true){
    //Extend the button if it is not the full size:
    if !(Extender > 128){
        draw_rectangle_colour(x-128,y-16,x+Extender,y+16,$000000,$600000,$600000,$000000,false);
        draw_triangle_colour(x+Extender,y-16-1,x+Extender,y+16,x+Extender+16,y-16-1,$F6D22A,$F6D22A,$F6D22A,false);
        draw_triangle_colour(x+Extender,y-16-1,x+Extender-16,y+16,x+Extender,y+16,$F6D22A,$F6D22A,$F6D22A,false);
        draw_set_colour($FFFF00);
    }
    //Otherwise, draw it at a fixed size:
    else {
        draw_rectangle_colour(x-128,y-16,x+Extender,y+16,$000000,$600000,$600000,$000000,false);
        draw_triangle_colour(x+Extender,y-16-1,x+Extender,y+16,x+Extender+16,y-16-1,$F6D22A,$F6D22A,$F6D22A,false);
        draw_triangle_colour(x+Extender,y-16-1,x+Extender-16,y+16,x+Extender,y+16,$F6D22A,$F6D22A,$F6D22A,false);
        draw_set_colour($FFFF00);
    }    
}

//If not hovered on, draw a standard button:
else {
    draw_rectangle(x-128,y-16,x+Extender,y+16,false);
    draw_triangle(x+Extender,y-16-1,x+Extender,y+16,x+Extender+16,y-16-1,false);
    draw_set_colour($FFFFFF);
}

//Set the text drawing configuration:
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//Draw button text:
if (BUTTON_TYPE == 0){
    draw_text(x+((1/4)*Extender)-112,y,string_hash_to_newline("Single Player"));
}
else if (BUTTON_TYPE == 1){
    draw_text(x+((1/4)*Extender)-112,y,string_hash_to_newline("Multiplayer"));
}
else if (BUTTON_TYPE == 2){
    draw_text(x+((1/4)*Extender)-112,y,string_hash_to_newline("Options"));
}
else if (BUTTON_TYPE == 3){
    draw_text(x+((1/4)*Extender)-112,y,string_hash_to_newline("Quit"));
}
else if (BUTTON_TYPE == 4){
    draw_text(x+((1/4)*Extender)-112,y,string_hash_to_newline("Back"));
}

//Revert draw settings:
draw_set_font(-1);
draw_set_colour(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

