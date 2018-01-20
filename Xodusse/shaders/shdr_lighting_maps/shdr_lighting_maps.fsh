uniform float4 Mat;
uniform float4 UV1;
uniform float4 UV2;
uniform float4 UV3;

Texture2D texture1 : register(t1);
SamplerState Norm  : register(s1);

Texture2D texture2 : register(t2);
SamplerState Prop  : register(s2);


struct Fragment
{
    float4 vPosition : SV_POSITION;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};

struct Render
{
    float4 Col : SV_TARGET0;
    float4 Nor : SV_TARGET1;
    float4 Pro : SV_TARGET2;
};

Render main(Fragment INPUT)
{	
	Render OUTPUT;
	float4 Color = INPUT.vColor * gm_BaseTextureObject.Sample(gm_BaseTexture,frac(INPUT.vTexcoord)*(UV1.zw-UV1.xy)+UV1.xy);
    OUTPUT.Col = Color;
    
    float3 Normal = texture1.Sample(Norm,frac(INPUT.vTexcoord)*(UV2.zw-UV2.xy)+UV2.xy).xyz*2.0-1.0;
    Normal = normalize(float3(dot(Normal.xy,Mat.xy),dot(Normal.xy,Mat.zw),Normal.z));
    OUTPUT.Nor = float4(Normal*.5+.5,1.)*Color.a;
    
    OUTPUT.Pro = float4(texture2.Sample(Prop,frac(INPUT.vTexcoord)*(UV3.zw-UV3.xy)+UV3.xy).rgb,1.)*Color.a;	
	return OUTPUT;
}