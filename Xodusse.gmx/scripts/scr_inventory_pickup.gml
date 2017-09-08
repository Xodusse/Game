///scr_inventory_pickup(item,quantity,weight)
// © 2017 - Jon Harvey

var Aitem,Aquan,Aweig;
Aitem = argument[0];
Aquan = argument[1];
Aweig = argument[2];
var Success = 0;

if (Iweight+Aweig<=Istrength){
    
    for(var Y = 1+Ibackpack;Y>=0;Y--)
    for(var X = 0;X<6;X++){
        
    if Success break;
    //Check if item slot is free.
    if (I[X+Y*6] == 0){
        
        if (Aitem<=Idoubles*2)
        {
            if  (X<4) && (I[X+1+Y*6] == 0)
            {
                //Add double slot gun.
                Success = 1;
                I[X+Y*6] = Aitem;
                Q[X+Y*6] = 0;
                I[X+1+Y*6] = Aitem+1;
                Q[X+1+Y*6] = Aquan;
                
                var Text;
                Text = instance_create(8,8,obj_message);
                Text.Message = "Picked up "+Gname[floor(Id/2)];
                instance_destroy();
            }
        }
        else{
                
                //Add gun, ammo or backpack.
                Success = 1;
                I[X+Y*6] = Aitem;
                Q[X+Y*6] = Aquan;
                
                var Text;
                Text = instance_create(8,8,obj_message);
                if Aitem>Idoubles*2+Isingles{
                
                    Text.Message = "+"+string(Quantity)+" ammo";
                }
                else{
                
                    Text.Message = "Picked up "+Gname[Id-Idoubles-1];
                }
                instance_destroy();
            }
        }
    }
}
return Success;
