uniform float4 UVM;
uniform float4 UV1;
uniform float4 UV2;
uniform float4 UV3;

Texture2D texture1 : register(t1);
SamplerState Colr  : register(s1);

Texture2D texture2 : register(t2);
SamplerState Norm  : register(s2);

Texture2D texture3 : register(t3);
SamplerState Prop  : register(s3);


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

float2 TileCoord(float2 Coord,float2 Tile)
{
    float4 Map = gm_BaseTextureObject.Sample(gm_BaseTexture,frac(Coord+Tile/64.)*(UVM.zw-UVM.xy)+UVM.xy);
    float2 C = floor(Coord*64.+Tile);
    float2 F = 0.;
    F = step(0.,cos(C.yx*float2(3.7,4.1))+cos(C*float2(1.9,2.4))); //This is the tile flip and can be commented out.
    return (F+frac(Coord*64.+Tile)*(1.-2.*F)+float2(floor(Map.g*5.),floor(Map.g*15.)%3.))/16.;
}

Render main(Fragment INPUT)
{
	Render OUTPUT;
    float2 MC = INPUT.vTexcoord;
    //MC += .003*cos(IN.Texcoord.yx*93.); //This is the tile warp and can be commented out.
    float4 F = frac(MC*64.).xyxy; F.xy = 1.-F.xy;
    float2 U1 = TileCoord(MC,float2(0,0));
    float2 U2 = TileCoord(MC,float2(1,0));
    float2 U3 = TileCoord(MC,float2(0,1));
    float2 U4 = TileCoord(MC,float2(1,1));
    
    float4 P1 = texture3.Sample(Prop,U1*(UV3.zw-UV3.xy)+UV3.xy);
    float4 P2 = texture3.Sample(Prop,U2*(UV3.zw-UV3.xy)+UV3.xy);
    float4 P3 = texture3.Sample(Prop,U3*(UV3.zw-UV3.xy)+UV3.xy);
    float4 P4 = texture3.Sample(Prop,U4*(UV3.zw-UV3.xy)+UV3.xy);
    
    float4 B = exp(20.*sqrt(float4(F.z*F.w,F.x*F.w,F.z*F.y,F.x*F.y))*(3.*float4(P1.g,P2.g,P3.g,P4.g)-(P1.g+P2.g+P3.g+P4.g)));
    B /= dot(B,float4(1,1,1,1));
    
    float4 C1 = texture1.Sample(Colr,U1*(UV1.zw-UV1.xy)+UV1.xy);
    float4 C2 = texture1.Sample(Colr,U2*(UV1.zw-UV1.xy)+UV1.xy);
    float4 C3 = texture1.Sample(Colr,U3*(UV1.zw-UV1.xy)+UV1.xy);
    float4 C4 = texture1.Sample(Colr,U4*(UV1.zw-UV1.xy)+UV1.xy);
    
    float4 Color = INPUT.vColor * (C1*B.x+C2*B.y+C3*B.z+C4*B.w);
    //Color = max(Color,(F.x>31./32.) || (F.y>31./32.))); //This is the tile grid and can be commented out.
    OUTPUT.Col = Color;
    
    float4 N1 = texture2.Sample(Norm,U1*(UV2.zw-UV2.xy)+UV2.xy);
    float4 N2 = texture2.Sample(Norm,U2*(UV2.zw-UV2.xy)+UV2.xy);
    float4 N3 = texture2.Sample(Norm,U3*(UV2.zw-UV2.xy)+UV2.xy);
    float4 N4 = texture2.Sample(Norm,U4*(UV2.zw-UV2.xy)+UV2.xy);
    
    float3 Normal = normalize((N1*B.x+N2*B.y+N3*B.z+N4*B.w).xyz*2.0-1.0);
    OUTPUT.Nor = float4(Normal*.5+.5,Color.a);
    
    OUTPUT.Pro =  float4((P1*B.x+P2*B.y+P3*B.z+P4*B.w).rgb,Color.a);
	return OUTPUT;
}