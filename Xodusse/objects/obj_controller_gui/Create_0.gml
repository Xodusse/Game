/// @description Screenshake variables
// © 2017 - Jon Harvey

globalvar Shake;
Shake = 0;
ShakeX = 0;
ShakeY = 0;
ShakeAngle = 0;

camera = camera_create();

var view_matrix = matrix_build_lookat(x,y,-100,x,y,0,0,1,0);
var projection_matrix = matrix_build_projection_ortho(960,540,1.0,32000.0);

camera_set_view_mat(camera,view_matrix);
camera_set_proj_mat(camera,projection_matrix);

view_camera[0] = camera;
