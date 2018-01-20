/// @description Add GUI and inventory object
// © 2017 - Jon Harvey

if !instance_exists(obj_controller_gui){
    
    instance_create(0,0,obj_controller_gui);
}
if !instance_exists(obj_controller_inventory){
    
    instance_create(0,0,obj_controller_inventory);
}

///Set gun variables
// © 2017 - Jon Harvey

//0 is gun, 1 is grenade.
Grenade = 0;
//Number of guns.
Count = 1;
//Gun in hand (between 0 and Count).
Current = 0;
//This is the gun in second hand.
Secondary = 0;
//Inventory position of the next and last magazine.
MagazineNext = -1;
//Number of extra magazines for the current gun.
Magazines = 0;

//Gun kick animation.
Kick = 0;
//Gun swap animation.
Swap = 0;

//Gun shooting timeline.
Rate = 0;
//Gun reload timeline.
Reload = 10;

//Position[slot], Gun positions in inventory.
P[0] = 0;
//Gun[slot], Guns (ids) in inventory.
G[0] = 0;

///Set player variables
// © 2017 - Jon Harvey

GunDirection = 90;
WalkDirection = 90;

TurnSpeed = 0;
SpeedX = 0;
SpeedY = 0;
WalkFrame = 0;
Radius = 16;

Melee = 0;
Health = 10;

