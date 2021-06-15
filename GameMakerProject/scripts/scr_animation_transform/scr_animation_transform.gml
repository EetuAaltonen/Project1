/*
	Insert description here
	param: _transform - Insert description here
	return:
*/
function GetAnimatedTransform(_transform) {
	var animatedTransform = undefined;
	if (instance_exists(_transform.Animator)) {
		with (_transform.Animator) {
			if (!is_undefined(activeAnimationStep)) {
				var newOffset = is_undefined(activeAnimationStep.Offset) ? _transform.Offset : activeAnimationStep.Offset;
				var newScale = is_undefined(activeAnimationStep.Scale) ? _transform.Scale : activeAnimationStep.Scale;
				var newRotation = is_undefined(activeAnimationStep.Rotation) ? _transform.Rotation : activeAnimationStep.Rotation;
				var newDepth = is_undefined(activeAnimationStep.Depth) ? _transform.Depth : activeAnimationStep.Depth;
		
				animatedTransform = new Transform(
					undefined, undefined, undefined, undefined, 
					newOffset, newScale, newRotation, newDepth
				);
			}
		}
	}
	return animatedTransform;
}