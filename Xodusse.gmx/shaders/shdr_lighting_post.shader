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
    float Emission = texture2D(Prop,v_vTexcoord+vec2(-1,-1)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(0,-2)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(1,-1)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(-2,0)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(0,0)/Size).b*2.;
    Emission += texture2D(Prop,v_vTexcoord+vec2(2,0)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(-1,1)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(0,2)/Size).b;
    Emission += texture2D(Prop,v_vTexcoord+vec2(1,1)/Size).b;
    gl_FragColor = vec4(mix(Tex.rgb,Color.rgb,Emission/10.),Tex.a);
}
