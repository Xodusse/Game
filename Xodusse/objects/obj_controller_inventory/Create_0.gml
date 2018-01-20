/// @description Inventory variables
// © 2017 - Jon Harvey

globalvar Idoubles,Isingles,Igrenades,Iammo;
Idoubles = 2;//Number of two-handed weapons.
Isingles = 2;//Number of one-handed weapons.
Igrenades = 1;
Iammo = Idoubles+Isingles;//Number of ammo (magazines or rounds).

globalvar Ienable,Ibackpack,Iid,Iquantity,Iposition,Iweight,Istrength,W,I,Q;
//Toggle inventory (0 is off, 1 is on).
Ienable = 0;
//Control backpack (0 is off, 1 is small, 2 is large).
Ibackpack = 0;
//Inventory id of item being moved (0 for no item).
Iid = 0;
Iquantity = 0;
Iposition = 0;

//Weight and strength (max weight) in kg used in inventory.
Iweight = 0;
Istrength = 50;

//Weight[id], weight of items in kg.
W[Idoubles*2+Isingles+Igrenades+Iammo+2] = 0;
//Guns
W[0] = 1.2;
W[1] = 1.5;
W[2] = 1.7;
W[3] = 1.5;
W[4] = 1.5;
W[5] = 1.2;
//Grenade
W[6] = 1.2;
//Ammo
W[7] = 1.2;
W[8] = 1.2;
W[9] = 1.2;
W[10] = 1.2;

//Item[pos] and quantity[pos] arrays (ordered from left to right, bottom to top).
I[23] = 0;
Q[23] = 0;

//Add default items (ids correspond to spr_items image index+1).
I[0] = 1;
Q[0] = 0;
I[1] = 2;
Q[1] = Gcap[0];
I[2] = 3;
Q[2] = 0;
I[3] = 4;
Q[3] = Gcap[1];
I[4] = 5;
Q[4] = Gcap[2];
I[5] = 6;
Q[5] = Gcap[3];

