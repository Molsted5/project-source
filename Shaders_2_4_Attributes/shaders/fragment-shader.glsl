
// 4 colors where assigned to 4 vertices and that attribute was then 
// assigned to the varying in the vertex shader 
// to make it avaiable in the fragment shader.  
varying vec3 vColour; 

void main() {
  gl_FragColor = vec4(vColour, 1.0);
}