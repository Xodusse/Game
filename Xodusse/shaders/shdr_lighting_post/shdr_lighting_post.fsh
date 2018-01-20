
varying vec2 v_vTexcoord;

uniform sampler2D Colr;
uniform sampler2D Prop;

uniform vec2 Size;

void main()
{
    vec4 Tex = texture2D(gm_BaseTexture,v_vTexcoord);
    vec4 Color = texture2D(Colr,v_vTexcoord);
    float Emission = texture2D(Prop,clamp(v_vTexcoord+vec2(-1,-1)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(0,-2)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(1,-1)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(-2,0)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(0,0)/Size,0.,1.)).b*2.;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(2,0)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(-1,1)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(0,2)/Size,0.,1.)).b;
    Emission += texture2D(Prop,clamp(v_vTexcoord+vec2(1,1)/Size,0.,1.)).b;
    
    gl_FragColor = vec4(Tex.rgb+(Emission/10.),Tex.a);
}
