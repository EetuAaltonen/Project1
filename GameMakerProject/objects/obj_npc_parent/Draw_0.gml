/// @description Insert description here
draw_self();
if (IsHighlighted(self)) {
	var iconPos = new Vector2(x + (10 * sign(image_xscale)), y - 40);
	draw_sprite_ext(
		spr_npc_talk_icon, 0,
		iconPos.x, iconPos.y,
		image_xscale, image_yscale,
		0, c_white, 1
	);
}