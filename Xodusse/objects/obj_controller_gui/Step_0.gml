/// @description View and screenshake controller
// © 2017 - Jon Harvey

Shake = Shake*S90;
ShakeX = ShakeX*(1-S90)+S90*50*Shake*(random(2)-1);
ShakeY = ShakeY*(1-S90)+S90*50*Shake*(random(2)-1);
ShakeAngle = ShakeAngle*(1-S90)+S90*Shake*(random(40)-20);

if instance_exists(obj_player){
    
    //Smoothly translate and rotate view with the player.
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 )*S90+(1-S90)*(obj_player.x-__view_get( e__VW.WView, 0 )/2+ShakeX+100*dsin(__view_get( e__VW.Angle, 0 ))) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 )*S90+(1-S90)*(obj_player.y-__view_get( e__VW.HView, 0 )/2+ShakeY-100*dcos(__view_get( e__VW.Angle, 0 ))) );
    __view_set( e__VW.Angle, 0, __view_get( e__VW.Angle, 0 )*S90+(1-S90)*(90-obj_player.WalkDirection+ShakeAngle) );
}

