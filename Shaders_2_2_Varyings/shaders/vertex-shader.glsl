
varying vec2 vUvs; 

void main() {	
  vec4 localPosition = vec4(position, 1.0);

  gl_Position = projectionMatrix * modelViewMatrix * localPosition;
  vUvs = uv; // our declared uv variable gets assigned the uv value so we can pass it on to the fragment shader
}