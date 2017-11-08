///scr_vertex_sprite(buffer,sprite,subimg,x,y,scale,angle,color,alpha)

var Abuff,Acolr,Asimg,Axpos,Aypos,Ablnd,Alpha,Asuvx,Asuvy;
Abuff = argument[0];
Acolr = argument[1];
Asimg = argument[2];
Axpos = argument[3];
Aypos = argument[4];
Ascal = argument[5];
Ablnd = argument[6];
Alpha = argument[7];

vertex_position(Abuff,Axpos,Aypos);
vertex_colour(Abuff,Ablnd,Alpha);
vertex_texcoord(Abuff,Asuvx,Asuvy);
