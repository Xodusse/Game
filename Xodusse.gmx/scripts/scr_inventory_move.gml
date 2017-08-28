///scr_inventory_move(new pos,old pos)

var Anpos,Aopos;
Anpos = argument[0];
Aopos = argument[1];

var Vitem,Vquan;
Vitem = I[Aopos];
Vquan = Q[Aopos];

I[Aopos] = 0;
Q[Aopos] = 0;

if Vitem && (Vitem<=Idoubles*2){
    
    var S = (Vitem&1)*2-1;
    Vquan = Q[Aopos+(Vitem&1)];
    I[Aopos+S] = 0;
    Q[Aopos+S] = 0;
}

scr_inventory_place(Anpos,Vitem,Vquan);
