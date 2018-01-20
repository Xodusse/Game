/// @description scr_inventory_drop(item,quantity,x,y,speedx,speedy)
/// @function scr_inventory_drop
/// @param item
/// @param quantity
/// @param x
/// @param y
/// @param speedx
/// @param speedy
// © 2017 - Jon Harvey

var Aitem,Aquan,Axpos,Aypos,Axspd,Ayspd;
Aitem = argument[0];
Aquan = argument[1];
Axpos = argument[2];
Aypos = argument[3];
Axspd = argument[4];
Ayspd = argument[5];
var Success = 0;

if Aitem{
    
    var SpeedA,SpeedX,SpeedY,SpeedZ;
    SpeedA = random(10);
    SpeedX = Axspd;
    SpeedY = Ayspd;
    SpeedZ = 50;
    
    if (Aitem<=Idoubles*2){
    
        Aitem -= !(Aitem&1);
    }
    //Drop item.
    var Item = instance_create(Axpos+SpeedX,Aypos+SpeedY,obj_item);
    Item.Id = Aitem;
    Item.Quantity = Aquan;
    Item.Z = 50;
    Item.SpeedA = SpeedA;Item.SpeedX = SpeedX;Item.SpeedY = SpeedY;Item.SpeedZ = SpeedZ;
}
