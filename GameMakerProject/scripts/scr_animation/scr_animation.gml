/*
	Insert description here
*/
function GetActiveAnimationFromList(_animationList, _animationTriggerValue) {
	var listSize = ds_list_size(_animationList);
	var activeAnimation = undefined;
		
	for (var i = 0; i < listSize; i++) {
		var animation = ds_list_find_value(_animationList, i);
		
		CheckAnimationTriggerValue(animation, _animationTriggerValue);
		
		if (animation.IsPlaying) {
			activeAnimation = animation;
		}
	}
	return activeAnimation;
}

/*
	Insert description here
*/
function GetAnimationTick() {
	return room_speed / 60;
}

/*
	Insert description here
*/
function CheckAnimationTriggerValue(_animation, _triggerValue) {
	if (_animation.TriggerValue == _triggerValue) {
		if (!_animation.IsPlaying) {
			_animation.Start();	
		}
	} else {
		if (_animation.IsPlaying) {
			_animation.Stop();	
		}
	}
}

