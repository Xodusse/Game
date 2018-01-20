struct Attribute 
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
};

struct Fragment
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
};
  
void main(in Attribute IN, out Fragment OUT)
{
    OUT.Position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION],IN.Position);
    OUT.Color = IN.Color;
    OUT.Texcoord = IN.Texcoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~

uniform float4 Mat;
uniform float4 UV1;
uniform float4 UV2;
uniform float4 UV3;

uniform sampler2D Norm;
uniform sampler2D Prop;

struct Fragment
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
};

struct Render
{
    float4 Colr : COLOR0;
    float4 Norm : COLOR1;
    float4 Prop : COLOR2;
};

void main(in Fragment IN, out Render OUT)
{
    float4 Color = IN.Color * tex2D(gm_BaseTexture,frac(IN.Texcoord)*(UV1.zw-UV1.xy)+UV1.xy);
    OUT.Colr = Color;
    
    float3 Normal = tex2D(Norm,frac(IN.Texcoord)*(UV2.zw-UV2.xy)+UV2.xy).xyz*2.0-1.0;
    Normal = normalize(float3(dot(Normal.xy,Mat.xy),dot(Normal.xy,Mat.zw),Normal.z));
    OUT.Norm = float4(Normal*.5+.5,1.)*Color.a;
    
    OUT.Prop = float4(tex2D(Prop,frac(IN.Texcoord)*(UV3.zw-UV3.xy)+UV3.xy).rgb,1.)*Color.a;
}
