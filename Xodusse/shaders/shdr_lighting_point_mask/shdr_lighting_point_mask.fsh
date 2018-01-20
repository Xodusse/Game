
varying vec4 v_vColor;
varying vec2 v_vMapcoord;
varying vec2 v_vTexcoord;
varying vec2 v_vCoord;

uniform vec3 Pos;
uniform sampler2D Colr;
uniform sampler2D Norm;
uniform sampler2D Prop;

void main()
{
    vec4 Light = v_vColor*texture2D(gm_BaseTexture,v_vTexcoord);
    vec4 Color = texture2D(Colr,v_vMapcoord);
    vec3 Normal = normalize(texture2D(Norm,v_vMapcoord).xyz*2.-1.);
    vec4 Proper = texture2D(Prop,v_vMapcoord);
    vec3 Ray = normalize(Pos-vec3(v_vCoord,0.));
    gl_FragColor = vec4(Light.rgb*Color.rgb,1)*(Light.a*pow(dot(Normal,Ray)*.5+.5,3.))+
    vec4(Light.rgb,1)*(Light.a*pow(abs(reflect(-Ray,Normal).z*.5+.5),16.)*Proper.r);
}
