/*
	Insert description here
*/
function GetTransformActiveAnimationStep(_transform){
	var animationStep = undefined;
	
	if (!is_undefined(_transform)) {
		with (_transform) {
			if (!is_undefined(Animator)) {
				animationStep = Animator.activeAnimationStep;	
			}
		}
	}
	
	return animationStep;
}