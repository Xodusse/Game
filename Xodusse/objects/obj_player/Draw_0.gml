/// @description Draw player sprites
// © 2017 - Jon Harvey

var Turn,Direction,Recoil,Switch,Swing,Sway,Face,Angle,Side;
Turn = angle_difference(point_direction(x,y,mouse_x,mouse_y),GunDirection);
Direction = darctan2(-SpeedY,SpeedX);
Recoil = min(Kick,5);
Switch = 1-sqr(abs(abs(Swap)*2-1));
Swing = dsin(Melee*Melee*360);
Sway = power(cos(WalkFrame),3)*8;
Face = GunDirection-Swing*20;
Angle = angle_difference(Direction,GunDirection);
Side = (abs(abs(Angle)-90)<45);

scr_lighting_draw_sprite(spr_player_legs,spr_player_legs_n,spr_player_legs_she,(WalkFrame%4)+4*Side,x,y,1,1,Direction-Side*sign(Angle)*90,$FFFFFF,1);
scr_lighting_draw_sprite(spr_player_torso,spr_player_torso_n,spr_player_torso_she,Ibackpack,x-dcos(Face)*Recoil,y+dsin(Face)*Recoil,1,1,Face+Sway,$FFFFFF,1);

//Draw right arm - Reece:
scr_lighting_draw_sprite(spr_player_arm,spr_player_arm_n,spr_player_arm_she,0,x-dcos(Face+Sway)*(Recoil-4)-dsin(-Face-Sway)*10,y+dsin(Face+Sway)*(Recoil-4)+dcos(-Face-Sway)*10,
1-Switch*0.1,1,Face+2*Recoil+25+Switch*60-Swing*40,$FFFFFF,1);
//Draw left arm - Reece:
scr_lighting_draw_sprite(spr_player_arm,spr_player_arm_n,spr_player_arm_she,0,x-dcos(Face+Sway)*(Recoil-4)+dsin(-Face-Sway)*10,y+dsin(Face+Sway)*(Recoil-4)-dcos(-Face-Sway)*10,
1-Switch*0.7,-1,Face-2*Recoil-25+Switch*30-Swing*20,$FFFFFF,1);

//Draw gun - Reece:
if Count{

    scr_lighting_draw_sprite(spr_player_holdables,spr_player_holdables_n,spr_player_holdables_she,G[(Current+Count+sign(Swap)*(abs(Swap)>0.5))%Count],x-dcos(Face+Switch*10-Swing*20)*(Recoil*2+Switch*8-16)+dsin(-Face)*Switch*10,
    y+dsin(Face+Switch*10-Swing*20)*(Recoil*2+Switch*8-16)-dcos(-Face)*Switch*10,0.4*sqr(abs(abs(Swap)*2-1)),0.4,Face-4+Switch*40-Swing*30+Sway/3,$FFFFFF,1);
    
    //draw_sprite_ext(spr_player_holdables,G[(Current+Count+sign(Swap)*(abs(Swap)>0.5))%Count],x-dcos(Face+Switch*10-Swing*20)*(Recoil*2+Switch*8-16)+dsin(-Face)*Switch*10,
    //y+dsin(Face+Switch*10-Swing*20)*(Recoil*2+Switch*8-16)-dcos(-Face)*Switch*10,0.4*sqr(abs(abs(Swap)*2-1)),0.4,Face-4+Switch*40-Swing*30,$FFFFFF,1);
}

scr_lighting_draw_sprite(spr_player_head,spr_player_head_n,spr_player_head_she,0,x-dcos(Face)*Recoil*0.8,y+dsin(Face)*Recoil*0.8,1,1,Face+0.6*Turn+Switch*20-Swing*10,$FFFFFF,1);

