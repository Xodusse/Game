/// @description Add magazines to the ground.
// © 2017 - Jon Harvey

var Count,Type,Id;
Count = 1+irandom(4);
Type = irandom(Iammo-1);
Id = Idoubles*2+Isingles+Igrenades+1+Type;


for(var N = 0;N<Count;N++)
{
    var A,B,Item;
    //Random polar coordinates.
    A = irandom(360);
    B = irandom(40);
    
    //Create magazine.
    Item = instance_create(x+B*cos(A),y+B*dsin(A),obj_item);
    Item.Id = Id;
    Item.Quantity = Gcap[Type];
}

