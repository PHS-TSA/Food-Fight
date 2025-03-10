shader_type canvas_item;

uniform float yoffset = 0.5; //Could edit this value to change intestity of fire based on amount of burn stacks
uniform float animation_speed = 0.5;
uniform vec4 flame_color:source_color = vec4(1.0);
uniform sampler2D noise_texture:hint_default_black, repeat_enable;

void fragment() {
	vec2 uv = vec2(UV.x, UV.y + TIME *animation_speed);
	vec4 noise_color = texture(noise_texture, uv);
	vec4 final_color = noise_color;
	final_color.rgb += vec3(UV.y - yoffset);
	// Returns 0 if above 0.5 and 1 if below 1.5
	final_color.rgb = step(final_color.rgb, vec3(0.5));
	//Inverts colors
	final_color.rgb = vec3(1.0) - final_color.rgb;
	//Sets transperancy to red value (so 0 above the white)
	final_color.a = final_color.r;
	final_color.rgb = flame_color.rgb;
	COLOR = final_color;

	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
