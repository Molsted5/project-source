

varying vec3 vNormal;

void main() {	
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
  vNormal = (modelMatrix * vec4(normal, 0.0)).xyz; // decide about which space to do our lighting in, in this case we transform the vertices from local space to world space by using modelMatrix. w = 0, because the vector is then treated as direction vector, not position.
}