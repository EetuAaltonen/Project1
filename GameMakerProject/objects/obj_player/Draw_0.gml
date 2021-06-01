/// @description Insert description here
// You can write your code in this editor
var hDirection = image_xscale;

var armFront = spr_player_r_arm;
var armBehind = spr_player_l_arm;
var armFrontRotation = rightArmRotation;
var armBehindRotation = leftArmRotation;

if (image_xscale < 0) {
	var armSwap = armFront;
	armFront = armBehind;
	armBehind = armSwap;
	
	var armRotationSwap = armFrontRotation;
	armFrontRotation = armBehindRotation;
	armBehindRotation = armRotationSwap;
}

draw_self();