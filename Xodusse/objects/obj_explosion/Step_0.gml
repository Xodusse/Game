/// @description Animate with delta timing
// © 2017 - Jon Harvey

if (Timer==1/2){

    for(var p = 0;p<40;p++){
        
        var Speed = power(random(1),8);
        Prx[p] = (random(4)-2)*Scale+SpeedX*Speed;
        Pry[p] = (random(4)-2)*Scale+SpeedY*Speed;
        Pra[p] = random(20)-10;
        Prr[p] = random(0.1);
        Pax[p] = random(8)-4;
        Pay[p] = random(8)-4;
        Paa[p] = random(360);
        Par[p] = Scale*2;
    }
    Shake = Shake*.9+3*sqr(Scale);
    with(obj_game_object){
    
        var Explosion = instance_nearest(x,y,obj_explosion);
        var Distance = distance_to_object(Explosion)/Explosion.Scale/32;
        if Distance<1.5{
        
            Health -= min(1.5-Distance,1)*Explosion.Damage;
        }
    }
}

Timer -= DELTA;
if Timer<=0{

    instance_destroy();
}

for(var p = 0;p<40;p++){

    Prx[p] *= S90;
    Pry[p] *= S90;
    Pra[p] *= S90;
    Prr[p] *= S90;
    
    Pax[p] += Prx[p]*FRAME_DELTA;
    Pay[p] += Pry[p]*FRAME_DELTA;
    Paa[p] += Pra[p]*FRAME_DELTA;
    Par[p] += Prr[p]*FRAME_DELTA;
}

