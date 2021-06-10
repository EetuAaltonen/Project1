/*
	Insert description here
	return:
*/
function CreateDbAnimationBindingMap() {
	var animationBindingMap = ds_map_create();
	var bindedObjectNameList = ds_list_create();
	var allAnimationBinding = GetDbAllAnimationBindingArray();
	var arrayLength = array_length(allAnimationBinding);
	
	for (var i = 0; i < arrayLength; i++) {
		var animationBinding = allAnimationBinding[i];
		var objectName = object_get_name(animationBinding.ObjectName);
		if (ds_list_find_index(bindedObjectNameList, objectName) < 0) {
			var animationIndexList = ds_list_create();
			for (var j = i; j < arrayLength; j++) {
				var binding = allAnimationBinding[j];
				if (object_get_name(binding.ObjectName) == objectName) {
					ds_list_add(animationIndexList, binding.AnimationIndex);
				}
			}
			ds_list_add(bindedObjectNameList, objectName);
			animationBindingMap [? objectName] = animationIndexList;
		}
	}	
	
	return animationBindingMap;
}

/*
	Insert description here
	param: _objectName - Insert description here
	return:
*/
function GetDbAnimationListByObjectName(_objectName) {
	with (obj_controller_database) {
		var animationIndexList = ds_map_find_value(dbAnimationBindingMap, _objectName);
		var animationList = ds_list_create();
		
		if (!is_undefined(animationIndexList)) {
			var listSize = ds_list_size(animationIndexList);
		
			for (var i = 0; i < listSize; i++) {
				var animationIndex = ds_list_find_value(animationIndexList, i);
				var animation = GetDbAnimationByAnimationIndex(animationIndex);
				ds_list_add(animationList, animation);
			}
		}
		
		return animationList;
	}
}

/*
	Insert description here
	return:
*/
function GetDbAllAnimationBindingArray() {
	// Object names are mapped afterward
	return [
		new AnimationBinding(obj_player_r_arm, AnimationIndex.PlayerWalkRightArm),
		new AnimationBinding(obj_player_l_arm, AnimationIndex.PlayerWalkLeftArm),
		
		new AnimationBinding(obj_player_r_leg, AnimationIndex.PlayerWalkRightLeg),
		new AnimationBinding(obj_player_l_leg, AnimationIndex.PlayerWalkLeftLeg)
	];
}