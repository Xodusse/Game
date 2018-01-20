var __b__;
__b__ = action_if_variable(PAUSED, true, 0);
if __b__
{
{
///Draw the pause screen.
//© 2017 - Reece Warren.

/* This needs to be drawn in a standard draw event because the button objects
   do not work whilst using Draw GUI, due to an alteration of the object's
   co-ordinates 
   */
   
draw_set_colour($000000);

//The final view_xview and view_yview co-ordinates that account for rotation.
var p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y;

    /*
       
        p1x,p1y   ---   p2x,p2y     ----
           |               |        vDist
       pH1x,pH1y   .   pH2x,pH2y    ----
           |               |           
        p3x,p3y   ---   p4x,p4y 
        
       
      * Firstly the horizontal relative camera points (pH1x,pH1y) & (pH2x,pH2y) must be calculated from
        the center of the camera which is the rotation point:
             ( view_xview[0]+(view_wview[0]/2) )
             ( view_yview[0]+(view_hview[0]/2) )              
        
      * This is because the screen width and height are not considered to be a square ratio.
      
      * Next, the variable vDist is calculated, which determines the vertical component between the center rotation
        point and the top of the screen. (This is calculated by adding 90 degrees to the VIEW_ANGLE variable to account for
        the direction, and then this is multiplied by one half of the height of the view (view_hview[0]/2).
        
      * Lastly, this variable is then used to calculate the final positions of each point on the screen based upon
        the VIEW_ANGLE+90 direction, multiplied by the vDist, and either added or subtracted depending upon each unique
        co-ordinate.
        
      * NOTE:
        64px have also been added at either side to account for screen shake, when the edges overlap the visible
        view in the room. (This is the extender variable).   
      
    */

//Used in debugging:
/*
draw_circle(view_xview[0]+(view_wview[0]/2),view_yview[0]+(view_hview[0]/2),5,false);

draw_circle(pH1x,pH1y,5,false);
draw_circle(pH2x,pH2y,5,false);

draw_circle(p1x,p1y,5,false);
draw_circle(p2x,p2y,5,false);
draw_circle(p3x,p3y,5,false);
draw_circle(p4x,p4y,5,false);
*/    
    
var Extender = 64;
       
var pH1x = (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))-(dcos(VIEW_ANGLE)*((__view_get( e__VW.WView, 0 )/2) + Extender));
var pH1y = (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))-(dsin(VIEW_ANGLE)*((__view_get( e__VW.WView, 0 )/2) + Extender));

var pH2x = (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))+(dcos(VIEW_ANGLE)*((__view_get( e__VW.WView, 0 )/2) + Extender));
var pH2y = (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))+(dsin(VIEW_ANGLE)*((__view_get( e__VW.WView, 0 )/2) + Extender));

var vDist = point_distance(
            (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))-(dcos(VIEW_ANGLE+90)*((__view_get( e__VW.HView, 0 )/2) + Extender)),
            (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))-(dsin(VIEW_ANGLE+90)*((__view_get( e__VW.HView, 0 )/2) + Extender)),
            (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2)),
            (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2)));

var p1x = pH1x - (dcos(VIEW_ANGLE+90)*vDist);
var p1y = pH1y - (dsin(VIEW_ANGLE+90)*vDist);

var p2x = pH2x - (dcos(VIEW_ANGLE+90)*vDist);
var p2y = pH2y - (dsin(VIEW_ANGLE+90)*vDist);

var p3x = pH1x + (dcos(VIEW_ANGLE+90)*vDist);
var p3y = pH1y + (dsin(VIEW_ANGLE+90)*vDist);

var p4x = pH2x + (dcos(VIEW_ANGLE+90)*vDist);
var p4y = pH2y + (dsin(VIEW_ANGLE+90)*vDist);


//Draw the pause screen background:
draw_set_alpha(0.4);

draw_triangle(p1x,p1y,p2x,p2y,p3x,p3y,false);
draw_triangle(p2x,p2y,p3x,p3y,p4x,p4y,false);

//Reset the draw settings:
draw_set_colour($FFFFFF);
draw_set_alpha(1);

draw_set_font(fnt_Exudation_Large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw menu items:
draw_text_transformed(
            (__view_get( e__VW.XView, 0 )+(__view_get( e__VW.WView, 0 )/2))-(dcos(VIEW_ANGLE+90)*128),
            (__view_get( e__VW.YView, 0 )+(__view_get( e__VW.HView, 0 )/2))-(dsin(VIEW_ANGLE+90)*128),
            string_hash_to_newline("GAME PAUSED"),
            1,1,VIEW_ANGLE*-1);

//Reset the draw settings:                      
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);  

draw_set_colour(-1);          

/* */
}
}
/*  */
