///scr_lighting_init()
// © 2017 - Jon Harvey

var Vscal;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;

globalvar LScolr,LSnorm,LSprop,LSligt;
LScolr = surface_create(GUIW*Vscal,GUIH*Vscal);
LSnorm = surface_create(GUIW*Vscal,GUIH*Vscal);
LSprop = surface_create(GUIW*Vscal,GUIH*Vscal);
LSligt = surface_create(GUIW*Vscal,GUIH*Vscal);

globalvar LUnorm,LUprop,LUmatx,LUsuv1,LUsuv2,LUsuv3;
LUnorm = shader_get_sampler_index(shdr_lighting_maps,"Norm");
LUprop = shader_get_sampler_index(shdr_lighting_maps,"Prop");
LUmatx = shader_get_uniform(shdr_lighting_maps,"Mat");
LUsuv1 = shader_get_uniform(shdr_lighting_maps,"UV1");
LUsuv2 = shader_get_uniform(shdr_lighting_maps,"UV2");
LUsuv3 = shader_get_uniform(shdr_lighting_maps,"UV3");

globalvar TUcolr,TUnorm,TUprop,TUbuvm,TUbuv1,TUbuv2,TUbuv3;
TUcolr = shader_get_sampler_index(shdr_lighting_maps_terrain,"Colr");
TUnorm = shader_get_sampler_index(shdr_lighting_maps_terrain,"Norm");
TUprop = shader_get_sampler_index(shdr_lighting_maps_terrain,"Prop");
TUbuvm = shader_get_uniform(shdr_lighting_maps_terrain,"UVM");
TUbuv1 = shader_get_uniform(shdr_lighting_maps_terrain,"UV1");
TUbuv2 = shader_get_uniform(shdr_lighting_maps_terrain,"UV2");
TUbuv3 = shader_get_uniform(shdr_lighting_maps_terrain,"UV3");

globalvar PUcolr,PUnorm,PUprop,PUlpos,PUsize;
PUcolr = shader_get_sampler_index(shdr_lighting_point,"Colr");
PUnorm = shader_get_sampler_index(shdr_lighting_point,"Norm");
PUprop = shader_get_sampler_index(shdr_lighting_point,"Prop");
PUlpos = shader_get_uniform(shdr_lighting_point,"Pos");
PUsize = shader_get_uniform(shdr_lighting_point,"Size");

globalvar MUcolr,MUnorm,MUprop,MUlpos,MUsize;
MUcolr = shader_get_sampler_index(shdr_lighting_point_mask,"Colr");
MUnorm = shader_get_sampler_index(shdr_lighting_point_mask,"Norm");
MUprop = shader_get_sampler_index(shdr_lighting_point_mask,"Prop");
MUlpos = shader_get_uniform(shdr_lighting_point_mask,"Pos");
MUsize = shader_get_uniform(shdr_lighting_point_mask,"Size");

globalvar DUcolr,DUnorm,DUprop,DUldir,DUsize;
DUcolr = shader_get_sampler_index(shdr_lighting_direct,"Colr");
DUnorm = shader_get_sampler_index(shdr_lighting_direct,"Norm");
DUprop = shader_get_sampler_index(shdr_lighting_direct,"Prop");
DUldir = shader_get_uniform(shdr_lighting_direct,"Dir");
DUsize = shader_get_uniform(shdr_lighting_direct,"Size");

globalvar EUcolr,EUprop,EUsize;
EUcolr = shader_get_sampler_index(shdr_lighting_post,"Colr");
EUprop = shader_get_sampler_index(shdr_lighting_post,"Prop");
EUsize = shader_get_uniform(shdr_lighting_post,"Size");
