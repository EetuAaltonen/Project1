/// @description Insert description here
// You can write your code in this editor
keyUp = keyboard_check(ord("W"));
keyLeft = keyboard_check(ord("A"));
keyDown = keyboard_check(ord("S"));
keyRight = keyboard_check(ord("D"));
keyRun = keyboard_check(vk_shift);

if (GetGUIStatement() != GUIStatement.Undefined) return;

var hMove = keyRight - keyLeft;

// Run or Walk
speedVector.x = keyRun ? hMove * runSpeed : hMove * walkSpeed;

speedVector.x = HorizontalCollision(self);
x += speedVector.x;

// Jump
if (IsGrounded(self) && keyUp) {
	speedVector.y -= jumpSpeed;
	headgearOffsetDir = 1;
}

speedVector.y += global.GRAVITY
speedVector.y = VerticalCollision(self);
y += speedVector.y;

// Animation
image_xscale = speedVector.x != 0 ? sign(speedVector.x): image_xscale;
if (hMove != 0) {
	rightArmRotation += (rightArmRotationDir * armRotationStep);
	leftArmRotation += (leftArmRotationDir * armRotationStep);
	
	rightLegRotation += (rightLegRotationDir * legRotationStep);
	leftLegRotation += (leftLegRotationDir * legRotationStep);
} else {
	rightArmRotation = 0;
	leftArmRotation = 0;
	
	rightLegRotation = 0;
	leftLegRotation = 0;
}

var maxArmRotation = 40;
var minArmRotation = maxArmRotation * (-1);

// Right arm
if (rightArmRotation >= maxArmRotation) {
	rightArmRotation = maxArmRotation;
	rightArmRotationDir *= -1;
} else if (rightArmRotation <= minArmRotation) {
	rightArmRotation = minArmRotation;
	rightArmRotationDir *= -1;
}

// Left arm
if (leftArmRotation >= maxArmRotation) {
	leftArmRotation = maxArmRotation;
	leftArmRotationDir *= -1;
} else if (leftArmRotation <= minArmRotation) {
	leftArmRotation = minArmRotation;
	leftArmRotationDir *= -1;
}

var maxLegRotation = 40;
var minLegRotation = maxLegRotation * (-1);

// Right leg
if (rightLegRotation >= maxLegRotation) {
	rightLegRotation = maxLegRotation;
	rightLegRotationDir *= -1;
} else if (rightLegRotation <= minLegRotation) {
	rightLegRotation = minLegRotation;
	rightLegRotationDir *= -1;
}

// Left leg
if (leftLegRotation >= maxLegRotation) {
	leftLegRotation = maxLegRotation;
	leftLegRotationDir *= -1;
} else if (leftLegRotation <= minLegRotation) {
	leftLegRotation = minLegRotation;
	leftLegRotationDir *= -1;
}

// Headgear
headgearOffset += (headgearOffsetStep * headgearOffsetDir);
if (headgearOffset >= headgearMaxOffset) {
	headgearOffset = headgearMaxOffset;
	headgearOffsetDir = -1;
} else if (headgearOffset <= headgearDefaultOffset) {
	headgearOffset = headgearDefaultOffset;
}