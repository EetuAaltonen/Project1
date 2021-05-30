/// @description Insert description here
// You can write your code in this editor
var hDirection = image_xscale;

var armHOffset = 2;
var armVOffset = 20;

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

var legHOffset = 4;
var legVOffset = 4;

var legFront = spr_player_r_leg;
var legBehind = spr_player_l_leg;
var legFrontRotation = rightLegRotation;
var legBehindRotation = leftLegRotation;

if (image_xscale < 0) {
	var legSwap = legFront;
	legFront = legBehind;
	legBehind = legSwap;
	
	var legRotationSwap = legFrontRotation;
	legFrontRotation = legBehindRotation;
	legBehindRotation = legRotationSwap;
}

var headOffset = 24;

draw_sprite_ext(
	armBehind,
	0, x + (hDirection * armHOffset), y - armVOffset,
	image_xscale, image_yscale,
	armBehindRotation, c_white, 1
);

draw_sprite_ext(
	legBehind,
	0, x + (hDirection * legHOffset), y + legVOffset,
	image_xscale, image_yscale,
	legBehindRotation, c_white, 1
);

draw_self();

draw_sprite_ext(
	legFront,
	0, x - (hDirection * legHOffset), y + legVOffset,
	image_xscale, image_yscale,
	legFrontRotation, c_white, 1
);

draw_sprite_ext(
	armFront,
	0, x - (hDirection * armHOffset), y - armVOffset,
	image_xscale, image_yscale,
	armFrontRotation, c_white, 1
);

draw_sprite_ext(
	spr_player_head,
	0, x, y - headOffset,
	image_xscale, image_yscale,
	0, c_white, 1
);

draw_sprite_ext(
	spr_headgear_top_hat,
	0, x, y - (headgearOffset + headOffset),
	image_xscale, image_yscale,
	0, c_white, 1
);