///scr_inventory_place(pos,item,quantity)
// © 2017 - Jon Harvey

var Anpos,Aitem,Aquan;
Anpos = argument[0];
Aitem = argument[1];
Aquan = argument[2];
var Success = 0;

if Aitem{
    
    if (Aitem<=Idoubles*2){
        
        Anpos += (Aitem&1);
        Aitem += (Aitem&1);
        if !I[Anpos] && !I[Anpos-1]{
            
            I[Anpos] = Aitem;
            Q[Anpos] = Aquan*!(Aitem&1);
            
            I[Anpos-1] = Aitem-1;
            Q[Anpos-1] = Aquan*(Aitem&1);
            Success = 1;
        }
    }
    else
    if (Aitem<=Idoubles*2+Isingles+Igrenades+Iammo){
        
        if !I[Anpos]{
            
            I[Anpos] = Aitem;
            Q[Anpos] = Aquan;
            Success = 1;
        }
    }
    
    if !Success{
        
        scr_inventory_drop(Aitem,Aquan)
    }
}
