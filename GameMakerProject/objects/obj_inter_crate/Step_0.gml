/// @description Insert description here
// You can write your code in this editor
speedVector.x = FrictionSlowing(self);
speedVector.x = HorizontalCollision(self);
x += speedVector.x;

speedVector.y += global.GRAVITY
speedVector.y = VerticalCollision(self);
y += speedVector.y;