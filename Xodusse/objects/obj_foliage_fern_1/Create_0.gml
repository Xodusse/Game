/// @description Define object required variables:

/*
 * © 2017 - Reece Warren, MIT License.
 */ 
 
sprite_count = irandom_range(8,32);
image_speed = F1Q;
radius = 32;

//Populate the positions of all the shrubs into an array:
for (var i = 0; i <= sprite_count; i++){

    var r = random(radius);
    var a = random(360);
    
    ///Position[i,0] = Row of X positions:
    Position[i,0] = x + dcos(a) * r;
    ///Position[i,1] = Row of Y positions:
    Position[i,1] = y + dsin(a) * r;
    ///Position[i,2] = Rotation:
    Position[i,2] = irandom(360);
} 


/* */
/*  */
