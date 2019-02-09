///@desc Create surfaces

Dif = surface_create(960,540);
Nor = surface_create(960,540);
She = surface_create(960,540);

uNor = shader_get_sampler_index(shd_map,"Norm");
uShe = shader_get_sampler_index(shd_map,"Prop");

uUV1 = shader_get_uniform(shd_map,"UV1");
uUV2 = shader_get_uniform(shd_map,"UV2");
uUV3 = shader_get_uniform(shd_map,"UV3");