shader_type canvas_item;

uniform bool apply = true;
uniform sampler2D offset_texture : hint_white;

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	vec4 color = texture_color;
	float amount_x = 3.0 * sin(TIME*2.0);
	float amount_y = 3.0 * cos(TIME*2.0);
	
	if (apply == true) {
		float adjust_x = amount_x * texture(offset_texture, UV).r / 100.0;
		float adjust_y = amount_y * texture(offset_texture, UV).r / 100.0;
		color.r = texture(TEXTURE, vec2(UV.x + adjust_x, UV.y + adjust_y)).r;
		color.g = texture(TEXTURE, UV).g;
		color.b = texture(TEXTURE, vec2(UV.x - adjust_x, UV.y - adjust_y)).b;
		color.a = texture(TEXTURE, vec2(UV.x + adjust_x, UV.y + adjust_y)).a;
	}
	COLOR = color;
}