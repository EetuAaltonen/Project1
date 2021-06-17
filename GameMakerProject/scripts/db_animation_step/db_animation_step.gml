/*
	Insert description here
	return:
*/
function GetDbAllAnimationStepArray() {
	return [
		// Player walk
		// Player head
		new AnimationStep(AnimationIndex.PlayerWalkHead, 20, 0, undefined, undefined, 5, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkHead, 20, 0, undefined, undefined, -10, undefined, undefined),
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerWalkRightArm, 20, 0, undefined, undefined, -40, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkRightArm, 20, 0, undefined, undefined, 40, undefined, undefined),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerWalkLeftArm, 20, 0, undefined, undefined, 40, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkLeftArm, 20, 0, undefined, undefined, -40, undefined, undefined),
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerWalkRightLeg, 20, 0, undefined, undefined, 40, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkRightLeg, 20, 0, undefined, undefined, -40, undefined, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerWalkLeftLeg, 20, 0, undefined, undefined, -40, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkLeftLeg, 20, 0, undefined, undefined, 40, undefined, undefined),
		
		// Player jump
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerJumpRightArm, 0, 1, undefined, undefined, 20, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpRightArm, 10, 0, undefined, undefined, 60, undefined, undefined),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerJumpLeftArm, 0, 1, undefined, undefined, -20, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpLeftArm, 10, 0, undefined, undefined, -60, undefined, undefined),
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerJumpRightLeg, 0, 1, undefined, undefined, -20, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpRightLeg, 10, 0, undefined, undefined, -30, undefined, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerJumpLeftLeg, 0, 1, undefined, undefined, 20, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpLeftLeg, 10, 0, undefined, undefined, 30, undefined, undefined),
		
		// Player fall
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerFallRightArm, 0, 1, undefined, undefined, 60, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFallRightArm, 10, 0, undefined, undefined, 100, undefined, undefined),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerFallLeftArm, 0, 1, undefined, undefined, -60, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFallLeftArm, 10, 0, undefined, undefined, -100, undefined, undefined),
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerFallRightLeg, 0, 1, undefined, undefined, -30, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFallRightLeg, 10, 0, undefined, undefined, -20, undefined, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerFallLeftLeg, 0, 1, undefined, undefined, 30, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFallLeftLeg, 10, 0, undefined, undefined, 20, undefined, undefined),
		
		// Player mine
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerMineRightArm, 40, 6, undefined, undefined, 240, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerMineRightArm, 10, 6, undefined, undefined, 10, undefined, InteractionTriggerValue.MineOre),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerMineLeftArm, 40, 6, undefined, undefined, 240, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerMineLeftArm, 10, 6, undefined, undefined, 10, undefined, undefined),
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerMineRightLeg, 10, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerMineRightLeg, 10, 0, undefined, undefined, 0, undefined, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerMineLeftLeg, 10, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerMineLeftLeg, 10, 0, undefined, undefined, 0, undefined, undefined)
	];
}