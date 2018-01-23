attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position,1);
    
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec2 v_vTexcoord;

uniform sampler2D Colr;
uniform sampler2D Prop;

uniform vec2 Size;

void main()
{
    vec4 Tex = texture2D(gm_BaseTexture,v_vTexcoord);
    vec4 Color = texture2D(Colr,v_vTexcoord);
    float Height = texture2D(Prop,v_vTexcoord).g-.01;
    float Shadow = 0.;
    
    vec2 UV = clamp(v_vTexcoord+vec2(-1,-1)/Size,0.,1.);
    
    vec2 Properties = texture2D(Prop,UV).gb;
    vec3 Emission = texture2D(Colr,UV).rgb*Properties.y*2.;
    Shadow += max(Height-Properties.x,0.)*2.;
    
    UV = clamp(v_vTexcoord+vec2(0,-2)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y;
    Shadow += pow(max(Height-Properties.x,0.),2.);
    
    UV = clamp(v_vTexcoord+vec2(1,-1)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y*2.;
    Shadow += pow(max(Height-Properties.x,0.),2.)*2.;
    
    UV = clamp(v_vTexcoord+vec2(-2,0)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y;
    Shadow += pow(max(Height-Properties.x,0.),2.);
    
    UV = clamp(v_vTexcoord+vec2(0,0)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*texture2D(Prop,UV).b*Properties.y*5.;
    Shadow += pow(max(Height-Properties.x,0.),2.)*5.;
    
    UV = clamp(v_vTexcoord+vec2(2,0)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y;
    Shadow += pow(max(Height-Properties.x,0.),2.);
    
    UV = clamp(v_vTexcoord+vec2(-1,1)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y*2.;
    Shadow += pow(max(Height-Properties.x,0.),2.)*2.;
    
    UV = clamp(v_vTexcoord+vec2(0,2)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y;
    Shadow += pow(max(Height-Properties.x,0.),2.);
    
    UV = clamp(v_vTexcoord+vec2(1,1)/Size,0.,1.);
    Properties = texture2D(Prop,UV).gb;
    Emission += texture2D(Colr,UV).rgb*Properties.y*2.;
    Shadow += pow(max(Height-Properties.x,0.),2.)*2.;
    
    gl_FragColor = Tex;
    gl_FragColor.rgb *= vec3(exp(min(-Shadow,0.)*2.));//Occulusion
    gl_FragColor.rgb += Color.rgb*Emission/10.;       //Emissive
}
