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
