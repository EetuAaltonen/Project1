/*
	Insert description here
*/
function GetActiveAnimation(_animationList) {
	var listSize = ds_list_size(_animationList);
	var activeAnimation = undefined;
		
	for (var i = 0; i < listSize; i++) {
		var animation = ds_list_find_value(_animationList, i);
		if (animation.IsPlaying) {
			activeAnimation = animation;
			break;
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

