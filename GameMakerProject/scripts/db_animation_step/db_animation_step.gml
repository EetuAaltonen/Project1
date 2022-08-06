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
		new AnimationStep(AnimationIndex.PlayerMineLeftLeg, 10, 0, undefined, undefined, 0, undefined, undefined),

		// PLAYERFLIP
		// AnimationIndex.PlayerFlipRightArm
		//new AnimationStep(AnimationIndex.PlayerFlipRightArm, 0, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 3, 0, undefined, undefined, -45, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 3, 0, undefined, undefined, 58, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 3, 0, undefined, undefined, 106, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 106, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 106, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 106, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 106, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 106, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 1, 0, undefined, undefined, 61, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 8, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightArm, 2, 0, undefined, undefined, 0, undefined, undefined),
		// AnimationIndex.PlayerFlipHead
		//new AnimationStep(AnimationIndex.PlayerFlipHead, 0, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 3, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 3, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 3, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 1, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipHead, 2, 0, undefined, undefined, 0, undefined, undefined),
		// AnimationIndex.PlayerFlipRightLeg
		//new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 0, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 3, 0, undefined, undefined, 50, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 3, 0, undefined, undefined, -34, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 3, 0, undefined, undefined, -34, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, -19, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, 31, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, 63, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, 97, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, 97, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 1, 0, undefined, undefined, 97, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, -6, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipRightLeg, 2, 0, undefined, undefined, 0, undefined, undefined),
		// AnimationIndex.PlayerFlipBody
		//new AnimationStep(AnimationIndex.PlayerFlipBody, 0, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 3, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 3, 0, undefined, undefined, -30, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 3, 0, undefined, undefined, -60, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -90, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -120, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -150, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -195, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -240, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 1, 0, undefined, undefined, -300, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -360, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipBody, 2, 0, undefined, undefined, -360, undefined, undefined),
		// AnimationIndex.PlayerFlipLeftLeg
		//new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 0, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 3, 0, undefined, undefined, -15, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 3, 0, undefined, undefined, 47, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 3, 0, undefined, undefined, 47, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 67, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 109, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 109, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 109, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 109, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 1, 0, undefined, undefined, 109, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 18, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftLeg, 2, 0, undefined, undefined, 0, undefined, undefined),
		// AnimationIndex.PlayerFlipLeftArm
		//new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 0, 0, undefined, undefined, 0, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 3, 0, undefined, undefined, 47, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 3, 0, undefined, undefined, -45, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 3, 0, undefined, undefined, 25, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 129, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 129, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 129, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 129, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 129, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 1, 0, undefined, undefined, 95, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 7, undefined, undefined),
		new AnimationStep(AnimationIndex.PlayerFlipLeftArm, 2, 0, undefined, undefined, 0, undefined, undefined)
	];
}