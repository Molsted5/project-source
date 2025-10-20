
attribute vec3 simondevColours; // not given by threejs but assigned to vertices ourself (inside main.js using threejs)

varying vec3 vColour; // in this case used to make our attribute available to the fragment shader

void main() {	
  vec4 localPosition = vec4(position, 1.0);

  gl_Position = projectionMatrix * modelViewMatrix * localPosition;
  vColour = simondevColours;
}