/// @description Insert description here
// You can write your code in this editor
var keyUp = keyboard_check(ord("W"));
var keyLeft = keyboard_check(ord("A"));
var keyDown = keyboard_check(ord("S"));
var keyRight = keyboard_check(ord("D"));
var keyRun = keyboard_check(vk_shift);

if (!is_undefined(GetGUIStatement())) return;

var hMove = keyRight - keyLeft;
var objectName;

// Run or Walk
speedVector.x = keyRun ? hMove * runSpeed : hMove * walkSpeed;
speedVector.x = HorizontalCollision(self);
x += speedVector.x;

// Jump
if (IsGrounded(self) && keyUp) {
	speedVector.y -= jumpSpeed;
}

speedVector.y += global.GRAVITY
speedVector.y = VerticalCollision(self);
y += speedVector.y;

// Animation
image_xscale = speedVector.x != 0 ? sign(speedVector.x) : image_xscale;
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

var xDir = sign(image_xscale);

objectName = object_get_name(obj_player_r_arm);
var rightArmTransform = transform.GetChildTransformByObjectName(objectName);
rightArmTransform.Rotation = rightArmRotation * xDir;

objectName = object_get_name(obj_player_l_arm);
var leftArmTransform = transform.GetChildTransformByObjectName(objectName);
leftArmTransform.Rotation = leftArmRotation * xDir;

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

objectName = object_get_name(obj_player_r_leg);
var rightLegTransform = transform.GetChildTransformByObjectName(objectName);
rightLegTransform.Rotation = rightLegRotation * xDir;

objectName = object_get_name(obj_player_l_leg);
var leftLegTransform = transform.GetChildTransformByObjectName(objectName);
leftLegTransform.Rotation = leftLegRotation * xDir;

transform.UpdateTransform();