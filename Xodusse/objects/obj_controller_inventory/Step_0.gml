/// @description Control inventory
// © 2017 - Jon Harvey

//Pop up on key press.
if Kinventory{
    
    Ienable = !Ienable;
}

//Inventory item movement
if Ienable{
    
    var S;
    S = 64;
    
    var X,Y;
    X = floor((window_mouse_get_x()-GUIW/2-S*3)/S);
    Y = 1-floor((window_mouse_get_y()-GUIH/2)/S);
    
    //Select item from inventory for moving.
    if mouse_check_button_pressed(mb_left){
        
        //Select backpack.
        if (X == 2) && (Y == 1){
            
            Iid = Idoubles*2+Isingles+Igrenades+Iammo+Ibackpack;
            Iquantity = 0;
            
            //Empty slot.
            Ibackpack = 0;
        }
        else
        if (X>=-6 && X<0) && (Y>0 && Y<=2+Ibackpack){
            
            //Get item details.
            Iid = I[X+Y*6];
            Iquantity = Q[X+Y*6];
            Iposition = X+Y*6;
            
            if Iid<=Idoubles*2{
                
                var S = (Iid&1)*2-1;
                Iquantity = Q[X+Y*6+(Iid&1)];
                I[X+Y*6+S] = 0;
                Q[X+Y*6+S] = 0;
            }
            //Empty slots.
            I[X+Y*6] = 0;
            Q[X+Y*6] = 0;
        }
    }
    else
    //Release item and move it.
    if mouse_check_button_released(mb_left) && Iid{
        
        if (X>=-6 && X<0) && (Y>0 && Y<=2+Ibackpack) && (X>=-6 && X<0){
                
            scr_inventory_swap(X+Y*6,Iposition,Iid,Iquantity);            
        }
        else{
            //Reece - Added extra required arguments to script:
            scr_inventory_drop(Iid,Iquantity,mouse_x,mouse_y,0,0);
        }
        
        Iid = 0;
        Iquantity = 0;
    }
}

