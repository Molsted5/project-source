
varying vec2 vUvs;

uniform sampler2D diffuse;
uniform sampler2D overlay;
uniform vec4 tint;


void main(void) {
  vec2 uvs = vUvs / 10.0; // we zoom and how the pixels are then handled is determined by the filtering setting. Default is smoothing by some linear or bilinear sampling but in this case we have nearest filter, which just finds the nearest pixel in the texel. 

  vec4 diffuseSample = texture2D(diffuse, uvs);

  gl_FragColor = diffuseSample;
}