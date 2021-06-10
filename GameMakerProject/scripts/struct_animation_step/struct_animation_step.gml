/*
	Insert description here
	param: _left - Insert description here
*/
function AnimationStep(_animationIndex, _transitionTime, _duration, _offset, _scale, _rotation, _depth) constructor {
	AnimationIndex = _animationIndex;
	TransitionTime = _transitionTime;
	Duration = _duration;
	
	// Transform manipulating
	Offset = _offset;
	Scale = _scale;
	Rotation = _rotation;
	Depth = _depth;
	
	/*
		Insert description here
	*/
	static Copy = function() {
		var copyAnimationStep = new AnimationStep(undefined, undefined, undefined, undefined, undefined, undefined, undefined);
		copyAnimationStep = CloneStructValues(self, copyAnimationStep);
		return copyAnimationStep;
    }
}