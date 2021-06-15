/// @description Insert description here
if (is_undefined(GetGUIStatement()) && instance_exists(transformInstance)) {
	var animation = GetActiveAnimationFromList(animationList, animationTriggerValue);
	if (!is_undefined(animation)) {
		if (!is_undefined(activeAnimationStep)) {
			if (animation.AnimationIndex != activeAnimationStep.AnimationIndex) {
				ChangeAnimatorActiveAnimationStep(self, animation.GetActiveAnimationStep());	
			}
		} else {
			ChangeAnimatorActiveAnimationStep(self, animation.GetActiveAnimationStep());
		}
		
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
						// Lerp offset
						if (!is_undefined(nextAnimationStep.Offset) && !is_undefined(prevAnimationStep.Offset)) {
							// TODO: Make sure offset lerp works right
							activeAnimationStep.Offset.x += (nextAnimationStep.Offset.x - prevAnimationStep.Offset.x) / nextAnimationStep.TransitionTime;
							activeAnimationStep.Offset.y += (nextAnimationStep.Offset.y - prevAnimationStep.Offset.y) / nextAnimationStep.TransitionTime;
						}
						// Lerp rotation
						if (!is_undefined(nextAnimationStep.Rotation) && !is_undefined(prevAnimationStep.Rotation)) {
							activeAnimationStep.Rotation += (nextAnimationStep.Rotation - prevAnimationStep.Rotation) / nextAnimationStep.TransitionTime;
						}
						transitionTime--;
					} else {
						activeAnimationStep = nextAnimationStep.Copy();
						nextAnimationStep = undefined;
					}
				}
			}
		}
	} else {
		ChangeAnimatorActiveAnimationStep(self, undefined);	
	}
}
alarm[0] = GetAnimationTick();