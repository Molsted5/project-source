
varying vec2 vUvs;

uniform vec2 resolution;

vec3 red = vec3(1.0, 0.0, 0.0);
vec3 blue = vec3(0.0, 0.0, 1.0);
vec3 white = vec3(1.0, 1.0, 1.0);
vec3 black = vec3(0.0, 0.0, 0.0);
vec3 yellow = vec3(1.0, 1.0, 0.0);

void main() {
  vec3 colour = vec3(0.75);

  // grid
  vec2 center = vUvs - 0.5; // we also center before fract, where we use resolution to create the grid, which might not end with full cells top and right side, but by centering first we actually center around the screen and make sure that the remainder cells gets distributed evenly on all sides
  vec2 cell = fract(center * resolution / 100.0); // each cell is 100 pixels
  cell = abs(cell - 0.5); // minus half within each cell to center them individually
  float distToCell = 1.0 - 2.0 * max(cell.x, cell.y); // multiply 2 to got from 0-1 again and then 1 minus to invert

  float cellLine = smoothstep(0.0, 0.05, distToCell);

  float xAxis = smoothstep(0.0, 0.002, abs(vUvs.y - 0.5));
  float yAxis = smoothstep(0.0, 0.002, abs(vUvs.x - 0.5));

  // Lines
  vec2 pos = center * resolution / 100.0; // again center around screen and then make sure that stepping 1 on the graph will equal one cell.
  float value1 = pos.x;
  float value2 = fract(pos.x); // only where pos.y is between 0 and 1, the line can happen, as pos.y - pos.x has to be close zero!
  //float value2 = mod(pos.x, 1.0);
  //float value2 = abs(pos.x); // we are guaranteed to subtract a positive x, therefore y has to be that much positive for the line to show.
  //float value2 = floor(pos.x); // in each grid the x we subtract is always the most negative and line only draws when y matches that value.
  //float value2 = ceil(pos.x);
  //float value2 = round(pos.x);
  float functionLine1 = smoothstep(0.0, 0.075, abs(pos.y - value1)); // only values close to 0 makes up the line. pos.y - pos.x results in diagonal line like normal, but its also in the grid and screen space! 
  //float functionLine1 = smoothstep(0.0, 0.075, abs(vUvs.y - vUvs.x)); // normal diagonal line in uv space. Notice it does not follow the grid-diagonals, unless window just so happens to be square.
  float functionLine2 = smoothstep(0.0, 0.075, abs(pos.y - value2));

  colour = mix(black, colour, cellLine);
  colour = mix(blue, colour, xAxis);
  colour = mix(blue, colour, yAxis);
  colour = mix(yellow, colour, functionLine1);
  colour = mix(red, colour, functionLine2);

  //gl_FragColor = vec4(vec2(center), 0.0, 1.0);
  //gl_FragColor = vec4(vec2(cell), 0.0, 1.0);
  //gl_FragColor = vec4(vec3(distToCell), 1.0);
  //gl_FragColor = vec4(vec2(pos), 0.0, 1.0);
  gl_FragColor = vec4(colour, 1.0);
}
