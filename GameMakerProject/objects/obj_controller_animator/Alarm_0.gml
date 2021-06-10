/// @description Insert description here
if (is_undefined(GetGUIStatement())) {
	var animation = GetActiveAnimation(animationList);
	if (!is_undefined(animation)) {
		activeAnimationStep = is_undefined(activeAnimationStep) ? animation.GetActiveAnimationStep() : activeAnimationStep;
		if (!is_undefined(activeAnimationStep)) {
			if (activeAnimationStep.Duration > 0) {
				activeAnimationStep.Duration--;
			} else {
				if (is_undefined(nextAnimationStep)) {
					if (animation.IsPlaying) {
						prevAnimationStep = activeAnimationStep.Copy();
						animation.NextStep();
						nextAnimationStep = animation.GetActiveAnimationStep();
						transitionTime = nextAnimationStep.TransitionTime;
					}
				} else {
					// Transition to next animation step
					if (transitionTime > 0) {
						activeAnimationStep.Rotation += (nextAnimationStep.Rotation - prevAnimationStep.Rotation) / nextAnimationStep.TransitionTime;
						transitionTime--;
					} else {
						activeAnimationStep = nextAnimationStep.Copy();
						nextAnimationStep = undefined;
					}
				}
			}
		}
	}
}
alarm[0] = GetAnimationTick();