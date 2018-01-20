//Barrel
//© 2017 - Reece Warren

var percent = irandom(100);

if (percent < 30){
    //Rusted
    type = 1;
    image_index = 1;
    puddle_child = instance_create(x,y,obj_Barrel_Puddle);
    puddle_child.parent = id;
    Health = 2;
}

else {
    //Regular
    type = 0;
    image_index = 0;
    Health = 1;
}

image_angle = irandom(360);
image_speed = 0;

///Initialize variables
// © 2017 - Jon Harvey

SpeedX = 0;
SpeedY = 0;
Radius = 20;

