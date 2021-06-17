/// @description Insert description here
if (enableGravity) {
	speedVector.y += global.GRAVITY
	speedVector.y = VerticalCollision(self);
	y += speedVector.y;
}