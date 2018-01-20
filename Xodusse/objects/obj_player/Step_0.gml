/// @description Check for guns in hotbar
// © 2017 - Jon Harvey

//This doesn't have to be calculated every step! Only when there's an inventory change.

//Variable for number of guns.
Count = 0;
//Cycle through primary inventory slots.
for(var X = 0;X<6;X++){
    
    var Item,Double;
    Item = I[X];
    Double = (Item<=Idoubles*2);
    //Check if item is gun (or front part of heavy gun).
    if Item<=(Idoubles*2+Isingles+Igrenades) ^^ (Double && ((Item+1)%2)){
        
        P[Count] = X+Double;            
        G[Count++] = floor(Item/2-1/2)+!Double*floor(Item/2-Idoubles);
    }
}

///Control weapon swapping
// © 2017 - Jon Harvey

//Reduce swap animation to 0.
Swap *= S90;

if Count{
    
    if abs(Swap)<0.1{
        
        var H,X,Y;
        H = __view_get( e__VW.HPort, 0 );
        X = window_mouse_get_x();
        Y = window_mouse_get_y();
    
        Swap = mouse_wheel_down()-mouse_wheel_up();
        if Swap != 0{
            
            if point_distance(0,H,X,Y)<150 && I[P[Current]]>Idoubles*2{
                
                Current = (Current-Swap+Count)%Count;
                Rate = 0;
            }
            else{
                
                Current = (Current-Swap+Count)%Count;
                Rate = 0;
            }
        }
        else{
            
            //Swap with number keys.
            if (K1)           {Current = 0; Rate = 0;Swap = 1;}
            if (K2 && Count>1){Current = 1; Rate = 0;Swap = 1;}
            if (K3 && Count>2){Current = 2; Rate = 0;Swap = 1;}
            if (K4 && Count>3){Current = 3; Rate = 0;Swap = 1;}
            if (K5 && Count>4){Current = 4; Rate = 0;Swap = 1;}
            if (K6 && Count>5){Current = 5; Rate = 0;Swap = 1;}
        }
    }
}
else{
    
    Current = 0;
}
Grenade = (I[P[Current]]>Idoubles*2+Isingles);
if !Grenade && (abs(Swap)==1){

    Reload = Greload[G[Current]]*((Q[P[Current]]>0));
}

//Broken dual wield varaible:
Secondary = Current;

///Check for magazines and weight
// © 2017 - Jon Harvey

//This doesn't have to be calculated every step! Only when there's an inventory change.

//Variables for magazine position and count.
Iweight = 0;
MagazineNext = -1;
Magazines = 0;
//Cycle through all inventory slots.
for(var Y = 1+Ibackpack;Y>=0;Y--)
for(var X = 0;X<6;X++){
    
    var Item = I[X+Y*6];
    if Item{
        
        //Add weight to inventory;
        Iweight += W[Item-1];
        //Check if item is the right ammo.
        if (Item == G[Current]+Idoubles*2+Isingles+Igrenades+1){
            
            if Q[X+Y*6]{
                
                Magazines++;
                if (MagazineNext = -1){
                    
                    MagazineNext = X+Y*6;
                }
            }
        }
    }
}

//Don't reload when empty.
if !Magazines && !Grenade{

    Reload = Greload[G[Current]];
}
else
if Q[P[Current]]<1 && !Grenade && Reload>=Greload[G[Current]]{

    Reload = 0;
}

///Handle grenades, gun and reloading
// © 2017 - Jon Harvey

//Temporary speed variables for recoil.
var RecoilSpeedX,RecoilSpeedY;
RecoilSpeedX = 0;
RecoilSpeedY = 0;

//Reduce kick animation to 0.
Kick *= S90;

//Fire or swap guns when not swapping.
if Count && (abs(Swap)<0.1){
       
    //Add to gun timelines.
    Rate += DELTA;
    Reload += DELTA;
    
    if !Ienable && Grenade{
            
        if mouse_check_button_pressed(mb_left) && (Reload>1){
                    
            if (Q[P[Current]]>0){
                
                Q[P[Current]]--;
                //Handle grenade.
                var ThrowSpeedX,ThrowSpeedY,Throw;
                ThrowSpeedX = (mouse_x-x)/40+SpeedX;
                ThrowSpeedY = (mouse_y-y)/40+SpeedY;
                Throw = instance_create(x,y,obj_grenade);
                
                Throw.Z = 50;
                Throw.SpeedA = random(20);
                Throw.SpeedX = ThrowSpeedX;
                Throw.SpeedY = ThrowSpeedY;
                Throw.SpeedZ = sqrt(sqr(ThrowSpeedX)+sqr(ThrowSpeedY));
                Reload = 0;
            }
            else{
            
                //Remove empty grenade slot.
                I[P[Current]] = 0;
                }
            }
        }
        else
        if !Grenade{
        
            //Fill gun when finished reloading.
            if Reload>Greload[G[Current]] && Q[P[Current]]<1  && Magazines{
            
                Q[P[Current]] = Q[MagazineNext];
                //Remove magazine
                I[MagazineNext] = 0;
                Q[MagazineNext] = 0;
            }
            else{
            
            //Shoot fully-automatic or semi-automatic with left click as long as the inventory is closed.
            if !Ienable && (mouse_check_button(mb_left)*Gauto[G[Current]] || mouse_check_button_pressed(mb_left)*!Gauto[G[Current]]){
                
                //Check gun timelines.
                if (Rate>1/Grate[G[Current]] && Reload>Greload[G[Current]] && Q[P[Current]]){
                    
                    Shake = Shake*0.9+0.05*Grecoil[G[Current]];
                    audio_play_sound(snd_gun,0,0);
                    Rate = 0;
                    
                    //Shoot all bullets.
                    for(var S = 0;S<Gbullets[G[Current]]*max(DELTA*Grate[G[Current]],1);S++){
                        
                        var Length,Bullet,Direction;
                        Length = 16+8*S/Gbullets[G[Current]]+32*(G[Current]<Idoubles);
                        Bullet = instance_create(x+Length*dcos(GunDirection),y-Length*dsin(GunDirection),obj_projectiles);
                        Direction = GunDirection+sqr(random(1))*choose(1,-1)*Garc[G[Current]];
                        Bullet.direction = Direction;
                        Bullet.image_angle = Direction;
                        Bullet.Id = Gtype[G[Current]];
                    }
                    
                    //Update or reload magazine.
                    Q[P[Current]] = max(Q[P[Current]]-ceil(DELTA*Grate[G[Current]]),0);
                    if (Q[P[Current]]<1 && Magazines){
                    
                        audio_play_sound(snd_empty,0,0);
                        Q[P[Current]] = 0;
                        Reload = 0;
                    }
                    
                    //Add gun recoil to player speed and kick.
                    Kick = Grecoil[G[Current]];
                    RecoilSpeedX = -Grecoil[G[Current]]*dcos(GunDirection)/FRAME_DELTA;
                    RecoilSpeedY =  Grecoil[G[Current]]*dsin(GunDirection)/FRAME_DELTA;
                }
            }
            
            //Reload magazine with the reload key.
            if Kreload && (Q[P[Current]]<Gcap[G[Current]] && Reload>Greload[G[Current]] && Magazines){
                
                var Last,Break;
                Last = -1;
                Break = 0;
                for(var Y = 0;Y<=1+Ibackpack;Y++)
                for(var X = 0;X<6;X++){
                    
                    if !I[X+Y*6] && !Break{
                        
                        Last = X+Y*6;
                    }
                    if Last>=0{
                        
                        Break += (I[X+Y*6] == G[Current]+Idoubles*2+Isingles+1);
                    }
                }
                if Last>=0{
                    
                    I[Last] = G[Current]+Idoubles*2+Isingles+Igrenades+1;
                    Q[Last] = Q[P[Current]];
                    Q[P[Current]] = 0;
                    Reload = 0;
                }
            }
        }
    }
}

///Handle meleeing
// © 2017 - Jon Harvey

Melee *= S90;

//Melee when not meleeing, swapping or firing.
if Kmelee && (Melee<0.1) && (abs(Swap)<0.1){

    if !Grenade && (!Count || (Reload>=Greload[G[Current]] && Rate>=1/Grate[G[Current]])){
        
        Melee = 1;
        with(obj_game_object){
    
            if object_index != obj_player{
            
                var Distance = max(distance_to_point(obj_player.x+dcos(obj_player.GunDirection)*8,obj_player.y-dsin(obj_player.GunDirection)*8)-Radius,0)/4;
                if Distance<1{
                
                    Health -= sqr(1-Distance)/2;
                }
            }
        }        
    }
}

///Handle player movement
// © 2017 - Jon Harvey

//Set controls for movement.
var Turn,Vert,Hor;
Turn = Kturnleft-Kturnright;
Vert = Kdown-Kup;
Hor = Kleft-Kright;

var MouseX,MouseY;
MouseX = window_mouse_get_x();
MouseY = window_mouse_get_y();

if obj_initialize.SETTING_CONTROL_MODE{
    
    Turn = sign(GUIW/2-MouseX)*(1-MouseY/GUIH)*((abs(MouseX-GUIW/2)*2/GUIW)>.5+.7*MouseY/GUIH);
}
//Smooth turn speed for turning motion.
TurnSpeed = TurnSpeed*S90+(1-S90)*Turn;

//Handle player turning gun and player direction.
WalkDirection = (WalkDirection+2*TurnSpeed*FRAME_DELTA);
Turn = angle_difference(point_direction(x,y,mouse_x,mouse_y),GunDirection);
GunDirection += 0.3*Turn*FRAME_DELTA;
//GunDirection = (GunDirection+0.3*Turn*FRAME_DELTA+360)%360;

//Smooth walk using controls defined above.
var MoveSpeed,MoveSpeedX,MoveSpeedY;
Speed = max(sqrt(sqr(Hor)+sqr(Vert)),1)/(1-0.5*sqr(Iweight/Istrength));
if !Grenade{Speed /= Gweight[G[Current]];}

MoveSpeedX = RecoilSpeedX+4*(Vert*dsin(-__view_get( e__VW.Angle, 0 ))-Hor*dcos(__view_get( e__VW.Angle, 0 )))/Speed;
MoveSpeedY = RecoilSpeedY+4*(Vert*dcos(-__view_get( e__VW.Angle, 0 ))-Hor*dsin(__view_get( e__VW.Angle, 0 )))/Speed;

//Set initial speed.
var SumX,SumY;
SumX = (MoveSpeedX*(dcos(GunDirection)*sign(SpeedX)*0.3+0.7));
SumY = (MoveSpeedY*(dsin(GunDirection)*sign(SpeedY)*-0.3+0.7));

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
x = clamp(x,0,2048);
y = clamp(y,0,2048);

//Update walk frame
var Speed = sqrt(sqr(SpeedX)+sqr(SpeedY));
WalkFrame = (WalkFrame+0.05*FRAME_DELTA*Speed)*(Speed>5*DELTA);

///Kill the player if their health is 0
//© 2017 - Reece Warren

if !(CHEAT_GODMODE){
    if (Health <= 0){
        room_goto(rm_main);
    }
}
else {
    Health = 10;
}

