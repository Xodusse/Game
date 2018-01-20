/// @description AI control
// © 2017 - Jon HarveY

AiTargetSpeedX *= S98;
AiTargetSpeedY *= S98;
AiTargetX += FRAME_DELTA*AiTargetSpeedX;
AiTargetY += FRAME_DELTA*AiTargetSpeedY;


if instance_exists(obj_player){
    
    var Visible = (point_distance(obj_player.x,obj_player.y,x+dcos(WalkDirection)*AiSight,y-dsin(WalkDirection)*AiSight)<AiSight) &&
    ((collision_line(obj_player.x,obj_player.y,x+dsin(WalkDirection)*AiEye,y+dcos(WalkDirection)*AiEye,obj_wall,0,1) == noone) ||
    (collision_line(obj_player.x,obj_player.y,x-dsin(WalkDirection)*AiEye,y-dcos(WalkDirection)*AiEye,obj_wall,0,1) == noone));
            
    if Visible{
        
        AiFocus = AiFocus*S90+(1-S90);
        Speed = Speed*S90+(1-S90);
        AiTargetSpeedX = obj_player.SpeedX;
        AiTargetSpeedY = obj_player.SpeedY;
        AiTargetX = obj_player.x;
        AiTargetY = obj_player.y;
    }
    else{
        
        AiFocus *= 1-(1-S90)*(point_distance(x,y,AiTargetX,AiTargetY)<100);
    }

    WalkDirection += FRAME_DELTA*0.1*AiFocus*angle_difference(point_direction(x,y,AiTargetX,AiTargetY),WalkDirection);
    
    var Return = point_distance(x,y,AiTargetX,AiTargetY)/2000*angle_difference(point_direction(x,y,AiTargetX,AiTargetY),WalkDirection);
    WalkDirection += FRAME_DELTA*0.1*(1-AiFocus)*(random(60)-30+Return);

    //Destroy the instance if too far away:
    if (distance_to_object(obj_player) >= 1000){
        instance_destroy();
    }

}

///Enemy movement
// © 2017 - Jon Harvey

image_angle = WalkDirection;

//Set image speed - Reece:
image_speed = F1Q;

//Set initial speed.
var SumX,SumY;
SumX =  Speed*dcos(WalkDirection);
SumY = -Speed*dsin(WalkDirection);

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
    }
}

//Move smoothly and with delta timing.
SpeedX = SpeedX*S90+(1-S90)*(SumX);
SpeedY = SpeedY*S90+(1-S90)*(SumY);
x += SpeedX*FRAME_DELTA;
y += SpeedY*FRAME_DELTA;

//Collide with obstacle
var Inst = instance_place(x+SpeedX*10,y+SpeedY*10,obj_wall);
if Inst != noone{

    WalkDirection += FRAME_DELTA*0.2*angle_difference(point_direction(Inst.x,Inst.y,x,y),WalkDirection);
}
else{
    
    WalkDirection += FRAME_DELTA*0.1*angle_difference(point_direction(0,0,SpeedX,SpeedY),WalkDirection);
}

//Check health.
if Health<=0
{
    //Play death sound 50% chance:
    var chance = irandom(100);
    if (chance <= 50){   
        if (instance_exists(obj_player)){
            if (distance_to_object(obj_player) <= 500){
                var deathsound = choose(0,1,2,3,4);
                audio_play_sound(
                    asset_get_index("snd_enemy_death_" + string(deathsound)), 1, false);
                
                //Drop ammo.
                if !irandom(8){
                    var Type = irandom(3);
                    scr_inventory_drop(Idoubles*2+Isingles+Igrenades+1+Type,ceil(sqrt(random(1))*Gcap[Type]),x,y,SpeedX,SpeedY);
                }
            }
        }
    }
        
    instance_destroy();
}

