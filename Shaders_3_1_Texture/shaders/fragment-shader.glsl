
varying vec2 vUvs;

uniform sampler2D diffuse;
uniform sampler2D overlay;
uniform vec4 tint;


void main(void) {
  vec4 diffuseSample = texture2D(diffuse, vUvs); // returns one texel from the texture at the specified coordinate
  //vec4 diffuseSample = texture2D(diffuse, vec2(1.0-vUvs.x, vUvs.y)); // flipped vertically
  //gl_FragColor = diffuseSample;
  gl_FragColor = vec4(diffuseSample.r);
  //gl_FragColor = vec4(diffuseSample.r, 0.0, 0.0, 1.0);
  //gl_FragColor = diffuseSample * tint;
}