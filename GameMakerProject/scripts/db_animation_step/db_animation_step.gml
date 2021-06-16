/*
	Insert description here
	return:
*/
function GetDbAllAnimationStepArray() {
	return [
		// Player walk
		// Player head
		new AnimationStep(AnimationIndex.PlayerWalkHead, 20, 0, undefined, undefined, 5, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkHead, 20, 0, undefined, undefined, -10, undefined),
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerWalkRightArm, 20, 0, undefined, undefined, -40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkRightArm, 20, 0, undefined, undefined, 40, undefined),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerWalkLeftArm, 20, 0, undefined, undefined, 40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkLeftArm, 20, 0, undefined, undefined, -40, undefined),
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerWalkRightLeg, 20, 0, undefined, undefined, 40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkRightLeg, 20, 0, undefined, undefined, -40, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerWalkLeftLeg, 20, 0, undefined, undefined, -40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkLeftLeg, 20, 0, undefined, undefined, 40, undefined),
		
		// Player jump
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerJumpRightArm, 0, 1, undefined, undefined, 40, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpRightArm, 10, 0, undefined, undefined, 100, undefined),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerJumpLeftArm, 0, 1, undefined, undefined, -40, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpLeftArm, 10, 0, undefined, undefined, -100, undefined),
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerJumpRightLeg, 0, 1, undefined, undefined, -20, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpRightLeg, 10, 0, undefined, undefined, -30, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerJumpLeftLeg, 0, 1, undefined, undefined, 20, undefined),
		new AnimationStep(AnimationIndex.PlayerJumpLeftLeg, 10, 0, undefined, undefined, 30, undefined)
	];
}