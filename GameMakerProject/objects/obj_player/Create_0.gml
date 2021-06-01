/// @description Insert description here
transform = new Transform(obj_player, self, undefined, undefined, new Vector2(0, 0), 1, 1, 0, 0);
speedVector = new Vector2(0, 0);
walkSpeed = 4;
runSpeed = 6;
jumpSpeed = 8;

// Create limbs
transform.AddChild(new Transform(obj_player_head, undefined, transform, TransFuncPlayerHead, new Vector2(0, -24), 1, 1, 0, -1));
transform.AddChild(new Transform(obj_player_r_arm, undefined, transform, TransFuncPlayerLimb, new Vector2(-2, -20), 1, 1, 0, -1));
transform.AddChild(new Transform(obj_player_l_arm, undefined, transform, TransFuncPlayerLimb, new Vector2(2, -20), 1, 1, 0, 1));
transform.AddChild(new Transform(obj_player_r_leg, undefined, transform, TransFuncPlayerLimb, new Vector2(-4, 4), 1, 1, 0, -1));
transform.AddChild(new Transform(obj_player_l_leg, undefined, transform, TransFuncPlayerLimb, new Vector2(4, 4), 1, 1, 0, 1));

var rightHand = transform.GetChildTransformByObject(obj_player_r_arm);
rightHand.AddChild(new Transform(obj_weapon_sword, undefined, rightHand, TransFuncPlayerLimb, new Vector2(0, 18), 1, 1, -80, -1));

var head = transform.GetChildTransformByObject(obj_player_head);
head.AddChild(new Transform(obj_headgear_hat, undefined, head, TransFuncPlayerLimb, new Vector2(0, -28), 1, 1, 0, -1));

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