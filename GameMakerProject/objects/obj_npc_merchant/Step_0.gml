/// @description Insert description here
if (is_undefined(GetGUIStatement())) {
	speedVector.y += global.GRAVITY
	speedVector.y = VerticalCollision(self);
	y += speedVector.y;
	
	transform.AnimationTriggerValue = characterStatement;
	transform.UpdateTransform();
}