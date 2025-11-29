
varying vec2 vUvs;

void main() {
  vec3 colour = vec3(0.0);

  // value is f(x), which is why, the line is created around vUvs.y = value
  // by using uvs we are in a very literal sense saying, keep going in this direction until you reach this point. Good, now repeat at the next step
  float value1 = vUvs.x;
  float value2 = smoothstep(0.0, 1.0, vUvs.x);

  float line = smoothstep(0.0, 0.005, abs(vUvs.y - 0.5)); // 0 to 0.005 is the new 0 to 1
  float linearLine = smoothstep(0.0, 0.0075, abs(vUvs.y - mix(0.5, 1.0, value1)));
  float smoothLine = smoothstep(0.0, 0.0075, abs(vUvs.y - mix(0.0, 0.5, value2)));

  vec3 red = vec3(1.0, 0.0, 0.0);
  vec3 blue = vec3(0.0, 0.0, 1.0);
  vec3 white = vec3(1.0, 1.0, 1.0);

  if (vUvs.y > 0.5) {
    colour = mix(red, blue, value1);
  } else {
    colour = mix(red, blue, value2);
  }

  colour = mix(white, colour, line);
  colour = mix(white, colour, linearLine);
  colour = mix(white, colour, smoothLine);

  //gl_FragColor = vec4(vec3(abs(vUvs.y-vUvs.x)), 1.0);
  gl_FragColor = vec4(colour, 1.0);
}