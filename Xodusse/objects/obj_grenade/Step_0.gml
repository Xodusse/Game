/// @description Move and explode
// © 2017 - Jon Harvey

if (Z<=.1){

    //Hit ground.
    SpeedA *= random(0.4)+0.8;
    SpeedX *= .8;
    SpeedY *= .8;
    SpeedZ *= -.9*S90;
}
else{
    
    //Fall to ground.
    SpeedZ += -653*DELTA;
}

//Bounce
var Object = collision_line(x*2-xprevious,y*2-yprevious,xprevious,yprevious,obj_game_object,1,1);
if instance_exists(Object) && (Object.object_index != obj_player) && !Hit{
    
    var Normal,Direction,Length;
    Normal = point_direction(Object.x,Object.y,x,y);
    Direction = darctan2(-SpeedY,SpeedX);
    Direction += angle_difference(Normal,Direction);
    Length = sqrt(sqr(SpeedX)+sqr(SpeedY))*.8;
    SpeedX = dcos(Direction)*Length;
    SpeedY = dcos(Direction)*Length;
}

//Set initial speed.
var SumX,SumY;
SumX = SpeedX;
SumY = SpeedY;

//Get pushed by all objects.
for(var i = instance_number(obj_game_object);i>=0;i--){

    var Inst = instance_find(obj_game_object,i);
    if (Inst!=noone) && (Inst!=id){
        
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
depth = -2;

//Control movement.
x += SpeedX*FRAME_DELTA;
y += SpeedY*FRAME_DELTA;
Z = max(Z+SpeedZ*FRAME_DELTA,0);


Timer += DELTA;
if (Timer>2){

    var Explosion = instance_create(x,y,obj_explosion);
    Explosion.SpeedX = SpeedX;
    Explosion.SpeedY = SpeedY;  
    Explosion.Scale = 1;
    Explosion.Damage = 4;
    instance_destroy();
}

