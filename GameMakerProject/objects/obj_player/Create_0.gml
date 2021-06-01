/// @description Insert description here
transform = new Transform(noone, self, undefined, undefined, undefined, undefined, 0, 0);
speedVector = new Vector2(0, 0);
walkSpeed = 4;
runSpeed = 6;
jumpSpeed = 8;

// Create limbs
transform.AddChild(new Transform(obj_player_head, undefined, transform, TransFuncPlayerHead, 0, -24, 0, -1));
transform.AddChild(new Transform(obj_player_r_arm, undefined, transform, TransFuncPlayerLimb, -2, -20, 0, -1));
transform.AddChild(new Transform(obj_player_l_arm, undefined, transform, TransFuncPlayerLimb, 2, -20, 0, 1));
transform.AddChild(new Transform(obj_player_r_leg, undefined, transform, TransFuncPlayerLimb, -4, 4, 0, -1));
transform.AddChild(new Transform(obj_player_l_leg, undefined, transform, TransFuncPlayerLimb, 4, 4, 0, 1));

transform.CreateAllChild();

// Limb animation
armRotationStep = 4;
rightArmRotation = 0;
rightArmRotationDir = -1;
leftArmRotation = 0;
leftArmRotationDir = 1;

legRotationStep = 6;
rightLegRotation = 0;
rightLegRotationDir = 1;
leftLegRotation = 0;
leftLegRotationDir = -1;