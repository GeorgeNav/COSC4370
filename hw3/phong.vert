#version 330 core
layout (location = 0) in vec3 positionAttribute;
layout (location = 1) in vec3 normalAttribute;

out vec3 normal;
out vec3 fragPos;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
  fragPos = vec3(model * vec4(positionAttribute, 1.0));
  normal = mat3(transpose(inverse(model))) * normalAttribute;  
  
  gl_Position = projection * view * vec4(fragPos, 1.0);
}