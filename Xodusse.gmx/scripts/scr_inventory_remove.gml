///scr_inventory_remove(pos)
// © 2017 - Jon Harvey

var Anpos;
Anpos = argument[0];

Ritem = I[Anpos];
Rquan = Q[Anpos];

I[Anpos] = 0;
Q[Anpos] = 0;

if Ritem && (Ritem<=Idoubles*2){
    
    var S = (Ritem&1)*2-1;
    I[Anpos+S] = 0;
    Q[Anpos+S] = 0;
}
