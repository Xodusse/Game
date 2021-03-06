attribute vec4 in_Color;
attribute vec3 in_Position;

uniform vec2 Size;

varying vec4 v_vColor;
varying vec2 v_vMapcoord;
varying vec2 v_vCoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position,1);
    
    v_vColor = in_Color;
    v_vMapcoord = (gm_Matrices[MATRIX_VIEW] * vec4(in_Position,1)).xy/Size+0.5;
    v_vCoord = in_Position.xy;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec4 v_vColor;
varying vec2 v_vMapcoord;
varying vec2 v_vCoord;

uniform vec3 Pos;
uniform sampler2D Colr;
uniform sampler2D Norm;
uniform sampler2D Prop;

void main()
{
    vec4 Color = texture2D(Colr,v_vMapcoord);
    vec3 Normal = normalize(texture2D(Norm,v_vMapcoord).xyz*2.-1.);
    vec4 Proper = texture2D(Prop,v_vMapcoord);
    vec3 Ray = normalize(Pos-vec3(v_vCoord,0.));
    gl_FragColor = vec4(v_vColor.rgb*Color.rgb,1)*(v_vColor.a*pow(dot(Normal,Ray)*.5+.5,3.))+
                   vec4(v_vColor.rgb,1)*(v_vColor.a*pow(abs(reflect(-Ray,Normal).z*.5+.5),16.)*Proper.r);
}
