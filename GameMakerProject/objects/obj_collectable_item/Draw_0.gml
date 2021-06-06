/// @description Insert description here
if (!is_undefined(sprite_index)) {
	if (IsHighlighted(self)) {
		DrawInteractionHighlightSelf(self);
	} else {
		draw_self();	
	}
}