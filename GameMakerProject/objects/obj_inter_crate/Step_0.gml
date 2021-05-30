/// @description Insert description here
// You can write your code in this editor
speedVector.x = FrictionSlowing(self);
speedVector.x = HorizontalCollision(self);
x += speedVector.x;

speedVector.y += global.GRAVITY
speedVector.y = VerticalCollision(self);
y += speedVector.y;

//Highlight
if (instance_exists(obj_player)) {
	if (IsHighlighted(self)) {
		if (distance_to_object(obj_player) > 20) {
			if (IsHighlighted(self)) {
				ResetInteraction();
			}
		}
	} else {
		if (distance_to_object(obj_player) <= 20) {
			SetInteractionHighlight(self);
		}
	}
}