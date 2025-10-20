// three js adds these to the shader by itself

//uniform mat4 projectionMatrix;
//uniform mat4 modelViewMatrix;

//attribute vec3 position;

void main() {	
  vec4 localPosition = vec4(position, 1.0);

  gl_Position = projectionMatrix * modelViewMatrix * localPosition;
}