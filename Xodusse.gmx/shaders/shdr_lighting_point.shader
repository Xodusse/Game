struct Attribute 
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
};

struct Fragment
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Coord    : TEXCOORD0;
    float2 MapCoord : TEXCOORD1;
};

uniform float2 Size;

void main(in Attribute IN, out Fragment OUT)
{
    OUT.Position = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION],IN.Position);
    OUT.Color = IN.Color;
    
    OUT.MapCoord = mul(gm_Matrices[MATRIX_VIEW],IN.Position).xy/Size+0.5;
    OUT.Coord = IN.Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
uniform float3 Pos;
uniform sampler2D Colr;
uniform sampler2D Norm;
uniform sampler2D Prop;

struct Fragment
{
    float4 Position : POSITION;
    float4 Color    : COLOR0;
    float2 Coord    : TEXCOORD0;
    float2 MapCoord : TEXCOORD1;
};

struct Render
{
    float4 Prop : COLOR0;
    float4 Ligt : COLOR1;
};

void main(in Fragment IN, out Render OUT)
{
    float4 Color = tex2D(Colr,IN.MapCoord);
    float3 Normal = normalize(tex2D(Norm,IN.MapCoord).xyz*2.-1.);
    float4 Proper = tex2D(Prop,IN.MapCoord);
    float3 Ray = normalize(Pos-float3(IN.Coord,Proper.g*0.));
    float Spec = Proper.r*smoothstep(.0,.9,reflect(-Ray,Normal).z);
    
    OUT.Prop = 0;//float4(0,0,IN.Color.a*Spec,0);
    OUT.Ligt = float4(Color.rgb,IN.Color.a*(pow(dot(Normal,Ray)*.5+.5,3.)+Spec));
}
