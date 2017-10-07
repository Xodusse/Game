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
uniform float4 UVM;
uniform float4 UV1;
uniform float4 UV2;

uniform sampler2D Colr;
uniform sampler2D Norm;

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
};

void main(in Fragment IN, out Render OUT)
{
    float4 Map = tex2D(gm_BaseTexture,frac(IN.Texcoord)*(UVM.zw-UVM.xy)+UVM.xy);
    float2 UV = ((frac(IN.Texcoord*64.)+float2(floor(Map.g*12.),0))/16.);
    float4 Color = IN.Color * tex2D(Colr,UV*(UV1.zw-UV1.xy)+UV1.xy);
    OUT.Colr = Color;
    
    float3 Normal = normalize(tex2D(Norm,UV*(UV2.zw-UV2.xy)+UV2.xy).xyz*2.0-1.0);
    OUT.Norm = float4(Normal*.5+.5,Color.a);
}
