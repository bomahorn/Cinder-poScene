//
//  poMask_frag.glsl
//  poMask Fragment Shader
//
//  Created by Stephen Varga on 5/13/14.
//
//

uniform sampler2D tex;
uniform sampler2D mask;

uniform vec2 contentScale;
uniform vec2 maskPosition;

void main(void)
{
    vec2 c0 = vec2(gl_TexCoord[0].s, 1.0 - gl_TexCoord[0].t);
    vec2 c1 = (gl_TexCoord[0].st - maskPosition) * contentScale;// - ( maskPosition - vec2(0,1));
    
    vec4 rgbValue       = texture2D(tex, c0);
    vec4 alphaValue     = texture2D(mask, c1);
    gl_FragColor.rgb    = rgbValue.rgb;
    gl_FragColor.a      = alphaValue.r;
    //gl_FragColor.a = 1.0;
}

