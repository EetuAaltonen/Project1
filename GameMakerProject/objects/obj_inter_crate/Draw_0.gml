/// @description Insert description here
// You can write your code in this editor

if (IsHighlighted(self)) {
	// Highlight shader
	shader_set(sh_highlight_self);

	var texture = sprite_get_texture(sprite_index, image_index);
	var textureWidth = texture_get_texel_width(texture);
	var textureHeight = texture_get_texel_height(texture);

	shader_set_uniform_f(uniformHandle, textureWidth, textureHeight);
	draw_self();

	shader_reset();
} else {
	draw_self();	
}