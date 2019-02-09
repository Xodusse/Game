uniform float4 UV1;
uniform float4 UV2;
uniform float4 UV3;

Texture2D    T1    : register(t1);
SamplerState Norm  : register(s1);
Texture2D    T2    : register(t2);
SamplerState Prop  : register(s2);

struct Fragment
{
    float4 vPosition : SV_POSITION;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};

struct Render
{
    float4 Colr : SV_TARGET0;
    float4 Norm : SV_TARGET1;
    float4 Prop : SV_TARGET2;
};

Render main(Fragment INPUT)
{   
	float2 UV = frac(INPUT.vTexcoord);
	
    Render OUTPUT;
    float4 Color = INPUT.vColor * gm_BaseTextureObject.Sample(gm_BaseTexture,UV*(UV1.zw-UV1.xy)+UV1.xy);
	float3 Normal = normalize(T1.Sample(Norm,UV*(UV2.zw-UV2.xy)+UV2.xy).xyz-.5);
    OUTPUT.Colr = Color;
    OUTPUT.Norm = float4(Normal*.5+.5,Color.a);
	OUTPUT.Prop = T2.Sample(Prop,UV*(UV3.zw-UV3.xy)+UV3.xy);
    return OUTPUT;
}