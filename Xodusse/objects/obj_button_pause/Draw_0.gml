//© 2017 - Reece Warren
//GUI Buttons:

draw_set_colour($000000);

//Set draw settings:
draw_set_font(fnt_Exudation_Large); 

//Animate on hover:
if (Hover == true){    
    
    //Extend the button if it is not the full size:
    if !(Extender > 96){
        draw_quad(p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y);      
        
        draw_set_colour($FFFF00);
    }
    //Otherwise, draw it at a fixed size:
    else {                                                                
        draw_quad(p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y);         
                
        draw_set_colour($FFFF00);
    }    
}

//If not hovered on, draw a standard button:
else {
    draw_quad(p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y);     
    draw_set_colour($FFFFFF);
}

//Draw the button text draw configuration:
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw button text:

//Return to game:
if (BUTTON_TYPE == 0){
    draw_text_transformed(x,y,string_hash_to_newline("Return to game."),1,1,VIEW_ANGLE*-1);
}

//Quit:
else if (BUTTON_TYPE == 1){
    draw_text_transformed(x,y,string_hash_to_newline("Main menu."),1,1,VIEW_ANGLE*-1);
}

//Revert draw settings:
draw_set_font(-1);
draw_set_colour(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

