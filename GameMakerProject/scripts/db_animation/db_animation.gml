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
		var newAnimation = new Animation(animation.AnimationIndex)
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
		new Animation(AnimationIndex.PlayerWalkRightArm),
		new Animation(AnimationIndex.PlayerWalkLeftArm),
		new Animation(AnimationIndex.PlayerWalkRightLeg),
		new Animation(AnimationIndex.PlayerWalkLeftLeg)
	];
}