shader_type canvas_item;

uniform sampler2D mask : hint_albedo;
uniform vec4 color_1 : hint_color = vec4(1);
uniform vec4 color_2 : hint_color = vec4(1);
uniform vec4 color_3 : hint_color = vec4(1);
uniform vec4 color_4 : hint_color = vec4(1);

void fragment() {
	vec4 m = texture(mask, UV);
	COLOR = vec4(mix(
		mix(color_1, color_3, m.g),
		mix(color_2, color_4, m.g),
		m.r
	).rgb, m.a);
}
