///scr_inventory_swap(new pos,old pos,item,quantity)
// © 2017 - Jon Harvey

var Anpos,Aopos,Aitem,Aquan;
Anpos = argument[0];
Aopos = argument[1];
Aitem = argument[2];
Aquan = argument[3];


if Aitem{
    
    scr_inventory_remove(Anpos);
    var Vitem1,Vquan1;
    Vitem1 = Ritem;
    Vquan1 = Rquan;
    if (Aitem<=Idoubles*2){
    
        var S = (Aitem&1)*2-1;
        scr_inventory_remove(Anpos+S);
        Vitem2 = Ritem;
        Vquan2 = Rquan;
    }
    scr_inventory_place(Anpos,Aitem,Aquan);
    scr_inventory_place(Aopos,Vitem1,Vquan1);
    if (Aitem<=Idoubles*2){
        
        var S = (Aitem&1)*2-1;
        scr_inventory_place(Aopos+S,Vitem2,Vquan2);
    }
}
