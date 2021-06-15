/// @description Insert description here
// You can write your code in this editor
var keyUp = keyboard_check(ord("W"));
var keyLeft = keyboard_check(ord("A"));
var keyDown = keyboard_check(ord("S"));
var keyRight = keyboard_check(ord("D"));
var keyRun = keyboard_check(vk_shift);

if (!is_undefined(GetGUIStatement())) return;

var hMove = keyRight - keyLeft;

// Run or Walk
speedVector.x = keyRun ? hMove * runSpeed : hMove * walkSpeed;
speedVector.x = HorizontalCollision(self);
x += speedVector.x;
if (speedVector.x != 0) {
	characterStatement = CharacterStatement.Walk;
} else {
	characterStatement = undefined;	
}

// Jump
if (IsGrounded(self) && keyUp) {
	speedVector.y -= jumpSpeed;
}

speedVector.y += global.GRAVITY
speedVector.y = VerticalCollision(self);
y += speedVector.y;

// Animation
image_xscale = speedVector.x != 0 ? sign(speedVector.x) : image_xscale;

transform.AnimationTriggerValue = characterStatement;
transform.UpdateTransform();