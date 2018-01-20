///scr_vertex_point(buffer,x,y,color,alpha,color uv,normal uv,property uv)

var Abuff,Axpos,Aypos,Ablnd,Alpha,Asuv1,Asuv2,Asuv3;
Abuff = argument[0];
Axpos = argument[1];
Aypos = argument[2];
Ablnd = argument[3];
Alpha = argument[4];
Asuv1 = argument[5];
Asuv2 = argument[6];
Asuv3 = argument[7];

vertex_position(Abuff,Axpos,Aypos);
vertex_colour(Abuff,Ablnd,Alpha);
//vertex_texcoord(Abuff,Asuv1[0],Asuv1[1],Asuv1[2],Asuv1[3]);
vertex_texcoord(Abuff,Asuv1[0],Asuv1[1]);
vertex_texcoord(Abuff,Asuv1[0],Asuv1[1]);
