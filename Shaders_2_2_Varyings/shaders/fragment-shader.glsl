
varying vec2 vUvs;

void main() {
  // we map red to x and green to y
  //gl_FragColor = vec4(vUvs, 0, 1.0);
  
  // flipped mapping of red to x and green to y
  gl_FragColor = vec4(vec2(1.0, 1.0) - vUvs, 0, 1.0);
  
  // we map red to y and blue to x
  //gl_FragColor = vec4(vUvs.y, 0.0, vUvs.x, 1.0);
  
  // we map red, green and blue to x
  //gl_FragColor = vec4(vec3(vUvs.x), 1.0);
  
  // gradient flipped
  //gl_FragColor = vec4(vec3(1.0-vUvs.x), 1.0);
}