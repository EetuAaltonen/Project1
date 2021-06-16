/*
	Insert description here
	param: _animationIndex - Insert description here
*/
function Animation(_animationIndex, _isRepeating) constructor {
	AnimationIndex = _animationIndex;
	TriggerValue = undefined;
	IsPlaying = false;
	IsRepeating = _isRepeating;
	IsReversed = false;
	PlaySpeed = 1.00;
	StepIndex = -1
	StepList = ds_list_create();
	
	/*
		Insert description here
	*/
	static Copy = function() {
		var copyAnimation = new Animation(undefined, undefined);
		copyAnimation = CloneStructValues(self, copyAnimation);
		return copyAnimation;
    }
	
	/*
		Insert description here
	*/
	static GetActiveAnimationStep = function() {
		var activeAnimationStep = undefined;
		if (StepIndex >= 0) {
			var animationStep = ds_list_find_value(StepList, StepIndex);
			activeAnimationStep = animationStep.Copy();
		}
		return activeAnimationStep;
    }
	
	/*
		Insert description here
	*/
	static AddStep = function(_step) {
		ds_list_add(StepList, _step);
    }
	
	/*
		Insert description here
	*/
	static NextStep = function() {
		StepIndex += IsReversed ? -1 : 1;
		ChangedStepIndex();
    }
	
	/*
		Insert description here
	*/
	static PreviousStep = function() {
		StepIndex -= IsReversed ? -1 : 1;
		ChangedStepIndex();
    }
	
	/*
		Insert description here
	*/
	static ChangedStepIndex = function() {
		var stepListSize = ds_list_size(StepList);
		if (StepIndex >= stepListSize) {
			if (IsRepeating) {
				StepIndex = 0;
			} else {
				Stop();	
			}
		} else if (StepIndex < 0) {
			if (IsRepeating) {
				StepIndex = (stepListSize - 1);
			} else {
				Stop();	
			}
		}
    }
	
	/*
		Insert description here
	*/
	static Start = function() {
		IsPlaying = true;
		StepIndex = 0;
    }
	
	/*
		Insert description here
	*/
	static Stop = function() {
		IsPlaying = false;
		StepIndex = -1;
    }
	
	/*
		Insert description here
	*/
	static Continue = function() {
		IsPlaying = true;
    }
	
	/*
		Insert description here
	*/
	static Pause = function() {
		IsPlaying = false;
    }
	
	/*
		Insert description here
	*/
	static Repeat = function() {
		IsRepeating = true;
    }
	
	/*
		Insert description here
	*/
	static PlayOnce = function() {
		IsRepeating = false;
    }
	
	/*
		Insert description here
	*/
	static Forward = function() {
		IsReversed = false;
    }
	
	/*
		Insert description here
	*/
	static Reverse = function() {
		IsReversed = true;
    }
}