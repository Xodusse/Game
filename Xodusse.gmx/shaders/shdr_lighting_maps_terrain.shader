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
uniform float4 UV3;

uniform sampler2D Colr;
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

float2 TileCoord(float2 Coord,float2 Tile)
{
    float4 Map = tex2D(gm_BaseTexture,frac(Coord+Tile/64.)*(UVM.zw-UVM.xy)+UVM.xy);
    float2 C = floor(Coord*64.+Tile);
    float2 F = 0.;
    F = step(0.,cos(C.yx*float2(3.7,4.1))+cos(C*float2(1.9,2.4))); //This is the tile flip and can be commented out.
    return (F+frac(Coord*64.+Tile)*(1.-2.*F)+float2(floor(Map.g*5.),floor(Map.g*15.)%3.))/16.;
}

void main(in Fragment IN, out Render OUT)
{
    float2 MC = IN.Texcoord;
    MC += .003*cos(IN.Texcoord.yx*93.); //This is the tile warp and can be commented out.
    float4 F = frac(MC*64.).xyxy; F.xy = 1.-F.xy;
    float2 U1 = TileCoord(MC,float2(0,0));
    float2 U2 = TileCoord(MC,float2(1,0));
    float2 U3 = TileCoord(MC,float2(0,1));
    float2 U4 = TileCoord(MC,float2(1,1));
    
    float4 P1 = tex2D(Prop,U1*(UV3.zw-UV3.xy)+UV3.xy);
    float4 P2 = tex2D(Prop,U2*(UV3.zw-UV3.xy)+UV3.xy);
    float4 P3 = tex2D(Prop,U3*(UV3.zw-UV3.xy)+UV3.xy);
    float4 P4 = tex2D(Prop,U4*(UV3.zw-UV3.xy)+UV3.xy);
    
    float4 B = exp(20.*sqrt(float4(F.z*F.w,F.x*F.w,F.z*F.y,F.x*F.y))*(3.*float4(P1.g,P2.g,P3.g,P4.g)-(P1.g+P2.g+P3.g+P4.g)));
    B /= dot(B,float4(1,1,1,1));
    
    float4 C1 = tex2D(Colr,U1*(UV1.zw-UV1.xy)+UV1.xy);
    float4 C2 = tex2D(Colr,U2*(UV1.zw-UV1.xy)+UV1.xy);
    float4 C3 = tex2D(Colr,U3*(UV1.zw-UV1.xy)+UV1.xy);
    float4 C4 = tex2D(Colr,U4*(UV1.zw-UV1.xy)+UV1.xy);
    
    float4 Color = IN.Color * (C1*B.x+C2*B.y+C3*B.z+C4*B.w);
    //Color = max(Color,(F.x>31./32.) || (F.y>31./32.))); //This is the tile grid and can be commented out.
    OUT.Colr = Color;
    
    float4 N1 = tex2D(Norm,U1*(UV2.zw-UV2.xy)+UV2.xy);
    float4 N2 = tex2D(Norm,U2*(UV2.zw-UV2.xy)+UV2.xy);
    float4 N3 = tex2D(Norm,U3*(UV2.zw-UV2.xy)+UV2.xy);
    float4 N4 = tex2D(Norm,U4*(UV2.zw-UV2.xy)+UV2.xy);
    
    float3 Normal = normalize((N1*B.x+N2*B.y+N3*B.z+N4*B.w).xyz*2.0-1.0);
    OUT.Norm = float4(Normal*.5+.5,Color.a);
    
    OUT.Prop = P1*B.x+P2*B.y+P3*B.z+P4*B.w;
}
