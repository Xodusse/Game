///scr_lighting_init()
// © 2017 - Jon Harvey

globalvar LScolr,LSnorm,LSligt;
LScolr = surface_create(GUIW,GUIH);
LSnorm = surface_create(GUIW,GUIH);
LSligt = surface_create(GUIW,GUIH);

globalvar LUnorm,LUrotn,LUsuv1,LUsuv2;
LUnorm = shader_get_sampler_index(shdr_lighting_maps,"Norm");
LUrotn = shader_get_uniform(shdr_lighting_maps,"Rot");
LUsuv1 = shader_get_uniform(shdr_lighting_maps,"UV1")
LUsuv2 = shader_get_uniform(shdr_lighting_maps,"UV2")

globalvar SUcolr,SUnorm;
SUcolr = shader_get_sampler_index(shdr_lighting_point,"Colr");
SUnorm = shader_get_sampler_index(shdr_lighting_point,"Norm");
