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
		new Animation(AnimationIndex.PlayerJumpLeftLeg, false)
	];
}