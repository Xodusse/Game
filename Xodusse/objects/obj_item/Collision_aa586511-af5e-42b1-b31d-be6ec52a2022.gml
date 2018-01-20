/// @description Give item to player
// © 2017 - Jon Harvey

if !Hit{
    
    var Weight;
    Weight = W[Id-1];
    if (Id>Idoubles*2){
        
        Weight += W[Id];
    }
    
    if (Z==0) && (alarm[0] == -1){
        
        //Add backpack.
        if Id>Idoubles*2+Isingles+Igrenades+Iammo{
                    
            if !Ibackpack{
                
                Ibackpack = Id-(Idoubles*2+Isingles+Igrenades+Iammo);
                for(var Y = Ibackpack-1;Y>=0;Y--)
                for(var X = 0;X<6;X++){
                    
                    I[X+Y*6+12] = Bac[X+Y*6];
                    Q[X+Y*6+12] = Qnt[X+Y*6];
                }
                var Text;
                Text = instance_create(8,8,obj_message);
                Text.Message = "Picked up a backpack";
                
                //Turn off the light in the room:
                with(obj_controller_normal){
                    event_user(0);
                }
                
                instance_destroy();
            }
        }
        
        else{
            
            //Add item.
            scr_inventory_pickup(Id,Quantity,Weight);
        }
    }
}

