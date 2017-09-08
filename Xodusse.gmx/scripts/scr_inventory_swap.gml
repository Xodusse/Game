///scr_inventory_swap(new pos,old pos,item,quantity)
// © 2017 - Jon Harvey

var Anpos,Aopos,Aitem,Aquan;
Anpos = argument[0];
Aopos = argument[1];
Aitem = argument[2];
Aquan = argument[3];


if Aitem{
    
    //Remove old item.
    scr_inventory_remove(Anpos);
    var Vitem1,Vquan1;
    Vitem1 = Ritem;
    Vquan1 = Rquan;
    //Remove second old item if necessary.
    if (Aitem<=Idoubles*2){
    
        var S = (Aitem&1)*2-1;
        scr_inventory_remove(Anpos+S);
        Vitem2 = Ritem;
        Vquan2 = Rquan;
    }
    else
    //Combine magazines of the same time.
    if (Aitem>Idoubles*2+Isingles+Igrenades) && (Aitem<=Idoubles*2+Isingles+Igrenades+Iammo) && (Aitem == Ritem){
        
        var Gun,Difference;
        Gun = Aitem-(Idoubles*2+Isingles+Igrenades+1);
        Difference = Gcap[Gun]-Aquan;
        
        Aquan  += Difference;
        Vquan1 -= Difference;
    }
    //Place the new item.
    scr_inventory_place(Anpos,Aitem,Aquan);
    
    //Place the old item(s).
    if Vquan1{
        
        scr_inventory_place(Aopos,Vitem1,Vquan1);
    }
    if (Aitem<=Idoubles*2){
        
        var S = (Aitem&1)*2-1;
        scr_inventory_place(Aopos+S,Vitem2,Vquan2);
    }
}
