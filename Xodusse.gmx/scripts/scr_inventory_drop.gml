///scr_inventory_drop(item,quantity)
// © 2017 - Jon Harvey

var Aitem,Aquan;
Aitem = argument[0];
Aquan = argument[1];
var Success = 0;

if Aitem{
    
    var SpeedA,SpeedX,SpeedY,SpeedZ;
    SpeedA = random(10);
    SpeedX = (mouse_x-obj_player.x)/200;
    SpeedY = (mouse_y-obj_player.y)/200;
    SpeedZ = 50;
    
    if (Aitem<=Idoubles*2){
    
        Aitem -= !(Aitem&1);
    }
    //Drop item.
    var Item = instance_create(obj_player.x+SpeedX,obj_player.y+SpeedY,obj_item);
    Item.Id = Aitem;
    Item.Quantity = Aquan;
    Item.Z = 50;
    Item.SpeedA = SpeedA;Item.SpeedX = SpeedX;Item.SpeedY = SpeedY;Item.SpeedZ = SpeedZ;
}
