
varying vec3 vNormal;
varying vec3 vPosition;

uniform float time;

float inverseLerp(float v, float minValue, float maxValue) {
  return (v - minValue) / (maxValue - minValue);
}

float remap(float v, float inMin, float inMax, float outMin, float outMax) {
  float t = inverseLerp(v, inMin, inMax);
  return mix(outMin, outMax, t);
}

mat3 rotateY(float radians) {
  float s = sin(radians);
  float c = cos(radians);

  return mat3(
    c, 0.0, s,
    0.0, 1.0, 0.0,
    -s, 0.0, c
  );
}

void main() {
  vec3 localSpacePosition = position;

  vec3 orbitCenter = vec3(cos(time), 0.0, sin(time));
  localSpacePosition = rotateY(time) * position + orbitCenter; // note: orbite center doesnt accumulate because position refers to the model vertex positions, which doesnt change here.

  //localSpacePosition.z += sin(time);
  //localSpacePosition.xz *= remap(sin(time), -1.0, 1.0, 0.1, 1.5);

  //localSpacePosition = rotateY(time) * position;
  
  gl_Position = projectionMatrix * modelViewMatrix * vec4(
      localSpacePosition, 1.0);
  vNormal = (modelMatrix * vec4(normal, 0.0)).xyz;
  vPosition = (modelMatrix * vec4(position, 1.0)).xyz;
}