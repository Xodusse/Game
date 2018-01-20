///scr_vertex_point(buffer,x,y,color,alpha,uv x, uv y)

var Abuff,Axpos,Aypos,Ablnd,Alpha,Asuvx,Asuvy;
Abuff = argument[0];
Axpos = argument[1];
Aypos = argument[2];
Ablnd = argument[3];
Alpha = argument[4];
Asuvx = argument[5];
Asuvy = argument[6];

vertex_position(Abuff,Axpos,Aypos);
vertex_colour(Abuff,Ablnd,Alpha);
vertex_texcoord(Abuff,Asuvx,Asuvy);
