/*
	Insert description here
	return:
*/
function CreateDbAnimationMap() {
	var animationMap = ds_map_create();
	var allAnimation = GetDbAllAnimationArray();
	var allAnimationStep = GetDbAllAnimationStepArray();
	var arrayLength = array_length(allAnimation);
	var stepArrayLength = array_length(allAnimationStep);
	
	for (var i = 0; i < arrayLength; i++) {
		var animation = allAnimation[i];
		var newAnimation = animation.Copy();
		for (var j = 0; j < stepArrayLength; j++) {
			var animationStep = allAnimationStep[j];
			if (animationStep.AnimationIndex == newAnimation.AnimationIndex) {
				newAnimation.AddStep(animationStep);
			}
		}
		animationMap [? newAnimation.AnimationIndex] = newAnimation;
	}	
	
	return animationMap;
}

/*
	Insert description here
	param: _objectName - Insert description here
	return:
*/
function GetDbAnimationByAnimationIndex(_index) {
	with (obj_controller_database) {
		var animation = ds_map_find_value(dbAnimationMap, _index);
		return animation.Copy();
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllAnimationArray() {
	return [
		// Player walk
		new Animation(AnimationIndex.PlayerWalkHead, true),
		new Animation(AnimationIndex.PlayerWalkRightArm, true),
		new Animation(AnimationIndex.PlayerWalkLeftArm, true),
		new Animation(AnimationIndex.PlayerWalkRightLeg, true),
		new Animation(AnimationIndex.PlayerWalkLeftLeg, true),
		// Player jump
		new Animation(AnimationIndex.PlayerJumpRightArm, false),
		new Animation(AnimationIndex.PlayerJumpLeftArm, false),
		new Animation(AnimationIndex.PlayerJumpRightLeg, false),
		new Animation(AnimationIndex.PlayerJumpLeftLeg, false),
		// Player fall
		new Animation(AnimationIndex.PlayerFallRightArm, false),
		new Animation(AnimationIndex.PlayerFallLeftArm, false),
		new Animation(AnimationIndex.PlayerFallRightLeg, false),
		new Animation(AnimationIndex.PlayerFallLeftLeg, false),
		// Player mine
		new Animation(AnimationIndex.PlayerMineRightArm, true),
		new Animation(AnimationIndex.PlayerMineLeftArm, true),
		new Animation(AnimationIndex.PlayerMineRightLeg, true),
		new Animation(AnimationIndex.PlayerMineLeftLeg, true),
		// Player flip
		new Animation(AnimationIndex.PlayerFlipHead, false),
		new Animation(AnimationIndex.PlayerFlipBody, false),
		new Animation(AnimationIndex.PlayerFlipRightArm, false),
		new Animation(AnimationIndex.PlayerFlipLeftArm, false),
		new Animation(AnimationIndex.PlayerFlipRightLeg, false),
		new Animation(AnimationIndex.PlayerFlipLeftLeg, false)
	];
}