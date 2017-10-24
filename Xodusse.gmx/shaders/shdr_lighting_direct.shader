attribute vec4 in_Color;
attribute vec3 in_Position;

varying vec4 v_vColor;
varying vec2 v_vMapcoord;

uniform vec2 Size;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position,1);
    
    v_vColor = in_Color;
    v_vMapcoord = (gm_Matrices[MATRIX_VIEW] * vec4(in_Position,1)).xy/Size+0.5;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec4 v_vColor;
varying vec2 v_vMapcoord;

uniform vec3 Dir;
uniform sampler2D Colr;
uniform sampler2D Norm;
uniform sampler2D Prop;

void main()
{
    vec4 Color = texture2D(Colr,v_vMapcoord);
    vec3 Normal = texture2D(Norm,v_vMapcoord).xyz*2.0-1.0;
    vec4 Proper = texture2D(Prop,v_vMapcoord);
    gl_FragColor = vec4(v_vColor.rgb,v_vColor.a*Color.a*exp(dot(Normal,normalize(Dir))*1.0-1.0));
}
