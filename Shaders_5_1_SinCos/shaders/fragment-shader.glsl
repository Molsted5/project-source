varying vec2 vUvs;

uniform sampler2D diffuse1;
uniform float time;

float inverseLerp(float v, float minValue, float maxValue) {
  return (v - minValue) / (maxValue - minValue);
}

float remap(float v, float inMin, float inMax, float outMin, float outMax) {
  float t = inverseLerp(v, inMin, inMax);
  return mix(outMin, outMax, t);
}

void main() {
  vec3 colour = vec3(0.0);
  vec3 white = vec3(1.0, 1.0, 1.0);
  vec3 red = vec3(1.0, 0.0, 0.0);
  vec3 blue = vec3(0.0, 0.0, 1.0);

  // lines and checkerboard
  // float t1 = sin(vUvs.x * 100.0); // will give just below 16 because 100/2pi
  // float t2 = sin(vUvs.y * 100.0);

  // colour = vec3(t1);
  // colour = vec3(t1 + t2);
  // colour = vec3(t1 * t2);
  // colour = vec3(max(t1, t2));

  // waves
  float t1 = sin(vUvs.x * 6.28 * 5.0 - 1.57) * 0.5 + 0.5;
  float range = inverseLerp(vUvs.y, 0.4, 0.6); // note the difference of the fractions is the same as 1/freq
  // float wave = range > t1 ? 1.0 : 0.0;
  float wave = inverseLerp(range - t1, 0.0, 0.05);
  float waveLine = inverseLerp(abs(range - t1), 0.0, 0.05);
  float linearLine = inverseLerp(abs(range - vUvs.x*0.0), 0.0, 0.05); // note the width changes with slope steapness, hence sin changing the width

  colour = vec3(wave);
  // colour = vec3(waveLine);
  // colour = vec3(linearLine);

  // colour = mix(red, blue, t1);
  // colour = mix(white, colour, min(waveLine, 1.0));

  // old tv static
  // float t1 = remap(sin(vUvs.y * 400.0 + time * 10.0), -1.0, 1.0, 0.9, 1.0);
  // float t2 = remap(sin(vUvs.y * 50.0 - time * 2.0), -1.0, 1.0, 0.9, 1.0);

  // colour = vec3(t1*t2);
  // colour = texture2D(diffuse1, vUvs).xyz * t1 * t2;

  gl_FragColor = vec4(colour, 1.0);
}
