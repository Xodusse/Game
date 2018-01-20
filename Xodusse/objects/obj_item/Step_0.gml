with (other) {
///Move when thrown
// © 2017 - Jon Harvey

if (Z<=-SpeedZ){

    //Hit ground.
    SpeedA *= .5*S90;
    SpeedX *= .5*S90;
    SpeedY *= .5*S90;
    SpeedZ = -Z;
}
else{
    
    //Fall to ground.
    SpeedZ += -653*DELTA;
}

//Bounce
var Object = collision_line(x*2-xprevious,y*2-yprevious,xprevious,yprevious,obj_game_object,1,1);
if instance_exists(Object) && !Hit{
    
    var Normal,Direction,Length;
    Normal = point_direction(Object.x,Object.y,x,y);
    Direction = darctan2(-SpeedY,SpeedX);
    Direction += angle_difference(Normal,Direction);
    Length = sqrt(sqr(SpeedX)+sqr(SpeedY));
    SpeedX = dcos(Direction)*Length;
    SpeedY = dcos(Direction)*Length;
}

//Set initial speed.
var SumX,SumY;
SumX = SpeedX;
SumY = SpeedY;
//Get pushed by enemies.
for(var i = instance_number(obj_game_object);i>=0;i--){

    var Inst = instance_find(obj_game_object,i);
    if (Inst!=id) && (Inst!=noone){
        
        var Distance = point_distance(x+SpeedX,y+SpeedY,Inst.x+Inst.SpeedX,Inst.y+Inst.SpeedY);
        if (Distance<Radius+Inst.Radius){
        
            var NormX = (x+SpeedX-(Inst.x+Inst.SpeedX))/Distance;
            var NormY = (y+SpeedY-(Inst.y+Inst.SpeedY))/Distance;
            SumX += NormX*(Radius+Inst.Radius-Distance);
            SumY += NormY*(Radius+Inst.Radius-Distance);
        }
        else{
            
            Hit *= Inst.object_index != obj_player;
        }
    }
}

//Move smoothly and with delta timing.
SpeedX = SpeedX*S90+(1-S90)*(SumX);
SpeedY = SpeedY*S90+(1-S90)*(SumY);

//Update visuals.
image_angle += SpeedA*FRAME_DELTA;
image_xscale = 1+.001*Z;
image_yscale = 1+.001*Z;
depth = -Z;

//Control movement.
x += SpeedX*FRAME_DELTA;
y += SpeedY*FRAME_DELTA;
Z = max(Z+SpeedZ*FRAME_DELTA,0);

}
