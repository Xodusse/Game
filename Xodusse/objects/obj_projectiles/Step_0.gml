/// @description Collision with game objects
// © 2017 - Jon Harvey

var Object = collision_line(x*2-xprevious,y*2-yprevious,xprevious,yprevious,obj_game_object,1,1);

if instance_exists(Object) && Object != Hit{
    
    if !irandom(10){
    
        var Normal;
        Normal = point_direction(Object.x,Object.y,x,y);
        direction += angle_difference(Normal,direction);
        image_angle = direction;
    }
    else{
    
        instance_destroy();
    }
    
    if (Pexplode[Id]>0){
        
        var Explosion = instance_create(x,y,obj_explosion);
        Explosion.SpeedX =  speed*dcos(direction);
        Explosion.SpeedY = -speed*dsin(direction);
        Explosion.Scale = Pexplode[Id];
        Explosion.Damage = Pdamage[Id];
        instance_destroy();
    }
    else{
    
        Hit = Object;
        Hit.Health -= Pdamage[Id]*min(image_alpha/Ppower[Id],1);
        image_alpha -= Ppower[Id];
        if (Hit.object_index == obj_player){
            
            Shake = Shake*0.9+Pdamage[Id];
        }
    }
}
else
if Object == noone{

    Hit = noone;
}

///Speed and fade update
// © 2017 - Jon Harvey

speed = Pspeed[Id]*FRAME_DELTA;
image_alpha -= Pspeed[Id]*FRAME_DELTA/Prange[Id];

if image_alpha<0.01{

    instance_destroy();
}

