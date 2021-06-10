/*
	Insert description here
	return:
*/
function GetDbAllAnimationStepArray() {
	return [
		// Player right arm
		new AnimationStep(AnimationIndex.PlayerWalkRightArm, 20, 1, undefined, undefined, -40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkRightArm, 20, 1, undefined, undefined, 40, undefined),
		// Player left arm
		new AnimationStep(AnimationIndex.PlayerWalkLeftArm, 20, 1, undefined, undefined, 40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkLeftArm, 20, 1, undefined, undefined, -40, undefined),
		
		// Player right leg
		new AnimationStep(AnimationIndex.PlayerWalkRightLeg, 20, 1, undefined, undefined, 40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkRightLeg, 20, 1, undefined, undefined, -40, undefined),
		// Player left leg
		new AnimationStep(AnimationIndex.PlayerWalkLeftLeg, 20, 1, undefined, undefined, -40, undefined),
		new AnimationStep(AnimationIndex.PlayerWalkLeftLeg, 20, 1, undefined, undefined, 40, undefined)
	];
}