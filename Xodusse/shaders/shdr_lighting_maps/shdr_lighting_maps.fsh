uniform float4 Mat;
uniform float4 UV1;
uniform float4 UV2;
uniform float4 UV3;

Texture2D texture1 : register(t[1]);
SamplerState Norm  : register(s[1]);
Texture2D texture2 : register(t[2]);
SamplerState Prop  : register(s[2]);

//https://msdn.microsoft.com/en-us/library/windows/desktop/bb509709%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
//https://msdn.microsoft.com/en-us/library/windows/desktop/dd607359%28v=vs.85%29.aspx

//Texture2D texture1 : register(t1);
//SamplerState Norm  : register(s1);
//Texture2D texture2 : register(t2);
//SamplerState Prop  : register(s2);

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
    Render OUTPUT;
    float4 Color = INPUT.vColor * gm_BaseTextureObject.Sample(gm_BaseTexture,frac(INPUT.vTexcoord)*(UV1.zw-UV1.xy)+UV1.xy);
    OUTPUT.Colr = Color;
    
    float3 Normal = gm_BaseTextureObject.Sample(Norm,frac(INPUT.vTexcoord)*(UV2.zw-UV2.xy)+UV2.xy).xyz*2.0-1.0;
    Normal = normalize(float3(dot(Normal.xy,Mat.xy),dot(Normal.xy,Mat.zw),Normal.z));
    OUTPUT.Norm = float4(Normal*.5+.5,1.)*Color.a;
    
    OUTPUT.Prop = float4(gm_BaseTextureObject.Sample(Prop,frac(INPUT.vTexcoord)*(UV3.zw-UV3.xy)+UV3.xy).rgb,1.)*Color.a;    
    return OUTPUT;
}
