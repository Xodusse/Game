///scr_lighting_init()
// © 2017 - Jon Harvey

var Vscal;
Vscal = obj_initialize.SETTING_SURFACE_SCALE;

globalvar LScolr,LSnorm,LSligt;
LScolr = surface_create(GUIW*Vscal,GUIH*Vscal);
LSnorm = surface_create(GUIW*Vscal,GUIH*Vscal);
LSligt = surface_create(GUIW*Vscal,GUIH*Vscal);

globalvar LUnorm,LUmatx,LUsuv1,LUsuv2;
LUnorm = shader_get_sampler_index(shdr_lighting_maps,"Norm");
LUmatx = shader_get_uniform(shdr_lighting_maps,"Mat");
LUsuv1 = shader_get_uniform(shdr_lighting_maps,"UV1");
LUsuv2 = shader_get_uniform(shdr_lighting_maps,"UV2");

globalvar PUcolr,PUnorm,PUlpos,PUsize,DUcolr,DUnorm,DUldir,DUsize;
PUcolr = shader_get_sampler_index(shdr_lighting_point,"Colr");
PUnorm = shader_get_sampler_index(shdr_lighting_point,"Norm");
PUlpos = shader_get_uniform(shdr_lighting_point,"Pos");
PUsize = shader_get_uniform(shdr_lighting_point,"Size");
DUcolr = shader_get_sampler_index(shdr_lighting_direct,"Colr");
DUnorm = shader_get_sampler_index(shdr_lighting_direct,"Norm");
DUldir = shader_get_uniform(shdr_lighting_direct,"Dir");
DUsize = shader_get_uniform(shdr_lighting_direct,"Size");
