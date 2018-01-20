/// @description Gun variables
// © 2017 - Jon Harvey

globalvar Gauto,Grate,Gcap,Greload,Garc,Grecoil,Gbullets,Gweight,Gtype,Gname;
//Automatic[gun], 0 = semi-automatic, 1 = fully-automatic
Gauto[0] = 0;
Gauto[1] = 1;
Gauto[2] = 1;
Gauto[3] = 0;

//Rate[gun], Rounds per second.
Grate[0] = 3;
Grate[1] = 25;
Grate[2] = 10;
Grate[3] = 5;

//Capacity[gun], Gun magazine capacity.
Gcap[0] = 6;
Gcap[1] = 50;
Gcap[2] = 20;
Gcap[3] = 8;

//Reload[gun], Reload time in seconds.
Greload[0] = 2;
Greload[1] = 3;
Greload[2] = 2;
Greload[3] = 1;

//Arc[gun], Gun arc in degrees.
Garc[0] = 10;
Garc[1] = 5;
Garc[2] = 15;
Garc[3] = 8;

//Recoil[gun], Gun recoil per shot.
Grecoil[0] = 10;
Grecoil[1] = 4;
Grecoil[2] = 4;
Grecoil[3] = 1;

//Bullets[gun], Number of bullets/projectiles per shot.
Gbullets[0] = 1;
Gbullets[1] = 1;
Gbullets[2] = 1;
Gbullets[3] = 1;

//Weight[gun], Speed multiplier (reciprocal of weight).
Gweight[0] = 0.6;
Gweight[1] = 0.7;
Gweight[2] = 1;
Gweight[3] = 1;

//Type[gun], Type of projectile.
Gtype[0] = 0;
Gtype[1] = 1
Gtype[2] = 2;
Gtype[3] = 3;

//Name[gun], Name of gun.
Gname[0] = "Grenade Launcher";
Gname[1] = "LMG";
Gname[2] = "SMG";
Gname[3] = "Pistol";

///Projectile variables
// © 2017 - Jon Harvey

globalvar Pexplode,Prange,Pspeed,Ppower,Pdamage;

//Explode[projectile], Explosion radius (0 for no explosion).
Pexplode[0] = .5;
Pexplode[1] = 0;
Pexplode[2] = 0;
Pexplode[3] = 0;

//Range[projectile], Projectile range in pixel units (about 1.5 cm).
Prange[0] = 1000;
Prange[1] = 1200;
Prange[2] = 800;
Prange[3] = 1500;

//Speed[projectile], Speed in pixel units per frame (1/60th of a second).
Pspeed[0] = 10;
Pspeed[1] = 12;
Pspeed[2] = 14;
Pspeed[3] = 16;

//Power[projectile], Power where lower numbers means a higher pierce value.
Ppower[0]  = 1;
Ppower[1]  = 1;
Ppower[2]  = 0.8;
Ppower[3]  = 0.5;

//Damage[projectile], Damage per shot (1 is an instant kill).
Pdamage[0] = 1;
Pdamage[1] = 0.2;
Pdamage[2] = 0.5;
Pdamage[3] = 1;

