/// @description Insert description here
transform = new Transform(object_get_name(obj_player), self, undefined, undefined, new Vector2(0, 0), new Scale(1, 1), 0, 0);
speedVector = new Vector2(0, 0);
walkSpeed = 4;
runSpeed = 6;
jumpSpeed = 8;

// Create limbs
transform.AddChild(new Transform(object_get_name(obj_player_head), undefined, transform, TransFuncPlayerHead, new Vector2(0, -24), new Scale(1, 1), 0, -1));
transform.AddChild(new Transform(object_get_name(obj_player_r_arm), undefined, transform, TransFuncPlayerLimb, new Vector2(-2, -20), new Scale(1, 1), 0, -1));
transform.AddChild(new Transform(object_get_name(obj_player_l_arm), undefined, transform, TransFuncPlayerLimb, new Vector2(2, -20), new Scale(1, 1), 0, 1));
transform.AddChild(new Transform(object_get_name(obj_player_r_leg), undefined, transform, TransFuncPlayerLimb, new Vector2(-4, 4), new Scale(1, 1), 0, -1));
transform.AddChild(new Transform(object_get_name(obj_player_l_leg), undefined, transform, TransFuncPlayerLimb, new Vector2(4, 4), new Scale(1, 1), 0, 1));

createAllChild = true;

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