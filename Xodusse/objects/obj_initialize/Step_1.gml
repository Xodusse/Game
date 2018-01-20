/// @description Delta time variables.
// © 2017 - Jon Harvey, Reece Warren

DELTA_OVERRIDE = (delta_time / 1000000);
DELTA = DELTA_OVERRIDE*!PAUSED;

//Some objects still need to function when the game is paused:
FRAME_DELTA_OVERRIDE = DESIRED_FPS * DELTA_OVERRIDE;
FRAME_DELTA = DESIRED_FPS * DELTA;

//Smoothing:
S90 = power(0.90,FRAME_DELTA);
S98 = power(0.98,FRAME_DELTA);

//Image_Speed calculation variables - Reece:

//1 Second frame update:
F1  = (1/DESIRED_FPS) * FRAME_DELTA;
//Half Second frame update:
F1H = (2/DESIRED_FPS) * FRAME_DELTA;
//Quarter Second frame update:
F1Q = (4/DESIRED_FPS) * FRAME_DELTA;
//10th Second frame update:
F10 = (10/DESIRED_FPS) * FRAME_DELTA;
//30th Second frame update:
F30 = (30/DESIRED_FPS) * FRAME_DELTA;
//60th Second frame update:
F60 = (60/DESIRED_FPS) * FRAME_DELTA;

//Update View Angle:
VIEW_ANGLE = __view_get( e__VW.Angle, 0 ) % 360;

