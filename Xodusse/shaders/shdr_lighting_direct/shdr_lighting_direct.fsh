
varying vec4 v_vColor;
varying vec2 v_vMapcoord;

uniform vec3 Dir;
uniform sampler2D Colr;
uniform sampler2D Norm;
uniform sampler2D Prop;

void main()
{
    vec4 Color = texture2D(Colr,v_vMapcoord);
    vec3 Normal = texture2D(Norm,v_vMapcoord).xyz*2.-1.;
    vec4 Proper = texture2D(Prop,v_vMapcoord);
    gl_FragColor = vec4(v_vColor.rgb*Color.rgb,1)*(v_vColor.a*pow(dot(Normal,normalize(Dir))*.5+.5,3.))+
                   vec4(v_vColor.rgb,1)*(v_vColor.a*pow(abs(reflect(-normalize(Dir),Normal).z*.5+.5),16.)*Proper.r);
}
