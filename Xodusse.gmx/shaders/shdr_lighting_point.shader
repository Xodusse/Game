attribute vec4 in_Color;
attribute vec3 in_Position;
attribute vec2 in_TextureCoord;

varying vec4 v_vColor;
varying vec2 v_vTexcoord;
varying vec2 v_vCoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position,1);
    
    v_vColor = in_Color;
    v_vTexcoord = (gm_Matrices[MATRIX_VIEW] * vec4(in_Position,1)).xy/vec2(960,540)+0.5;
    v_vCoord = in_Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec4 v_vColor;
varying vec2 v_vTexcoord;
varying vec2 v_vCoord;

uniform vec3 Pos;
uniform sampler2D Colr;
uniform sampler2D Norm;

void main()
{
    vec4 Color = texture2D(Colr,v_vTexcoord);
    vec3 Normal = texture2D(Norm,v_vTexcoord).xyz*2.0-1.0;
    vec3 Ray = normalize(Pos-vec3(v_vCoord,0));
    gl_FragColor = vec4(v_vColor.rgb,v_vColor.a*(dot(Normal,Ray)*0.5+0.5)*Color.a);
}
