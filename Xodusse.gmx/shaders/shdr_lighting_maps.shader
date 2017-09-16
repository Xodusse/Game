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
    float2 Coord    : TEXCOORD1;
};
  
void main(in Attribute IN, out Fragment OUT)
{
    OUT.Position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION],IN.Position);
    OUT.Color = IN.Color;
    OUT.Texcoord = IN.Texcoord;
    OUT.Coord = IN.Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
uniform float Rot;
uniform float4 UV1;
uniform float4 UV2;

uniform sampler2D Norm;

struct Fragment
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Texcoord : TEXCOORD0;
    float2 Coord    : TEXCOORD1;
};

struct Render
{
    float4 Colr : COLOR0;
    float4 Norm : COLOR1;
};

void main(in Fragment IN, out Render OUT)
{
    OUT.Colr = IN.Color * tex2D(gm_BaseTexture,IN.Texcoord);
    
    float3 Normal = tex2D(Norm,(IN.Texcoord-UV1.xy)/(UV1.zw-UV1.xy)*(UV2.zw-UV2.xy)+UV2.xy).xyz*2.0-1.0;
    Normal = float3(dot(Normal.xy,float2(cos(-Rot),-sin(-Rot))),dot(Normal.xy,float2(sin(-Rot),cos(-Rot))),Normal.z);
    OUT.Norm = float4(Normal*.5+.5,1);
}
