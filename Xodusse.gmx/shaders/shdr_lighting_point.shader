attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position,1);
    
    v_vTexcoord = (gm_Matrices[MATRIX_VIEW] * vec4(in_Position,1)).xy/vec2(960,540)+0.5;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~


































varying vec2 v_vTexcoord;

uniform sampler2D Colr;
uniform sampler2D Norm;

void main()
{
    vec4 Color = texture2D(Colr,v_vTexcoord);
    vec3 Normal = texture2D(Norm,v_vTexcoord).xyz*2.0-1.0;
    gl_FragColor = vec4(1,1,1,exp(dot(Normal,vec3(.2,.8,.4))*2.0-2.0)*Color.a);
}
