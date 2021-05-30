/// @description Insert description here
// You can write your code in this editor
keyUp = keyboard_check(ord("W"));
keyLeft = keyboard_check(ord("A"));
keyDown = keyboard_check(ord("S"));
keyRight = keyboard_check(ord("D"));
keyRun = keyboard_check(vk_shift);

var hMove = keyRight - keyLeft;

// Run or Walk
hSpeed = keyRun ? hMove * runSpeed : hMove * walkSpeed;

if (place_meeting(x + hSpeed, y, obj_collision_parent)) {
	while (!place_meeting(x + sign(hSpeed), y, obj_collision_parent)) {
		x += sign(hSpeed);
	}
	hSpeed = 0;
}
x += hSpeed;

// Jump
if (place_meeting(x, y + 1, obj_collision_parent) && keyUp) {
	vSpeed -= jumpSpeed;
	headgearOffsetDir = 1;
}

vSpeed += global.GRAVITY
if (place_meeting(x, y + vSpeed, obj_collision_parent)) {
	while (!place_meeting(x, y + sign(vSpeed), obj_collision_parent)) {
		y += sign(vSpeed);
	}
	vSpeed = 0;
};
y += vSpeed;

// Animation
image_xscale = hSpeed != 0 ? sign(hSpeed): image_xscale;
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