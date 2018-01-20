struct Attribute
{
    float4 vPosition : POSITION;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};

struct Fragment
{
    float4 vPosition : SV_POSITION;
    float4 vColor    : COLOR0;
    float2 vTexcoord : TEXCOORD0;
};

Fragment main(Attribute INPUT)
{
    Fragment OUTPUT;

    float4 matrixWVP = mul(gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION], INPUT.vPosition);

    OUTPUT.vPosition = matrixWVP;
    OUTPUT.vColor    = INPUT.vColor;
    OUTPUT.vTexcoord = INPUT.vTexcoord; 

    return OUTPUT;
}