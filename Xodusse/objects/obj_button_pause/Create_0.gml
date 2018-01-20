/// @description GUI Buttons:
//© 2017 - Reece Warren

//Button type determines the function of the button:

//0 = Quit,
//1 = Back to game,

//NOTE:
    //Button types for main menu buttons are set in object creation code:

BUTTON_TYPE = 0;
image_speed = 0;

Hover = false;
Clicked = false;

Extender = 96;

//Coordinates:
pH1x = x-(dcos(VIEW_ANGLE)*(Extender));
pH1y = y-(dsin(VIEW_ANGLE)*(Extender));

pH2x = x+(dcos(VIEW_ANGLE)*(Extender));
pH2y = y+(dsin(VIEW_ANGLE)*(Extender));

vDist = 16;

p1x = pH1x - (dcos(VIEW_ANGLE+90)*vDist);
p1y = pH1y - (dsin(VIEW_ANGLE+90)*vDist);

p2x = pH2x - (dcos(VIEW_ANGLE+90)*vDist);
p2y = pH2y - (dsin(VIEW_ANGLE+90)*vDist);

p3x = pH1x + (dcos(VIEW_ANGLE+90)*vDist);
p3y = pH1y + (dsin(VIEW_ANGLE+90)*vDist);

p4x = pH2x + (dcos(VIEW_ANGLE+90)*vDist);
p4y = pH2y + (dsin(VIEW_ANGLE+90)*vDist);   

